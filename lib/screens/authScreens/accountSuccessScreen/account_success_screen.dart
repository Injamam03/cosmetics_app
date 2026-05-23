import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../constant/app_colors.dart';
import '../../../constant/app_text_styles.dart';
import '../../../constant/constring.dart';
import '../../../widgets/custom_text/custom_text.dart';
import '../../../widgets/custombutton/custom_button.dart';
import 'controller/account_success_controller.dart';

class AccountSuccessScreen extends StatelessWidget {
  const AccountSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(AccountSuccessController());
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          Positioned(top: -80.h, right: -40.w,
            child: Container(width: 280.w, height: 280.h,
              decoration: BoxDecoration(shape: BoxShape.circle, color: AppColors.primary.withOpacity(0.05)))),
          Positioned(bottom: -80.h, left: -40.w,
            child: Container(width: 280.w, height: 280.h,
              decoration: BoxDecoration(shape: BoxShape.circle, color: AppColors.secondaryContainer.withOpacity(0.2)))),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(28.r),
                    decoration: BoxDecoration(
                      gradient: AppColors.primaryGradient,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.auto_awesome, color: AppColors.onPrimary, size: 48.sp),
                  ),
                  SizedBox(height: 32.h),
                  CustomText(text: Constring.accountSuccessTitle, style: AppTextStyles.headlineLg,
                    textAlign: TextAlign.center),
                  SizedBox(height: 8.h),
                  CustomText(text: Constring.accountSuccessSubtitle,
                    style: AppTextStyles.bodyMd.copyWith(color: AppColors.onSurfaceVariant),
                    textAlign: TextAlign.center),
                  SizedBox(height: 48.h),
                  // Perks row
                  Row(children: [
                    Expanded(child: _PerkCard(
                      icon: Icons.redeem_outlined,
                      title: Constring.accountSuccessGift,
                      subtitle: Constring.accountSuccessGiftSub,
                    )),
                    SizedBox(width: 12.w),
                    Expanded(child: _PerkCard(
                      icon: Icons.workspace_premium_outlined,
                      title: Constring.accountSuccessLoyalty,
                      subtitle: Constring.accountSuccessLoyaltySub,
                    )),
                  ]),
                  SizedBox(height: 48.h),
                  CustomButton(text: Constring.accountSuccessButton, onTap: c.onStartShopping),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PerkCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  const _PerkCard({required this.icon, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [BoxShadow(color: AppColors.onBackground.withOpacity(0.04), blurRadius: 30)],
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Icon(icon, color: AppColors.primary, size: 24.sp),
        SizedBox(height: 8.h),
        CustomText(text: title, style: AppTextStyles.labelMd),
        SizedBox(height: 4.h),
        CustomText(text: subtitle,
          style: AppTextStyles.labelSm.copyWith(color: AppColors.onSurfaceVariant)),
      ]),
    );
  }
}
