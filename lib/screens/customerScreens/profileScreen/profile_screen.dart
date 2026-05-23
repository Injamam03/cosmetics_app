import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../constant/app_colors.dart';
import '../../../constant/app_text_styles.dart';
import '../../../constant/constring.dart';
import '../../../widgets/custom_text/custom_text.dart';
import 'controller/profile_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(ProfileController());
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface.withOpacity(0.8), elevation: 0,
        leading: IconButton(icon: Icon(Icons.menu, color: AppColors.primary), onPressed: () {}),
        title: CustomText(text: Constring.appName, style: AppTextStyles.labelMd.copyWith(color: AppColors.primary, fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [IconButton(icon: Icon(Icons.shopping_bag_outlined, color: AppColors.onSurface), onPressed: () {})],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Header
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(24.r),
              decoration: BoxDecoration(
                gradient: AppColors.primaryGradient,
              ),
              child: Column(children: [
                CircleAvatar(
                  radius: 40.r,
                  backgroundColor: AppColors.onPrimary.withOpacity(0.2),
                  child: Icon(Icons.person, color: AppColors.onPrimary, size: 40.sp),
                ),
                SizedBox(height: 12.h),
                CustomText(text: 'Sophie Laurent',
                  style: AppTextStyles.headlineMd.copyWith(color: AppColors.onPrimary)),
                SizedBox(height: 4.h),
                CustomText(text: 'sophie.l@editorial.com',
                  style: AppTextStyles.labelSm.copyWith(color: AppColors.onPrimary.withOpacity(0.7))),
                SizedBox(height: 8.h),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: AppColors.roseGold.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(99),
                  ),
                  child: CustomText(text: Constring.profileVibMember,
                    style: AppTextStyles.labelSm.copyWith(color: AppColors.onPrimary, letterSpacing: 1.5)),
                ),
              ]),
            ),
            // Points
            Container(
              margin: EdgeInsets.all(16.r),
              padding: EdgeInsets.all(20.r),
              decoration: BoxDecoration(
                color: AppColors.surfaceContainerLowest,
                borderRadius: BorderRadius.circular(16.r),
                boxShadow: [BoxShadow(color: AppColors.onBackground.withOpacity(0.04), blurRadius: 30)],
              ),
              child: Row(children: [
                Icon(Icons.stars_outlined, color: AppColors.primary, size: 32.sp),
                SizedBox(width: 12.w),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  CustomText(text: Constring.profileGlowPoints, style: AppTextStyles.labelSm.copyWith(color: AppColors.onSurfaceVariant)),
                  CustomText(text: '2,450', style: AppTextStyles.headlineMd.copyWith(color: AppColors.primary)),
                ]),
              ]),
            ),
            // Menu
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.surfaceContainerLowest,
                  borderRadius: BorderRadius.circular(16.r),
                  boxShadow: [BoxShadow(color: AppColors.onBackground.withOpacity(0.04), blurRadius: 30)],
                ),
                child: Column(children: [
                  _SectionHeader('Orders & Shopping'),
                  _MenuItem(icon: Icons.inventory_2_outlined, label: Constring.profileOrderHistory, onTap: c.goToOrderHistory),
                  _MenuItem(icon: Icons.favorite_outline, label: Constring.profileWishlist, trailing: Constring.profileWishlistCount, onTap: c.goToWishlist),
                  _Divider(),
                  _SectionHeader('Account Details'),
                  _MenuItem(icon: Icons.location_on_outlined, label: Constring.profileSavedAddresses, onTap: () {}),
                  _MenuItem(icon: Icons.edit_outlined, label: Constring.profileEditProfile, onTap: c.goToEditProfile),
                  _MenuItem(icon: Icons.lock_outline, label: Constring.profileChangePassword, onTap: c.goToChangePassword),
                  _Divider(),
                  _SectionHeader('Support'),
                  _MenuItem(icon: Icons.headset_mic_outlined, label: Constring.profileContactSupport, onTap: c.goToContactSupport),
                  _MenuItem(icon: Icons.delete_outline, label: Constring.profileDeleteAccount, isDestructive: true, onTap: c.goToDeleteAccount),
                  _Divider(),
                  _MenuItem(icon: Icons.logout, label: Constring.profileLogout, isDestructive: true, onTap: c.onLogout),
                  SizedBox(height: 8.h),
                ]),
              ),
            ),
            SizedBox(height: 32.h),
          ],
        ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader(this.title);
  @override
  Widget build(BuildContext context) => Padding(
    padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 4.h),
    child: Align(alignment: Alignment.centerLeft,
      child: CustomText(text: title, style: AppTextStyles.labelSm.copyWith(color: AppColors.onSurfaceVariant, letterSpacing: 1))),
  );
}

class _MenuItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String? trailing;
  final bool isDestructive;
  final VoidCallback onTap;
  const _MenuItem({required this.icon, required this.label, this.trailing, this.isDestructive = false, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final color = isDestructive ? AppColors.error : AppColors.onSurface;
    return ListTile(
      onTap: onTap,
      leading: Icon(icon, color: isDestructive ? AppColors.error : AppColors.primary, size: 22.sp),
      title: CustomText(text: label, style: AppTextStyles.bodyMd.copyWith(color: color)),
      trailing: trailing != null
          ? CustomText(text: trailing!, style: AppTextStyles.labelSm.copyWith(color: AppColors.onSurfaceVariant))
          : Icon(Icons.chevron_right, color: AppColors.onSurfaceVariant, size: 20.sp),
    );
  }
}

class _Divider extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Divider(color: AppColors.outlineVariant.withOpacity(0.5), height: 1);
}
