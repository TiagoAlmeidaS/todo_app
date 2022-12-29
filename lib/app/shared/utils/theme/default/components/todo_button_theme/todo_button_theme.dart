import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/app/shared/utils/theme/colors/colors_theme.dart';
import 'package:todo_app/app/shared/utils/theme/i_theme.dart';

mixin TodoButtonMixin implements ITodoTheme {
  @override
  TextStyle get todoButtonTextOutline => GoogleFonts.inter(
        fontSize: 18,
        color: colors.shadesOfDark[500],
      );

  @override
  TextStyle get todoButtonTextFilled => GoogleFonts.inter(
        fontSize: 18,
        color: colors.shadesOfLight[100],
      );
}
