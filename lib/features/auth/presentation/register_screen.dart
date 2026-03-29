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

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();
  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
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
                'Hello! Register to get started',
                style: AppTextStyles.text30Regular,
              ),
              SizedBox(height: 32.h),
              CustomTextFormFiled(
                controller: nameController,
                hintText: 'Username',
                keyboardType: TextInputType.name,
              ),
              SizedBox(height: 15.h),
              CustomTextFormFiled(
                controller: emailController,
                hintText: 'Email',
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 15.h),
              CustomTextFormFiled(
                controller: passwordController,
                hintText: 'Password',
                keyboardType: TextInputType.visiblePassword,
              ),
              SizedBox(height: 15.h),
              CustomTextFormFiled(
                controller: confirmPasswordController,
                hintText: 'Confirm password',
                keyboardType: TextInputType.visiblePassword,
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
                    context.pushNamedAndRemoveUntil(Routes.homeScreen, predicate: (Route<dynamic> route) { return false; }, );
                  }
                  
                },
                child: CustomeBotton(
                  onTap: () {
                    context.read<AuthCubit>().register(
                      name: nameController.text,
                      email: emailController.text,
                      password: passwordController.text,
                      confirmPassword: confirmPasswordController.text,
                    );
                  },
                  label: 'Register',
                ),
              ),
              Spacer(),
              CustomRowAskHaveAccount(
                labelOne: 'Already have an account?',
                labelTwo: ' Login Now',
              ),

              SizedBox(height: 19.h),
            ],
          ),
        ),
      ),
    );
  }
}
