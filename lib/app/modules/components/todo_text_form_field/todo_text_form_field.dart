import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_app/app/modules/components/todo_text_form_field/todo_text_form_field_message.dart';

import '../../../shared/utils/theme/i_theme.dart';

class TodoTextFormField extends StatefulWidget {
  const TodoTextFormField({
    Key? key,
    this.label,
    this.maxLines,
    this.minLines,
    @Deprecated('The internal logic of use of this parameter has been removed, having no real effects on the widget, it is recommended to use the rulesOnEnter, rulesOnChange and rulesOnLeave parameters instead')
        this.controller,
    this.autoCorrect,
    this.enabled,
    this.maxLength,
    this.inputFormatters,
    this.keyboardType,
    this.obscureText = false,
    this.textCapitalization = TextCapitalization.words,
    this.initialValue,
    this.rulesOnChange,
    this.rulesOnLeave,
    this.focusNode,
    this.state = TodoTextFieldState.standard,
    this.prefixIcon,
    this.suffixIcon,
    this.hintText,
    this.helperFixInfoMessage,
    this.padding,
    this.expands = true,
  }) : super(key: key);

  final String? label;
  final int? maxLines;
  final int? minLines;
  final bool? autoCorrect;
  final bool? enabled;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final TextCapitalization? textCapitalization;
  final TextEditingController? controller;
  final String? initialValue;
  final TodoTextInputMessage? Function(String?)? rulesOnChange;
  final TodoTextInputMessage? Function(String?)? rulesOnLeave;
  final FocusNode? focusNode;
  final TodoTextFieldState state;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final String? hintText;
  final EdgeInsets? padding;
  final bool? expands;

  final TodoTextInputMessage? Function()? helperFixInfoMessage;

  @override
  State<TodoTextFormField> createState() => _TodoTextFormFieldState();
}

