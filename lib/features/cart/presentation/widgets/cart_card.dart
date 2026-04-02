
import 'package:bookia_app/core/theme/app_colors.dart';
import 'package:bookia_app/core/theme/app_text_styles.dart';
import 'package:bookia_app/core/widgets/custom_network_image.dart';
import 'package:bookia_app/features/cart/data/model/show_cart_model.dart';
import 'package:bookia_app/features/cart/presentation/widgets/custom_add_remove_button.dart';
import 'package:bookia_app/features/cart/presentation/widgets/delete_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartCard extends StatefulWidget {
  const CartCard({super.key, required this.cart, this.onTap, });
  final CartItemModel cart;
  final void Function()? onTap;
  
  

  @override
  State<CartCard> createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(6.r),
        child: CustomNetworkImage(
          url: widget.cart.itemProductImage,
          width: 100.w,
          height: 118.h,
        ),
      ),
      
      Expanded( 
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.cart.itemProductName,
                style: AppTextStyles.text16Regular.copyWith( fontSize: 18.sp , color: Color(0xff606060)),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 9.h),
              Text('₹${widget.cart.itemProductPrice}' ,style: AppTextStyles.text16Regular.copyWith(color: AppColors.black),),
              SizedBox(height: 29.h),
              Row(
                children: [
                  CustomAddRemoveButton(icons: Icons.add, onPressed: () {
                    counter++;
                    setState(() {});
                  }),
                  SizedBox(width: 8.w),
                  Text('0 ${counter.toString()}' , style: AppTextStyles.text16Regular.copyWith(color: AppColors.black , fontWeight: FontWeight.w600 , fontSize: 18.sp)),
                  SizedBox(width: 8.w),
                  CustomAddRemoveButton(icons: Icons.remove, onPressed: () {
                    if (counter > 0) {
                      counter--;
                      setState(() {});
                    }
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
      
      DeleteContainer( onTap: widget.onTap,),
        ],
      ),
    );
  }
}