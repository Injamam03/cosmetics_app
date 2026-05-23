import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../constant/app_colors.dart';
import '../../../../constant/app_text_styles.dart';
import '../../../../constant/constring.dart';
import '../../../../widgets/custom_text/custom_text.dart';
import '../../../../widgets/custom_text_Field/custom_text_field.dart';
import '../../../../widgets/custombutton/custom_button.dart';
import 'controller/edit_profile_controller.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(EditProfileController());
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background, elevation: 0,
        leading: IconButton(icon: Icon(Icons.arrow_back, color: AppColors.primary), onPressed: Get.back),
        title: CustomText(text: Constring.editProfileTitle, style: AppTextStyles.labelMd.copyWith(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.r),
        child: Form(
          key: c.formKey,
          child: Column(children: [
            // Avatar
            Center(child: Stack(children: [
              CircleAvatar(radius: 48.r,
                backgroundColor: AppColors.primaryFixed,
                child: Icon(Icons.person, color: AppColors.primary, size: 48.sp)),
              Positioned(bottom: 0, right: 0,
                child: Container(
                  padding: EdgeInsets.all(8.r),
                  decoration: BoxDecoration(color: AppColors.primary, shape: BoxShape.circle),
                  child: Icon(Icons.camera_alt_outlined, color: AppColors.onPrimary, size: 16.sp),
                )),
            ])),
            SizedBox(height: 32.h),
            Row(children: [
              Expanded(child: CustomTextField(controller: c.firstNameController, label: Constring.editProfileFirstName,
                validator: (v) => (v == null || v.isEmpty) ? Constring.validationRequired : null)),
              SizedBox(width: 12.w),
              Expanded(child: CustomTextField(controller: c.lastNameController, label: Constring.editProfileLastName,
                validator: (v) => (v == null || v.isEmpty) ? Constring.validationRequired : null)),
            ]),
            SizedBox(height: 16.h),
            CustomTextField(controller: c.emailController, label: Constring.editProfileEmail,
              keyboardType: TextInputType.emailAddress,
              validator: (v) {
                if (v == null || v.isEmpty) return Constring.validationRequired;
                if (!v.contains('@')) return Constring.validationEmail;
                return null;
              }),
            SizedBox(height: 16.h),
            CustomTextField(controller: c.phoneController, label: Constring.editProfilePhone,
              keyboardType: TextInputType.phone,
              validator: (v) => (v == null || v.isEmpty) ? Constring.validationRequired : null),
            SizedBox(height: 16.h),
            CustomTextField(controller: c.dobController, label: Constring.editProfileDob,
              suffixIcon: Icons.calendar_today_outlined, readOnly: true),
            SizedBox(height: 40.h),
            Obx(() => CustomButton(text: Constring.editProfileSave, onTap: c.onSave, isLoading: c.isLoading.value)),
          ]),
        ),
      ),
    );
  }
}
