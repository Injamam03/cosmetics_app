import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ForgotPasswordController extends GetxController {
  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void onSendLink() {
    if (formKey.currentState!.validate()) {
      // Get.toNamed(AppRoutes.otp);
    }
  }

  void goBack() => Get.back();

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }
}