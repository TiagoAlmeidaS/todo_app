import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_app/app/modules/components/todo_note_field/todo_note_field_message.dart';

import '../../../shared/utils/theme/i_theme.dart';

class TodoNoteField extends StatefulWidget {
  const TodoNoteField({
    Key? key,
    this.rulesOnChange,
    this.rulesOnLeave,
    this.focusNode,
    this.hintText,
    this.padding,
    this.controller,
  }) : super(key: key);

  final FocusNode? focusNode;
  final String? hintText;
  final EdgeInsets? padding;

  final TextEditingController? controller;

  final TodoNoteFieldMessage? Function(String?)? rulesOnChange;
  final TodoNoteFieldMessage? Function(String?)? rulesOnLeave;

  @override
  State<TodoNoteField> createState() => _TodoNoteFieldState();
}

class _TodoNoteFieldState extends State<TodoNoteField> {
  TextEditingController _controller = TextEditingController();
  TodoNoteFieldMessage? _todoNoteFieldMessage = TodoNoteFieldMessage.none;

  @override
  void initState() {
    if (widget.controller != null) {
      _controller = widget.controller!;
    }
    super.initState();
  }

  void _onChangeListener() {
    if (widget.rulesOnChange != null) {
      setState(() {
        _todoNoteFieldMessage = widget.rulesOnChange!.call(_controller.text)!;
      });
    }
  }

  void _onLeaveListener() {
    if (_controller.text.isNotEmpty && widget.rulesOnLeave != null) {
      setState(() {
        _todoNoteFieldMessage = widget.rulesOnLeave!.call(_controller.text)!;
      });
    }
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
        onChanged: (_) => _onChangeListener(),
        onFieldSubmitted: (_) => _onLeaveListener(),
        focusNode: widget.focusNode,
        style: Modular.get<ITodoTheme>().inputLabelTodoNoteField,
        decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Modular.get<ITodoTheme>().primaryColorMain,
            ),
          ),
          focusColor: Modular.get<ITodoTheme>().primaryColorMain,
          border: const UnderlineInputBorder(),
          hintText: widget.hintText,
        ),
      ),
    );
  }
}
