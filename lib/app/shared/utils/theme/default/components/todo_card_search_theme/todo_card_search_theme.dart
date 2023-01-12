import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../colors/colors_theme.dart';
import 'i_todo_card_search_theme.dart';

mixin TodoCardSearchThemeMixin implements ITodoCardSearchTheme {

  @override
  TextStyle get dateCreationCardSearch => GoogleFonts.inter(
    fontSize: 22,
    color: colors.shadesOfLight[100],
  );

  @override
  TextStyle get titleCardSearch => GoogleFonts.inter(
    fontSize: 22,
    color: colors.primaryColorMain,
  );

  @override
  TextStyle get descriptionCardSearch => GoogleFonts.inter(
    fontSize: 18,
    color: colors.shadesOfDark[200],
  );

}