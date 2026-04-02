import 'package:bookia_app/core/helper/app_extension.dart';
import 'package:bookia_app/core/theme/app_text_styles.dart';
import 'package:bookia_app/features/book_mark/cubit/cubit/wishlist_cubit.dart';
import 'package:bookia_app/features/book_mark/presentation/widgets/grid_showlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookMarkScreen extends StatelessWidget {
  const BookMarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(height: 30.h),
                Text(
                  'Wishlist',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.text20Regular.copyWith(fontSize: 24.sp),
                ),
                SizedBox(height: 25.h),
              ],
            ),
          ),
          BlocConsumer<WishlistCubit, WishlistState>(
            listener: (context, state)  async{
              if (state is RemoveWishlistLoading) {
                showDialog(context: context, builder: (context)=> Center(child: CircularProgressIndicator()));
              } else if (state is RemoveWishlistSuccess){
                context.pop();
                await context.read<WishlistCubit>().showWishlist();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.green,
                  content: Text(state.message ?? '')));
              }
            },
            builder: (context, state) {
             if (state is ShowWishlistLoading) {
               return GridShowlist();
             }else if ( state is ShowWishlistSuccess){
              return GridShowlist(wishproduct: state.wishItem, isLoading: false,

              );
             }else {
              return SliverToBoxAdapter(child: Text('error'));
             }
            },
          ),
        ],
      ),
    );
  }
}
