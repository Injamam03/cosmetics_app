import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../constant/app_colors.dart';
import '../../../constant/app_text_styles.dart';
import '../../../constant/constring.dart';
import '../../../widgets/custom_text/custom_text.dart';
import 'controller/categories_controller.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(CategoriesController());
    final categories = [
      {'icon': Icons.spa_outlined, 'title': Constring.categoriesSkincare, 'tag': Constring.categoriesSkincareTag, 'color': AppColors.primaryFixed},
      {'icon': Icons.brush_outlined, 'title': Constring.categoriesMakeup, 'tag': Constring.categoriesMakeupTag, 'color': AppColors.secondaryContainer},
      {'icon': Icons.air_outlined, 'title': Constring.categoriesFragrance, 'tag': Constring.categoriesFragranceTag, 'color': AppColors.primaryFixed},
      {'icon': Icons.bathtub_outlined, 'title': Constring.categoriesBathBody, 'tag': Constring.categoriesBathBodyTag, 'color': AppColors.surfaceContainerHigh},
    ];
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface.withOpacity(0.8), elevation: 0,
        leading: IconButton(icon: Icon(Icons.menu, color: AppColors.primary), onPressed: () {}),
        title: CustomText(text: Constring.categoriesTitle, style: AppTextStyles.labelMd.copyWith(fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          IconButton(icon: Icon(Icons.notifications_outlined, color: AppColors.onSurface), onPressed: () {}),
          IconButton(icon: Icon(Icons.search, color: AppColors.onSurface), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.r),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // Spring Collection Banner
          Container(
            height: 100.h,
            decoration: BoxDecoration(
              gradient: AppColors.primaryGradient,
              borderRadius: BorderRadius.circular(20.r),
            ),
            padding: EdgeInsets.all(20.r),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [
              CustomText(text: Constring.categoriesSpringCollection,
                style: AppTextStyles.headlineMd.copyWith(color: AppColors.onPrimary)),
            ]),
          ),
          SizedBox(height: 24.h),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 12.w, mainAxisSpacing: 12.h, childAspectRatio: 1.1),
            itemCount: categories.length,
            itemBuilder: (_, i) {
              final cat = categories[i];
              return GestureDetector(
                onTap: c.goToProduct,
                child: Container(
                  decoration: BoxDecoration(
                    color: cat['color'] as Color,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  padding: EdgeInsets.all(16.r),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Icon(cat['icon'] as IconData, color: AppColors.primary, size: 28.sp),
                    const Spacer(),
                    CustomText(text: cat['title'] as String, style: AppTextStyles.labelMd),
                    SizedBox(height: 4.h),
                    CustomText(text: cat['tag'] as String,
                      style: AppTextStyles.labelSm.copyWith(color: AppColors.onSurfaceVariant)),
                  ]),
                ),
              );
            },
          ),
          SizedBox(height: 24.h),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            CustomText(text: Constring.categoriesTrending, style: AppTextStyles.labelMd),
            GestureDetector(onTap: () {},
              child: CustomText(text: Constring.categoriesViewAllTrends,
                style: AppTextStyles.labelSm.copyWith(color: AppColors.primary))),
          ]),
          SizedBox(height: 12.h),
          CustomText(text: Constring.categoriesMostWanted, style: AppTextStyles.labelMd.copyWith(color: AppColors.onSurfaceVariant)),
        ]),
      ),
    );
  }
}
