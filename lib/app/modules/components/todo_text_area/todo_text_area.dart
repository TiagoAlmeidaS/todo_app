import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_app/app/shared/utils/theme/i_theme.dart';

class TodoTextArea extends StatefulWidget {
  const TodoTextArea({
    Key? key,
    this.padding,
    this.hintText,
    this.maxLength,
    this.maxLines,
    this.controller,
    this.enable,
  }) : super(key: key);

  final EdgeInsets? padding;
  final String? hintText;
  final int? maxLength;
  final int? maxLines;
  final TextEditingController? controller;
  final bool? enable;

  @override
  State<TodoTextArea> createState() => _TodoTextAreaState();
}

class _TodoTextAreaState extends State<TodoTextArea> {
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    if (widget.controller != null) {
      _controller = widget.controller!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.padding ??
          const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 20,
          ),
      child: TextFormField(
        controller: _controller,
        enabled: widget.enable ?? true,
        keyboardType: TextInputType.multiline,
        maxLines: widget.maxLines,
        maxLength: widget.maxLength,
        style: Modular.get<ITodoTheme>().textFieldInputStyle,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: widget.hintText,
          hintStyle: Modular.get<ITodoTheme>().hintTodoTextArea,
          filled: true,
            fillColor: (widget.enable ?? false)
                ? Modular.get<ITodoTheme>().primaryColorLight
                : Modular.get<ITodoTheme>().shadesOfLight[400]!,

        ),
      ),
    );
  }
}
