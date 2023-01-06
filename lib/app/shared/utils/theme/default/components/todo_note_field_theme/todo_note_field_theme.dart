import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/app/shared/utils/theme/i_theme.dart';

mixin TodoNoteFieldThemeMixin implements ITodoTheme {

  @override
  TextStyle get inputLabelTodoNoteField => GoogleFonts.inter(
    fontSize: 43,
    color: Modular.get<ITodoTheme>().primaryColorMain,
  );
}
