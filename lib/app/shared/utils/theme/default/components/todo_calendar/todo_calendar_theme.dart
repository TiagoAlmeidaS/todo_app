import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/app/shared/utils/theme/i_theme.dart';

mixin TodoCalendarThemeMixin implements ITodoTheme {

  @override
  TextStyle get dayLabel => GoogleFonts.inter(
    fontSize: 12,
    color: Modular.get<ITodoTheme>().shadesOfLight[500],
  );

  @override
  TextStyle get monthLabel => GoogleFonts.inter(
    fontSize: 12,
    color: Modular.get<ITodoTheme>().shadesOfLight[500],
  );

  @override
  TextStyle get numberDayLabel => GoogleFonts.inter(
    fontSize: 20,
    color: Modular.get<ITodoTheme>().shadesOfLight[500],
  );

  @override
  TextStyle get numberDaySelectLabel => GoogleFonts.inter(
    fontSize: 22,
    color: Modular.get<ITodoTheme>().shadesOfLight[500],
  );

  @override
  TextStyle get tempature => GoogleFonts.inter(
    fontSize: 45,
    color: Modular.get<ITodoTheme>().primaryColorMain,
  );

  @override
  TextStyle get grade => GoogleFonts.inter(
    fontSize: 15,
    color: Modular.get<ITodoTheme>().primaryColorMain,
  );

  @override
  TextStyle get month => GoogleFonts.inter(
    fontSize: 19,
    color: Modular.get<ITodoTheme>().primaryColorMain,
  );

  @override
  TextStyle get timerNow => GoogleFonts.inter(
    fontSize: 16,
    color: Modular.get<ITodoTheme>().shadesOfDark[200],
  );

  @override
  TextStyle get location => GoogleFonts.inter(
    fontSize: 14,
    color: Modular.get<ITodoTheme>().primaryColorMain,
  );

}
