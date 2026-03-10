import 'package:bookia_app/bookia_app/bookia_app.dart';
import 'package:bookia_app/core/helper/bloc_observer.dart';
import 'package:bookia_app/core/networking/dio_factory.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
 

  WidgetsFlutterBinding.ensureInitialized();
   DioFactory.init();
    Bloc.observer = MyBlocObserver();
   final SharedPreferences prefs = await SharedPreferences.getInstance();
   String? token = prefs.getString('token');
  await Future.wait([
    EasyLocalization.ensureInitialized(),
    ScreenUtil.ensureScreenSize(),
  ]);
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en',), Locale('ar',)],
      path: 'assets/translations', // <-- change the path of the translation files 
      fallbackLocale: Locale('en',),
      child: BookiaApp(
        token: token,
      )
    ),
  );

}
