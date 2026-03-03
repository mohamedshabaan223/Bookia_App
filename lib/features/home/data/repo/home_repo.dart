import 'package:bookia_app/features/home/data/models/sliders_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomeRepo {
   static final Dio _dio = Dio();
   static Future<SlidersModel?> homeSliders() async{
    try {
      Response response = await _dio.get('https://codingarabic.online/api/sliders');
      if (response.statusCode == 200) {
         return SlidersModel.fromJson(response.data);
        
      }else {
        return null;
      }
    } catch (e) {
      return null;
    }
   }
   
}