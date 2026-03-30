import 'package:bookia_app/core/helper/app_extension.dart';
import 'package:bookia_app/core/theme/app_colors.dart';
import 'package:bookia_app/core/theme/app_text_styles.dart';
import 'package:bookia_app/core/widgets/custom_arrow_back.dart';
import 'package:bookia_app/core/widgets/custom_network_image.dart';
import 'package:bookia_app/features/book_details/cubit/cubit/book_details_cubit.dart';
import 'package:bookia_app/features/home/cubit/cubit/home_cubit.dart';
import 'package:bookia_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class BookDetailScreen extends StatelessWidget {
  const BookDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookDetailsCubit, BookDetailsState>(
      buildWhen: (previous, current) =>
          current is BookDetailsLoading ||
          current is BookDetailsSuccess ||
          current is BookDetailsError,
      builder: (context, state) {
        if (state is BookDetailsLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is BookDetailsSuccess) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 11.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomArrowBack(),
                        BlocListener<BookDetailsCubit, BookDetailsState>(
                          listener: (context, state) {
                            if (state is AddWishlistLoading) {
                              showDialog(
                                context: context,
                                builder: (context) => Center(
                                  child: CircularProgressIndicator(
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                              );
                            } else if (state is AddWishlistSuccess) {
                              context.pop();
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: Colors.green,
                                  content: Text(state.successMessage ?? ''),
                                ),
                              );
                            }
                          },
                          child: InkWell(
                            onTap: () {
                              context.read<BookDetailsCubit>().addWishList(
                                state.bookModel!.id,
                              );
                            },
                            child: SvgPicture.asset(Assets.icons.booKmark),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30.h),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(7.r),
                      child: CustomNetworkImage(
                        url: state.bookModel?.image ?? '',
                        width: 183.w,
                        height: 271.h,
                      ),
                    ),

                    SizedBox(height: 11),

                    // 📖 Title
                    Text(
                      state.bookModel?.name ?? '',
                      style: TextStyle(
                        fontSize: 30.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 8.h),

                    Text(
                      state.bookModel?.category ?? '',
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: AppColors.primaryColor,
                      ),
                    ),

                    SizedBox(height: 16.h),

                    // 📝 Description
                    Text(
                      state.bookModel?.description ?? '',
                      textAlign: TextAlign.start,

                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                      ),
                    ),

                    const Spacer(),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '₹${state.bookModel?.price ?? ''}',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        BlocListener<HomeCubit, HomeState>(
                           listener: (context, state) {
                                      if (state is CartLoading) {
                                        showDialog(
                                          context: context,
                                          builder: (context) => Center(
                                            child: CircularProgressIndicator(
                                              color: AppColors.primaryColor,
                                            ),
                                          ),
                                        );
                                      } else if (state is CartSuccess) {
                                        context.pop();
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          SnackBar(
                                            backgroundColor: Colors.green,
                                            content: Text(
                                              state.message ,
                                            ),
                                          ),
                                        );
                                      }
                                    },
                          child: InkWell(
                            onTap: () {
                              context.read<HomeCubit>().addToCart(
                                state.bookModel?.id ?? 0,
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 36.w,
                                vertical: 15.h,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.black,
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: Text(
                                'Add To Cart',
                                style: AppTextStyles.text20Regular.copyWith(
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          );
        } else {
          return Text('data');
        }
      },
    );
  }
}
