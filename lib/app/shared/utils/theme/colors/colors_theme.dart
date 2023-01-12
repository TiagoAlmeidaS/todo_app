import 'package:todo_app/app/shared/utils/theme/color_custom_scheme.dart';

import '../colors/i_colors_theme.dart';
import 'package:flutter/material.dart';

class TodoColors with ColorsThemeMixin {}

var colors = TodoColors();
mixin ColorsThemeMixin implements IColorsTheme {
  final Color _primaryColor = const Color(0xff2a2952);

  @override
  Color get primaryColorMain => _primaryColor;

  @override
  Color get primaryOutlineColor => _primaryColor;

  @override
  Color get primaryColorLighter => const Color(0xff6b86f3);

  @override
  Color get secondaryColorLighter => const Color(0xff76eef3);

  @override
  Color get primaryColorLight => const Color(0xfff7f5f4);

  @override
  Color get primaryColorDarker => const Color(0xFF0047A5);

  final Color _secondaryColor = const Color(0xfff36b80);

  @override
  Color get secondaryColor => _secondaryColor;

  @override
  Color get pinkColorDarker => const Color(0xfff36b80);

  final Color _suffixTextFieldIconColor = const Color(0xFF6C6C6F);

  @override
  Color get suffixTextFieldIconColor => _suffixTextFieldIconColor;

  @override
  CustomColorScheme get colorScheme => CustomColorScheme(
      primary: _primaryColor,
      secondary: _secondaryColor,
      success: const Color(0xFF23C653),
      warning: const Color(0xFFEFB52D),
      danger: const Color(0xFFFF4539),
      dangerPink: const Color(0xfff36b80)
  );
  

  @override
  Color get backgroundColor => const Color(0xFFF7F7F7);

  @override
  Color get textFieldBackgroundColor => const Color(0xfff7f5f4);

  @override
  ColorSwatch<int> get gray => const ColorSwatch<int>(50, {
        50: Color(0xFFD6D6D6),
        100: Color(0xFFF2F2F5),
        200: Color(0xFF8E90A6),
        300: Color(0xFF555770),
        400: Color(0xFFEBEBF0),
        800: Color(0xFF555555),
      });

  @override
  ColorSwatch<int> get shadesOfLight => const ColorSwatch<int>(100, {
        100: Color(0xFFFFFFFF),
        200: Color(0xFFFAFAFC),
        300: Color(0xFFF2F2F5),
        400: Color(0xFFEBEBF0),
        500: Color(0xFFE3E4EB),
      });

  @override
  ColorSwatch<int> get shadesOfDark => const ColorSwatch<int>(100, {
        100: Color(0xFFC7C8D9),
        200: Color(0xFF8E90A6),
        300: Color(0xFF555770),
        400: Color(0xFF28293D),
        500: Color(0xFF000000),
      });

  @override
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

  ColorSwatch<int> get colorsStatusTasks => const ColorSwatch<int>(1, {
    1: Color(0xff232252),
    2: Color(0xffebaa37),
    3: Color(0xFFDC4703),
    4: Color(0xFFAFDBD4),
  });


}
