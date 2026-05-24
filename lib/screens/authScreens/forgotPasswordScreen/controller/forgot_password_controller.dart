import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stitch_app/routes/app_routes.dart';
class ForgotPasswordController extends GetxController {
  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void onSendLink() {
    if (formKey.currentState!.validate()) {
      Get.toNamed(AppRoutes.forgotPasswordOtpScreen);
    }
  }

  void goBack() => Get.back();

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }
}