import 'package:cherry_toast/cherry_toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:scheduleflutter/app/routes/app_pages.dart';

class FirebaseService extends GetxService {
  static FirebaseService get to => Get.find<FirebaseService>();
  late BuildContext context;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  get auth => _auth;
  User? get currentUser => _auth.currentUser;
  final CollectionReference userRef =
      FirebaseFirestore.instance.collection('user');
  final _user = Rxn<User>();
  late Stream<User?> _authStateChanges;

  @override
  void onReady() async {
    await initAuth();
    super.onReady();
  }

  @override
  void onClose() async {}

  Future<void> initAuth() async {
    _authStateChanges = _auth.authStateChanges();
    _authStateChanges.listen((User? user) => _user.value = user);
  }

  Future<void> siginInWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    try {
      GoogleSignInAccount? account = await googleSignIn.signIn();
      if (account != null) {
        final gAuthentication = await account.authentication;
        final credential = GoogleAuthProvider.credential(
          idToken: gAuthentication.idToken,
          accessToken: gAuthentication.accessToken,
        );

        await _auth.signInWithCredential(credential);

        await saveUser(_auth.currentUser!, null);

        Get.offAllNamed(Routes.home);
      }
    } on FirebaseAuthException catch (error) {
      CherryToast.error(
        title: Text('${error.code}: ${error.message}'),
        animationDuration: const Duration(milliseconds: 1000),
        autoDismiss: true,
      ).show(context);
    }
  }

  Future<bool> createUserAccount(
      String name, String email, String password) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await credential.user?.updateDisplayName(name);

      User user = _auth.currentUser!;

      await user.sendEmailVerification();

      await userRef.doc(user.uid).get().then((user) async {
        if (!user.exists) {
          await saveUser(_auth.currentUser!, null);
        }
      });

      await siginInWithAccount(email, password);

      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        await siginInWithAccount(email, password);
      }
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<void> siginInWithAccount(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);

      Get.offAllNamed(Routes.home);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();

      Get.offAllNamed(Routes.login);
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  Future<void> saveUser(User account, [String? provider, String? type]) async {
    final Map<String, dynamic> data = <String, dynamic>{
      'user': {
        'displayName': account.displayName,
        'email': account.email,
        'emailVerified': account.emailVerified,
        'photoURL': account.photoURL,
      },
    };

    await userRef.doc(account.uid).set(data);
  }

  Future<bool> emailRegistered(String email) async {
    final check = await _auth.fetchSignInMethodsForEmail(email);
    if (check.isNotEmpty) return true;
    return false;
  }

  get isLogedIn => _auth.currentUser != null;
}
