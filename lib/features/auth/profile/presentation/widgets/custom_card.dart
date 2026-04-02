import 'package:bookia_app/core/theme/app_text_styles.dart';
import 'package:bookia_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.label, this.onTap});
  final String label;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 7,
        shadowColor: Color(0xff8A959E33),
        margin: EdgeInsets.symmetric(vertical: 6.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.r),
        ),
        child:Padding(
          padding:  EdgeInsets.symmetric(vertical: 15.h , horizontal: 19.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Text(label , style: AppTextStyles.text16Regular.copyWith(fontSize: 18.sp , color: Color(0xff606060)),),
            SvgPicture.asset(Assets.icons.group6)
          ],),
        ) ,
      ),
    );
  }
}