import 'package:bookia_app/core/networking/api_constant.dart';
import 'package:bookia_app/core/networking/dio_factory.dart';
import 'package:bookia_app/features/place_order/data/models/governorate_model.dart';

class GovernorateRepo {
  static Future<GovernorateModel?> governorate()async{
    try {
    final response = await DioFactory.dio?.get(ApiConstant.governorate);
    if (response?.statusCode == 200) {
      return GovernorateModel.fromJson(response?.data);
    }else {
      return response?.data['message'];
    }
    } catch (e) {
      return null;
    }
  }
  static placeOrder( int governorateId, String name , String phone , String address , String email)async {
    try {
      final response = await DioFactory.dio?.post(ApiConstant.placeOrder, data: {
    "governorate_id":governorateId,
    "name" : name,
    "phone" : phone,
    "address":address,
    "email" : email
      });
      if (response?.statusCode ==201) {
        return response?.data['message'];
      }else {
                return response?.data['message'];

      }
    } catch (e) {
      return e.toString();
    }
  }

}