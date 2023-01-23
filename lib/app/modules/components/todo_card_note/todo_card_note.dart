import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:todo_app/app/modules/components/todo_shimmer/todo_shimmer.dart';
import 'package:todo_app/app/shared/utils/theme/i_theme.dart';

class TodoCardNote extends StatefulWidget {
  const TodoCardNote({
    Key? key,
    this.titleCard,
    this.descriptionCard,
    this.margin,
    this.padding,
    this.onTapCard,
    this.onTapDelete,
    this.state = TodoCardNoteState.standard,
  }) : super(key: key);

  final String? titleCard;
  final String? descriptionCard;
  final EdgeInsets? margin;
  final EdgeInsets? padding;

  final Function()? onTapCard;
  final Function()? onTapDelete;
  final TodoCardNoteState state;

  @override
  State<TodoCardNote> createState() => _TodoCardNoteState();
}

class _TodoCardNoteState extends State<TodoCardNote> {
  bool isToDelete = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:
          widget.state == TodoCardNoteState.standard ? widget.onTapCard : null,
      onLongPress: () => changeIsToDelete(isToDelete),
      child: widget.state == TodoCardNoteState.standard
          ? Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              margin: widget.margin ??
                  const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              padding: widget.padding ??
                  const EdgeInsets.symmetric(
                      vertical: 10, horizontal: 10),
              decoration: BoxDecoration(
                color: Modular.get<ITodoTheme>().primaryColorLight,
                borderRadius: isToDelete
                    ? const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                )
                    : const BorderRadius.all(
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
                        style:
                        Modular.get<ITodoTheme>().descriptionCardNote,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
              onTap: widget.onTapDelete,
              child: AnimatedContainer(
                width: isToDelete ? 50 : 0,
                alignment: Alignment.center,
                padding: widget.padding ??
                    const EdgeInsets.symmetric(vertical: 17),
                duration: const Duration(milliseconds: 500),
                decoration: BoxDecoration(
                  color: Modular.get<ITodoTheme>().colorScheme.dangerPink,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                ),
                child: Icon(
                  LineAwesomeIcons.trash,
                  size: 25,
                  color: isToDelete
                      ? Modular.get<ITodoTheme>().primaryColorLight
                      : Colors.transparent,
                ),
              )),
        ],
      )
          : contentLoading(),
    );
  }

  Widget contentLoading() {
    return TodoShimmer(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              margin:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              padding:
                  const EdgeInsets.symmetric(
                      vertical: 10, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    child: Text(
                      "loading",
                      style: Modular.get<ITodoTheme>().headerCardNote,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void changeIsToDelete(bool value) => setState(
        () {
          isToDelete = !value;
        },
      );
}

enum TodoCardNoteState { standard, loading }
