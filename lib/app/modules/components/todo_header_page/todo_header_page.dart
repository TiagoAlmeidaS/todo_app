import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../shared/utils/theme/i_theme.dart';
import '../todo_circle_button/todo_circle_button.dart';

class TodoHeaderPage extends StatelessWidget {
  const TodoHeaderPage({
    Key? key,
    required this.label,
    required this.icon,
    this.status = TodoHeaderPageStatus.standard,
    this.actionIcon,
    this.padding,
  }) : super(key: key);

  final String label;
  final IconData icon;
  final TodoHeaderPageStatus status;
  final Function()? actionIcon;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ??
          const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 20,
          ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: Modular.get<ITodoTheme>().headerLabel,
          ),
          TodoCircleButton(
            icon: icon,
            margin: EdgeInsets.zero,
            onTap:
                status == TodoHeaderPageStatus.disabled ? () => {} : actionIcon,
            state: status == TodoHeaderPageStatus.disabled
                ? TodoCircleButtonState.disabled
                : TodoCircleButtonState.standardFilled,
          )
        ],
      ),
    );
  }
}

enum TodoHeaderPageStatus { standard, disabled }
