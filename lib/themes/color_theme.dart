import 'package:flutter/material.dart';

class ColorTheme {
  static ColorTheme colorTheme = new ColorTheme();
  final Color primaryColor;
  final Color primaryLightColor;
  final Color primaryTextColor;
  final Color greyColor;

  ColorTheme(
      {this.primaryColor = const Color(0xFFE04B0B),
      this.primaryLightColor = const Color(0xFFF88C5E),
      this.primaryTextColor = const Color(0xFF000000),
      this.greyColor = const Color(0xFF5F5959)});
}