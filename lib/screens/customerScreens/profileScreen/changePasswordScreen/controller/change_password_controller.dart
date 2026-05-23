import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordController extends GetxController {
  final currentController = TextEditingController();
  final newController = TextEditingController();
  final confirmController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final RxBool isCurrentVisible = false.obs;
  final RxBool isNewVisible = false.obs;
  final RxBool isConfirmVisible = false.obs;
  final RxBool isLoading = false.obs;

  void toggleCurrent() => isCurrentVisible.toggle();
  void toggleNew() => isNewVisible.toggle();
  void toggleConfirm() => isConfirmVisible.toggle();

  Future<void> onUpdate() async {
    if (!formKey.currentState!.validate()) return;
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2));
    isLoading.value = false;
    Get.back();
  }

  @override
  void onClose() {
    currentController.dispose(); newController.dispose(); confirmController.dispose();
    super.onClose();
  }
}
