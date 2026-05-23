import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../constant/app_colors.dart';
import '../../../constant/app_text_styles.dart';
import '../../../constant/constring.dart';
import '../../../widgets/custom_text/custom_text.dart';
import '../../../widgets/custom_text_Field/custom_text_field.dart';
import '../../../widgets/custombutton/custom_button.dart';
import 'controller/add_product_controller.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(AddProductController());
    final stepLabels = [Constring.addProductStep1, Constring.addProductStep2, Constring.addProductStep3, Constring.addProductStep4];
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background, elevation: 0,
        leading: IconButton(icon: Icon(Icons.close, color: AppColors.onSurface), onPressed: c.prevStep),
        title: Column(children: [
          CustomText(text: Constring.addProductTitle, style: AppTextStyles.labelMd.copyWith(fontWeight: FontWeight.bold)),
          Obx(() => CustomText(text: stepLabels[c.currentStep.value],
            style: AppTextStyles.labelSm.copyWith(color: AppColors.primary))),
        ]),
        centerTitle: true,
      ),
      body: Column(children: [
        // Progress bar
        Obx(() => LinearProgressIndicator(
          value: (c.currentStep.value + 1) / 4,
          backgroundColor: AppColors.outlineVariant,
          valueColor: AlwaysStoppedAnimation(AppColors.primary),
          minHeight: 3,
        )),
        Expanded(child: SingleChildScrollView(
          padding: EdgeInsets.all(20.r),
          child: Obx(() {
            switch (c.currentStep.value) {
              case 0: return _Step1(c: c);
              case 1: return _Step2(c: c);
              case 2: return _Step3(c: c);
              default: return _Step4(c: c);
            }
          }),
        )),
        Padding(
          padding: EdgeInsets.fromLTRB(20.w, 12.h, 20.w, 28.h),
          child: Obx(() => c.currentStep.value < 3
              ? CustomButton(text: Constring.addProductNext, onTap: c.nextStep)
              : CustomButton(text: Constring.addProductPublish, onTap: c.onPublish, isLoading: c.isLoading.value)),
        ),
      ]),
    );
  }
}

class _Step1 extends StatelessWidget {
  final AddProductController c;
  const _Step1({required this.c});
  @override
  Widget build(BuildContext context) {
    final cats = [
      {'icon': Icons.spa_outlined, 'label': Constring.addProductCatSkincare},
      {'icon': Icons.brush_outlined, 'label': Constring.addProductCatMakeup},
      {'icon': Icons.air_outlined, 'label': Constring.addProductCatFragrance},
    ];
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      CustomText(text: Constring.addProductEssentials, style: AppTextStyles.headlineMd),
      SizedBox(height: 24.h),
      CustomTextField(controller: c.nameController, label: Constring.addProductName,
        validator: (v) => (v == null || v.isEmpty) ? Constring.validationRequired : null),
      SizedBox(height: 16.h),
      CustomText(text: Constring.addProductCategory, style: AppTextStyles.labelMd),
      SizedBox(height: 12.h),
      Obx(() => Row(children: cats.map((cat) => GestureDetector(
        onTap: () => c.selectCategory(cat['label'] as String),
        child: Container(
          margin: EdgeInsets.only(right: 10.w),
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
          decoration: BoxDecoration(
            color: c.selectedCategory.value == cat['label'] ? AppColors.primaryFixed : AppColors.surfaceContainerLowest,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: c.selectedCategory.value == cat['label'] ? AppColors.primary : AppColors.outlineVariant),
          ),
          child: Row(children: [
            Icon(cat['icon'] as IconData, color: AppColors.primary, size: 16.sp),
            SizedBox(width: 6.w),
            CustomText(text: cat['label'] as String, style: AppTextStyles.labelSm),
          ]),
        ),
      )).toList())),
      SizedBox(height: 16.h),
      CustomTextField(controller: c.descController, label: Constring.addProductDescription, maxLines: 4),
    ]);
  }
}

class _Step2 extends StatelessWidget {
  final AddProductController c;
  const _Step2({required this.c});
  @override
  Widget build(BuildContext context) {
    final slots = [
      Constring.addProductPrimary, Constring.addProductDetailView,
      Constring.addProductLifestyle, Constring.addProductPackaging, Constring.addProductScale,
    ];
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      CustomText(text: Constring.addProductMedia, style: AppTextStyles.headlineMd),
      SizedBox(height: 24.h),
      GridView.count(
        shrinkWrap: true, physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2, crossAxisSpacing: 12.w, mainAxisSpacing: 12.h, childAspectRatio: 1.0,
        children: slots.map((label) => GestureDetector(
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.surfaceContainerLow,
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(color: AppColors.outlineVariant, style: BorderStyle.solid),
            ),
            child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Icon(Icons.add_photo_alternate_outlined, color: AppColors.primary, size: 28.sp),
              SizedBox(height: 8.h),
              CustomText(text: label, style: AppTextStyles.labelSm.copyWith(color: AppColors.onSurfaceVariant), textAlign: TextAlign.center),
            ]),
          ),
        )).toList(),
      ),
      SizedBox(height: 20.h),
      Container(
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(color: AppColors.primaryFixed, borderRadius: BorderRadius.circular(12.r)),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Icon(Icons.auto_awesome, color: AppColors.primary, size: 18.sp),
          SizedBox(width: 8.w),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            CustomText(text: Constring.addProductTips, style: AppTextStyles.labelMd.copyWith(color: AppColors.primary)),
            SizedBox(height: 4.h),
            CustomText(text: Constring.addProductNaturalLight,
              style: AppTextStyles.labelSm.copyWith(color: AppColors.onSurfaceVariant)),
          ])),
        ]),
      ),
    ]);
  }
}

