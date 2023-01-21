import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/app/shared/utils/theme/colors/colors_theme.dart';
import 'package:todo_app/app/shared/utils/theme/i_theme.dart';

mixin TodoTextFormFieldMixin implements ITodoTheme {

  @override
  TextStyle get labelTodoTextFormField => GoogleFonts.inter(
    fontSize: 18,
    color: colors.shadesOfDark[500],
    fontWeight: FontWeight.w600
  );

  @override
  TextStyle get hintTodoTextFormField => GoogleFonts.inter(
    fontSize: 16,
    color: colors.primaryColorMain.withOpacity(0.5),
  );

  @override
  TextStyle get helperTodoTextFormField => GoogleFonts.inter(
    fontSize: 18,
    color: colors.shadesOfDark[500],
  );

  @override
  TextStyle get textFieldInputStyle => GoogleFonts.inter(
    fontSize: 16,
    color: colors.shadesOfDark[500],
  );

  @override
  TextStyle get messageTextFieldStyle => GoogleFonts.inter(
    color: shadesOfDark[200],
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    fontSize: 14,
  );
}
