import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../constant/app_colors.dart';
import '../../../constant/app_text_styles.dart';
import '../../../constant/constring.dart';
import '../../../widgets/custom_text/custom_text.dart';
import '../../../widgets/custombutton/custom_button.dart';
import 'controller/cart_controller.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(CartController());
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface.withOpacity(0.8),
        elevation: 0,
        leading: IconButton(icon: Icon(Icons.menu, color: AppColors.primary), onPressed: () {}),
        title: Column(children: [
          CustomText(text: Constring.cartTitle, style: AppTextStyles.labelMd.copyWith(fontWeight: FontWeight.bold)),
          Obx(() => CustomText(text: 'You have ${c.cartItems.length} items in your selection.',
            style: AppTextStyles.labelSm.copyWith(color: AppColors.onSurfaceVariant))),
        ]),
        centerTitle: true,
      ),
      body: Obx(() => c.cartItems.isEmpty
          ? Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Icon(Icons.shopping_bag_outlined, size: 64.sp, color: AppColors.outlineVariant),
              SizedBox(height: 16.h),
              CustomText(text: Constring.cartEmpty, style: AppTextStyles.headlineMd),
              SizedBox(height: 8.h),
              CustomText(text: Constring.cartEmptySub,
                style: AppTextStyles.bodyMd.copyWith(color: AppColors.onSurfaceVariant)),
            ]))
          : ListView.separated(
              padding: EdgeInsets.all(16.r),
              itemCount: c.cartItems.length,
              separatorBuilder: (_, __) => SizedBox(height: 12.h),
              itemBuilder: (_, i) {
                final item = c.cartItems[i];
                return Container(
                  padding: EdgeInsets.all(16.r),
                  decoration: BoxDecoration(
                    color: AppColors.surfaceContainerLowest,
                    borderRadius: BorderRadius.circular(16.r),
                    boxShadow: [BoxShadow(color: AppColors.onBackground.withOpacity(0.04), blurRadius: 30)],
                  ),
                  child: Row(children: [
                    Container(
                      width: 70.w, height: 70.h,
                      decoration: BoxDecoration(
                        color: AppColors.surfaceContainerLow,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Center(child: Icon(Icons.spa_outlined, color: AppColors.primary.withOpacity(0.4), size: 28.sp)),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      CustomText(text: item['name'], style: AppTextStyles.labelMd),
                      SizedBox(height: 4.h),
                      CustomText(text: item['variant'],
                        style: AppTextStyles.labelSm.copyWith(color: AppColors.onSurfaceVariant)),
                      SizedBox(height: 8.h),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                        CustomText(text: '\$${item['price'].toStringAsFixed(2)}',
                          style: AppTextStyles.labelMd.copyWith(color: AppColors.primary)),
                        Obx(() => Row(children: [
                          _QtyButton(icon: Icons.remove, onTap: () => c.decrement(i)),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.w),
                            child: CustomText(text: '${c.cartItems[i]['qty']}', style: AppTextStyles.labelMd),
                          ),
                          _QtyButton(icon: Icons.add, onTap: () => c.increment(i)),
                        ])),
                      ]),
                    ])),
                    IconButton(icon: Icon(Icons.delete_outline, color: AppColors.error, size: 20.sp), onPressed: () => c.removeItem(i)),
                  ]),
                );
              },
            ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 28.h),
        decoration: BoxDecoration(
          color: AppColors.surfaceContainerLowest,
          boxShadow: [BoxShadow(color: AppColors.onBackground.withOpacity(0.08), blurRadius: 20, offset: const Offset(0, -4))],
        ),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Obx(() => Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            CustomText(text: Constring.cartTotal, style: AppTextStyles.labelMd),
            CustomText(text: '\$${c.total.toStringAsFixed(2)}',
              style: AppTextStyles.bodyLg.copyWith(color: AppColors.primary, fontWeight: FontWeight.w700)),
          ])),
          SizedBox(height: 16.h),
          CustomButton(text: Constring.cartCheckout, onTap: c.goToCheckout),
        ]),
      ),
    );
  }
}

class _QtyButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const _QtyButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(4.r),
        decoration: BoxDecoration(
          color: AppColors.surfaceContainerLow,
          borderRadius: BorderRadius.circular(6.r),
        ),
        child: Icon(icon, size: 16.sp, color: AppColors.primary),
      ),
    );
  }
}
