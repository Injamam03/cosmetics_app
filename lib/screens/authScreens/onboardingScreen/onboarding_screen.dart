  import 'package:flutter/material.dart';
  import 'package:flutter_screenutil/flutter_screenutil.dart';
  import 'package:get/get.dart';
  import 'package:stitch_app/constant/imageString.dart';
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
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     CustomText(
                //       text: Constring.appName,
                //       style: AppTextStyles.bodyLg.copyWith(
                //         color: AppColors.primary,
                //         fontWeight: FontWeight.bold,
                //       ),
                //     ),
                //     GestureDetector(
                //       onTap: c.skip,
                //       child: CustomText(
                //         text: Constring.onboardingSkip,
                //         style: AppTextStyles.bodyLg.copyWith(
                //           color: AppColors.onSurfaceVariant,
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                SizedBox(height: 20.h),
                // Badge
                CustomText(
                  text: Constring.discoverYourGlow,
                  style: AppTextStyles.headlineLgMobile.copyWith(
                    // color: AppColors.onBackground,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20.h),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                  decoration: BoxDecoration(
                    color: AppColors.primaryFixed,
                    borderRadius: BorderRadius.circular(99),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.verified, color: AppColors.primary, size: 16.sp),
                      SizedBox(width: 6.w),
                      CustomText(
                        text: Constring.onboardingBadge,
                        fontSize: 18,
                        style: AppTextStyles.labelSm.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                // Headline

                // Illustration placeholder
                Container(
                  height: 320.h,  // 👈 এটা add করো
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(color: AppColors.primaryContainer.withAlpha(20), width: 2),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        AppColors.primaryContainer.withAlpha(30),
                        AppColors.tertiaryContainer.withAlpha(20),
                      ],
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.r),
                    child: Image.asset(
                      ImageString.onBoardingImag,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 320.h,
                    ),
                  ),
                ),

                SizedBox(height: 20.h),
                // Illustration placeholder
                Container(
                  // height: 240.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(color: AppColors.primaryContainer.withAlpha(20),width: 2),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        AppColors.primaryContainer.withAlpha(30),
                        AppColors.tertiaryContainer.withAlpha(20),
                      ],
                    ),
                  ),
                  // child: Icon(Icons.spa_outlined, size: 80.sp, color: AppColors.primary.withAlpha(60)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        CustomText(
                          text: Constring.onBoardingSubTitle01,
                          style: AppTextStyles.bodyLg.copyWith(
                            color: AppColors.onBackground,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 10.h,),
                        CustomText(
                          text: Constring.onBoardingSubTitle02,
                          style: AppTextStyles.bodyLg.copyWith(
                            color: AppColors.onBackground,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 20.h),

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


  }
