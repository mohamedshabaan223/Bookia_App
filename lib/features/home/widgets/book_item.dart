import 'package:bookia_app/core/theme/app_colors.dart';
import 'package:bookia_app/core/theme/app_text_styles.dart';
import 'package:bookia_app/core/widgets/custom_network_image.dart';
import 'package:bookia_app/features/home/data/models/books_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookItem extends StatelessWidget {
  final Product? product;
  const BookItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
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
          url: product?.image ?? '',
          width: double.infinity,
          height: 175.h),
      ),
        SizedBox(height: 6.h,),
        Expanded(child: Text(product?.name ?? '' ,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: AppTextStyles.text16Regular.copyWith(fontSize: 18.sp , 
        color: AppColors.black),)),
        Row(
          children: [
            Expanded(child: Text(product?.price ?? '' , style: AppTextStyles.text16Regular.copyWith(
              color: AppColors.black
            ),)),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 23.w , vertical: 4.h),
              decoration: BoxDecoration(
                color: AppColors.black,
                borderRadius: BorderRadius.circular(4.r)
              ),
              child: Text('Buy' , style: AppTextStyles.text14Regular.copyWith(
                color: AppColors.white
              ),),
            )
          ],
        )
    ],
    ),
    );
  }
}