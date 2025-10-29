import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:assigment2/app/config/app_routes.dart';

class AuthController extends GetxController {
  final emailC = TextEditingController();
  final passwordC = TextEditingController();
  final fullNameC = TextEditingController();
  final confirmPasswordC = TextEditingController();
  
  var isPasswordHidden = true.obs;

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  void login(BuildContext context) {
    print("Login with ${emailC.text} and ${passwordC.text}");
    context.go(AppRoutes.home);
  }

  void signup(BuildContext context) {
    print("Sign up with ${emailC.text} and ${fullNameC.text}");
    context.go(AppRoutes.home);
  }

  void loginWithGoogle(BuildContext context) {
    print("Login with Google");
    context.go(AppRoutes.home);
  }

  void loginWithFacebook(BuildContext context) {
    print("Login with Facebook");
    context.go(AppRoutes.home);
  }

  @override
  void onClose() {
    emailC.dispose();
    passwordC.dispose();
    fullNameC.dispose();
    confirmPasswordC.dispose();
    super.onClose();
  }
}