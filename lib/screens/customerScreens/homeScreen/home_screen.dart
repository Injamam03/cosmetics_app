import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../constant/app_colors.dart';
import '../../../constant/app_text_styles.dart';
import '../../../constant/constring.dart';
import '../../../widgets/custom_text/custom_text.dart';
import '../../../widgets/custombutton/custom_button.dart';
import 'controller/home_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(HomeController());
    return Scaffold(
      backgroundColor: AppColors.surfaceBright,
      appBar: AppBar(
        backgroundColor: AppColors.surface.withOpacity(0.8),
        elevation: 0,
        leading: IconButton(icon: Icon(Icons.menu, color: AppColors.primary), onPressed: () {}),
        title: CustomText(text: Constring.appName,
          style: AppTextStyles.labelMd.copyWith(color: AppColors.primary, fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          IconButton(icon: Icon(Icons.search, color: AppColors.onSurface), onPressed: () {}),
          IconButton(icon: Icon(Icons.notifications_outlined, color: AppColors.onSurface), onPressed: () {}),
          IconButton(icon: Icon(Icons.shopping_bag_outlined, color: AppColors.primary), onPressed: c.goToCart),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero Banner
            Container(
              margin: EdgeInsets.all(16.r),
              height: 220.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24.r),
                gradient: AppColors.primaryGradient,
              ),
              child: Stack(
                children: [
                  Positioned(top: -30.h, right: -30.w,
                    child: Container(width: 180.w, height: 180.h,
                      decoration: BoxDecoration(shape: BoxShape.circle,
                        color: AppColors.onPrimary.withOpacity(0.05)))),
                  Padding(
                    padding: EdgeInsets.all(24.r),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                          decoration: BoxDecoration(
                            color: AppColors.roseGold.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(99),
                          ),
                          child: CustomText(text: Constring.homeBannerBadge,
                            style: AppTextStyles.labelSm.copyWith(color: AppColors.onPrimary)),
                        ),
                        SizedBox(height: 12.h),
                        CustomText(text: Constring.homeBannerTitle,
                          style: AppTextStyles.headlineLgMobile.copyWith(color: AppColors.onPrimary)),
                        SizedBox(height: 4.h),
                        CustomText(text: Constring.homeBannerSubtitle,
                          style: AppTextStyles.bodyMd.copyWith(color: AppColors.onPrimary.withOpacity(0.7))),
                        SizedBox(height: 16.h),
                        SizedBox(
                          width: 160.w,
                          child: CustomButton(
                            text: Constring.homeShopButton,
                            onTap: c.goToCategories,
                            isOutlined: false,
                            backgroundColor: AppColors.onPrimary,
                            textColor: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Categories
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                CustomText(text: 'Categories', style: AppTextStyles.labelMd),
                GestureDetector(onTap: c.goToCategories,
                  child: CustomText(text: Constring.homeViewAll,
                    style: AppTextStyles.labelSm.copyWith(color: AppColors.primary))),
              ]),
            ),
            SizedBox(height: 12.h),
            SizedBox(
              height: 90.h,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                children: const [
                  _CategoryChip(icon: Icons.brush_outlined, label: Constring.homeCategoryMakeup),
                  _CategoryChip(icon: Icons.spa_outlined, label: Constring.homeCategorySkincare),
                  _CategoryChip(icon: Icons.air_outlined, label: Constring.homeCategoryFragrance),
                  _CategoryChip(icon: Icons.bathtub_outlined, label: Constring.homeCategoryBathBody),
                ],
              ),
            ),
            SizedBox(height: 24.h),
            // Featured
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                CustomText(text: Constring.homeFeatured, style: AppTextStyles.labelMd),
                GestureDetector(onTap: () {},
                  child: CustomText(text: Constring.homeViewAll,
                    style: AppTextStyles.labelSm.copyWith(color: AppColors.primary))),
              ]),
            ),
            SizedBox(height: 12.h),
            SizedBox(
              height: 220.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                itemCount: 5,
                separatorBuilder: (_, __) => SizedBox(width: 12.w),
                itemBuilder: (_, i) => GestureDetector(
                  onTap: c.goToProduct,
                  child: _ProductCard(
                    name: 'Velvet Glow Serum',
                    price: '\$42.00',
                    oldPrice: '\$65.00',
                    rating: '4.8',
                  ),
                ),
              ),
            ),
            SizedBox(height: 32.h),
          ],
        ),
      ),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
        currentIndex: c.currentNavIndex.value,
        onTap: (i) {
          c.onNavTap(i);
          if (i == 1) c.goToWishlist();
          if (i == 2) c.goToCart();
          if (i == 3) c.goToProfile();
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.surfaceContainerLowest,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.onSurfaceVariant,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), activeIcon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_outline), activeIcon: Icon(Icons.favorite), label: 'Wishlist'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined), activeIcon: Icon(Icons.shopping_bag), label: 'Bag'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), activeIcon: Icon(Icons.person), label: 'Profile'),
        ],
      )),
    );
  }
}

class _CategoryChip extends StatelessWidget {
  final IconData icon;
  final String label;
  const _CategoryChip({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 12.w),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [BoxShadow(color: AppColors.onBackground.withOpacity(0.04), blurRadius: 30)],
      ),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Icon(icon, color: AppColors.primary, size: 24.sp),
        SizedBox(height: 4.h),
        CustomText(text: label, style: AppTextStyles.labelSm.copyWith(color: AppColors.onSurface)),
      ]),
    );
  }
}

class _ProductCard extends StatelessWidget {
  final String name;
  final String price;
  final String oldPrice;
  final String rating;
  const _ProductCard({required this.name, required this.price, required this.oldPrice, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.w,
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [BoxShadow(color: AppColors.onBackground.withOpacity(0.04), blurRadius: 30)],
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          height: 120.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
            color: AppColors.surfaceContainerLow,
          ),
          child: Center(child: Icon(Icons.spa_outlined, size: 40.sp, color: AppColors.primary.withOpacity(0.3))),
        ),
        Padding(
          padding: EdgeInsets.all(10.r),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            CustomText(text: name, style: AppTextStyles.labelSm, maxLines: 1, overflow: TextOverflow.ellipsis),
            SizedBox(height: 4.h),
            Row(children: [
              Icon(Icons.star, color: Colors.amber, size: 12.sp),
              SizedBox(width: 2.w),
              CustomText(text: rating, style: AppTextStyles.labelSm.copyWith(color: AppColors.onSurfaceVariant)),
            ]),
            SizedBox(height: 4.h),
            CustomText(text: price, style: AppTextStyles.labelMd.copyWith(color: AppColors.primary)),
          ]),
        ),
      ]),
    );
  }
}
