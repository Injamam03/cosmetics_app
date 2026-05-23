import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../constant/app_colors.dart';
import '../../../constant/app_text_styles.dart';
import '../../../constant/constring.dart';
import '../../../widgets/custom_text/custom_text.dart';
import 'controller/orders_controller.dart';

class SellerOrdersScreen extends StatelessWidget {
  const SellerOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(SellerOrdersController());
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface.withOpacity(0.8), elevation: 0,
        title: CustomText(text: Constring.sellerOrdersTitle, style: AppTextStyles.labelMd.copyWith(fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          IconButton(icon: Icon(Icons.search, color: AppColors.onSurface), onPressed: () {}),
          IconButton(icon: Icon(Icons.auto_awesome_outlined, color: AppColors.primary), onPressed: () {}),
        ],
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child: CustomText(text: Constring.sellerManagementPortal,
            style: AppTextStyles.labelSm.copyWith(color: AppColors.onSurfaceVariant, letterSpacing: 1)),
        ),
        SizedBox(
          height: 50.h,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            children: c.filters.map((f) => Obx(() => GestureDetector(
              onTap: () => c.setFilter(f),
              child: Container(
                margin: EdgeInsets.only(right: 8.w),
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                decoration: BoxDecoration(
                  color: c.selectedFilter.value == f ? AppColors.primaryFixed : AppColors.surfaceContainerLowest,
                  borderRadius: BorderRadius.circular(99),
                  border: Border.all(color: c.selectedFilter.value == f ? AppColors.primary : AppColors.outlineVariant),
                ),
                child: CustomText(text: f, style: AppTextStyles.labelSm.copyWith(color: c.selectedFilter.value == f ? AppColors.primary : AppColors.onSurface)),
              ),
            ))).toList(),
          ),
        ),
        Expanded(child: ListView.separated(
          padding: EdgeInsets.all(16.r),
          itemCount: 6,
          separatorBuilder: (_, __) => SizedBox(height: 12.h),
          itemBuilder: (_, i) {
            final statuses = ['Pending', 'Processing', 'Shipped', 'Delivered', 'Pending', 'Shipped'];
            final colors = [Colors.orange, Colors.blue, Colors.teal, Colors.green, Colors.orange, Colors.teal];
            return Container(
              padding: EdgeInsets.all(16.r),
              decoration: BoxDecoration(
                color: AppColors.surfaceContainerLowest,
                borderRadius: BorderRadius.circular(16.r),
                boxShadow: [BoxShadow(color: AppColors.onBackground.withOpacity(0.04), blurRadius: 30)],
              ),
              child: Row(children: [
                Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  CustomText(text: '#ORD-20240${i + 1}23', style: AppTextStyles.labelMd),
                  SizedBox(height: 4.h),
                  CustomText(text: '${i + 2} items • \$${(i + 1) * 68}.00',
                    style: AppTextStyles.labelSm.copyWith(color: AppColors.onSurfaceVariant)),
                  SizedBox(height: 4.h),
                  CustomText(text: 'Customer: Jane D.', style: AppTextStyles.labelSm.copyWith(color: AppColors.onSurfaceVariant)),
                ])),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                  decoration: BoxDecoration(
                    color: colors[i].withOpacity(0.1),
                    borderRadius: BorderRadius.circular(99),
                  ),
                  child: CustomText(text: statuses[i], style: AppTextStyles.labelSm.copyWith(color: colors[i], fontWeight: FontWeight.w600)),
                ),
              ]),
            );
          },
        )),
      ]),
    );
  }
}
