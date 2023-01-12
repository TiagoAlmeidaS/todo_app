import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/app/shared/utils/theme/colors/colors_theme.dart';
import 'package:todo_app/app/shared/utils/theme/i_theme.dart';

mixin TodoCardsResumeMixin implements ITodoTheme {

  @override
  TextStyle get labelCardsResume => GoogleFonts.inter(
        fontWeight: FontWeight.w700,
        fontSize: 18,
        color: colors.shadesOfDark[200],
      );

  @override
  TextStyle get numberTaskCardResume => GoogleFonts.inter(
        fontWeight: FontWeight.w700,
        fontSize: 10,
      );
}
