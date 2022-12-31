import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/app/shared/utils/theme/colors/colors_theme.dart';
import 'package:todo_app/app/shared/utils/theme/default/pages/notes_feed/my_notes/i_my_notes_theme.dart';

mixin MyNotesThemeMixin implements IMyNotesTheme {
  @override
  TextStyle get headerLabel => GoogleFonts.inter(
        color: colors.primaryColorMain,
        fontSize: 25,
        fontWeight: FontWeight.w400,
      );
}
