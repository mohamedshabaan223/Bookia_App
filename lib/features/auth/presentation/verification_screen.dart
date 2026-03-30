import 'package:bookia_app/core/theme/app_colors.dart';
import 'package:bookia_app/core/theme/app_text_styles.dart';
import 'package:bookia_app/core/widgets/custom_arrow_back.dart';
import 'package:bookia_app/core/widgets/custom_row_ask_have_account.dart';
import 'package:bookia_app/core/widgets/custome_botton.dart';
import 'package:bookia_app/features/auth/presentation/widgets/custom_otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 22.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomArrowBack(),
            SizedBox(height: 30.h,),
            Text('OTP Verification' , style: AppTextStyles.text30Regular,),
           SizedBox(height: 10.h,),
            Text('Enter the verification code we just sent on your email address. ', style: AppTextStyles.text16Regular,),
            SizedBox(height: 30.h,),
           CustomOtp(),
            SizedBox(height: 38.h,),
            CustomeBotton(label: 'Verify'),
            Spacer(),
            CustomRowAskHaveAccount(labelOne: 'Didn’t received code?', labelTwo: ' Resend'),
            SizedBox(height: 29.h,),

          ],
        ),
      )),
    );
  }
}