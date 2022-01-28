import 'package:weather_app_demo/core/extension/string_extension.dart';

class SvgConstants {
  static SvgConstants? _instance;

  static SvgConstants get instance => _instance ??= SvgConstants._init();

  SvgConstants._init();

  final loginBackground = 'login_bg'.toSvg;
  final registerBackground = 'register_bg'.toSvg;
  final onBoardBackground = 'main_login'.toSvg;
}
