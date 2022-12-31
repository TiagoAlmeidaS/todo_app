import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/app/shared/utils/theme/colors/colors_theme.dart';
import 'package:todo_app/app/shared/utils/theme/default/components/todo_title_page_theme/i_todo_title_page_theme.dart';
import 'package:flutter/material.dart';

mixin TodoTitlePageThemeMixin implements ITodoTitlePageTheme {
  @override
  TextStyle get firstLabelTitle => GoogleFonts.inter(
        color: colors.primaryColorMain,
        fontSize: 43,
        fontWeight: FontWeight.w500,
      );

  @override
  TextStyle get secondLabelTitle => GoogleFonts.inter(
        color: colors.primaryColorMain,
        fontSize: 43,
        fontWeight: FontWeight.w800,
      );
}
