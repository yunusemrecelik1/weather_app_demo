import 'package:flutter/cupertino.dart';
import 'package:weather_app_demo/core/base/model/base_view_model.dart';
import 'package:weather_app_demo/core/constants/navigation/navigation_constants.dart';
import 'package:weather_app_demo/core/init/navigation/navigation_service.dart';

class OnBoardViewModel extends ChangeNotifier with BaseViewModel {
  @override
  void setContext(BuildContext context) => this.context = context;

  @override
  void init() {}

  void navigateRegister(){
    NavigationService.instance.navigateToPage(path: NavigationConstants.registerView);
  }
  void navigateLogin(){
    NavigationService.instance.navigateToPage(path: NavigationConstants.loginView);
  }
}