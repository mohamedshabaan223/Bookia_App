import 'package:bookia_app/core/theme/app_colors.dart';
import 'package:bookia_app/core/theme/app_text_styles.dart';
import 'package:bookia_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomTextFormFiled extends StatefulWidget {
  final String hintText;
   final bool isPassword;
  final TextInputType? keyboardType;

  final TextEditingController? controller;


  const CustomTextFormFiled({super.key, required this.hintText, this.keyboardType, this.controller,  this.isPassword = false});

  @override
  State<CustomTextFormFiled> createState() => _CustomTextFormFiledState();
}

class _CustomTextFormFiledState extends State<CustomTextFormFiled> {
 bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.isPassword&&isObscure,
      cursorColor: AppColors.primaryColor,
      keyboardType: widget.keyboardType,
      controller: widget.controller,
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      decoration: InputDecoration(
        
        filled: true,
        fillColor: AppColors.gray3,
        hintText: widget.hintText,
        suffixIcon: widget.isPassword ? Padding(
          padding: EdgeInsets.all(10.0.r),
          child: InkWell(
            onTap: () {
              isObscure =!isObscure;
              setState(() {
                
              });
            },
            child: isObscure ? Icon(Icons.visibility_off) : SvgPicture.asset(Assets.icons.eye)),
        ) : null,
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