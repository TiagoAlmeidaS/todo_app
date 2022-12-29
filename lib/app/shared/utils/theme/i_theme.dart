import 'package:flutter/material.dart';
import 'package:todo_app/app/shared/utils/theme/colors/i_colors_theme.dart';
import 'package:todo_app/app/shared/utils/theme/default/components/todo_button_theme/i_todo_button_theme.dart';

abstract class ITodoTheme implements IColorsTheme, ITodoButtonTheme {
  ThemeData get theme;
}
