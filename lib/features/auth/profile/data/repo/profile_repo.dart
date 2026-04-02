import 'package:bookia_app/core/networking/api_constant.dart';
import 'package:bookia_app/core/networking/dio_factory.dart';
import 'package:bookia_app/features/auth/profile/data/models/profile_model.dart';

class ProfileRepo {
  static Future<ProfileModel?> showPrfile() async {
    try {
      final response = await DioFactory.dio?.get(ApiConstant.showProfile);
      if (response?.statusCode == 200) {
        return ProfileModel.fromJson(response?.data);
      } else {
        return response?.data['message'];
      }
    } catch (e) {
      return null;
    }
  }

  static Future<ProfileModel?> updateProfile(
    String name,
    String phone,
    String address,
  ) async {
    try {
      final response = await DioFactory.dio?.get(
        ApiConstant.updateProfile,
        data: {
          "name": name, 
          "address": address, 
          "phone": phone},
      );
      if (response?.statusCode == 200) {
        return ProfileModel.fromJson(response?.data);
      } else {
        return response?.data['message'];
      }
    } catch (e) {
      return null;
    }
  }
  
}
