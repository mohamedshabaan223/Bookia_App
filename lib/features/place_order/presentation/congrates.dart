import 'package:bookia_app/core/helper/app_extension.dart';
import 'package:bookia_app/core/routing/routes.dart';
import 'package:bookia_app/core/theme/app_colors.dart';
import 'package:bookia_app/core/theme/app_text_styles.dart';
import 'package:bookia_app/core/widgets/custome_botton.dart';
import 'package:bookia_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Congrates extends StatelessWidget {
  const Congrates({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(Assets.icons.successmark , width: 145.w,
          height: 145.h,),
          SizedBox(height: 49.h,),
          Text('SUCCESS!' , style: TextStyle(
            fontSize: 36.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.black
          ),),
          SizedBox(height: 22.h,),
          Text('Your order will be delivered soon\n Thank you for choosing our app!' , style: AppTextStyles.text20Regular.copyWith(fontSize: 18 , color: Color(0xff606060))
                  

          ),
          SizedBox(height: 51.h,),
           CustomeBotton(label: 'Back To Home', onTap: () => context.pushNamed(Routes.onboardingScreen),)
        ],),
      ),
    );
  }
}