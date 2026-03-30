import 'package:bookia_app/core/theme/app_colors.dart';
import 'package:bookia_app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSignGoogleApple extends StatelessWidget {
  const CustomSignGoogleApple({super.key, required this.imageUrl, required this.label});
  final String imageUrl;
  final String label ;

  @override
  Widget build(BuildContext context) {
    return Container(
      
      height: 56.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color:Color(0xffE8ECF4) ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(imageUrl),
          SizedBox(width:12.w ,),
          Text(label, style: AppTextStyles.text14Regular.copyWith(color: AppColors.darkGray),)
        ],
      ),
    );
  }
}