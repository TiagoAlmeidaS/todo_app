import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/app/shared/utils/theme/colors/colors_theme.dart';
import 'package:todo_app/app/shared/utils/theme/default/components/todo_button_theme/todo_button_theme.dart';
import 'package:todo_app/app/shared/utils/theme/i_theme.dart';

class DefaultTheme
    with ColorsThemeMixin, TodoButtonMixin
    implements ITodoTheme {
  @override
  ThemeData get theme => ThemeData(
        primaryColor: primaryColorMain,
        textTheme: GoogleFonts.openSansTextTheme(),
        appBarTheme: AppBarTheme(
          color: primaryColorMain,
          centerTitle: true,
          elevation: 0,
          iconTheme: IconThemeData(
            size: 20,
            color: shadesOfLight[100],
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: colors.shadesOfLight[100]!,
          unselectedLabelStyle: _bottomNavigationBarTextStyle,
          selectedLabelStyle: _bottomNavigationBarTextStyle.copyWith(
            color: colors.primaryColorMain,
          ),
          selectedItemColor: colors.primaryColorMain,
          unselectedItemColor: colors.shadesOfDark[200]!,
          selectedIconTheme:
              IconThemeData(color: colors.primaryColorMain, size: 28),
          unselectedIconTheme:
              IconThemeData(color: colors.shadesOfDark[200]!, size: 28),
        ),
      );

  TextStyle get _bottomNavigationBarTextStyle => GoogleFonts.openSans(
        color: colors.shadesOfDark[200]!,
        fontSize: 10,
        fontWeight: FontWeight.w600,
      );

  TextStyle get appBarFeatureSearch => GoogleFonts.montserrat(
        color: shadesOfDark[200],
        fontSize: 16,
        fontWeight: FontWeight.w400,
      );

  Color get ribbonBemolRed => Color(0xFFFF4539);
  Color get ribbonBemolBlue => Color(0xFF0286D1);
  Color get ribbonBemolWhite => Color(0xFFFFFFFF);

  TextStyle get appBarTitle => GoogleFonts.openSans(
        color: shadesOfLight[100],
        fontSize: 16,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.24,
      );
}
