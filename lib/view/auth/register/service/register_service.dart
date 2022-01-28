import 'package:weather_app_demo/core/init/network/firebase_network/IFirebaseNetworkManager.dart';
import 'package:weather_app_demo/core/init/network/firebase_network/firebase_network_manager.dart';
import 'package:weather_app_demo/view/auth/register/model/register_model.dart';
import 'package:weather_app_demo/view/auth/register/service/IRegisterService.dart';

class RegisterService extends IRegisterService{
  RegisterService(IFirebaseNetworkManager manager) : super(manager);

  @override
  Future<String> fetchUser(RegisterModel model) async{
   final result = await manager.registerService(model);
   if(result != null){
     return result.email ?? "";
   }
   else {
     return "";
   }
  }
}