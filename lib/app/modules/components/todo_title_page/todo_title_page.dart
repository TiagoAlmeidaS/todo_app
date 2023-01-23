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
    this.status = TodoTitlePageStatus.standard,
    this.iconSize,
  });

  final String firstLabel;
  final String secondLabel;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final IconData? icon;
  final double? iconSize;
  final Function()? actionIcon;
  final TodoTitlePageStatus? status;

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
              text: firstLabel,
              style: Modular.get<ITodoTheme>().firstLabelTitle,
              children: [
                TextSpan(
                  text: firstLabel.isEmpty ? secondLabel : " $secondLabel",
                  style: Modular.get<ITodoTheme>().secondLabelTitle,
                ),
              ],
            ),
          ),
          const Spacer(),
          if (actionIcon != null && status != TodoTitlePageStatus.disabled) ...{
            GestureDetector(
              onTap: actionIcon,
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: colorBackGround()),
                child: Icon(
                  icon,
                  size: iconSize ?? 20,
                  color: colorIcon(),
                ),
              ),
            ),
          }
        ],
      ),
    );
  }

  Color? colorIcon() {
    switch (status) {
      case TodoTitlePageStatus.fillRounded:
        return Modular.get<ITodoTheme>().primaryColorMain;
      case TodoTitlePageStatus.fillRoundedDanger:
        return Modular.get<ITodoTheme>().shadesOfLight[100];
      default:
        return Modular.get<ITodoTheme>().primaryColorMain;
    }
  }

  Color? colorBackGround() {
    switch (status) {
      case TodoTitlePageStatus.fillRounded:
        return Modular.get<ITodoTheme>().textFieldBackgroundColor;
      case TodoTitlePageStatus.fillRoundedDanger:
        return Modular.get<ITodoTheme>().colorScheme.dangerPink;
      default:
        return Colors.transparent;
    }
  }
}

enum TodoTitlePageStatus { standard, fillRounded, fillRoundedDanger, disabled }
