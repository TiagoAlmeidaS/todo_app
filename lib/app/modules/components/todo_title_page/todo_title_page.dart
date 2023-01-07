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
    this.icon,
    this.actionIcon,
  });

  final String? firstLabel;
  final String? secondLabel;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final IconData? icon;
  final Function()? actionIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin:
          margin ?? const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        children: [
          RichText(
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
          const Spacer(),
          if(actionIcon != null)
          GestureDetector(
            onTap: actionIcon,
            child: Icon(
              icon,
              size: 20,
              color: Modular.get<ITodoTheme>().primaryColorMain,
            ),
          )
        ],
      ),
    );
  }
}
