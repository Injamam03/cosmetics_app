import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../constant/app_colors.dart';
import '../../../constant/app_text_styles.dart';
import '../../../constant/constring.dart';
import '../../../widgets/custom_text/custom_text.dart';
import '../../../widgets/custombutton/custom_button.dart';
import 'controller/checkout_controller.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(CheckoutController());
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(icon: Icon(Icons.arrow_back, color: AppColors.primary), onPressed: Get.back),
        title: CustomText(text: Constring.checkoutTitle, style: AppTextStyles.labelMd.copyWith(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Steps
          Obx(() => Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
            child: Row(children: [
              _StepDot(label: Constring.checkoutStepShipping, isActive: c.currentStep.value >= 0, isDone: c.currentStep.value > 0),
              Expanded(child: Divider(color: c.currentStep.value > 0 ? AppColors.primary : AppColors.outlineVariant, thickness: 1.5)),
              _StepDot(label: Constring.checkoutStepPayment, isActive: c.currentStep.value >= 1, isDone: c.currentStep.value > 1),
              Expanded(child: Divider(color: c.currentStep.value > 1 ? AppColors.primary : AppColors.outlineVariant, thickness: 1.5)),
              _StepDot(label: Constring.checkoutStepReview, isActive: c.currentStep.value >= 2, isDone: false),
            ]),
          )),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Obx(() {
                if (c.currentStep.value == 0) return _ShippingStep(c: c);
                if (c.currentStep.value == 1) return _PaymentStep();
                return _ReviewStep();
              }),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20.w, 12.h, 20.w, 28.h),
            child: Obx(() => c.currentStep.value < 2
                ? CustomButton(text: 'Next', onTap: c.nextStep)
                : CustomButton(text: Constring.checkoutPlaceOrder, onTap: c.placeOrder, isLoading: c.isLoading.value)),
          ),
        ],
      ),
    );
  }
}

class _StepDot extends StatelessWidget {
  final String label;
  final bool isActive;
  final bool isDone;
  const _StepDot({required this.label, required this.isActive, required this.isDone});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      Container(
        width: 28.w, height: 28.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isActive ? AppColors.primary : AppColors.surfaceContainerHigh,
        ),
        child: Center(child: isDone
            ? Icon(Icons.check, color: AppColors.onPrimary, size: 14.sp)
            : Icon(Icons.circle, color: isActive ? AppColors.onPrimary : AppColors.outline, size: 8.sp)),
      ),
      SizedBox(height: 4.h),
      CustomText(text: label, style: AppTextStyles.labelSm.copyWith(color: isActive ? AppColors.primary : AppColors.onSurfaceVariant)),
    ]);
  }
}

class _ShippingStep extends StatelessWidget {
  final CheckoutController c;
  const _ShippingStep({required this.c});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(height: 8.h),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        CustomText(text: Constring.checkoutShippingAddress, style: AppTextStyles.labelMd),
        GestureDetector(onTap: () {},
          child: CustomText(text: Constring.checkoutEdit, style: AppTextStyles.labelSm.copyWith(color: AppColors.primary))),
      ]),
      SizedBox(height: 12.h),
      Container(
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          color: AppColors.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [BoxShadow(color: AppColors.onBackground.withOpacity(0.04), blurRadius: 30)],
        ),
        child: Row(children: [
          Icon(Icons.location_on_outlined, color: AppColors.primary, size: 20.sp),
          SizedBox(width: 12.w),
          CustomText(text: 'Sophia Laurent\n123 Beauty Lane, NY 10001', style: AppTextStyles.bodyMd),
        ]),
      ),
      SizedBox(height: 24.h),
      CustomText(text: Constring.checkoutDeliveryMethod, style: AppTextStyles.labelMd),
      SizedBox(height: 12.h),
      Obx(() => _DeliveryOption(
        title: Constring.checkoutStandard, subtitle: Constring.checkoutStandardDays,
        price: Constring.commonFree, isSelected: c.selectedDelivery.value == 'standard',
        onTap: () => c.selectDelivery('standard'),
      )),
      SizedBox(height: 8.h),
      Obx(() => _DeliveryOption(
        title: Constring.checkoutExpress, subtitle: Constring.checkoutExpressDay,
        price: Constring.checkoutExpressPrice, isSelected: c.selectedDelivery.value == 'express',
        onTap: () => c.selectDelivery('express'),
      )),
    ]);
  }
}

class _DeliveryOption extends StatelessWidget {
  final String title, subtitle, price;
  final bool isSelected;
  final VoidCallback onTap;
  const _DeliveryOption({required this.title, required this.subtitle, required this.price, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryFixed : AppColors.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: isSelected ? AppColors.primary : AppColors.outlineVariant),
        ),
        child: Row(children: [
          Radio(value: true, groupValue: isSelected, onChanged: (_) => onTap(),
            activeColor: AppColors.primary, visualDensity: VisualDensity.compact),
          SizedBox(width: 8.w),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            CustomText(text: title, style: AppTextStyles.labelMd),
            CustomText(text: subtitle, style: AppTextStyles.labelSm.copyWith(color: AppColors.onSurfaceVariant)),
          ])),
          CustomText(text: price, style: AppTextStyles.labelMd.copyWith(color: AppColors.primary)),
        ]),
      ),
    );
  }
}

class _PaymentStep extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(height: 8.h),
      CustomText(text: Constring.checkoutPaymentMethod, style: AppTextStyles.labelMd),
      SizedBox(height: 120.h),
      Center(child: CustomText(text: 'Payment options coming soon', style: AppTextStyles.bodyMd.copyWith(color: AppColors.onSurfaceVariant))),
    ]);
  }
}

class _ReviewStep extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(height: 8.h),
      CustomText(text: 'Order Review', style: AppTextStyles.labelMd),
      SizedBox(height: 120.h),
      Center(child: CustomText(text: 'Review your order details above', style: AppTextStyles.bodyMd.copyWith(color: AppColors.onSurfaceVariant))),
    ]);
  }
}
