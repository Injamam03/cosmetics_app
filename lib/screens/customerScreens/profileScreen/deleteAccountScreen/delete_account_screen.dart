import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../constant/app_colors.dart';
import '../../../../constant/app_text_styles.dart';
import '../../../../constant/constring.dart';
import '../../../../widgets/custom_text/custom_text.dart';
import '../../../../widgets/custombutton/custom_button.dart';
import 'controller/delete_account_controller.dart';

class DeleteAccountScreen extends StatelessWidget {
  const DeleteAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(DeleteAccountController());
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background, elevation: 0,
        leading: IconButton(icon: Icon(Icons.arrow_back, color: AppColors.primary), onPressed: c.goBack),
        title: CustomText(text: Constring.deleteAccountTitle, style: AppTextStyles.labelMd.copyWith(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.r),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // Warning icon
          Center(child: Container(
            padding: EdgeInsets.all(24.r),
            decoration: BoxDecoration(color: AppColors.errorContainer, shape: BoxShape.circle),
            child: Icon(Icons.warning_amber_rounded, color: AppColors.error, size: 48.sp),
          )),
          SizedBox(height: 24.h),
          Center(child: CustomText(text: Constring.deleteAccountWarning,
            style: AppTextStyles.headlineMd.copyWith(color: AppColors.error), textAlign: TextAlign.center)),
          SizedBox(height: 24.h),
          // What you'll lose
          ...[
            [Icons.history_outlined, Constring.deleteAccountLoss1],
            [Icons.loyalty_outlined, Constring.deleteAccountLoss2],
            [Icons.face_outlined, Constring.deleteAccountLoss3],
          ].map((item) => Container(
            margin: EdgeInsets.only(bottom: 10.h),
            padding: EdgeInsets.all(16.r),
            decoration: BoxDecoration(
              color: AppColors.errorContainer.withOpacity(0.3),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Row(children: [
              Icon(item[0] as IconData, color: AppColors.error, size: 20.sp),
              SizedBox(width: 12.w),
              CustomText(text: item[1] as String, style: AppTextStyles.bodyMd.copyWith(color: AppColors.onSurface)),
            ]),
          )),
          SizedBox(height: 24.h),
          CustomText(text: Constring.deleteAccountReason, style: AppTextStyles.labelMd),
          SizedBox(height: 12.h),
          Obx(() => Column(children: c.reasons.map((reason) => GestureDetector(
            onTap: () => c.selectReason(reason),
            child: Container(
              margin: EdgeInsets.only(bottom: 8.h),
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
              decoration: BoxDecoration(
                color: c.selectedReason.value == reason ? AppColors.errorContainer.withOpacity(0.4) : AppColors.surfaceContainerLowest,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: c.selectedReason.value == reason ? AppColors.error : AppColors.outlineVariant),
              ),
              child: Row(children: [
                Radio(value: reason, groupValue: c.selectedReason.value, onChanged: (v) => c.selectReason(v!),
                  activeColor: AppColors.error, visualDensity: VisualDensity.compact),
                SizedBox(width: 8.w),
                CustomText(text: reason, style: AppTextStyles.bodyMd),
              ]),
            ),
          )).toList())),
          SizedBox(height: 16.h),
          Container(
            padding: EdgeInsets.all(12.r),
            decoration: BoxDecoration(color: AppColors.errorContainer, borderRadius: BorderRadius.circular(12.r)),
            child: Row(children: [
              Icon(Icons.info_outline, color: AppColors.error, size: 16.sp),
              SizedBox(width: 8.w),
              Expanded(child: CustomText(text: Constring.deleteAccountIrreversible,
                style: AppTextStyles.labelSm.copyWith(color: AppColors.error))),
            ]),
          ),
          SizedBox(height: 32.h),
          Obx(() => CustomButton(
            text: Constring.deleteAccountButton,
            onTap: c.onDelete,
            isLoading: c.isLoading.value,
            backgroundColor: AppColors.error,
          )),
          SizedBox(height: 12.h),
          CustomButton(text: Constring.deleteAccountCancel, onTap: c.goBack, isOutlined: true),
          SizedBox(height: 32.h),
        ]),
      ),
    );
  }
}
