import 'package:bookia_app/core/helper/app_extension.dart';
import 'package:bookia_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomArrowBack extends StatelessWidget {
  const CustomArrowBack({super.key,});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:()=> context.pop(),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.gray2),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: IconButton(onPressed: (){},
         icon: Icon(Icons.arrow_back_ios_rounded, color: AppColors.black,)),
      ),
    );
  }
}