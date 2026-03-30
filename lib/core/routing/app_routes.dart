import 'package:bookia_app/core/routing/routes.dart';
import 'package:bookia_app/features/auth/cubit/cubit/auth_cubit.dart';
import 'package:bookia_app/features/auth/presentation/create_new_password_screen.dart';
import 'package:bookia_app/features/auth/presentation/forget_password_screen.dart';
import 'package:bookia_app/features/auth/presentation/login_screen.dart';
import 'package:bookia_app/features/auth/presentation/register_screen.dart';
import 'package:bookia_app/features/auth/presentation/verification_screen.dart';
import 'package:bookia_app/features/book_details/cubit/cubit/book_details_cubit.dart';
import 'package:bookia_app/features/book_details/presentation/book_details_screen.dart';
import 'package:bookia_app/features/book_mark/cubit/cubit/wishlist_cubit.dart';
import 'package:bookia_app/features/book_mark/presentation/book_mark_screen.dart';
import 'package:bookia_app/features/botton_nav_bar/presentation/botton_nav_bar_screen.dart';
import 'package:bookia_app/features/home/cubit/cubit/home_cubit.dart';
import 'package:bookia_app/features/home/presentation/home_screen.dart';
import 'package:bookia_app/features/onboarding/presentation/onboarding_screen.dart';
import 'package:bookia_app/features/search/cubit/cubit/search_cubit.dart';
import 'package:bookia_app/features/search/presentation/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoutes {
  static Route onGenrateRoute(RouteSettings setting) {
    switch (setting.name) {
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => AuthCubit(),
            child: LoginScreen(),
          ),
        );
      case Routes.registerScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => AuthCubit(),
            child: RegisterScreen(),
          ),
        );
      case Routes.forgetScreen:
        return MaterialPageRoute(builder: (_) => ForgetPasswordScreen());
      case Routes.bookDetailsScreen:
        int id = setting.arguments as int;
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => BookDetailsCubit()..bookDetails(id)),
              BlocProvider(create: (context) => HomeCubit())
            ],
            child: BookDetailScreen()),
        );
      case Routes.searchScreen:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => HomeCubit()),
              BlocProvider(create: (context) => SearchCubit()),
            ],
            child: SearchScreen(),
          ),
        );
      case Routes.createPassowrdScreen:
        return MaterialPageRoute(builder: (_) => CreateNewPasswordScreen());
      case Routes.bookMarkScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => WishlistCubit(),
            child: BookMarkScreen(),
          ),
        );
      case Routes.onboardingScreen:
        return MaterialPageRoute(builder: (_) => OnboardingScreen());
        case Routes.verificationOtp:
        return MaterialPageRoute(builder: (_) => VerificationScreen());
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case Routes.bottonNavBarScreen:
        return MaterialPageRoute(builder: (_) => BottonNavBarScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(body: Center(child: Text('NOT FOUND'))),
        );
    }
  }
}
