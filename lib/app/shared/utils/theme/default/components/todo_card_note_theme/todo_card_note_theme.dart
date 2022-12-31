import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/app/shared/utils/theme/default/components/todo_card_note_theme/i_todo_card_note_theme.dart';

import '../../../colors/colors_theme.dart';

mixin TodoCardNoteThemeMixin implements ITodoCardNoteTheme {

  @override
  TextStyle get titleCardNote => GoogleFonts.inter(
    fontSize: 20,
    color: colors.primaryColorMain,
  );

  @override
  TextStyle get descriptionCardNote => GoogleFonts.inter(
    fontSize: 12,
    color: colors.primaryColorMain,
  );

  @override
  TextStyle get headerCardNote => GoogleFonts.inter(
    fontSize: 27,
    color: colors.shadesOfLight[500],
    fontWeight: FontWeight.w800
  );

}