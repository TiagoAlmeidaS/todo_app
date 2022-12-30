import 'package:flutter/material.dart';
import 'package:todo_app/app/shared/utils/theme/colors/i_colors_theme.dart';
import 'package:todo_app/app/shared/utils/theme/default/components/todo_button_theme/i_todo_button_theme.dart';

import 'default/components/todo_text_form_field/i_todo_text_form_field_theme.dart';
import 'default/pages/profile/signin/I_signin_theme.dart';

abstract class ITodoTheme implements IColorsTheme, ITodoButtonTheme, ITodoTextFormFieldTheme, ISigninTheme {
  ThemeData get theme;
}
