import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/app/shared/utils/theme/colors/colors_theme.dart';
import 'package:todo_app/app/shared/utils/theme/default/components/todo_button_theme/todo_button_theme.dart';
import 'package:todo_app/app/shared/utils/theme/default/components/todo_title_page_theme/todo_title_page_theme.dart';
import 'package:todo_app/app/shared/utils/theme/default/pages/notes_feed/my_notes/my_notes_theme.dart';
import 'package:todo_app/app/shared/utils/theme/default/pages/profile/signin/signin_theme.dart';
import 'package:todo_app/app/shared/utils/theme/i_theme.dart';

import 'components/todo_calendar/todo_calendar_theme.dart';
import 'components/todo_card_note_theme/todo_card_note_theme.dart';
import 'components/todo_cards_resume_theme/todo_cards_resume_theme.dart';
import 'components/todo_note_field_theme/todo_note_field_theme.dart';
import 'components/todo_text_area/todo_text_area_theme.dart';
import 'components/todo_text_form_field_theme/todo_text_form_field_theme.dart';

class DefaultTheme
    with
        ColorsThemeMixin,
        TodoButtonMixin,
        TodoTextFormFieldMixin,
        SigninThemeMixin,
        TodoTitlePageThemeMixin,
        MyNotesThemeMixin,
        TodoCardNoteThemeMixin,
        TodoNoteFieldThemeMixin,
        TodoTextAreaThemeMixin,
        TodoCalendarThemeMixin,
        TodoCardsResumeMixin
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

  Color get ribbonBemolRed => const Color(0xFFFF4539);
  Color get ribbonBemolBlue => const Color(0xFF0286D1);
  Color get ribbonBemolWhite => const Color(0xFFFFFFFF);

  TextStyle get appBarTitle => GoogleFonts.openSans(
        color: shadesOfLight[100],
        fontSize: 16,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.24,
      );

  @override
  TextStyle get flushbarMessageStyle => GoogleFonts.openSans(
    fontSize: 14,
    fontStyle: FontStyle.normal,
    color: colors.shadesOfLight[100],
    fontWeight: FontWeight.w600,
  );
}
