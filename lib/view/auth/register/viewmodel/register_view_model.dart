import 'package:flutter/material.dart';
import 'package:weather_app_demo/core/base/model/base_view_model.dart';
import 'package:weather_app_demo/core/constants/navigation/navigation_constants.dart';
import 'package:weather_app_demo/core/init/navigation/navigation_service.dart';
import 'package:weather_app_demo/core/init/network/firebase_network/firebase_network_manager.dart';
import 'package:weather_app_demo/view/auth/register/model/register_model.dart';
import 'package:weather_app_demo/view/auth/register/service/IRegisterService.dart';
import 'package:weather_app_demo/view/auth/register/service/register_service.dart';

class RegisterViewModel  extends ChangeNotifier with BaseViewModel{

  late TextEditingController fullNameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController passwordAgainController;
  late IRegisterService registerService;
  GlobalKey<FormState> formState = GlobalKey();
  bool isLoading = false;
  bool isLockOpen = true;
  bool isSecondLockOpen = true;
  @override
  void setContext(BuildContext context) => this.context = context;

  @override
  void init() {
    registerService = RegisterService(FirebaseNetworkManager.instance);
    fullNameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    passwordAgainController = TextEditingController();
  }
  void changeLock(){
    isLockOpen = !isLockOpen;
    notifyListeners();
  }
  void changeLoading(){
    isLoading = !isLoading;
    notifyListeners();
  }
  void changeSecondPasswordLock(){
    isSecondLockOpen = !isSecondLockOpen;
    notifyListeners();
  }

  Future<void> fetchRegisterService() async {
    changeLoading();
    if(passwordAgainController.text == emailController.text){
      final result = await registerService.fetchUser(RegisterModel(email:emailController.text, password:passwordController.text,name: fullNameController.text));
      if(result != ""){
        NavigationService.instance.navigateToPage(path: NavigationConstants.loginView);
      }
    }
    changeLoading();
  }
  void navigateLogin(){
    NavigationService.instance.navigateToPage(path: NavigationConstants.loginView);
  }
}