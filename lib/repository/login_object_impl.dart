import 'package:flutter_login_ui_cubit/models/user/user_object.dart';
import 'package:flutter_login_ui_cubit/repository/login_object_repo.dart';
import 'package:flutter_login_ui_cubit/services/web_service.dart';

//This class calls api for real data
class LoginObjectRepoImpl implements LoginObjectRepository {
  @override
  Future<UserObject> fetchLoginObject(String email, String password) {
    return WebService().getLoginData(email, password);
  }
}
