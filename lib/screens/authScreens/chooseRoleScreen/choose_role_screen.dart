import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../constant/app_colors.dart';
import '../../../constant/app_text_styles.dart';
import '../../../constant/constring.dart';
import '../../../widgets/custom_text/custom_text.dart';
import '../../../widgets/custombutton/custom_button.dart';
import 'controller/choose_role_controller.dart';

class ChooseRoleScreen extends StatelessWidget {
  const ChooseRoleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(ChooseRoleController());
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              SizedBox(height: 24.h),
              CustomText(
                text: Constring.appName,
                style: AppTextStyles.labelMd.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 48.h),
              CustomText(
                text: Constring.chooseRoleTitle,
                style: AppTextStyles.headlineLgMobile,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8.h),
              CustomText(
                text: Constring.chooseRoleSubtitle,
                style: AppTextStyles.bodyMd.copyWith(
                  color: AppColors.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40.h),
              Obx(() => _RoleCard(
                    icon: Icons.shopping_bag_outlined,
                    title: Constring.roleCustomer,
                    subtitle: Constring.roleCustomerSub,
                    isSelected: c.selectedRole.value == 'customer',
                    onTap: () => c.selectRole('customer'),
                  )),
              SizedBox(height: 16.h),
              Obx(() => _RoleCard(
                    icon: Icons.storefront_outlined,
                    title: Constring.roleSeller,
                    subtitle: Constring.roleSellerSub,
                    isSelected: c.selectedRole.value == 'seller',
                    onTap: () => c.selectRole('seller'),
                  )),
              const Spacer(),
              Obx(() => CustomButton(
                    text: Constring.roleContinue,
                    onTap: c.selectedRole.value.isNotEmpty ? c.onContinue : null,
                  )),
              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }
}

class _RoleCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool isSelected;
  final VoidCallback onTap;

  const _RoleCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: double.infinity,
        padding: EdgeInsets.all(20.r),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryFixed : AppColors.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.outlineVariant,
            width: isSelected ? 2 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.onBackground.withOpacity(0.04),
              blurRadius: 30,
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(12.r),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primary : AppColors.surfaceContainerLow,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Icon(
                icon,
                color: isSelected ? AppColors.onPrimary : AppColors.primary,
                size: 24.sp,
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: title,
                    style: AppTextStyles.labelMd.copyWith(
                      color: AppColors.onSurface,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  CustomText(
                    text: subtitle,
                    style: AppTextStyles.labelSm.copyWith(
                      color: AppColors.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            if (isSelected)
              Icon(Icons.check_circle, color: AppColors.primary, size: 22.sp),
          ],
        ),
      ),
    );
  }
}
