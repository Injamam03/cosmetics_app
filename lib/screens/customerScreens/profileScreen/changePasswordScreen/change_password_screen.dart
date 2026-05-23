import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../constant/app_colors.dart';
import '../../../../constant/app_text_styles.dart';
import '../../../../constant/constring.dart';
import '../../../../widgets/custom_text/custom_text.dart';
import '../../../../widgets/custom_text_Field/custom_text_field.dart';
import '../../../../widgets/custombutton/custom_button.dart';
import 'controller/change_password_controller.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(ChangePasswordController());
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background, elevation: 0,
        leading: IconButton(icon: Icon(Icons.arrow_back, color: AppColors.primary), onPressed: Get.back),
        title: CustomText(text: Constring.changePasswordTitle, style: AppTextStyles.labelMd.copyWith(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.r),
        child: Form(
          key: c.formKey,
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(height: 16.h),
            Obx(() => CustomTextField(controller: c.currentController, label: Constring.changePasswordCurrent,
              prefixIcon: Icons.lock_outline, obscureText: !c.isCurrentVisible.value,
              suffixIcon: c.isCurrentVisible.value ? Icons.visibility_outlined : Icons.visibility_off_outlined,
              onSuffixTap: c.toggleCurrent,
              validator: (v) => (v == null || v.isEmpty) ? Constring.validationRequired : null)),
            SizedBox(height: 16.h),
            Obx(() => CustomTextField(controller: c.newController, label: Constring.changePasswordNew,
              prefixIcon: Icons.lock_outline, obscureText: !c.isNewVisible.value,
              suffixIcon: c.isNewVisible.value ? Icons.visibility_outlined : Icons.visibility_off_outlined,
              onSuffixTap: c.toggleNew,
              validator: (v) {
                if (v == null || v.isEmpty) return Constring.validationRequired;
                if (v.length < 8) return Constring.validationPassword;
                return null;
              })),
            SizedBox(height: 16.h),
            Obx(() => CustomTextField(controller: c.confirmController, label: Constring.changePasswordConfirm,
              prefixIcon: Icons.lock_outline, obscureText: !c.isConfirmVisible.value,
              suffixIcon: c.isConfirmVisible.value ? Icons.visibility_outlined : Icons.visibility_off_outlined,
              onSuffixTap: c.toggleConfirm,
              validator: (v) {
                if (v == null || v.isEmpty) return Constring.validationRequired;
                if (v != c.newController.text) return Constring.validationPasswordMatch;
                return null;
              })),
            SizedBox(height: 40.h),
            Obx(() => CustomButton(text: Constring.changePasswordButton, onTap: c.onUpdate, isLoading: c.isLoading.value)),
          ]),
        ),
      ),
    );
  }
}
