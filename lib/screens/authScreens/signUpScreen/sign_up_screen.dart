import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../constant/app_colors.dart';
import '../../../constant/app_text_styles.dart';
import '../../../constant/constring.dart';
import '../../../widgets/custom_text/custom_text.dart';
import '../../../widgets/custom_text_Field/custom_text_field.dart';
import '../../../widgets/custombutton/custom_button.dart';
import 'controller/sign_up_controller.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(SignUpController());
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background.withOpacity(0.8),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.primary),
          onPressed: c.goToSignIn,
        ),
        title: CustomText(text: Constring.appName,
          style: AppTextStyles.labelMd.copyWith(color: AppColors.primary, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Form(
          key: c.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24.h),
              CustomText(text: Constring.signUpTitle, style: AppTextStyles.headlineLgMobile),
              SizedBox(height: 32.h),
              Row(children: [
                Expanded(child: CustomTextField(
                  controller: c.firstNameController,
                  label: Constring.signUpFirstName,
                  validator: (v) => (v == null || v.isEmpty) ? Constring.validationRequired : null,
                )),
                SizedBox(width: 12.w),
                Expanded(child: CustomTextField(
                  controller: c.lastNameController,
                  label: Constring.signUpLastName,
                  validator: (v) => (v == null || v.isEmpty) ? Constring.validationRequired : null,
                )),
              ]),
              SizedBox(height: 16.h),
              CustomTextField(
                controller: c.emailController,
                label: Constring.signUpEmail,
                keyboardType: TextInputType.emailAddress,
                validator: (v) {
                  if (v == null || v.isEmpty) return Constring.validationRequired;
                  if (!v.contains('@')) return Constring.validationEmail;
                  return null;
                },
              ),
              SizedBox(height: 16.h),
              CustomTextField(
                controller: c.dobController,
                label: Constring.signUpDob,
                suffixIcon: Icons.calendar_today_outlined,
                readOnly: true,
                onTap: () async {
                  final date = await showDatePicker(
                    context: context,
                    initialDate: DateTime(2000),
                    firstDate: DateTime(1950),
                    lastDate: DateTime.now(),
                  );
                  if (date != null) {
                    c.dobController.text = '${date.day}/${date.month}/${date.year}';
                  }
                },
                validator: (v) => (v == null || v.isEmpty) ? Constring.validationRequired : null,
              ),
              SizedBox(height: 16.h),
              Obx(() => CustomTextField(
                controller: c.passwordController,
                label: Constring.signUpPassword,
                prefixIcon: Icons.lock_outline,
                obscureText: !c.isPasswordVisible.value,
                suffixIcon: c.isPasswordVisible.value ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                onSuffixTap: c.togglePassword,
                validator: (v) {
                  if (v == null || v.isEmpty) return Constring.validationRequired;
                  if (v.length < 8) return Constring.validationPassword;
                  return null;
                },
              )),
              SizedBox(height: 20.h),
              Obx(() => GestureDetector(
                onTap: c.toggleTerms,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Checkbox(
                      value: c.termsAccepted.value,
                      onChanged: (_) => c.toggleTerms(),
                      activeColor: AppColors.primary,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(top: 12.h),
                        child: RichText(text: TextSpan(
                          style: AppTextStyles.labelSm.copyWith(color: AppColors.onSurfaceVariant),
                          children: [
                            TextSpan(text: Constring.signUpTermsPrefix),
                            TextSpan(text: Constring.signUpTerms,
                              style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.w700)),
                            TextSpan(text: Constring.signUpAnd),
                            TextSpan(text: Constring.signUpPrivacy,
                              style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.w700)),
                            TextSpan(text: Constring.signUpTermsSuffix),
                          ],
                        )),
                      ),
                    ),
                  ],
                ),
              )),
              SizedBox(height: 32.h),
              Obx(() => CustomButton(
                text: Constring.signUpButton,
                onTap: c.onSignUp,
                isLoading: c.isLoading.value,
              )),
              SizedBox(height: 24.h),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                CustomText(text: Constring.signUpAlreadyHave,
                  style: AppTextStyles.bodyMd.copyWith(color: AppColors.onSurfaceVariant)),
                SizedBox(width: 4.w),
                GestureDetector(
                  onTap: c.goToSignIn,
                  child: CustomText(text: Constring.signUpSignIn,
                    style: AppTextStyles.labelMd.copyWith(color: AppColors.primary)),
                ),
              ]),
              SizedBox(height: 32.h),
            ],
          ),
        ),
      ),
    );
  }
}
