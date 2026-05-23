import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../constant/app_colors.dart';

class EditProfileController extends GetxController {
  final firstNameController = TextEditingController(text: 'Sophie');
  final lastNameController = TextEditingController(text: 'Laurent');
  final emailController = TextEditingController(text: 'sophie.l@editorial.com');
  final phoneController = TextEditingController(text: '+1 234 567 8900');
  final dobController = TextEditingController(text: '15/06/1992');
  final formKey = GlobalKey<FormState>();
  final RxBool isLoading = false.obs;

  Future<void> onSave() async {
    if (!formKey.currentState!.validate()) return;
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2));
    isLoading.value = false;
    Get.back();
    Get.snackbar('Success', 'Profile updated successfully', backgroundColor: AppColors.primaryFixed);
  }

  @override
  void onClose() {
    firstNameController.dispose(); lastNameController.dispose();
    emailController.dispose(); phoneController.dispose(); dobController.dispose();
    super.onClose();
  }
}
