import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_app/app/shared/utils/theme/i_theme.dart';

class TodoButton extends StatefulWidget {
  const TodoButton({
    Key? key,
    this.state,
    this.onTap,
    this.margin,
    this.padding,
    required this.label,
    this.fontSize = 18,
  }) : super(key: key);

  final TodoButtonState? state;
  final Function? onTap;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final String label;
  final double fontSize;

  @override
  State<TodoButton> createState() => _TodoButtonState();
}

class _TodoButtonState extends State<TodoButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.state != TodoButtonState.disabled) {
          widget.onTap?.call();
        }
      },
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        decoration: BoxDecoration(
            color: widget.state == TodoButtonState.disabled
                ? Modular.get<ITodoTheme>().shadesOfDark[100]
                : _colorFill(),
            borderRadius: const BorderRadius.all(
              Radius.circular(
                10,
              ),
            ),
            border: Border.all(
                color: widget.state == TodoButtonState.disabled
                    ? Colors.transparent
                    : _colorOutline(),
                width: 1)),
        margin: widget.margin ??
            const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 20,
            ),
        padding: widget.padding ??
            const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 20,
            ),
        child: isLoading()
            ? SizedBox(
                height: widget.fontSize + 3,
                width: widget.fontSize + 3,
                child: CircularProgressIndicator(
                  color: _colorOutline(),
                ),
              )
            : Text(
                widget.label,
                style: widget.state == TodoButtonState.disabled
                    ? Modular.get<ITodoTheme>()
                        .todoButtonTextOutline
                        .copyWith(color: Colors.white)
                    : isOutline()
                        ? Modular.get<ITodoTheme>()
                            .todoButtonTextOutline
                            .copyWith(fontSize: widget.fontSize)
                        : Modular.get<ITodoTheme>().todoButtonTextFilled,
              ),
      ),
    );
  }

  Color _colorFill() {
    switch (widget.state) {
      case TodoButtonState.loadingOutlined:
        return Modular.get<ITodoTheme>().primaryColorMain.withOpacity(0);
      case TodoButtonState.loadingFilledDark:
        return Modular.get<ITodoTheme>().shadesOfDark[500]!;
      case TodoButtonState.standardFilledDark:
        return Modular.get<ITodoTheme>().shadesOfDark[500]!;
      case TodoButtonState.loadingFilledSucess:
        return Modular.get<ITodoTheme>().colorScheme.success;
      case TodoButtonState.standardOutlined:
        return Modular.get<ITodoTheme>().primaryColorMain.withOpacity(0);
      case TodoButtonState.fillSucess:
        return Modular.get<ITodoTheme>().colorScheme.success;
      default:
        return Modular.get<ITodoTheme>().shadesOfDark[500]!;
    }
  }

  Color _colorOutline() {
    switch (widget.state) {
      case TodoButtonState.loadingOutlined:
        return Modular.get<ITodoTheme>().shadesOfDark[500]!;
      case TodoButtonState.loadingFilledDark:
        return Modular.get<ITodoTheme>().shadesOfLight[100]!;
      case TodoButtonState.loadingFilledSucess:
        return Modular.get<ITodoTheme>().colorScheme.success;
      case TodoButtonState.standardFilledDark:
        return Modular.get<ITodoTheme>().shadesOfLight[100]!;
      case TodoButtonState.standardOutlined:
        return Modular.get<ITodoTheme>().shadesOfDark[500]!;
      case TodoButtonState.fillSucess:
        return Modular.get<ITodoTheme>().colorScheme.success;
      default:
        return Modular.get<ITodoTheme>().shadesOfDark[500]!;
    }
  }

  bool isLoading() {
    switch (widget.state) {
      case TodoButtonState.loadingOutlined:
        return true;
      case TodoButtonState.loadingFilledDark:
        return true;
      case TodoButtonState.loadingFilledSucess:
        return true;
      case TodoButtonState.standardFilledDark:
      case TodoButtonState.standardOutlined:
      default:
        return false;
    }
  }

  bool isOutline() {
    switch (widget.state) {
      case TodoButtonState.loadingOutlined:
        return true;
      case TodoButtonState.loadingFilledDark:
      case TodoButtonState.standardOutlined:
        return true;
      case TodoButtonState.standardFilledDark:
      default:
        return false;
    }
  }
}

enum TodoButtonState {
  standardOutlined,
  loadingOutlined,
  standardFilledDark,
  loadingFilledDark,
  fillSucess,
  loadingFilledSucess,
  disabled
}
