import 'package:bookia_app/core/theme/app_colors.dart';
import 'package:bookia_app/core/theme/app_text_styles.dart';
import 'package:bookia_app/core/widgets/custom_arrow_back.dart';
import 'package:bookia_app/core/widgets/custom_text_form_fiELd.dart';
import 'package:bookia_app/core/widgets/custome_botton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.w , vertical: 11.h),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                CustomArrowBack(),
                 SizedBox(height: 45.h,),
                Center(child: Text('New Password' , style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.w400),)),
                  SizedBox(height: 73.h,),
                  CustomTextFormFiled(hintText: 'Current Password'),
                  SizedBox(height: 26.h,),
                  CustomTextFormFiled(hintText: 'New Password'),
                  SizedBox(height: 26.h,),
                  CustomTextFormFiled(hintText: 'Confirm password' , isPassword: true,),
                   SizedBox(height: 230.h,),
                  CustomeBotton(label: 'Update Password'),
          ],),
        ),
      ),
    );
  }
}