import 'package:bookia_app/core/theme/app_colors.dart';
import 'package:bookia_app/features/home/cubit/cubit/sliders_cubit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SlidersHome extends StatefulWidget {
  const SlidersHome({super.key});

  @override
  State<SlidersHome> createState() => _SlidersHomeState();
}

class _SlidersHomeState extends State<SlidersHome> {
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SlidersCubit, SlidersState>(
      builder: (context, state) {
        if ( state is SlidersHomeLoading) {
          return CircularProgressIndicator( color: AppColors.primaryColor,);
        }else if(state is SlidersHomeSuccsess){
         
          return Column(
        children: [
          CarouselSlider(
          
            options: CarouselOptions(height: 150.0.h , 
            autoPlay: true , 
            viewportFraction: 1,
            onPageChanged: (index, reason) {
               setState(() {
                 
                 activeIndex= index;
               });
            },),
            
            items: List.generate( state.sliders.length, (index) =>
             Padding(
               padding:EdgeInsets.symmetric(horizontal: 9.0.w),
               child: ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(12.r),
                 child: Image.network(state.sliders[index].image??'' , width: double.infinity, fit: BoxFit.cover,) ,
               ),
             ))
          ),
          SizedBox(height: 14.h,),
          AnimatedSmoothIndicator(
            activeIndex: activeIndex,
            count: state.sliders.length,
            effect: ExpandingDotsEffect(
              
              dotHeight: 7.h,
              activeDotColor: AppColors.primaryColor,
              dotColor: AppColors.dotColor,
            ),
          ),
        ],
      );
        } else {
          return Text('error');
        }
      },
    );
  }
}
