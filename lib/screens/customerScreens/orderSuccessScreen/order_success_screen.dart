import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../constant/app_colors.dart';
import '../../../constant/app_text_styles.dart';
import '../../../constant/constring.dart';
import '../../../widgets/custom_text/custom_text.dart';
import '../../../widgets/custombutton/custom_button.dart';
import 'controller/order_success_controller.dart';

class OrderSuccessScreen extends StatelessWidget {
  const OrderSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(OrderSuccessController());
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background, elevation: 0, automaticallyImplyLeading: false,
        title: CustomText(text: Constring.appName,
          style: AppTextStyles.labelMd.copyWith(color: AppColors.primary, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            padding: EdgeInsets.all(28.r),
            decoration: BoxDecoration(gradient: AppColors.primaryGradient, shape: BoxShape.circle),
            child: Icon(Icons.check, color: AppColors.onPrimary, size: 48.sp),
          ),
          SizedBox(height: 32.h),
          CustomText(text: Constring.orderSuccessTitle, style: AppTextStyles.headlineLg, textAlign: TextAlign.center),
          SizedBox(height: 8.h),
          CustomText(text: Constring.orderSuccessSubtitle,
            style: AppTextStyles.bodyMd.copyWith(color: AppColors.onSurfaceVariant), textAlign: TextAlign.center),
          SizedBox(height: 8.h),
          CustomText(text: Constring.orderSuccessDelivery,
            style: AppTextStyles.bodyMd.copyWith(color: AppColors.onSurfaceVariant), textAlign: TextAlign.center),
          SizedBox(height: 16.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            decoration: BoxDecoration(color: AppColors.primaryFixed, borderRadius: BorderRadius.circular(99)),
            child: CustomText(text: '${Constring.orderSuccessOrderId}${c.orderId}',
              style: AppTextStyles.labelMd.copyWith(color: AppColors.primary)),
          ),
          SizedBox(height: 48.h),
          CustomButton(text: Constring.orderSuccessTrack, onTap: c.trackOrder),
          SizedBox(height: 12.h),
          CustomButton(text: Constring.orderSuccessShop, onTap: c.continueShopping, isOutlined: true),
        ]),
      ),
    );
  }
}
