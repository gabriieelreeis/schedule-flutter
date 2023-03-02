import 'package:get/get.dart';
import 'package:scheduleflutter/app/modules/login/controllers/login_controller.dart';
import 'package:scheduleflutter/app/services/firebase/firebase_service.dart';

class LoginBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut<LoginController>(
        () => LoginController(),
      ),
      Bind.lazyPut<FirebaseService>(
        () => FirebaseService(),
      )
    ];
  }
}
