import 'package:flutter_login_ui_cubit/models/user/user_object.dart';

//This abstruct class is for dependency injection
abstract class LoginObjectRepository {
  Future<UserObject> fetchLoginObject(String email, String password);
}
