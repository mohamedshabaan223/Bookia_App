import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
class AuthRepo {
  static final  Dio _dio = Dio();
  static Future<bool> login({ required String email , required String password}) async {
   try {
     Response response = await _dio.post("https://codingarabic.online/api/login" ,
      data:{
        "email" : email,
         "password":password,
      } );
    if (response.statusCode == 200) {
     await saveData(response.data["data"]["token"].toString());
      return true;
    }else {
      return false;
    }
   } catch (e) {
     return false;
   }
  }


  static Future<bool> register({ required String name , required String email ,  required String password ,  required String confirmPassword }) async{
   try {
      Response response = await _dio.post("https://codingarabic.online/api/register" , 
    data: {
      "name" : name,
    "email" :email,
    "password":password,
    "password_confirmation" :confirmPassword,
    });

    if (response.statusCode == 20) {
      return true;
    }else {
      return false;

    }
   } catch (e) {
     return false;
   }

  }
  static saveData( String token) async{
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('token', token);
}
}

