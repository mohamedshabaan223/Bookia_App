import 'package:bookia_app/core/theme/app_colors.dart';
import 'package:bookia_app/core/theme/app_text_styles.dart';
import 'package:bookia_app/core/widgets/custom_arrow_back.dart';
import 'package:bookia_app/core/widgets/custom_row_ask_have_account.dart';
import 'package:bookia_app/core/widgets/custom_text_form_fiELd.dart';
import 'package:bookia_app/core/widgets/custome_botton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 22.w,),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            CustomArrowBack(),
            SizedBox(height: 29.h,),
            Text('Welcome back! Glad to see you, Again!' , style: AppTextStyles.text30Regular,),
           SizedBox(height: 32.h,),
            CustomTextFormFiled(
              hintText: 'Enter your email',
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 15.h,),
            CustomTextFormFiled(
                hintText: 'Enter your password',
                 keyboardType: TextInputType.visiblePassword,
            ),
             SizedBox(height: 13.h,),
            Row(
              children: [
                Spacer(),
              TextButton(onPressed: (){}, child:Text( 'Forgot Password?' , style: AppTextStyles.text14Regular,))
              ],
            ),
            SizedBox(height: 30.h,),
            CustomeBotton(label: 'Login'),
            Spacer(),
            CustomRowAskHaveAccount(labelOne:'Don’t have an account?' , labelTwo: ' Register Now'),
            SizedBox(height: 19.h,),
            ],
          ),
        ),
      ),
    );
  }

}