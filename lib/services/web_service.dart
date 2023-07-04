import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_login_ui_cubit/models/user/user_object.dart';
import 'package:flutter_login_ui_cubit/utils/constant.dart';

//This class is for network calls
class WebService {
  var dio = Dio();

  //call login api
  Future<UserObject> getLoginData(String email, String password) async {
    final response = await dio.post(
      Constants.loginUrl,
      data: {'email': email, 'password': password},
    );

    if (response.statusCode == 200) {
      if (kDebugMode) {
        print("Login Onject\n$response");
      }

      return UserObject.fromJson(response.data);
    } else {
      throw Exception("Authentication error!");
    }
  }
}
