import 'package:todo_app/app/shared/utils/theme/color_custom_scheme.dart';

import '../colors/i_colors_theme.dart';
import 'package:flutter/material.dart';

class TodoColors with ColorsThemeMixin {}

var colors = TodoColors();
mixin ColorsThemeMixin implements IColorsTheme {
  Color _primaryColor = Color(0xff2a2952);

  @override
  Color get primaryColorMain => _primaryColor;

  @override
  Color get primaryOutlineColor => _primaryColor;

  @override
  Color get primaryColorLighter => Color(0xFF02C2EF);

  @override
  Color get primaryColorLight => Color(0xFFE1EEF8);

  @override
  Color get primaryColorDarker => Color(0xFF0047A5);

  Color _secondaryColor = Color(0xFFA66DD4);

  @override
  Color get secondaryColor => _secondaryColor;

  Color _suffixTextFieldIconColor = Color(0xFF6C6C6F);

  @override
  Color get suffixTextFieldIconColor => _suffixTextFieldIconColor;

  @override
  CustomColorScheme get colorScheme => CustomColorScheme(
      primary: _primaryColor,
      secondary: _secondaryColor,
      success: Color(0xFF23C653),
      warning: Color(0xFFEFB52D),
      danger: Color(0xFFFF4539));

  @override
  Color get backgroundColor => Color(0xFFF7F7F7);

  @override
  ColorSwatch<int> get gray => ColorSwatch<int>(50, {
        50: Color(0xFFD6D6D6),
        100: Color(0xFFF2F2F5),
        200: Color(0xFF8E90A6),
        300: Color(0xFF555770),
        400: Color(0xFFEBEBF0),
        800: Color(0xFF555555),
      });

  @override
  ColorSwatch<int> get shadesOfLight => ColorSwatch<int>(100, {
        100: Color(0xFFFFFFFF),
        200: Color(0xFFFAFAFC),
        300: Color(0xFFF2F2F5),
        400: Color(0xFFEBEBF0),
        500: Color(0xFFE3E4EB),
      });

  @override
  ColorSwatch<int> get shadesOfDark => ColorSwatch<int>(100, {
        100: Color(0xFFC7C8D9),
        200: Color(0xFF8E90A6),
        300: Color(0xFF555770),
        400: Color(0xFF28293D),
        500: Color(0xFF000000),
      });

  ColorSwatch<int> get shadesOfGray => ColorSwatch<int>(600, {
        100: shadesOfLight[100]!,
        200: shadesOfLight[200]!,
        300: shadesOfLight[300]!,
        400: shadesOfLight[400]!,
        500: shadesOfLight[500]!,
        600: shadesOfDark[100]!,
        700: shadesOfDark[200]!,
        800: shadesOfDark[300]!,
        900: shadesOfDark[400]!,
        1000: shadesOfDark[500]!,
      });
}
