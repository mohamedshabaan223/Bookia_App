import 'package:bookia_app/features/home/widgets/home_app_bar.dart';
import 'package:bookia_app/features/home/widgets/sliders_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 13.0.w),
      child: Column(
        children: [
          HomeAppBar(),
          SizedBox(height: 25.h,),
          SlidersHome(),
        ],
      ),
    );
  }
}