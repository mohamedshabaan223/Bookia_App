import 'package:bookia_app/bookia_app/bookia_app.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([
    EasyLocalization.ensureInitialized(),
    ScreenUtil.ensureScreenSize(),
  ]);
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en',), Locale('ar',)],
      path: 'assets/translations', // <-- change the path of the translation files 
      fallbackLocale: Locale('en',),
      child: BookiaApp()
    ),
  );

}
