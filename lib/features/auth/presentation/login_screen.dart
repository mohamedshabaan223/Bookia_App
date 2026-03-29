import 'package:bookia_app/core/helper/app_extension.dart';
import 'package:bookia_app/core/routing/routes.dart';
import 'package:bookia_app/core/theme/app_colors.dart';
import 'package:bookia_app/core/theme/app_text_styles.dart';
import 'package:bookia_app/core/widgets/custom_arrow_back.dart';
import 'package:bookia_app/core/widgets/custom_row_ask_have_account.dart';
import 'package:bookia_app/core/widgets/custom_text_form_fiELd.dart';
import 'package:bookia_app/core/widgets/custome_botton.dart';
import 'package:bookia_app/features/auth/cubit/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
 
class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
 TextEditingController passwordController = TextEditingController();
 @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomArrowBack(),
              SizedBox(height: 29.h),
              Text(
                'Welcome back! Glad to see you, Again!',
                style: AppTextStyles.text30Regular,
              ),
              SizedBox(height: 32.h),
              CustomTextFormFiled(
                controller: emailController,
                hintText: 'Enter your email',
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 15.h),
              CustomTextFormFiled(
                controller: passwordController,
                hintText: 'Enter your password',
                keyboardType: TextInputType.visiblePassword,
                isPassword: true,
              ),
              SizedBox(height: 13.h),
              Row(
                children: [
                  Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forgot Password?',
                      style: AppTextStyles.text14Regular,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.h),
              BlocListener<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is AuthLoadingState ) {
                    showDialog(context: context, builder: (_)=>Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ),
                    ));
                  }else  if( state is AuthErrorState){
                    showDialog(context: context, builder: (_)=> AlertDialog(
                      title: Text('Error!'),
                    content: Text('Something is wrong'),
                    ));
                  } else {
                    context.pushNamedAndRemoveUntil(Routes.homeScreen, predicate: (Route<dynamic> route) {return false ;}, );
                  }
                  
                },
                child: CustomeBotton(
                  onTap: () {
                    context.read<AuthCubit>().login(email: emailController.text, password: passwordController.text);
                  },
                  label: 'Login'),
              ),
              Spacer(),
              CustomRowAskHaveAccount(
                labelOne: 'Don’t have an account?',
                labelTwo: ' Register Now',
              ),
              SizedBox(height: 19.h),
            ],
          ),
        ),
      ),
    );
  }
}
