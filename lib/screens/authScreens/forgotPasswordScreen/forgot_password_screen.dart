import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../constant/app_colors.dart';
import '../../../constant/app_text_styles.dart';
import '../../../constant/constring.dart';
import '../../../widgets/custom_text/custom_text.dart';
import '../../../widgets/custom_text_Field/custom_text_field.dart';
import '../../../widgets/custombutton/custom_button.dart';
import 'controller/forgot_password_controller.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(ForgotPasswordController());
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface.withOpacity(0.4),
        elevation: 0,
        leading: IconButton(icon: Icon(Icons.arrow_back, color: AppColors.primary), onPressed: c.goBack),
        title: CustomText(text: Constring.appName,
          style: AppTextStyles.labelMd.copyWith(color: AppColors.primary, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Obx(() => c.emailSent.value ? _EmailSentView(c: c) : _ForgotForm(c: c)),
      ),
    );
  }
}

class _ForgotForm extends StatelessWidget {
  final ForgotPasswordController c;
  const _ForgotForm({required this.c});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: c.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 40.h),
          Container(
            padding: EdgeInsets.all(20.r),
            decoration: BoxDecoration(color: AppColors.primaryFixed, shape: BoxShape.circle),
            child: Icon(Icons.lock_reset_outlined, color: AppColors.primary, size: 32.sp),
          ),
          SizedBox(height: 24.h),
          CustomText(text: Constring.forgotTitle, style: AppTextStyles.headlineLgMobile),
          SizedBox(height: 8.h),
          CustomText(text: Constring.forgotSubtitle,
            style: AppTextStyles.bodyMd.copyWith(color: AppColors.onSurfaceVariant)),
          SizedBox(height: 40.h),
          CustomTextField(
            controller: c.emailController,
            label: Constring.forgotEmail,
            prefixIcon: Icons.mail_outline,
            keyboardType: TextInputType.emailAddress,
            validator: (v) {
              if (v == null || v.isEmpty) return Constring.validationRequired;
              if (!v.contains('@')) return Constring.validationEmail;
              return null;
            },
          ),
          SizedBox(height: 32.h),
          Obx(() => CustomButton(
            text: Constring.forgotButton,
            onTap: c.onSendLink,
            isLoading: c.isLoading.value,
          )),
        ],
      ),
    );
  }
}

class _EmailSentView extends StatelessWidget {
  final ForgotPasswordController c;
  const _EmailSentView({required this.c});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.check_circle_outline, color: AppColors.primary, size: 80.sp),
        SizedBox(height: 24.h),
        CustomText(text: Constring.forgotSuccessTitle, style: AppTextStyles.headlineMd, textAlign: TextAlign.center),
        SizedBox(height: 8.h),
        CustomText(text: Constring.forgotSuccessSubtitle,
          style: AppTextStyles.bodyMd.copyWith(color: AppColors.onSurfaceVariant),
          textAlign: TextAlign.center),
        SizedBox(height: 32.h),
        GestureDetector(
          onTap: c.tryAnother,
          child: CustomText(text: Constring.forgotTryAnother,
            style: AppTextStyles.labelMd.copyWith(color: AppColors.primary)),
        ),
      ],
    );
  }
}
