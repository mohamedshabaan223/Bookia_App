import 'package:bookia_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAddRemoveButton extends StatelessWidget {
  const CustomAddRemoveButton({super.key, this.onPressed, required this.icons});
  final  void Function()? onPressed;
  final IconData icons;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 25.w,
        height: 25.h,
        decoration: BoxDecoration(
          color: Color(0XFFE0E0E0),
          borderRadius: BorderRadius.circular(6.r)
        ),
        child: Icon(icons),
      ),
    );
}}