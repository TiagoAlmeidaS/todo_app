import 'package:flutter/material.dart';
import 'package:todo_app/app/shared/utils/theme/color_custom_scheme.dart';

abstract class IColorsTheme {
  Color get primaryColorMain;
  Color get primaryOutlineColor;
  Color get primaryColorLight;
  Color get primaryColorLighter;
  Color get primaryColorDarker;

  Color get secondaryColor;
  Color get secondaryColorLighter;

  Color get suffixTextFieldIconColor;

  CustomColorScheme get colorScheme;

  Color get backgroundColor;
  Color get textFieldBackgroundColor;

  ColorSwatch<int> get gray;
  ColorSwatch<int> get shadesOfDark;
  ColorSwatch<int> get shadesOfLight;
  ColorSwatch<int> get shadesOfGray;
}
