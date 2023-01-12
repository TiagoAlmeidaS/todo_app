import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/app/shared/utils/theme/colors/colors_theme.dart';
import 'package:todo_app/app/shared/utils/theme/default/components/todo_button_menu_profile_theme/i_todo_button_menu_profile_theme.dart';

mixin TodoButtonMenuProfileMixin implements ITodoButtonMenuProfileTheme {
  @override
  TextStyle get todoButtonMenuProfile => GoogleFonts.inter(
        fontSize: 18,
        color: colors.primaryColorMain,
      );

  @override
  TextStyle get hintTextMenuProfile => GoogleFonts.inter(
        fontSize: 14,
        color: colors.shadesOfDark[200],
      );

  @override
  TextStyle get labelTextMenuProfile => GoogleFonts.inter(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: colors.primaryColorMain,
  );
}
