import 'package:bookia_app/core/helper/app_extension.dart';
import 'package:bookia_app/core/routing/routes.dart';
import 'package:bookia_app/core/theme/app_text_styles.dart';
import 'package:bookia_app/features/cart/cubit/cubit/cart_cubit.dart';
import 'package:bookia_app/features/cart/cubit/cubit/show_cart_state.dart';
import 'package:bookia_app/features/cart/data/model/show_cart_model.dart';
import 'package:bookia_app/features/cart/presentation/widgets/cart_card.dart';
import 'package:bookia_app/features/cart/presentation/widgets/checkout_button.dart';
import 'package:bookia_app/features/cart/presentation/widgets/total_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) async {
        if (state is RemoveCartLoading) {
          showDialog(
            context: context,
            builder: (context) => Center(child: CircularProgressIndicator()),
          );
        } else if (state is RemoveCartSuccess) {
          context.pop();
          await BlocProvider.of<CartCubit>(context).showCart();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.green,
              content: Text(state.removeMessage ?? ''),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is ShowCartLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is ShowCartSuccess) {
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    SizedBox(height: 15.h),
                    Text(
                      'My Cart',
                      style: AppTextStyles.text20Regular.copyWith(
                        fontSize: 24.sp,
                      ),
                    ),
                    SizedBox(height: 30.h),
                  ],
                ),
              ),
              SliverList.separated(
                separatorBuilder: (context, index) =>
                    Divider(indent: 14.w, endIndent: 14.w, height: 20.h),
                itemBuilder: (context, index) => CartCard(
                  cart: state.cartItem![index],
                  onTap: () => context.read<CartCubit>().removeCart(
                    state.cartItem![index].itemId,
                  ),
                ),
                itemCount: state.cartItem?.length ?? 0,
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    SizedBox(height: 20.h),
                    TotalRow(totalPrice: calculateTotal(state.cartItem)),
                    CheckoutButton(
                      onPressed: () {
                        context.pushNamed(Routes.placeOrder,);
                      },
                    ),
                  ],
                ),
              ),
            ],
          );
        } else {
          return Center(child: Text('No Cart Founded , Plase Add Cart'));
        }
      },
    );
  }

  double calculateTotal(List<CartItemModel>? items) {
    return items!.fold(0.0, (total, item) {
      final price = double.tryParse(item.itemProductPrice) ?? 0.0;
      total = total + (price * item.itemQuantity);
      return total;
    });
  }
}
