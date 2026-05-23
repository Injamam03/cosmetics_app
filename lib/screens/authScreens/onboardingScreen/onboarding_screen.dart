import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../constant/app_colors.dart';
import '../../../constant/app_text_styles.dart';
import '../../../constant/constring.dart';
import '../../../widgets/custom_text/custom_text.dart';
import '../../../widgets/custombutton/custom_button.dart';
import 'controller/onboarding_controller.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(OnboardingController());
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              SizedBox(height: 16.h),
              // Top bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: Constring.appName,
                    style: AppTextStyles.labelMd.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: c.skip,
                    child: CustomText(
                      text: Constring.onboardingSkip,
                      style: AppTextStyles.labelMd.copyWith(
                        color: AppColors.onSurfaceVariant,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40.h),
              // Badge
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: AppColors.primaryFixed,
                  borderRadius: BorderRadius.circular(99),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.verified, color: AppColors.primary, size: 14.sp),
                    SizedBox(width: 6.w),
                    CustomText(
                      text: Constring.onboardingBadge,
                      style: AppTextStyles.labelSm.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32.h),
              // Headline
              CustomText(
                text: Constring.onboardingHeadline,
                style: AppTextStyles.headlineLgMobile.copyWith(
                  color: AppColors.onBackground,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40.h),
              // Illustration placeholder
              Container(
                height: 240.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24.r),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      AppColors.primaryContainer.withOpacity(0.15),
                      AppColors.tertiaryContainer.withOpacity(0.1),
                    ],
                  ),
                ),
                child: Icon(Icons.spa, size: 80.sp, color: AppColors.primary.withOpacity(0.3)),
              ),
              SizedBox(height: 40.h),
              // Features
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _featureChip(Icons.workspace_premium, Constring.onboardingFeature1),
                  SizedBox(width: 12.w),
                  _featureChip(Icons.auto_awesome, Constring.onboardingFeature2),
                ],
              ),
              const Spacer(),
              CustomButton(
                text: Constring.onboardingGetStarted,
                onTap: c.goNext,
              ),
              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _featureChip(IconData icon, String label) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16.sp, color: AppColors.primary),
          SizedBox(width: 6.w),
          CustomText(
            text: label,
            style: AppTextStyles.labelSm.copyWith(color: AppColors.onSurface),
          ),
        ],
      ),
    );
  }
}
