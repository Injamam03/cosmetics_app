import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../constant/app_colors.dart';
import '../../../constant/app_text_styles.dart';
import '../../../constant/constring.dart';
import '../../../widgets/custom_text/custom_text.dart';
import 'controller/insights_controller.dart';

class InsightsScreen extends StatelessWidget {
  const InsightsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(InsightsController());
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface.withOpacity(0.8), elevation: 0,
        title: CustomText(text: Constring.sellerInsightsTitle, style: AppTextStyles.labelMd.copyWith(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.r),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CustomText(text: Constring.sellerPerformanceReport,
            style: AppTextStyles.labelSm.copyWith(color: AppColors.onSurfaceVariant, letterSpacing: 1)),
          SizedBox(height: 16.h),
          // Date range
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            decoration: BoxDecoration(
              color: AppColors.surfaceContainerLowest,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: AppColors.outlineVariant),
            ),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Row(children: [
                Icon(Icons.calendar_today_outlined, color: AppColors.primary, size: 18.sp),
                SizedBox(width: 8.w),
                CustomText(text: 'Oct 1 - Oct 31, 2023', style: AppTextStyles.labelMd),
              ]),
              Icon(Icons.expand_more, color: AppColors.onSurfaceVariant),
            ]),
          ),
          SizedBox(height: 20.h),
          // Revenue card
          Container(
            padding: EdgeInsets.all(20.r),
            decoration: BoxDecoration(
              gradient: AppColors.primaryGradient,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              CustomText(text: Constring.sellerRevenueGrowth,
                style: AppTextStyles.labelMd.copyWith(color: AppColors.onPrimary.withOpacity(0.7))),
              SizedBox(height: 4.h),
              CustomText(text: Constring.sellerRevenueMonthly,
                style: AppTextStyles.labelSm.copyWith(color: AppColors.onPrimary.withOpacity(0.5))),
              SizedBox(height: 12.h),
              CustomText(text: '\$128,430.00',
                style: AppTextStyles.headlineLg.copyWith(color: AppColors.onPrimary)),
              SizedBox(height: 4.h),
              Row(children: [
                Icon(Icons.trending_up, color: Colors.greenAccent, size: 16.sp),
                SizedBox(width: 4.w),
                CustomText(text: '+22.4% from last period',
                  style: AppTextStyles.labelSm.copyWith(color: Colors.greenAccent)),
              ]),
            ]),
          ),
          SizedBox(height: 20.h),
          // Stats grid
          GridView.count(
            shrinkWrap: true, physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2, crossAxisSpacing: 12.w, mainAxisSpacing: 12.h,
            childAspectRatio: 1.5,
            children: [
              _InsightCard(label: 'Total Orders', value: '1,284', icon: Icons.shopping_bag_outlined),
              _InsightCard(label: 'Avg Order Value', value: '\$99.50', icon: Icons.receipt_long_outlined),
              _InsightCard(label: 'New Customers', value: '342', icon: Icons.person_add_outlined),
              _InsightCard(label: 'Return Rate', value: '2.3%', icon: Icons.keyboard_return_outlined),
            ],
          ),
        ]),
      ),
    );
  }
}

class _InsightCard extends StatelessWidget {
  final String label, value;
  final IconData icon;
  const _InsightCard({required this.label, required this.value, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [BoxShadow(color: AppColors.onBackground.withOpacity(0.04), blurRadius: 30)],
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Icon(icon, color: AppColors.primary, size: 20.sp),
        const Spacer(),
        CustomText(text: value, style: AppTextStyles.headlineMd),
        SizedBox(height: 2.h),
        CustomText(text: label, style: AppTextStyles.labelSm.copyWith(color: AppColors.onSurfaceVariant)),
      ]),
    );
  }
}
