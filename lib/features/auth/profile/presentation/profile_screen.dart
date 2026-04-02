import 'package:bookia_app/core/helper/app_extension.dart';
import 'package:bookia_app/core/routing/routes.dart';
import 'package:bookia_app/core/theme/app_colors.dart';
import 'package:bookia_app/core/theme/app_text_styles.dart';
import 'package:bookia_app/features/auth/profile/cubit/cubit/profile_cubit.dart';
import 'package:bookia_app/features/auth/profile/presentation/widgets/custom_card.dart';
import 'package:bookia_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: Column(
        children: [
          SizedBox(height: 12.h),
          Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 130.w),
              Text(
                'Profile',
                style: AppTextStyles.text20Regular.copyWith(fontSize: 24.sp),
              ),
              SizedBox(width: 115.w),
              InkWell(child: SvgPicture.asset(Assets.icons.frame15)),
            ],
          ),
          SizedBox(height: 16.h),
          BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              if (state is ProfileLoading) {
                return Center(child: CircleAvatar(),);
              }else if(state is ProfileSuccess){
                return Row(
                children: [
                  CircleAvatar(
                    radius: 39.r,
                    backgroundColor: Color(0xffDADADA),
                    backgroundImage: AssetImage(state.userData?.image ?? ''),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 13.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                         state.userData?.name?? '',
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.black,
                          ),
                        ),
                        SizedBox(height: 3.h),
                        Text(
                          state.userData?.email?? '',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: Color(0Xff808080),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
              }else {
                return Text('Error');
              }
            },
          ),
          SizedBox(height: 35.h),
          CustomCard(label: 'My Orders'),
          CustomCard(
            label: 'Edit Profile',
            onTap: () => context.pushNamed(Routes.editProfile),
          ),
          CustomCard(
            label: 'Reset Password',
            onTap: () => context.pushNamed(Routes.resetPassword),
          ),
          CustomCard(label: 'FAQ'),
          CustomCard(label: 'Contact Us'),
          CustomCard(label: 'Privacy & Terms'),
        ],
      ),
    );
  }
}
