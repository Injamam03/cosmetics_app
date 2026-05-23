import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../constant/app_colors.dart';
import '../../../constant/app_text_styles.dart';
import '../../../constant/constring.dart';
import '../../../widgets/custom_text/custom_text.dart';
import '../../../widgets/custombutton/custom_button.dart';
import 'controller/wishlist_controller.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(WishlistController());
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface.withOpacity(0.8), elevation: 0,
        leading: IconButton(icon: Icon(Icons.menu, color: AppColors.primary), onPressed: () {}),
        title: CustomText(text: Constring.wishlistTitle, style: AppTextStyles.labelMd.copyWith(fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [IconButton(icon: Icon(Icons.share_outlined, color: AppColors.onSurface), onPressed: () {})],
      ),
      body: Column(
        children: [
          // Notify strip
          Container(
            margin: EdgeInsets.all(16.r),
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            decoration: BoxDecoration(
              color: AppColors.surfaceContainerLow,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Row(children: [
              Icon(Icons.notifications_active_outlined, color: AppColors.primary, size: 20.sp),
              SizedBox(width: 8.w),
              CustomText(text: Constring.wishlistNotify,
                style: AppTextStyles.labelSm.copyWith(color: AppColors.onSurface)),
            ]),
          ),
          Expanded(
            child: Obx(() => ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              itemCount: c.items.length,
              separatorBuilder: (_, __) => SizedBox(height: 12.h),
              itemBuilder: (_, i) {
                final item = c.items[i];
                return Container(
                  padding: EdgeInsets.all(16.r),
                  decoration: BoxDecoration(
                    color: AppColors.surfaceContainerLowest,
                    borderRadius: BorderRadius.circular(16.r),
                    boxShadow: [BoxShadow(color: AppColors.onBackground.withOpacity(0.04), blurRadius: 30)],
                  ),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                      decoration: BoxDecoration(color: AppColors.primaryFixed, borderRadius: BorderRadius.circular(99)),
                      child: CustomText(text: item['category'],
                        style: AppTextStyles.labelSm.copyWith(color: AppColors.primary)),
                    ),
                    SizedBox(height: 8.h),
                    Row(children: [
                      Container(width: 64.w, height: 64.h,
                        decoration: BoxDecoration(color: AppColors.surfaceContainerLow, borderRadius: BorderRadius.circular(12.r)),
                        child: Center(child: Icon(Icons.spa_outlined, color: AppColors.primary.withOpacity(0.4), size: 24.sp))),
                      SizedBox(width: 12.w),
                      Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        CustomText(text: item['name'], style: AppTextStyles.labelMd),
                        SizedBox(height: 4.h),
                        CustomText(text: item['tag'], style: AppTextStyles.labelSm.copyWith(color: AppColors.onSurfaceVariant)),
                        SizedBox(height: 8.h),
                        Row(children: [
                          CustomText(text: item['price'], style: AppTextStyles.labelMd.copyWith(color: AppColors.primary)),
                          if (item['oldPrice'] != null) ...[
                            SizedBox(width: 8.w),
                            CustomText(text: item['oldPrice'],
                              style: AppTextStyles.labelSm.copyWith(
                                color: AppColors.onSurfaceVariant, decoration: TextDecoration.lineThrough)),
                          ],
                        ]),
                      ])),
                      IconButton(icon: Icon(Icons.delete_outline, color: AppColors.error, size: 20.sp),
                        onPressed: () => c.removeItem(i)),
                    ]),
                    SizedBox(height: 12.h),
                    CustomButton(text: Constring.wishlistMoveToCart, onTap: () => c.moveToCart(i)),
                  ]),
                );
              },
            )),
          ),
        ],
      ),
    );
  }
}
