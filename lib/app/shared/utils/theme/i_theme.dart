import 'package:flutter/material.dart';
import 'package:todo_app/app/shared/utils/theme/colors/i_colors_theme.dart';
import 'package:todo_app/app/shared/utils/theme/default/components/todo_button_theme/i_todo_button_theme.dart';
import 'package:todo_app/app/shared/utils/theme/default/components/todo_title_page_theme/i_todo_title_page_theme.dart';
import 'package:todo_app/app/shared/utils/theme/default/pages/notes_feed/my_notes/i_my_notes_theme.dart';

import 'default/components/todo_card_note_theme/i_todo_card_note_theme.dart';
import 'default/components/todo_note_field_theme/i_todo_note_field_theme.dart';
import 'default/components/todo_text_area/i_todo_text_area_theme.dart';
import 'default/components/todo_text_form_field_theme/i_todo_text_form_field_theme.dart';
import 'default/pages/profile/signin/I_signin_theme.dart';

abstract class ITodoTheme
    implements
        IColorsTheme,
        ITodoButtonTheme,
        ITodoTextFormFieldTheme,
        ISigninTheme,
        IMyNotesTheme,
        ITodoTitlePageTheme,
        ITodoCardNoteTheme,
        ITodoNoteFieldTheme,
        ITodoTextAreaTheme {
  ThemeData get theme;
  TextStyle get flushbarMessageStyle;
}
