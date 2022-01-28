import 'package:firebase_auth/firebase_auth.dart';
import 'package:weather_app_demo/core/init/network/firebase_network/IFirebaseNetworkManager.dart';
import 'package:weather_app_demo/view/auth/login/model/login_model.dart';
import 'package:weather_app_demo/view/auth/register/model/register_model.dart';

class FirebaseNetworkManager extends IFirebaseNetworkManager {
  static FirebaseNetworkManager? _instance;

  static FirebaseNetworkManager get instance => _instance ??= FirebaseNetworkManager._init();

  FirebaseNetworkManager._init();
  final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Future<User?> loginService(LoginModel model) async {
    final result =
    await auth.signInWithEmailAndPassword(email: model.email ?? "", password: model.password ?? "");
    if(result.user != null){
      return result.user;
    }
    else {
      return null;
    }
  }

  @override
  Future<User?> registerService(RegisterModel model) async {

    final result = await auth.createUserWithEmailAndPassword(email: model.email ?? "", password: model.password ?? "");
    if(result.user != null){
      return result.user;
    }
    else {
      return null;
    }
  }
}

