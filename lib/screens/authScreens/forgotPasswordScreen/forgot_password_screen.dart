import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:stitch_app/constant/app_colors.dart';
import 'package:stitch_app/constant/app_text_styles.dart';
import 'package:stitch_app/constant/constring.dart';
import 'package:stitch_app/widgets/custom_text/custom_text.dart';
import 'package:stitch_app/widgets/custom_text_Field/custom_text_field.dart';
import 'package:stitch_app/widgets/custombutton/custom_button.dart';
import 'controller/forgot_password_controller.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(ForgotPasswordController());

    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.primary),
          onPressed: () => Get.back(),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Form(
          key: controller.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Icon circle
              Container(
                padding: EdgeInsets.all(20.r),
                decoration: const BoxDecoration(
                  color: AppColors.primaryFixed,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.lock_reset_outlined,
                  color: AppColors.primary,
                  size: 32.sp,
                ),
              ),
              SizedBox(height: 24.h),

              // Title
              const CustomText(
                text: Constring.forgotTitle,
                style: AppTextStyles.headlineLgMobile,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8.h),

              // Subtitle
              CustomText(
                text: Constring.forgotSubtitle,
                style: AppTextStyles.bodyMd.copyWith(
                  color: AppColors.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40.h),

              // Email field
              CustomTextField(
                controller: controller.emailController,
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

              // Button
              CustomButton(
                text: Constring.forgotButton,
                onTap: controller.onSendLink
              ),
            ],
          ),
        ),
      ),
    );
  }
}