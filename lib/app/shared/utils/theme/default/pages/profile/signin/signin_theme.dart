import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/app/shared/utils/theme/colors/colors_theme.dart';
import 'package:todo_app/app/shared/utils/theme/i_theme.dart';

mixin SigninThemeMixin implements ITodoTheme {

  @override
  TextStyle get labelLink => GoogleFonts.inter(
    fontSize: 18,
    color: colors.primaryColorLighter,
    decoration: TextDecoration.underline
  );

  @override
  TextStyle get labelSignin => GoogleFonts.inter(
      fontSize: 18,
      color: colors.shadesOfDark[500],
  );

}