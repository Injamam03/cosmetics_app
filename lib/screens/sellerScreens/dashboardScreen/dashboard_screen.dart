import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../constant/app_colors.dart';
import '../../../constant/app_text_styles.dart';
import '../../../constant/constring.dart';
import '../../../widgets/custom_text/custom_text.dart';
import '../../../routes/app_routes.dart';
import 'controller/dashboard_controller.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(DashboardController());
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface.withOpacity(0.8), elevation: 0,
        title: Row(mainAxisSize: MainAxisSize.min, children: [
          Icon(Icons.storefront_outlined, color: AppColors.primary, size: 20.sp),
          SizedBox(width: 6.w),
          CustomText(text: 'Luminous Seller', style: AppTextStyles.labelMd.copyWith(color: AppColors.primary, fontWeight: FontWeight.bold)),
        ]),
        centerTitle: true,
        actions: [
          IconButton(icon: Icon(Icons.search, color: AppColors.onSurface), onPressed: () {}),
          IconButton(icon: Icon(Icons.notifications_outlined, color: AppColors.onSurface), onPressed: () {}),
          IconButton(icon: Icon(Icons.settings_outlined, color: AppColors.onSurface), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.r),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // Seller badge card
          Container(
            padding: EdgeInsets.all(16.r),
            decoration: BoxDecoration(
              gradient: AppColors.primaryGradient,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Row(children: [
              CircleAvatar(radius: 24.r, backgroundColor: AppColors.onPrimary.withOpacity(0.2),
                child: Icon(Icons.store, color: AppColors.onPrimary, size: 24.sp)),
              SizedBox(width: 12.w),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                CustomText(text: 'Luxe Cosmetics', style: AppTextStyles.labelMd.copyWith(color: AppColors.onPrimary)),
                CustomText(text: Constring.sellerPlatinumPartner, style: AppTextStyles.labelSm.copyWith(color: AppColors.onPrimary.withOpacity(0.7))),
              ]),
            ]),
          ),
          SizedBox(height: 20.h),
          // Greeting
          CustomText(text: '${Constring.sellerGreeting} Luxe Cosmetics', style: AppTextStyles.headlineMd),
          SizedBox(height: 20.h),
          // Stats
          Row(children: [
            _StatCard(label: Constring.sellerTotalSales, value: '\$42,890.50', growth: Constring.sellerGrowth, icon: Icons.trending_up),
            SizedBox(width: 12.w),
            _StatCard(label: 'Total Orders', value: '1,284', growth: '+8.3% this month', icon: Icons.shopping_bag_outlined),
          ]),
          SizedBox(height: 12.h),
          Row(children: [
            _StatCard(label: 'Active Products', value: '64', growth: '12 low stock', icon: Icons.inventory_2_outlined, isWarning: true),
            SizedBox(width: 12.w),
            _StatCard(label: 'Avg. Rating', value: '4.8★', growth: 'Excellent', icon: Icons.star_outline),
          ]),
          SizedBox(height: 24.h),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            CustomText(text: 'Quick Actions', style: AppTextStyles.labelMd),
          ]),
          SizedBox(height: 12.h),
          Row(children: [
            _QuickAction(icon: Icons.add_box_outlined, label: Constring.addProductTitle, onTap: () => Get.toNamed(AppRoutes.addProduct)),
            SizedBox(width: 12.w),
            _QuickAction(icon: Icons.inventory_outlined, label: Constring.sellerNavInventory, onTap: () => Get.toNamed(AppRoutes.sellerInventory)),
            SizedBox(width: 12.w),
            _QuickAction(icon: Icons.analytics_outlined, label: Constring.sellerNavInsights, onTap: () => Get.toNamed(AppRoutes.sellerInsights)),
          ]),
        ]),
      ),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
        currentIndex: c.currentNavIndex.value,
        onTap: c.onNavTap,
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.surfaceContainerLowest,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.onSurfaceVariant,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard_outlined), activeIcon: Icon(Icons.dashboard), label: 'Overview'),
          BottomNavigationBarItem(icon: Icon(Icons.inventory_2_outlined), activeIcon: Icon(Icons.inventory_2), label: 'Inventory'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined), activeIcon: Icon(Icons.shopping_bag), label: 'Orders'),
          BottomNavigationBarItem(icon: Icon(Icons.analytics_outlined), activeIcon: Icon(Icons.analytics), label: 'Insights'),
        ],
      )),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String label, value, growth;
  final IconData icon;
  final bool isWarning;
  const _StatCard({required this.label, required this.value, required this.growth, required this.icon, this.isWarning = false});

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [BoxShadow(color: AppColors.onBackground.withOpacity(0.04), blurRadius: 30)],
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Icon(icon, color: isWarning ? Colors.orange : AppColors.primary, size: 22.sp),
        SizedBox(height: 8.h),
        CustomText(text: value, style: AppTextStyles.headlineMd.copyWith(color: AppColors.onSurface)),
        SizedBox(height: 4.h),
        CustomText(text: label, style: AppTextStyles.labelSm.copyWith(color: AppColors.onSurfaceVariant)),
        SizedBox(height: 4.h),
        CustomText(text: growth, style: AppTextStyles.labelSm.copyWith(
          color: isWarning ? Colors.orange : Colors.green, fontWeight: FontWeight.w600)),
      ]),
    ));
  }
}

class _QuickAction extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  const _QuickAction({required this.icon, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(child: GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16.h),
        decoration: BoxDecoration(
          color: AppColors.primaryFixed,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(children: [
          Icon(icon, color: AppColors.primary, size: 24.sp),
          SizedBox(height: 6.h),
          CustomText(text: label, style: AppTextStyles.labelSm.copyWith(color: AppColors.primary), textAlign: TextAlign.center),
        ]),
      ),
    ));
  }
}
