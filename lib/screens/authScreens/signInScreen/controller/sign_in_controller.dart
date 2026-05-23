import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stitch_app/routes/app_routes.dart';


class SignInController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final RxBool isPasswordVisible = false.obs;
  final RxBool isLoading = false.obs;

  void togglePassword() => isPasswordVisible.toggle();

  Future<void> onSignIn() async {
    if (!formKey.currentState!.validate()) return;
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2));
    isLoading.value = false;
    Get.offAllNamed(AppRoutes.customerHome);
  }

  void goToSignUp() => Get.toNamed(AppRoutes.signUp);
  void goToForgotPassword() => Get.toNamed(AppRoutes.forgotPassword);

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
