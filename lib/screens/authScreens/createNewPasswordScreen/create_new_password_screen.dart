import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../constant/app_colors.dart';
import '../../../constant/app_text_styles.dart';
import '../../../constant/constring.dart';
import '../../../widgets/custom_text/custom_text.dart';
import '../../../widgets/custom_text_Field/custom_text_field.dart';
import '../../../widgets/custombutton/custom_button.dart';
import 'controller/create_new_password_controller.dart';

class CreateNewPasswordScreen extends StatelessWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(CreateNewPasswordController());
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface.withOpacity(0.8),
        elevation: 0,
        leading: IconButton(icon: Icon(Icons.arrow_back, color: AppColors.primary), onPressed: Get.back),
        title: CustomText(text: Constring.createPasswordTitle,
          style: AppTextStyles.labelMd.copyWith(color: AppColors.onSurface, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Form(
          key: c.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 32.h),
              CustomText(text: Constring.createPasswordSubtitle, style: AppTextStyles.headlineMd),
              SizedBox(height: 32.h),
              Obx(() => CustomTextField(
                controller: c.newPasswordController,
                label: Constring.createPasswordNew,
                prefixIcon: Icons.lock_outline,
                obscureText: !c.isNewVisible.value,
                suffixIcon: c.isNewVisible.value ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                onSuffixTap: c.toggleNew,
                validator: (v) {
                  if (v == null || v.isEmpty) return Constring.validationRequired;
                  if (v.length < 8) return Constring.validationPassword;
                  return null;
                },
              )),
              SizedBox(height: 16.h),
              Obx(() => CustomTextField(
                controller: c.confirmPasswordController,
                label: Constring.createPasswordConfirm,
                prefixIcon: Icons.lock_outline,
                obscureText: !c.isConfirmVisible.value,
                suffixIcon: c.isConfirmVisible.value ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                onSuffixTap: c.toggleConfirm,
                validator: (v) {
                  if (v == null || v.isEmpty) return Constring.validationRequired;
                  if (v != c.newPasswordController.text) return Constring.validationPasswordMatch;
                  return null;
                },
              )),
              SizedBox(height: 40.h),
              Obx(() => CustomButton(
                text: Constring.createPasswordButton,
                onTap: c.onUpdate,
                isLoading: c.isLoading.value,
              )),
            ],
          ),
        ),
      ),
    );
  }
}
