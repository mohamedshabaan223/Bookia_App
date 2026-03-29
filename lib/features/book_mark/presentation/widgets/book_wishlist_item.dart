
import 'package:bookia_app/core/theme/app_colors.dart';
import 'package:bookia_app/core/theme/app_text_styles.dart';
import 'package:bookia_app/core/widgets/custom_network_image.dart';
import 'package:bookia_app/features/book_mark/data/models/show_wishlist_model.dart';
import 'package:bookia_app/features/cart/presentation/widgets/delete_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookWishlistItem extends StatelessWidget {
  final WishlistItem? productwishlist;
  final void Function()? onTap;
  
  const BookWishlistItem({super.key, required this.productwishlist, this.onTap ,});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
      
     },
      child: Container(
        padding: EdgeInsets.all(
          11.r
        ),
       
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: AppColors.backgroundBookItem,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10.r),
          child: CustomNetworkImage(
            url: productwishlist?.image ?? '',
            width: double.infinity,
            height: 175.h),
        ),
          SizedBox(height: 6.h,),
          Expanded(child: Text(productwishlist?.name ?? '' ,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.text16Regular.copyWith(fontSize: 18.sp , 
          color: AppColors.black),)),
          Row(
            children: [
              Expanded(child: Text('₹${productwishlist?.price ?? ''}', style: AppTextStyles.text16Regular.copyWith(
                color: AppColors.black
              ),)),
             DeleteContainer(
              onTap: onTap,
             )
            ],
          )
      ],
      ),
      ),
    );
  }
}