class _TodoTextFormFieldState extends State<TodoTextFormField>
    with TickerProviderStateMixin {
  TextEditingController _controller = TextEditingController();
  TodoTextInputMessage? _todoTextInputMessage = TodoTextInputMessage.none;

  bool _hideText = true;

  AnimationController? _aController;
  Animation<double>? _animation;

  @override
  void initState() {
    super.initState();
    _controller = (widget.controller ?? _controller);
    if (widget.initialValue != null) {
      _controller.text = widget.initialValue!;
    }
    _aController = AnimationController(
        duration: const Duration(milliseconds: 1000),
        vsync: this,
        value: 0,
        lowerBound: 0,
        upperBound: 1);
    _animation =
        CurvedAnimation(parent: _aController!, curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    _aController!.dispose();
    super.dispose();
  }

  void toogleAnimationError() {
    if (_todoTextInputMessage!.message != null &&
        _todoTextInputMessage!.todoTextInputMessageType ==
            TodoTextInputMessageType.ERROR) {
      _aController!.forward(from: 1);
    } else {
      _aController!.forward(from: 0);
    }
  }

  void _onChangeListener() {
    if (widget.rulesOnChange != null) {
      setState(() {
        _todoTextInputMessage = widget.rulesOnChange!.call(_controller.text)!;
      });
    }
    toogleAnimationError();
  }

  void _onLeaveListener() {
    if (_controller.text.isNotEmpty && widget.rulesOnLeave != null) {
      setState(() {
        _todoTextInputMessage = widget.rulesOnLeave!.call(_controller.text)!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.padding ??
          const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label ?? "",
            style: Modular.get<ITodoTheme>().labelTodoTextFormField,
          ),
          const SizedBox(
            height: 4,
          ),
          Container(height: 65,
          child: TextFormField(
            expands: widget.expands ?? true,
            minLines: widget.minLines,
            maxLines: widget.maxLines,
            autocorrect: widget.autoCorrect ?? false,
            enabled: widget.enabled,
            controller: _controller,
            maxLength: widget.maxLength,
            inputFormatters: widget.inputFormatters,
            keyboardType: widget.keyboardType,
            obscureText: (widget.obscureText ?? false) && _hideText,
            textCapitalization:
            widget.textCapitalization ?? TextCapitalization.none,
            cursorColor: Modular.get<ITodoTheme>().primaryColorMain,
            onChanged: (_) => _onChangeListener(),
            onFieldSubmitted: (_) => _onLeaveListener(),
            focusNode: widget.focusNode,
            style: Modular.get<ITodoTheme>().textFieldInputStyle,
            decoration: InputDecoration(
              filled: widget.state == TodoTextFieldState.filled ||
                  widget.state == TodoTextFieldState.standard,
              fillColor: (widget.enabled ?? false)
                  ? Modular.get<ITodoTheme>().textFieldBackgroundColor
                  : Modular.get<ITodoTheme>().shadesOfDark[100]!,
              counter: const Offstage(),
              isDense: true,
              prefixIcon: widget.prefixIcon != null
                  ? Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: 12.0),
                child: Icon(
                  widget.prefixIcon,
                  color: Modular.get<ITodoTheme>().primaryColorMain,
                ),
              )
                  : null,
              prefixIconConstraints: const BoxConstraints(minWidth: 18.0),
              suffixIcon: (widget.obscureText ?? false)
                  ? IconButton(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                padding: const EdgeInsets.only(
                  right: 14,
                ),
                constraints: const BoxConstraints(minWidth: 18.0),
                icon: Icon(
                  _hideText ? Icons.visibility_off : Icons.visibility,
                  color:
                  Modular.get<ITodoTheme>().suffixTextFieldIconColor,
                  semanticLabel: _hideText
                      ? 'Senha oculta. Mostrar senha.'
                      : 'Senha visível. Ocultar senha.',
                ),
                onPressed: () => setState(() {
                  _hideText = !_hideText;
                }),
              )
                  : _todoTextInputMessage?.todoTextInputMessageType !=
                  TodoTextInputMessageType.HELPER
                  ? IconButton(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                padding: const EdgeInsets.only(
                  right: 14,
                ),
                constraints: const BoxConstraints(minWidth: 18.0),
                icon: Icon(
                  _todoTextInputMessage?.todoTextInputMessageType ==
                      TodoTextInputMessageType.SUCCESS
                      ? Icons.check_circle_outline
                      : Icons.info_outline,
                  color: _todoTextInputMessage
                      ?.todoTextInputMessageType ==
                      TodoTextInputMessageType.SUCCESS
                      ? Modular.get<ITodoTheme>().colorScheme.success
                      : Modular.get<ITodoTheme>().colorScheme.danger,
                  semanticLabel: _todoTextInputMessage
                      ?.todoTextInputMessageType ==
                      TodoTextInputMessageType.SUCCESS
                      ? 'Texto válido.'
                      : 'Texto inválido.',
                ),
                onPressed: () => setState(() {
                  _hideText = !_hideText;
                }),
              )
                  : widget.suffixIcon,
              suffixIconConstraints: const BoxConstraints(minWidth: 38.0),
              border: borderBehavior(),
              enabledBorder: borderBehavior(),
              focusedBorder: borderBehavior(),
              hintText: widget.hintText,
              hintStyle: Modular.get<ITodoTheme>().hintTodoTextFormField,
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: _todoTextInputMessage?.todoTextInputMessageType ==
                      TodoTextInputMessageType.SUCCESS
                      ? Modular.get<ITodoTheme>().colorScheme.success
                      : _todoTextInputMessage?.todoTextInputMessageType ==
                      TodoTextInputMessageType.ERROR
                      ? Modular.get<ITodoTheme>().colorScheme.danger
                      : Colors.transparent,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: _todoTextInputMessage?.todoTextInputMessageType ==
                      TodoTextInputMessageType.SUCCESS
                      ? Modular.get<ITodoTheme>().colorScheme.success
                      : _todoTextInputMessage?.todoTextInputMessageType ==
                      TodoTextInputMessageType.ERROR
                      ? Modular.get<ITodoTheme>().colorScheme.danger
                      : Colors.transparent,
                ),
              ),
            ),
          ),),
          if (_todoTextInputMessage != null &&
              _todoTextInputMessage!.message != null &&
              _todoTextInputMessage!.message!.isNotEmpty) ...{
            FocusScope(
              child: FadeTransition(
                opacity: _animation!,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        "${_todoTextInputMessage?.message}",
                        style: Modular.get<ITodoTheme>()
                            .messageTextFieldStyle
                            .copyWith(
                              color: _todoTextInputMessage
                                          ?.todoTextInputMessageType ==
                                      TodoTextInputMessageType.SUCCESS
                                  ? Modular.get<ITodoTheme>()
                                      .colorScheme
                                      .success
                                  : _todoTextInputMessage
                                              ?.todoTextInputMessageType ==
                                          TodoTextInputMessageType.ERROR
                                      ? Modular.get<ITodoTheme>()
                                          .colorScheme
                                          .danger
                                      : null,
                            ),
                      ),
                    ),
                    if (widget.maxLength != null &&
                        widget.maxLength == _controller.text.length) ...{
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        '${_controller.text.length}/${widget.maxLength}',
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.right,
                        style: Modular.get<ITodoTheme>()
                            .messageTextFieldStyle
                            .copyWith(
                              color: _todoTextInputMessage
                                          ?.todoTextInputMessageType ==
                                      TodoTextInputMessageType.SUCCESS
                                  ? Modular.get<ITodoTheme>()
                                      .colorScheme
                                      .success
                                  : _todoTextInputMessage
                                              ?.todoTextInputMessageType ==
                                          TodoTextInputMessageType.ERROR
                                      ? Modular.get<ITodoTheme>()
                                          .colorScheme
                                          .danger
                                      : null,
                            ),
                      ),
                    }
                  ],
                ),
              ),
            ),
          },
          if (widget.helperFixInfoMessage != null &&
              widget.helperFixInfoMessage!.call()!.message != null) ...{
            if (_todoTextInputMessage != null &&
                _todoTextInputMessage?.message != null) ...{
              const SizedBox(height: 4),
            },
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    "${widget.helperFixInfoMessage!.call()!.message}",
                    maxLines: 6,
                    style: Modular.get<ITodoTheme>()
                        .messageTextFieldStyle
                        .copyWith(
                            color: (widget.maxLength != null &&
                                        _controller.text.length ==
                                            widget.maxLength) &&
                                    (_todoTextInputMessage != null &&
                                        _todoTextInputMessage!.message !=
                                            null &&
                                        _todoTextInputMessage!.message!.isEmpty)
                                ? Modular.get<ITodoTheme>().colorScheme.danger
                                : Modular.get<ITodoTheme>().shadesOfDark[200]),
                  ),
                ),
                if (widget.maxLength != null &&
                    _todoTextInputMessage != null &&
                    (_todoTextInputMessage!.message == null ||
                        _todoTextInputMessage!.message!.isEmpty)) ...{
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    '${_controller.text.length}/${widget.maxLength}',
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.right,
                    style: Modular.get<ITodoTheme>()
                        .messageTextFieldStyle
                        .copyWith(
                          color: _controller.text.length <
                                  (widget.maxLength ?? 0) * 0.9
                              ? Modular.get<ITodoTheme>().shadesOfDark[200]
                              : Modular.get<ITodoTheme>().colorScheme.danger,
                        ),
                  ),
                }
              ],
            )
          }
        ],
      ),
    );
  }

  InputBorder borderBehavior() {
    late Color color;

    switch (_todoTextInputMessage?.todoTextInputMessageType) {
      case TodoTextInputMessageType.SUCCESS:
        color = Modular.get<ITodoTheme>().colorScheme.success;
        break;
      case TodoTextInputMessageType.ERROR:
        color = Modular.get<ITodoTheme>().colorScheme.danger;
        break;
      default:
        color = Colors.transparent;
        if (widget.state == TodoTextFieldState.outlined) {
          color = Modular.get<ITodoTheme>().shadesOfDark[200]!;
        }
    }

    return OutlineInputBorder(
      borderSide: !(widget.enabled ?? true)
          ? BorderSide.none
          : BorderSide(
              color: color,
            ),
    );
  }
}

enum TodoTextFieldState { standard, filled, outlined }
