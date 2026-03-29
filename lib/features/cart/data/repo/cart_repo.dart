import 'package:bookia_app/core/networking/api_constant.dart';
import 'package:bookia_app/core/networking/dio_factory.dart';
import 'package:bookia_app/features/cart/data/model/show_cart_model.dart';
class CartRepo {
   static  addToCart(int productId)async {
    try {
      final response =await DioFactory.dio?.post(ApiConstant.addToCart ,
      data: {
        "product_id":productId,
      } );
      if (response?.statusCode == 201) {
        return response?.data["message"];
      }else {
    
        return response?.data["message"];
      }
    } catch (e) {
      return e.toString();
    }
   }
   static Future<ShowCartModel?> showCart()async {
    try {
      final response = await DioFactory.dio?.get(ApiConstant.showCart);
      if( response?.statusCode == 200 ){
        return ShowCartModel.fromJson(response?.data);
      }
      else {
        return response?.data['message'];
      }
    } catch (e) {
      return null;
    }
   }
   static removeCart(int cartId ) async{
    try {
      final response = await DioFactory.dio?.post(ApiConstant.removeCart , data: {
        'cart_item_id':cartId,
      });
      if (response?.statusCode == 200) {
        return response?.data['message'];
      }else {
         return response?.data['message'];
      }
    } catch (e) {
      e.toString();
    }
   }
}