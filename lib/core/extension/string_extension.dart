import 'package:flutter/material.dart';

extension ImagePathExtension on String {
  String get toSvg => 'assets/svg/$this.svg';

}
extension ColorPaletteExtension on String {
  int? get colorCode => int.tryParse('0xFF$this');
  Color get colorPalette => Color(colorCode ?? 0xFFFFFFFF);
}