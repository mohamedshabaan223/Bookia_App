import 'package:bookia_app/core/theme/app_colors.dart';
import 'package:bookia_app/features/auth/profile/presentation/profile_screen.dart';
import 'package:bookia_app/features/book_mark/cubit/cubit/wishlist_cubit.dart';
import 'package:bookia_app/features/book_mark/presentation/book_mark_screen.dart';
import 'package:bookia_app/features/cart/cubit/cubit/cart_cubit.dart';
import 'package:bookia_app/features/cart/presentation/cart_screen.dart';
import 'package:bookia_app/features/home/cubit/cubit/home_cubit.dart';
import 'package:bookia_app/features/home/presentation/home_screen.dart';
import 'package:bookia_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottonNavBarScreen extends StatefulWidget {
  const BottonNavBarScreen({super.key});

  @override
  State<BottonNavBarScreen> createState() => _BottonNavBarScreenState();
}

class _BottonNavBarScreenState extends State<BottonNavBarScreen> {
  List<Widget> tabs = [
    BlocProvider(create: (context) => HomeCubit()..init(), child: HomeScreen()),
    BlocProvider(create: (context) => WishlistCubit()..showWishlist(), child: BookMarkScreen()),
    BlocProvider(
      create: (context) => CartCubit()..showCart(),
      child: CartScreen(),
    ),
    ProfileScreen(),
  ];
  int curentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: tabs[curentIndex]),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            curentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Assets.icons.home,
              colorFilter: curentIndex == 0
                  ? ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn)
                  : null,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Assets.icons.booKmark,
              colorFilter: curentIndex == 1
                  ? ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn)
                  : null,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Assets.icons.cart,
              colorFilter: curentIndex == 2
                  ? ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn)
                  : null,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Assets.icons.profile,
              colorFilter: curentIndex == 3
                  ? ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn)
                  : null,
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
