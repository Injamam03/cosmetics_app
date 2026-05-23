import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../constant/app_colors.dart';
import '../../../../constant/app_text_styles.dart';
import '../../../../constant/constring.dart';
import '../../../../widgets/custom_text/custom_text.dart';
import 'controller/order_history_controller.dart';

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(OrderHistoryController());
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background, elevation: 0,
        leading: IconButton(icon: Icon(Icons.arrow_back, color: AppColors.primary), onPressed: Get.back),
        title: CustomText(text: Constring.orderHistoryTitle, style: AppTextStyles.labelMd.copyWith(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        // Filter chips
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
                child: CustomText(text: f,
                  style: AppTextStyles.labelSm.copyWith(
                    color: c.selectedFilter.value == f ? AppColors.primary : AppColors.onSurface)),
              ),
            ))).toList(),
          ),
        ),
        SizedBox(height: 8.h),
        Expanded(child: ListView.separated(
          padding: EdgeInsets.all(16.r),
          itemCount: 5,
          separatorBuilder: (_, __) => SizedBox(height: 12.h),
          itemBuilder: (_, i) => Container(
            padding: EdgeInsets.all(16.r),
            decoration: BoxDecoration(
              color: AppColors.surfaceContainerLowest,
              borderRadius: BorderRadius.circular(16.r),
              boxShadow: [BoxShadow(color: AppColors.onBackground.withOpacity(0.04), blurRadius: 30)],
            ),
            child: Row(children: [
              Container(width: 56.w, height: 56.h,
                decoration: BoxDecoration(color: AppColors.primaryFixed, borderRadius: BorderRadius.circular(12.r)),
                child: Center(child: Icon(Icons.inventory_2_outlined, color: AppColors.primary, size: 24.sp))),
              SizedBox(width: 12.w),
              Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                CustomText(text: '#LUM-00${i + 1}234', style: AppTextStyles.labelMd),
                SizedBox(height: 4.h),
                CustomText(text: '3 items • \$${(i + 1) * 45}.00',
                  style: AppTextStyles.labelSm.copyWith(color: AppColors.onSurfaceVariant)),
              ])),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                decoration: BoxDecoration(color: AppColors.primaryFixed, borderRadius: BorderRadius.circular(99)),
                child: CustomText(text: 'Delivered', style: AppTextStyles.labelSm.copyWith(color: AppColors.primary)),
              ),
            ]),
          ),
        )),
      ]),
    );
  }
}
