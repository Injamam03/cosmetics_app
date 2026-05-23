import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../routes/app_routes.dart';

class SignUpController extends GetxController {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final dobController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final RxBool isPasswordVisible = false.obs;
  final RxBool isLoading = false.obs;
  final RxBool termsAccepted = false.obs;

  void togglePassword() => isPasswordVisible.toggle();
  void toggleTerms() => termsAccepted.toggle();

  Future<void> onSignUp() async {
    if (!formKey.currentState!.validate()) return;
    if (!termsAccepted.value) {
      Get.snackbar('Required', 'Please accept terms and conditions');
      return;
    }
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2));
    isLoading.value = false;
    Get.toNamed(AppRoutes.otpVerify);
  }

  void goToSignIn() => Get.back();

  @override
  void onClose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    dobController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
