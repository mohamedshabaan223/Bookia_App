import 'package:bookia_app/core/networking/api_constant.dart';
import 'package:bookia_app/core/networking/dio_factory.dart';
import 'package:bookia_app/features/book_mark/data/models/show_wishlist_model.dart';
class WishlistRepo {

  static  addWishlist(int id)async{
    try {
      final response = await DioFactory.dio?.post(ApiConstant.addWishlist , data: {
        'product_id':id,
      });
      if (response?.statusCode == 200) {
        return response?.data['message'];
      }else {
        return response?.data['message'];
      }
    } catch (e) {
      return e.toString();
    }
  }
  static Future<ShowWishlistModel?> showWishlist()async{
   try {
     final response = await DioFactory.dio?.get(ApiConstant.showWishList);
     if (response?.statusCode == 200) {
      return ShowWishlistModel.fromJson(response?.data) ;
     }else {
      return response?.data['message'];
     }
   } catch (e) {
     return null;
   }
  }
}