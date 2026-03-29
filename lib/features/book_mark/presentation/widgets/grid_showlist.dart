
import 'package:bookia_app/features/book_mark/data/models/show_wishlist_model.dart';
import 'package:bookia_app/features/book_mark/presentation/widgets/book_wishlist_item.dart';

import 'package:bookia_app/features/home/data/models/books_model.dart';
import 'package:bookia_app/features/home/widgets/book_item.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class GridShowlist extends StatelessWidget {
  const GridShowlist({super.key, this.isLoading = true, this.wishproduct,});
  final bool isLoading;
  final List<WishlistItem>? wishproduct;
  

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
        : SliverGrid.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.58,
            mainAxisSpacing: 11.w,
            crossAxisSpacing: 11.h,
          ),
          itemCount: wishproduct?.length ?? 0,
          itemBuilder: (context, index) => BookWishlistItem(
            productwishlist:wishproduct![index] ,
          )
        );
  }
}
