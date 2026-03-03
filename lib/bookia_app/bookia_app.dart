
import 'package:bookia_app/core/routing/app_routes.dart';
import 'package:bookia_app/core/routing/routes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookiaApp extends StatelessWidget {
  final String? token;
  const BookiaApp({super.key, this.token});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: ThemeData(fontFamily: 'DMSerifDisplay', 
        ),
        onGenerateRoute: AppRoutes.onGenrateRoute,
        initialRoute: startRoute(),
      ),
    );
  }
  startRoute(){
  if (token == null) {
    return Routes.onboardingScreen;
  }else {
    return Routes.bottonNavBarScreen;
  }
}
}

