import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/app/shared/utils/theme/colors/colors_theme.dart';
import 'package:todo_app/app/shared/utils/theme/default/pages/profile/I_profile_theme.dart';

mixin ProfileThemeMixin implements IProfileTheme {

  @override
  TextStyle get headerProfile => GoogleFonts.inter(
    fontSize: 24,
    color: colors.primaryColorMain,
    fontWeight: FontWeight.w600
  );

  @override
  TextStyle get descriptionProfile => GoogleFonts.inter(
      fontSize: 20,
      color: colors.primaryColorMain,
  );

  @override
  TextStyle get helperProfile => GoogleFonts.inter(
    fontSize: 12,
    color: colors.primaryColorMain,
  );

}