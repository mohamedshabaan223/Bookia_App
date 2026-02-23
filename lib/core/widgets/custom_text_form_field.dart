import 'package:bookia_app/core/theme/app_colors.dart';
import 'package:bookia_app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormFiled extends StatelessWidget {
  final String hintText;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  const CustomTextFormFiled({super.key, required this.hintText, this.keyboardType, this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.primaryColor,
      keyboardType: keyboardType,
      controller: controller,
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      decoration: InputDecoration(
      
        filled: true,
        fillColor: AppColors.gray3,
        hintText: hintText,
        hintStyle: AppTextStyles.text15Regular.copyWith(
          color: AppColors.gray
        ),
        border: OutlineInputBorder(
           borderRadius: BorderRadius.circular(8.r),
        ),
        focusedBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: AppColors.primaryColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: AppColors.gray2),
        ),

      ),
    );
  }
}