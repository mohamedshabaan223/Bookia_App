import 'package:bookia_app/core/theme/app_colors.dart';
import 'package:bookia_app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomOrDivider extends StatelessWidget {
  const CustomOrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(child: Divider(color: Color(0XFFE8ECF4),)),
        SizedBox(width: 45..w),
        Text(
          'Or',
          style: AppTextStyles.text14Regular.copyWith(
            color: AppColors.darkGray,
          ),
        ),
        SizedBox(width: 45..w),
        Expanded(child: Divider(color: Color(0XFFE8ECF4))),
      ],
    );
  }
}
