import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../routes/app_routes.dart';

class CreateNewPasswordController extends GetxController {
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final RxBool isNewVisible = false.obs;
  final RxBool isConfirmVisible = false.obs;
  final RxBool isLoading = false.obs;

  void toggleNew() => isNewVisible.toggle();
  void toggleConfirm() => isConfirmVisible.toggle();

  Future<void> onUpdate() async {
    if (!formKey.currentState!.validate()) return;
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2));
    isLoading.value = false;
    Get.offAllNamed(AppRoutes.signIn);
  }

  @override
  void onClose() {
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
