import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_app/app/shared/utils/theme/i_theme.dart';

class TodoCardNote extends StatefulWidget {
  const TodoCardNote({
    Key? key,
    required this.titleCard,
    required this.descriptionCard,
    this.margin,
    this.padding,
  }) : super(key: key);

  final String? titleCard;
  final String? descriptionCard;
  final EdgeInsets? margin;
  final EdgeInsets? padding;

  @override
  State<TodoCardNote> createState() => _TodoCardNoteState();
}

class _TodoCardNoteState extends State<TodoCardNote> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.padding ??
          const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      margin: widget.margin,
      decoration: BoxDecoration(
        color: Modular.get<ITodoTheme>().primaryColorLight,
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            child: Text(
              widget.titleCard![0].toUpperCase(),
              style: Modular.get<ITodoTheme>().headerCardNote,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${widget.titleCard}",
                style: Modular.get<ITodoTheme>().titleCardNote,
              ),
              Text(
                "${widget.descriptionCard}",
                style: Modular.get<ITodoTheme>().descriptionCardNote,
              ),
            ],
          )
        ],
      ),
    );
  }
}
