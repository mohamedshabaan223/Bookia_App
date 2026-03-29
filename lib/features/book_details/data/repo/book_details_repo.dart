import 'package:bookia_app/core/networking/api_constant.dart';
import 'package:bookia_app/core/networking/dio_factory.dart';
import 'package:bookia_app/features/book_details/data/models/show_book_model.dart';

class BookDetailsRepo {
  static Future<ShowBook?> showBookDetails(int bookId) async{
    try {
      final response = await DioFactory.dio?.get('${ApiConstant.bookId}/$bookId');
      if (response?.statusCode == 200) {
        return ShowBook.fromJson(response?.data);
      }else {
        return response?.data['message'];
      }
    } catch (e) {
      return null;
    }
  }
}