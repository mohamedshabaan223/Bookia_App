import 'package:bookia_app/core/networking/api_constant.dart';
import 'package:bookia_app/core/networking/dio_factory.dart';
import 'package:bookia_app/features/home/data/models/books_model.dart';
import 'package:dio/dio.dart';

class SearchRepo {
  static productSearch(String text) async {
    try {
      final response = await DioFactory.dio?.get(ApiConstant.productSearch , queryParameters: {
        'name':text
      });
      if (response?.statusCode == 200) {
        return BooksModel.fromJson(response?.data);
      }else {
        return response?.data['message'];
      }
    } catch (e) {
      return e.toString();
    }
  }
}