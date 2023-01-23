import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/app/shared/utils/theme/i_theme.dart';

mixin TodoTextAreaThemeMixin implements ITodoTheme {

  @override
  TextStyle get inputLabelTodoTextArea => GoogleFonts.inter(
    fontSize: 18,
    color: Modular.get<ITodoTheme>().shadesOfDark[500],
  );

  @override
  TextStyle get hintTodoTextArea => GoogleFonts.inter(
    fontSize: 14,
    color: Modular.get<ITodoTheme>().shadesOfDark[300],
  );
  
}
