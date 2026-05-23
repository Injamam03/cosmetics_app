import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../constant/app_colors.dart';
import '../../../constant/app_text_styles.dart';
import '../../../constant/constring.dart';
import '../../../widgets/custom_text/custom_text.dart';
import '../../../widgets/custombutton/custom_button.dart';
import 'controller/product_detail_controller.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(ProductDetailController());
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 280.h,
            pinned: true,
            backgroundColor: AppColors.background,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: AppColors.primary),
              onPressed: Get.back,
            ),
            title: CustomText(text: Constring.appName,
              style: AppTextStyles.labelMd.copyWith(color: AppColors.primary, fontWeight: FontWeight.bold)),
            centerTitle: true,
            actions: [
              Obx(() => IconButton(
                icon: Icon(
                  c.isWishlisted.value ? Icons.favorite : Icons.favorite_border,
                  color: c.isWishlisted.value ? Colors.red : AppColors.onSurface,
                ),
                onPressed: c.toggleWishlist,
              )),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: AppColors.surfaceContainerLow,
                child: Center(child: Icon(Icons.spa_outlined, size: 100.sp, color: AppColors.primary.withOpacity(0.2))),
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all(20.r),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                CustomText(text: 'Velvet Glow Serum', style: AppTextStyles.headlineMd),
                SizedBox(height: 8.h),
                Row(children: [
                  Icon(Icons.star, color: Colors.amber, size: 16.sp),
                  SizedBox(width: 4.w),
                  CustomText(text: '4.8', style: AppTextStyles.labelMd),
                  SizedBox(width: 4.w),
                  CustomText(text: '124 ${Constring.productReviews}',
                    style: AppTextStyles.labelSm.copyWith(color: AppColors.onSurfaceVariant)),
                ]),
                SizedBox(height: 16.h),
                Row(children: [
                  CustomText(text: '\$42.00',
                    style: AppTextStyles.bodyLg.copyWith(color: AppColors.primary, fontWeight: FontWeight.w700)),
                  SizedBox(width: 8.w),
                  CustomText(text: '\$65.00',
                    style: AppTextStyles.bodyMd.copyWith(
                      color: AppColors.onSurfaceVariant,
                      decoration: TextDecoration.lineThrough,
                    )),
                ]),
                SizedBox(height: 24.h),
                CustomText(text: Constring.productSelectSize, style: AppTextStyles.labelMd),
                SizedBox(height: 12.h),
                Obx(() => Row(children: [
                  _SizeChip(label: Constring.productSize30ml, isSelected: c.selectedSize.value == Constring.productSize30ml, onTap: () => c.selectSize(Constring.productSize30ml)),
                  SizedBox(width: 8.w),
                  _SizeChip(label: Constring.productSize50ml, isSelected: c.selectedSize.value == Constring.productSize50ml, onTap: () => c.selectSize(Constring.productSize50ml)),
                  SizedBox(width: 8.w),
                  _SizeChip(label: Constring.productSize100ml, isSelected: c.selectedSize.value == Constring.productSize100ml, onTap: () => c.selectSize(Constring.productSize100ml)),
                ])),
                SizedBox(height: 24.h),
                _ExpandableSection(
                  title: Constring.productKeyIngredients,
                  content: '• Pure Hyaluronic Acid: Retains 1000x its weight in water.\n• Vitamin C: Brightens and evens skin tone.\n• Peptide Complex: Boosts collagen production.',
                  isExpanded: false,
                  onTap: c.toggleIngredients,
                  expandedObs: c.ingredientsExpanded,
                ),
                SizedBox(height: 12.h),
                _ExpandableSection(
                  title: Constring.productHowToUse,
                  content: 'Apply 2-3 drops to cleansed skin morning and evening. Gently press into face and neck. Follow with moisturizer.',
                  isExpanded: false,
                  onTap: c.toggleHowToUse,
                  expandedObs: c.howToUseExpanded,
                ),
                SizedBox(height: 24.h),
                CustomText(text: Constring.productCustomerReviews, style: AppTextStyles.labelMd),
                SizedBox(height: 100.h),
              ]),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.fromLTRB(20.w, 12.h, 20.w, 24.h),
        decoration: BoxDecoration(
          color: AppColors.surfaceContainerLowest,
          boxShadow: [BoxShadow(color: AppColors.onBackground.withOpacity(0.08), blurRadius: 20, offset: const Offset(0, -4))],
        ),
        child: CustomButton(text: Constring.productAddToCart, onTap: c.addToBag),
      ),
    );
  }
}

class _SizeChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  const _SizeChip({required this.label, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryFixed : AppColors.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(99),
          border: Border.all(color: isSelected ? AppColors.primary : AppColors.outlineVariant),
        ),
        child: CustomText(text: label,
          style: AppTextStyles.labelSm.copyWith(color: isSelected ? AppColors.primary : AppColors.onSurface)),
      ),
    );
  }
}

class _ExpandableSection extends StatelessWidget {
  final String title;
  final String content;
  final bool isExpanded;
  final VoidCallback onTap;
  final RxBool expandedObs;
  const _ExpandableSection({required this.title, required this.content, required this.isExpanded, required this.onTap, required this.expandedObs});

  @override
  Widget build(BuildContext context) {
    return Obx(() => GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          color: AppColors.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [BoxShadow(color: AppColors.onBackground.withOpacity(0.04), blurRadius: 30)],
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            CustomText(text: title, style: AppTextStyles.labelMd),
            Icon(expandedObs.value ? Icons.expand_less : Icons.expand_more, color: AppColors.primary),
          ]),
          if (expandedObs.value) ...[
            SizedBox(height: 12.h),
            CustomText(text: content, style: AppTextStyles.bodyMd.copyWith(color: AppColors.onSurfaceVariant)),
          ],
        ]),
      ),
    ));
  }
}