class _Step3 extends StatelessWidget {
  final AddProductController c;
  const _Step3({required this.c});
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      CustomText(text: Constring.addProductPricing, style: AppTextStyles.headlineMd),
      SizedBox(height: 24.h),
      CustomTextField(controller: c.priceController, label: Constring.addProductRetailPrice,
        prefixIcon: Icons.payments_outlined, keyboardType: TextInputType.number),
      SizedBox(height: 16.h),
      CustomTextField(controller: c.skuController, label: Constring.addProductSku),
      SizedBox(height: 16.h),
      CustomTextField(controller: c.costController, label: Constring.addProductCost,
        keyboardType: TextInputType.number),
      SizedBox(height: 4.h),
      CustomText(text: Constring.addProductCostNote, style: AppTextStyles.labelSm.copyWith(color: AppColors.onSurfaceVariant)),
      SizedBox(height: 24.h),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        CustomText(text: Constring.addProductTrackInventory, style: AppTextStyles.labelMd),
        Obx(() => Switch(value: c.trackInventory.value, onChanged: (_) => c.toggleTrack(), activeColor: AppColors.primary)),
      ]),
      SizedBox(height: 16.h),
      CustomTextField(controller: c.stockController, label: Constring.addProductInitialStock, keyboardType: TextInputType.number),
      SizedBox(height: 16.h),
      CustomTextField(controller: c.lowStockController, label: Constring.addProductLowStockAlert, keyboardType: TextInputType.number),
      SizedBox(height: 16.h),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        CustomText(text: Constring.addProductAutoRestock, style: AppTextStyles.labelMd),
        Obx(() => Switch(value: c.autoRestock.value, onChanged: (_) => c.toggleRestock(), activeColor: AppColors.primary)),
      ]),
    ]);
  }
}

class _Step4 extends StatelessWidget {
  final AddProductController c;
  const _Step4({required this.c});
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      CustomText(text: Constring.addProductReview, style: AppTextStyles.headlineMd),
      SizedBox(height: 24.h),
      CustomText(text: Constring.addProductLivePreview, style: AppTextStyles.labelMd),
      SizedBox(height: 12.h),
      Container(
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          color: AppColors.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [BoxShadow(color: AppColors.onBackground.withOpacity(0.04), blurRadius: 30)],
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            height: 140.h, width: double.infinity,
            decoration: BoxDecoration(color: AppColors.surfaceContainerLow, borderRadius: BorderRadius.circular(12.r)),
            child: Center(child: Icon(Icons.spa_outlined, size: 48.sp, color: AppColors.primary.withOpacity(0.3))),
          ),
          SizedBox(height: 12.h),
          CustomText(text: Constring.addProductStorefrontView,
            style: AppTextStyles.labelSm.copyWith(color: AppColors.onSurfaceVariant)),
          SizedBox(height: 4.h),
          Obx(() => CustomText(text: c.nameController.text.isNotEmpty ? c.nameController.text : 'Product Name',
            style: AppTextStyles.labelMd)),
          Obx(() => CustomText(text: c.priceController.text.isNotEmpty ? '\$${c.priceController.text}' : '\$0.00',
            style: AppTextStyles.bodyLg.copyWith(color: AppColors.primary, fontWeight: FontWeight.w700))),
        ]),
      ),
      SizedBox(height: 24.h),
      CustomText(text: Constring.addProductReviewDetails, style: AppTextStyles.labelMd),
      SizedBox(height: 12.h),
      _ReviewRow(label: 'Product Name', value: c.nameController.text.isNotEmpty ? c.nameController.text : '-'),
      _ReviewRow(label: 'Category', value: c.selectedCategory.value.isNotEmpty ? c.selectedCategory.value : '-'),
      _ReviewRow(label: 'Price', value: c.priceController.text.isNotEmpty ? '\$${c.priceController.text}' : '-'),
      _ReviewRow(label: 'SKU', value: c.skuController.text.isNotEmpty ? c.skuController.text : '-'),
    ]);
  }
}

class _ReviewRow extends StatelessWidget {
  final String label, value;
  const _ReviewRow({required this.label, required this.value});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: AppColors.outlineVariant.withOpacity(0.5)))),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        CustomText(text: label, style: AppTextStyles.labelSm.copyWith(color: AppColors.onSurfaceVariant)),
        CustomText(text: value, style: AppTextStyles.labelMd),
      ]),
    );
  }
}
