import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../constant/app_colors.dart';
import '../../../constant/app_text_styles.dart';
import '../../../constant/constring.dart';
import '../../../widgets/custom_text/custom_text.dart';
import '../../../widgets/custom_text_Field/custom_text_field.dart';
import '../../../widgets/custombutton/custom_button.dart';
import 'controller/sign_in_controller.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(SignInController());
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: Stack(
        children: [
          // Background blobs
          // Positioned(
          //   top: -80.h,
          //   right: -40.w,
          //   child: Container(
          //     width: 280.w,
          //     height: 320.h,
          //     decoration: BoxDecoration(
          //       shape: BoxShape.circle,
          //       color: AppColors.secondaryContainer.withAlpha(20),
          //     ),
          //   ),
          // ),

          /// =-==-=-=--=-==-=-= commit test -=-=-=-=--===-==-//
          // Positioned(
          //   bottom: -80.h,
          //   left: -40.w,
          //   child: Container(
          //     width: 240.w,
          //     height: 280.h,
          //     decoration: BoxDecoration(
          //       shape: BoxShape.circle,
          //       color: AppColors.primaryFixed.withAlpha(20),
          //     ),
          //   ),
          // ),
          SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Form(
                key: c.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // SizedBox(height: 60.h),
                    // // Quote
                    // CustomText(
                    //   text: Constring.appTagline,
                    //   style: AppTextStyles.labelSm.copyWith(
                    //     color: AppColors.onSurfaceVariant,
                    //     fontStyle: FontStyle.italic,
                    //   ),
                    // ),
                    SizedBox(height: 32.h),
                    const CustomText(
                      text: Constring.welcomeBack,
                      style: AppTextStyles.headlineLgMobile,
                    ),
                    SizedBox(height: 8.h),
                    CustomText(
                      text: Constring.signInSubtitle,
                      style: AppTextStyles.bodyMd.copyWith(
                        color: AppColors.onSurfaceVariant,
                      ),
                    ),
                    SizedBox(height: 40.h),
                    CustomTextField(
                      controller: c.emailController,
                      label: Constring.signInEmail,
                      prefixIcon: Icons.mail_outline,
                      keyboardType: TextInputType.emailAddress,
                      validator: (v) {
                        if (v == null || v.isEmpty) {
                          return Constring.validationRequired;
                        }
                        if (!v.contains('@')) return Constring.validationEmail;
                        return null;
                      },
                    ),
                    SizedBox(height: 16.h),
                    Obx(() => CustomTextField(
                          controller: c.passwordController,
                          label: Constring.signInPassword,
                          prefixIcon: Icons.lock_outline,
                          obscureText: !c.isPasswordVisible.value,
                          suffixIcon: c.isPasswordVisible.value
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          onSuffixTap: c.togglePassword,
                          validator: (v) {
                            if (v == null || v.isEmpty) {
                              return Constring.validationRequired;
                            }
                            if (v.length < 8) {
                              return Constring.validationPassword;
                            }
                            return null;
                          },
                        )),
                    SizedBox(height: 12.h),
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: c.goToForgotPassword,
                        child: CustomText(
                          text: Constring.signInForgotPassword,
                          style: AppTextStyles.labelMd.copyWith(
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 32.h),
                    Obx(() => CustomButton(
                          text: Constring.signInButton,
                          onTap: c.onSignIn,
                          isLoading: c.isLoading.value,
                        )),
                    SizedBox(height: 24.h),
                    // Divider
                    Row(
                      children: [
                        const Expanded(
                            child: Divider(color: AppColors.outlineVariant)),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.w),
                          child: CustomText(
                            text: Constring.signInOr,
                            style: AppTextStyles.labelSm.copyWith(
                              color: AppColors.onSurfaceVariant,
                            ),
                          ),
                        ),
                       const Expanded(
                            child: Divider(color: AppColors.outlineVariant)),
                      ],
                    ),
                    SizedBox(height: 24.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          text: Constring.signInNoAccount,
                          style: AppTextStyles.bodyMd.copyWith(
                            color: AppColors.onSurfaceVariant,
                          ),
                        ),
                        SizedBox(width: 4.w),
                        GestureDetector(
                          onTap: c.goToSignUp,
                          child: CustomText(
                            text: Constring.signInSignUp,
                            style: AppTextStyles.labelMd.copyWith(
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 32.h),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
