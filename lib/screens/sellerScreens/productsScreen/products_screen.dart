import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../constant/app_colors.dart';
import '../../../constant/app_text_styles.dart';
import '../../../constant/constring.dart';
import '../../../widgets/custom_text/custom_text.dart';
import 'controller/products_controller.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(ProductsController());
    final products = [
      {'name': 'Velvet Radiant Foundation', 'sku': 'LC-VR-001', 'variant': 'Shade: Alabaster', 'status': 'Active', 'stock': 142, 'price': '\$48.00'},
      {'name': 'Rose Petal Blush', 'sku': 'LC-RP-002', 'variant': 'Shade: Rose Dust', 'status': 'Low Stock', 'stock': 5, 'price': '\$32.00'},
      {'name': 'Silk Glow Serum', 'sku': 'LC-SG-003', 'variant': '30ml', 'status': 'Active', 'stock': 88, 'price': '\$74.00'},
      {'name': 'Night Revival Cream', 'sku': 'LC-NR-004', 'variant': '50ml', 'status': 'Inactive', 'stock': 0, 'price': '\$95.00'},
    ];
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface.withOpacity(0.8), elevation: 0,
        title: CustomText(text: Constring.sellerProductsTitle, style: AppTextStyles.labelMd.copyWith(fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          IconButton(icon: Icon(Icons.add, color: AppColors.primary), onPressed: c.goToAddProduct),
          IconButton(icon: Icon(Icons.search, color: AppColors.onSurface), onPressed: () {}),
        ],
      ),
      body: Column(children: [
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
          itemCount: products.length,
          separatorBuilder: (_, __) => SizedBox(height: 12.h),
          itemBuilder: (_, i) {
            final p = products[i];
            final isLow = p['status'] == 'Low Stock';
            final isInactive = p['status'] == 'Inactive';
            return Container(
              padding: EdgeInsets.all(16.r),
              decoration: BoxDecoration(
                color: AppColors.surfaceContainerLowest,
                borderRadius: BorderRadius.circular(16.r),
                boxShadow: [BoxShadow(color: AppColors.onBackground.withOpacity(0.04), blurRadius: 30)],
              ),
              child: Row(children: [
                Container(width: 56.w, height: 56.h,
                  decoration: BoxDecoration(color: AppColors.surfaceContainerLow, borderRadius: BorderRadius.circular(12.r)),
                  child: Center(child: Icon(Icons.spa_outlined, color: AppColors.primary.withOpacity(0.4), size: 22.sp))),
                SizedBox(width: 12.w),
                Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    Expanded(child: CustomText(text: p['name'] as String, style: AppTextStyles.labelMd, maxLines: 1, overflow: TextOverflow.ellipsis)),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
                      decoration: BoxDecoration(
                        color: isLow ? Colors.orange.withOpacity(0.1) : isInactive ? AppColors.errorContainer : AppColors.primaryFixed,
                        borderRadius: BorderRadius.circular(99),
                      ),
                      child: CustomText(text: p['status'] as String,
                        style: AppTextStyles.labelSm.copyWith(color: isLow ? Colors.orange : isInactive ? AppColors.error : AppColors.primary)),
                    ),
                  ]),
                  SizedBox(height: 4.h),
                  CustomText(text: '${p['variant']} • SKU: ${p['sku']}',
                    style: AppTextStyles.labelSm.copyWith(color: AppColors.onSurfaceVariant)),
                  SizedBox(height: 4.h),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    CustomText(text: '${p['stock']} in stock', style: AppTextStyles.labelSm.copyWith(color: AppColors.onSurfaceVariant)),
                    CustomText(text: p['price'] as String, style: AppTextStyles.labelMd.copyWith(color: AppColors.primary)),
                  ]),
                ])),
              ]),
            );
          },
        )),
      ]),
    );
  }
}
