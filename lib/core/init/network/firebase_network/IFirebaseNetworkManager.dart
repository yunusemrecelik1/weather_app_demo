import 'package:firebase_auth/firebase_auth.dart';
import 'package:weather_app_demo/view/auth/login/model/login_model.dart';
import 'package:weather_app_demo/view/auth/register/model/register_model.dart';

abstract class IFirebaseNetworkManager {
  Future<User?> registerService(RegisterModel model);
  Future<User?> loginService(LoginModel model);
}