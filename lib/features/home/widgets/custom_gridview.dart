import 'package:bookia_app/features/home/cubit/cubit/home_cubit.dart';
import 'package:bookia_app/features/home/data/models/books_model.dart';
import 'package:bookia_app/features/home/widgets/book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomGridview extends StatelessWidget {
  const CustomGridview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
       buildWhen: (previous, current) =>
          current is GeyBestSellerLoading ||
          current is GeyBestSellerSuccess ||
          current is GeyBestSellerError,
      builder: (context, state) {
      if ( state is GeyBestSellerLoading) {
        return SliverToBoxAdapter(
          child: Skeletonizer(
            enabled: true,
            child: GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2 ,
            childAspectRatio: 0.58,
            mainAxisSpacing: 11.w,
            crossAxisSpacing: 11.h
            ),
            itemCount: 10,
            itemBuilder: (context , index) => BookItem( product: 
            Product(
              name: 'test',
              price: '22',
              image: ''
            ) ,)),
          ),
        );
      }else if ( state is GeyBestSellerSuccess){
        return  SliverGrid.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2 ,
          childAspectRatio: 0.58,
          mainAxisSpacing: 11.w,
          crossAxisSpacing: 11.h
          ),
          itemCount: state.book.length,
          itemBuilder: (context , index) => BookItem( product: state.book[index] ,));
      } else {
        return SliverToBoxAdapter(
          child: Text('Error!'),
        );
      }
      },
    );
  }
}