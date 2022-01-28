import 'package:weather_app_demo/core/init/network/firebase_network/IFirebaseNetworkManager.dart';
import 'package:weather_app_demo/view/auth/login/model/login_model.dart';

abstract class ILoginService {
  final IFirebaseNetworkManager manager;

  ILoginService(this.manager);

  Future<String> loginUser(LoginModel model);
}