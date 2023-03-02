import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:scheduleflutter/app/modules/login/controllers/login_controller.dart';
import 'package:scheduleflutter/app/services/firebase/firebase_service.dart';
import 'package:scheduleflutter/app/shared/theme/app_colors.dart';
import 'package:scheduleflutter/app/shared/theme/app_texts.dart';
import 'package:scheduleflutter/app/shared/widgets/forms/default_button_widget.dart';
import 'package:scheduleflutter/app/shared/widgets/forms/default_input_widget.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FirebaseService firebaseService = FirebaseService.to;
    firebaseService.context = context;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.center,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/imgs/pngs/login.png'),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Login',
                      style: h1.copyWith(color: Colors.black),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    DefaultInput(
                      hintText: 'Email',
                    ),
                    DefaultInput(
                      hintText: 'Senha',
                      obscureText: true,
                    ),
                    DefaultButton(
                      title: 'Entrar',
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Center(
                      child: Text(
                        'ou',
                        style: p.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    DefaultButton(
                      title: 'Entre com o Google',
                      bgColor: googleButtonBackground,
                      textColor: googleButtonColor,
                      onTap: controller.firebaseService.siginInWithGoogle,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
