import 'package:bookia_app/core/routing/routes.dart';
import 'package:bookia_app/features/auth/cubit/cubit/auth_cubit.dart';
import 'package:bookia_app/features/auth/presentation/create_new_password_screen.dart';
import 'package:bookia_app/features/auth/presentation/forget_password_screen.dart';
import 'package:bookia_app/features/auth/presentation/login_screen.dart';
import 'package:bookia_app/features/auth/presentation/register_screen.dart';
import 'package:bookia_app/features/botton_nav_bar/presentation/botton_nav_bar_screen.dart';
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
      case Routes.searchScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => SearchCubit(),
            child: SearchScreen(),
          ),
        );
      case Routes.createPassowrdScreen:
        return MaterialPageRoute(builder: (_) => CreateNewPasswordScreen());
      case Routes.onboardingScreen:
        return MaterialPageRoute(builder: (_) => OnboardingScreen());
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
