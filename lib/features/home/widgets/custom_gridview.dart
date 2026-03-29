import 'package:bookia_app/core/helper/app_extension.dart';
import 'package:bookia_app/core/theme/app_colors.dart';
import 'package:bookia_app/features/home/cubit/cubit/home_cubit.dart';
import 'package:bookia_app/features/home/data/models/books_model.dart';
import 'package:bookia_app/features/home/widgets/book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomGridview extends StatelessWidget {
  const CustomGridview({super.key, this.isLoading = true, this.books,});
  final bool isLoading;
  
  final List<Product>? books;

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? SliverToBoxAdapter(
            child: Skeletonizer(
              enabled: true,
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.58,
                  mainAxisSpacing: 11.w,
                  crossAxisSpacing: 11.h,
                ),
                itemCount: 10,
                itemBuilder: (context, index) => BookItem(
                  product: Product(name: 'test', price: '22', image: ''),
                ),
              ),
            ),
          )
        : BlocListener<HomeCubit, HomeState>(
            listener: (context, state) {
              if (state is CartLoading) {
                showDialog(context: context, builder: (context)=> Center(child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),));
              }else if (state is CartSuccess){
                context.pop();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.green,
                  content: Text(state.message)));
              }
            },
            child: SliverGrid.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.58,
                mainAxisSpacing: 11.w,
                crossAxisSpacing: 11.h,
              ),
              itemCount: books?.length ?? 0,
              itemBuilder: (context, index) => BookItem(
                onTap: () => context.read<HomeCubit>().addToCart(books?[index].id ?? 0),
                product: books?[index],
              ),
            ),
          );
  }
}
