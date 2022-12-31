import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_app/app/shared/utils/theme/i_theme.dart';

class TodoTitlePage extends StatelessWidget {
  const TodoTitlePage({
    super.key,
    required this.firstLabel,
    required this.secondLabel,
    this.margin,
    this.padding,
  });

  final String? firstLabel;
  final String? secondLabel;
  final EdgeInsets? margin;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin:
          margin ?? const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: RichText(
        textAlign: TextAlign.left,
        text: TextSpan(
          text: "$firstLabel ",
          style: Modular.get<ITodoTheme>().firstLabelTitle,
          children: [
            TextSpan(
              text: secondLabel,
              style: Modular.get<ITodoTheme>().secondLabelTitle,
            ),
          ],
        ),
      ),
    );
  }
}
