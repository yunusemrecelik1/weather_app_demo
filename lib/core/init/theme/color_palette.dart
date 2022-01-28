import 'package:weather_app_demo/core/extension/string_extension.dart';

class ColorPalette {
  static ColorPalette? _instance;

  static ColorPalette get instance => _instance ??= ColorPalette._init();

  ColorPalette._init();

  final mainColor = '8e4de0'.colorPalette;
  final secondaryColor = 'd29cfb'.colorPalette;
  final appGray = 'acaca4'.colorPalette;
  final appDarkGray = '5c5c5c'.colorPalette;
  final appBlack = '0e0e0e'.colorPalette;
}