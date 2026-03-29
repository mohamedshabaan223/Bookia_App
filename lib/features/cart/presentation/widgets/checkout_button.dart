import 'package:bookia_app/core/theme/app_colors.dart';
import 'package:bookia_app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckoutButton extends StatelessWidget {
  const CheckoutButton({super.key, this.onPressed});
  final void Function()? onPressed;
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 15.w , vertical: 17.h),
      child: ElevatedButton(onPressed: onPressed, 
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        minimumSize: Size(double.infinity, 55.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(4.r)
        )
      ),
      child: Text('Checkout' , style: AppTextStyles.text16Regular.copyWith(color: AppColors.white),)),
    );
  }
}