import 'package:bookia_app/core/theme/app_text_styles.dart';
import 'package:bookia_app/core/widgets/custom_arrow_back.dart';
import 'package:bookia_app/core/widgets/custom_text_form_field.dart';
import 'package:bookia_app/core/widgets/custome_botton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateNewPasswordScreen extends StatelessWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 22.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomArrowBack(),
            SizedBox(height: 30.h,),
            Text('Create new password' , style: AppTextStyles.text30Regular,),
           SizedBox(height: 10.h,),
            Text('Your new password must be unique from those previously used.', style: AppTextStyles.text16Regular,),
            SizedBox(height: 30.h,),
            CustomTextFormFiled(hintText: 'New Password' , 
            keyboardType: TextInputType.visiblePassword, ),
             SizedBox(height: 15.h,),
            CustomTextFormFiled(hintText: 'Confirm Password' , 
            keyboardType: TextInputType.visiblePassword, ),
            SizedBox(height: 38.h,),
            CustomeBotton(label: 'Reset Password'),
          

          ],
        ),
      )),
    );
  }
}