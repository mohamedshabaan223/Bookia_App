import 'package:bookia_app/core/networking/api_constant.dart';
import 'package:bookia_app/core/networking/dio_factory.dart';
class CartRepo {
   static addToCart(int productId)async {
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
}