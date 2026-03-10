import 'package:bookia_app/core/theme/app_text_styles.dart';
import 'package:bookia_app/features/home/widgets/book_item.dart';
import 'package:bookia_app/features/home/widgets/custom_gridview.dart';
import 'package:bookia_app/features/home/widgets/home_app_bar.dart';
import 'package:bookia_app/features/home/widgets/sliders_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 13.0.w),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HomeAppBar(),
                SizedBox(height: 25.h),
                SlidersHome(),
                SizedBox(height: 52.h),
                Text(
                  'Best Seller',
                  style: AppTextStyles.text20Regular.copyWith(fontSize: 24.sp),
                ),
                SizedBox(height: 15.h),
               
              ],
            ),
          ),
          CustomGridview()
        ],
      ),
    );
  }
}
