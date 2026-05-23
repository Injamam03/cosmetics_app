import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../constant/app_colors.dart';
import '../../../constant/app_text_styles.dart';
import '../../../constant/constring.dart';
import '../../../widgets/custom_text/custom_text.dart';
import 'controller/inventory_controller.dart';

class InventoryScreen extends StatelessWidget {
  const InventoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(InventoryController());
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface.withOpacity(0.8), elevation: 0,
        title: CustomText(text: Constring.sellerProductsTitle, style: AppTextStyles.labelMd.copyWith(fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [IconButton(icon: Icon(Icons.search, color: AppColors.onSurface), onPressed: () {})],
      ),
      body: Column(children: [
        SizedBox(
          height: 50.h,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            children: c.cats.map((cat) => Obx(() => GestureDetector(
              onTap: () => c.setCat(cat),
              child: Container(
                margin: EdgeInsets.only(right: 8.w),
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                decoration: BoxDecoration(
                  color: c.selectedCat.value == cat ? AppColors.primaryFixed : AppColors.surfaceContainerLowest,
                  borderRadius: BorderRadius.circular(99),
                  border: Border.all(color: c.selectedCat.value == cat ? AppColors.primary : AppColors.outlineVariant),
                ),
                child: CustomText(text: cat, style: AppTextStyles.labelSm.copyWith(color: c.selectedCat.value == cat ? AppColors.primary : AppColors.onSurface)),
              ),
            ))).toList(),
          ),
        ),
        Expanded(child: ListView.separated(
          padding: EdgeInsets.all(16.r),
          itemCount: 8,
          separatorBuilder: (_, __) => SizedBox(height: 12.h),
          itemBuilder: (_, i) => Container(
            padding: EdgeInsets.all(14.r),
            decoration: BoxDecoration(
              color: AppColors.surfaceContainerLowest,
              borderRadius: BorderRadius.circular(16.r),
              boxShadow: [BoxShadow(color: AppColors.onBackground.withOpacity(0.04), blurRadius: 30)],
            ),
            child: Row(children: [
              Container(width: 48.w, height: 48.h,
                decoration: BoxDecoration(color: AppColors.surfaceContainerLow, borderRadius: BorderRadius.circular(10.r)),
                child: Center(child: Icon(Icons.spa_outlined, color: AppColors.primary.withOpacity(0.4), size: 20.sp))),
              SizedBox(width: 12.w),
              Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                CustomText(text: 'Product ${i + 1}', style: AppTextStyles.labelMd),
                SizedBox(height: 2.h),
                CustomText(text: 'SKU: LC-00${i + 1} • Stock: ${(i + 1) * 12}',
                  style: AppTextStyles.labelSm.copyWith(color: AppColors.onSurfaceVariant)),
              ])),
              CustomText(text: '\$${(i + 1) * 22}.00', style: AppTextStyles.labelMd.copyWith(color: AppColors.primary)),
            ]),
          ),
        )),
      ]),
    );
  }
}
