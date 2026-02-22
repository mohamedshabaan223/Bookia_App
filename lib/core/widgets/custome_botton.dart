import 'package:bookia_app/core/theme/app_colors.dart';
import 'package:bookia_app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomeBotton extends StatelessWidget {
  final String label;
  final Color? backgroundColor;
  const CustomeBotton({super.key, required this.label, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 331.w,
      height: 56.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.primaryColor,
        border: Border.all(
          color: backgroundColor == AppColors.white
              ? AppColors.black
              : AppColors.primaryColor,
        ),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Text(
        label,
        style: AppTextStyles.text15Regular.copyWith(
          color: backgroundColor == AppColors.white
              ? AppColors.black
              : AppColors.white,
        ),
      ),
    );
  }
}
