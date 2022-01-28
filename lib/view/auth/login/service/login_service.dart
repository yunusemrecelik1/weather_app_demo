import 'package:weather_app_demo/core/init/network/firebase_network/IFirebaseNetworkManager.dart';
import 'package:weather_app_demo/view/auth/login/model/login_model.dart';
import 'ILoginService.dart';

class LoginService  extends ILoginService{
  LoginService(IFirebaseNetworkManager manager) : super(manager);

  @override
  Future<String> loginUser(LoginModel model) async{
    final result = await manager.loginService(model);
    if(result != null){
      return result.email ?? "";
    }
    else {
      return "";
    }
  }

}
