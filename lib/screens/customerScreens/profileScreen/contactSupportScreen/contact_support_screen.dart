import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../constant/app_colors.dart';
import '../../../../constant/app_text_styles.dart';
import '../../../../constant/constring.dart';
import '../../../../widgets/custom_text/custom_text.dart';
import '../../../../widgets/custom_text_Field/custom_text_field.dart';
import '../../../../widgets/custombutton/custom_button.dart';
import 'controller/contact_support_controller.dart';

class ContactSupportScreen extends StatelessWidget {
  const ContactSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(ContactSupportController());
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background, elevation: 0,
        leading: IconButton(icon: Icon(Icons.arrow_back, color: AppColors.primary), onPressed: Get.back),
        title: CustomText(text: Constring.contactSupportTitle, style: AppTextStyles.labelMd.copyWith(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.r),
        child: Form(
          key: c.formKey,
          child: Column(children: [
            // Quick contact options
            Row(children: [
              _ContactOption(icon: Icons.email_outlined, label: Constring.contactSupportEmail),
              SizedBox(width: 12.w),
              _ContactOption(icon: Icons.chat_bubble_outline, label: Constring.contactSupportChat),
              SizedBox(width: 12.w),
              _ContactOption(icon: Icons.phone_outlined, label: Constring.contactSupportPhone),
            ]),
            SizedBox(height: 32.h),
            CustomTextField(controller: c.subjectController, label: Constring.contactSupportSubject,
              validator: (v) => (v == null || v.isEmpty) ? Constring.validationRequired : null),
            SizedBox(height: 16.h),
            CustomTextField(controller: c.messageController, label: Constring.contactSupportMessage,
              maxLines: 5,
              validator: (v) => (v == null || v.isEmpty) ? Constring.validationRequired : null),
            SizedBox(height: 32.h),
            Obx(() => CustomButton(text: Constring.contactSupportButton, onTap: c.onSend, isLoading: c.isLoading.value)),
          ]),
        ),
      ),
    );
  }
}

class _ContactOption extends StatelessWidget {
  final IconData icon;
  final String label;
  const _ContactOption({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Container(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [BoxShadow(color: AppColors.onBackground.withOpacity(0.04), blurRadius: 30)],
      ),
      child: Column(children: [
        Icon(icon, color: AppColors.primary, size: 24.sp),
        SizedBox(height: 6.h),
        CustomText(text: label, style: AppTextStyles.labelSm.copyWith(color: AppColors.onSurface)),
      ]),
    ));
  }
}
