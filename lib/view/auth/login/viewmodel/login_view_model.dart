
import 'package:flutter/cupertino.dart';
import 'package:weather_app_demo/core/base/model/base_view_model.dart';
import 'package:weather_app_demo/core/constants/navigation/navigation_constants.dart';
import 'package:weather_app_demo/core/init/navigation/navigation_service.dart';
import 'package:weather_app_demo/core/init/network/firebase_network/firebase_network_manager.dart';
import 'package:weather_app_demo/view/auth/login/model/login_model.dart';
import 'package:weather_app_demo/view/auth/login/service/ILoginService.dart';
import 'package:weather_app_demo/view/auth/login/service/login_service.dart';

class LoginViewModel extends ChangeNotifier with BaseViewModel {

  late TextEditingController emailController;
  late TextEditingController passwordController;
  late ILoginService loginService;
  bool isLoading = false;
  bool isLockOpen = true;

  @override
  void setContext(BuildContext context) => this.context = context;

  @override
  void init() {
    loginService = LoginService(FirebaseNetworkManager.instance);
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }
  void navigateRegister(){
    NavigationService.instance.navigateToPage(path: NavigationConstants.registerView);
  }
  void changeLock(){
    isLockOpen = !isLockOpen;
    notifyListeners();
  }
  void changeLoading(){
    isLoading = !isLoading;
    notifyListeners();
  }
  Future<void> fetchLoginService() async {
    changeLoading();
    final result = await loginService.loginUser(LoginModel(email:emailController.text, password:passwordController.text));
    if(result != ""){
      NavigationService.instance.navigateToPage(path: NavigationConstants.homeView);
    }
    changeLoading();
  }
}