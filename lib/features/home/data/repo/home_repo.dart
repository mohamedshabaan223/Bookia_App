import 'package:bookia_app/core/networking/api_constant.dart';
import 'package:bookia_app/core/networking/dio_factory.dart';
import 'package:bookia_app/features/home/data/models/books_model.dart';
import 'package:bookia_app/features/home/data/models/sliders_model.dart';
import 'package:dio/dio.dart';


class HomeRepo {
  
   static Future<SlidersModel?> homeSliders() async{
    try {
      Response? response = await DioFactory.dio?.get(ApiConstant.sliders);
      if (response?.statusCode == 200) {
         return SlidersModel.fromJson(response?.data);
        
      }else {
        return null;
      }
    } catch (e) {
      return null;
    }
   }
    static Future<BooksModel?> bookItemModel() async{
     try {
        Response? response =await DioFactory.dio?.get(ApiConstant.bestSeller);
      if (response?.statusCode == 200) {
        return BooksModel.fromJson(response?.data);
      }else {
        return null;
      }
     } catch (e) {
       return null;
     }
    }
   
}