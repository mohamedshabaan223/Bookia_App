import 'package:bookia_app/core/extension/app_extension.dart';
import 'package:bookia_app/core/routing/routes.dart';
import 'package:bookia_app/core/theme/app_colors.dart';
import 'package:bookia_app/core/theme/app_text_styles.dart';
import 'package:bookia_app/core/widgets/custome_botton.dart';
import 'package:bookia_app/gen/assets.gen.dart';
import 'package:bookia_app/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Assets.images.backgroundImage.image().image,
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 135.h),
            Assets.images.logo2.image(),
            SizedBox(height: 28.h),
            Text(LocaleKeys.on_boarding.tr(), style: AppTextStyles.text20Regular),
            Spacer(),
            CustomeBotton(onTap: () {
              context.pushNamed(Routes.loginScreen);
            },label: LocaleKeys.login.tr()),
            SizedBox(height: 15.h),
            CustomeBotton(
              onTap: () => context.pushNamed(Routes.registerScreen),
              label:LocaleKeys.register.tr(), backgroundColor: AppColors.white),
            SizedBox(height: 94.h),
          ],
        ),
      ),
    );
  }
}
