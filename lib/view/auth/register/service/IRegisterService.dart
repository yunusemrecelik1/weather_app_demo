import 'package:weather_app_demo/core/init/network/firebase_network/IFirebaseNetworkManager.dart';
import 'package:weather_app_demo/view/auth/register/model/register_model.dart';

abstract class IRegisterService {
  final IFirebaseNetworkManager manager;

  IRegisterService(this.manager);

  Future<String> fetchUser(RegisterModel model);
}