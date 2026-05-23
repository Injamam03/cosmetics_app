import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constant/app_colors.dart';
import '../../constant/app_text_styles.dart';
import '../custom_text/custom_text.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final bool isLoading;
  final bool isOutlined;
  final Color? backgroundColor;
  final Color? textColor;

  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    this.isLoading = false,
    this.isOutlined = false,
    this.backgroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final bg = backgroundColor ?? (isOutlined ? Colors.transparent : AppColors.primary);
    final fg = textColor ?? (isOutlined ? AppColors.primary : AppColors.onPrimary);
    return SizedBox(
      width: double.infinity,
      height: 52.h,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 200),
        opacity: onTap == null ? 0.5 : 1.0,
        child: GestureDetector(
          onTap: isLoading ? null : onTap,
          child: Container(
            decoration: BoxDecoration(
              color: bg,
              borderRadius: BorderRadius.circular(12.r),
              border: isOutlined ? Border.all(color: AppColors.primary, width: 1.5) : null,
              gradient: !isOutlined && backgroundColor == null
                  ? AppColors.primaryGradient
                  : null,
              boxShadow: isOutlined ? null : [
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.25),
                  blurRadius: 16,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Center(
              child: isLoading
                  ? SizedBox(
                      width: 22.w,
                      height: 22.h,
                      child: CircularProgressIndicator(
                        color: fg,
                        strokeWidth: 2.5,
                      ),
                    )
                  : Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomText(
                          text: text,
                          style: AppTextStyles.labelMd.copyWith(color: fg, letterSpacing: 0.5),
                        ),
                        if (!isOutlined) ...[
                          SizedBox(width: 8.w),
                          Icon(Icons.arrow_forward, color: fg, size: 16.sp),
                        ],
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
