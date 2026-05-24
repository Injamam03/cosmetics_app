import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:stitch_app/constant/app_colors.dart';
import 'package:stitch_app/constant/app_text_styles.dart';
import 'package:stitch_app/constant/constring.dart';
import 'package:stitch_app/widgets/custom_text/custom_text.dart';
import 'package:stitch_app/widgets/custombutton/custom_button.dart';
import 'controller/forgotPasswordOtpController.dart';

class ForgotPasswordOtpScreen extends StatelessWidget {
  const ForgotPasswordOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(ForgotPasswordOtpController());
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        backgroundColor: AppColors.surface.withAlpha(16),
        elevation: 0,
        leading: IconButton(icon: const Icon(Icons.arrow_back, color: AppColors.primary), onPressed: Get.back),
        title: CustomText(text: Constring.appName,
            style: AppTextStyles.labelMd.copyWith(color: AppColors.primary, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 48.h),
            Container(
              padding: EdgeInsets.all(20.r),
              decoration: const BoxDecoration(
                color: AppColors.primaryFixed,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.stars_outlined, color: AppColors.primary, size: 32.sp),
            ),
            SizedBox(height: 24.h),
            const CustomText(text: Constring.otpTitle, style: AppTextStyles.headlineLgMobile, textAlign: TextAlign.center),
            SizedBox(height: 8.h),
            CustomText(text: Constring.otpSubtitle,
                style: AppTextStyles.bodyMd.copyWith(color: AppColors.onSurfaceVariant),
                textAlign: TextAlign.center),
            SizedBox(height: 40.h),
            // OTP boxes
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(4, (i) => Container(
                margin: EdgeInsets.symmetric(horizontal: 8.w),
                width: 60.w,
                height: 64.h,
                decoration: BoxDecoration(
                  color: AppColors.surfaceContainerLowest,
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: AppColors.outlineVariant),
                  boxShadow: [BoxShadow(color: AppColors.onBackground.withAlpha(8), blurRadius: 30)],
                ),
                child: TextField(
                  textAlign: TextAlign.center,
                  maxLength: 1,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(counterText: '', border: InputBorder.none),
                  style: AppTextStyles.headlineMd.copyWith(color: AppColors.primary),
                ),
              )),
            ),
            SizedBox(height: 32.h),
            Obx(() => GestureDetector(
              onTap: c.canResend.value ? c.resendOtp : null,
              child: CustomText(
                text: c.canResend.value
                    ? Constring.otpResend
                    : '${Constring.otpTimer}${c.secondsRemaining.value}${Constring.otpSeconds}',
                style: AppTextStyles.labelMd.copyWith(
                  color: c.canResend.value ? AppColors.primary : AppColors.onSurfaceVariant,
                ),
              ),
            )),
            const Spacer(),
            Obx(() => CustomButton(
              text: Constring.otpVerify,
              onTap: c.onVerify,
              isLoading: c.isLoading.value,
            )),
            SizedBox(height: 32.h),
          ],
        ),
      ),
    );
  }
}
