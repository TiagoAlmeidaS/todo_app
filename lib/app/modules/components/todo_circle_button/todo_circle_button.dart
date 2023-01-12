import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_app/app/shared/utils/theme/i_theme.dart';

class TodoCircleButton extends StatefulWidget {
  const TodoCircleButton({
    Key? key,
    this.state,
    this.onTap,
    this.margin,
    this.padding,
    required this.icon,
    this.size = 18,
  }) : super(key: key);

  final TodoCircleButtonState? state;
  final Function? onTap;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final IconData icon;
  final double? size;

  @override
  State<TodoCircleButton> createState() => _TodoCircleButtonState();
}

class _TodoCircleButtonState extends State<TodoCircleButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap?.call();
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _colorFill(),
        ),
        margin: widget.margin ??
            const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 20,
            ),
        padding: widget.padding ??
            const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 8,
            ),
        child: Icon(
          widget.icon,
          size: widget.size,
        ),
      ),
    );
  }

  Color _colorFill() {
    switch (widget.state) {
      case TodoCircleButtonState.standard:
        return Modular.get<ITodoTheme>().primaryColorLight.withOpacity(0);
      case TodoCircleButtonState.disabled:
        return Modular.get<ITodoTheme>().primaryColorLight.withOpacity(0);
      case TodoCircleButtonState.disabledFilled:
      case TodoCircleButtonState.standardFilled:
      default:
        return Modular.get<ITodoTheme>().primaryColorLight;
    }
  }

  bool isFilled() {
    switch (widget.state) {
      case TodoCircleButtonState.standardFilled:
        return true;
      case TodoCircleButtonState.standard:
      case TodoCircleButtonState.disabledFilled:
        return true;
      case TodoCircleButtonState.disabled:
      default:
        return false;
    }
  }
}

enum TodoCircleButtonState {
  standardFilled,
  disabledFilled,
  standard,
  disabled
}
