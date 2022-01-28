import 'package:flutter/material.dart';
import 'package:weather_app_demo/view/auth/login/view/login_view.dart';
import 'package:weather_app_demo/view/auth/onboard/view/onboard_view.dart';
import 'package:weather_app_demo/view/auth/register/view/register_view.dart';
import 'package:weather_app_demo/view/home/home_screen/view/home_view.dart';
import '../../constants/navigation/navigation_constants.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.onBoardView:
        return normalNavigate(const OnBoardView());
      case NavigationConstants.registerView:
        return normalNavigate(const RegisterView());

      case NavigationConstants.loginView:
        return normalNavigate(const LoginView());

      case NavigationConstants.homeView:
        return normalNavigate(const HomeView());

      default:
        return MaterialPageRoute(
          builder: (context) => const Text("Error"),
        );
    }
  }

  MaterialPageRoute normalNavigate(Widget widget) {
    return MaterialPageRoute(
      builder: (context) => widget,
    );
  }
}
