import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:todo_app/app/modules/components/todo_shimmer/todo_shimmer.dart';
import 'package:todo_app/app/shared/utils/theme/i_theme.dart';

class TodoCardTask extends StatefulWidget {
  const TodoCardTask({
    Key? key,
    this.title,
    this.margin,
    this.padding,
    this.onTapCard,
    this.onTapDelete,
    this.state = TodoCardTaskState.standard,
    this.date,
    this.statusTask,
  }) : super(key: key);

  final String? title;
  final EdgeInsets? margin;
  final EdgeInsets? padding;

  final Function()? onTapCard;
  final Function()? onTapDelete;
  final TodoCardTaskState state;
  final String? date;
  final bool? statusTask;

  @override
  State<TodoCardTask> createState() => _TodoCardTaskState();
}

class _TodoCardTaskState extends State<TodoCardTask> {
  bool isToDelete = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.margin ??
          const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      child: GestureDetector(
        onLongPress: () => changeIsToDelete(isToDelete),
        child: widget.state == TodoCardTaskState.standard
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: widget.state == TodoCardTaskState.standard
                          ? widget.onTapCard
                          : null,
                      child: Container(
                        padding: widget.padding ??
                            const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                        decoration: BoxDecoration(
                          color: Modular.get<ITodoTheme>().shadesOfLight[100],
                          boxShadow: [
                            BoxShadow(
                              color: Modular.get<ITodoTheme>()
                                  .shadesOfDark[500]!
                                  .withOpacity(0.16),
                              offset: const Offset(0, 2),
                              blurRadius: 2,
                            ),
                          ],
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
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(
                                      color: Modular.get<ITodoTheme>()
                                          .pinkColorDarker,
                                      width: 1)),
                              padding: const EdgeInsets.all(4),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2),
                                  color: widget.statusTask ?? false
                                      ? Modular.get<ITodoTheme>()
                                          .pinkColorDarker
                                      : Modular.get<ITodoTheme>()
                                          .pinkColorDarker
                                          .withOpacity(0),
                                ),
                                height: 10,
                                width: 10,
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Text(
                                "${widget.title}",
                                maxLines: 1,
                                style: Modular.get<ITodoTheme>().titleCardNote,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "${widget.date}",
                              textAlign: TextAlign.right,
                              style: Modular.get<ITodoTheme>()
                                  .titleCardNote
                                  .copyWith(fontSize: 16),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                      onTap: widget.onTapDelete,
                      child: AnimatedContainer(
                        width: isToDelete ? 50 : 0,
                        alignment: Alignment.center,
                        padding: widget.padding ??
                            const EdgeInsets.symmetric(vertical: 12),
                        duration: const Duration(milliseconds: 500),
                        decoration: BoxDecoration(
                          color:
                              Modular.get<ITodoTheme>().colorScheme.dangerPink,
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(12),
                            bottomRight: Radius.circular(12),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Modular.get<ITodoTheme>()
                                  .shadesOfDark[500]!
                                  .withOpacity(0.16),
                              offset: const Offset(0, 2),
                              blurRadius: 2,
                            ),
                          ],
                        ),
                        child: Icon(
                          LineAwesomeIcons.trash,
                          size: 22,
                          color: isToDelete
                              ? Modular.get<ITodoTheme>().primaryColorLight
                              : Colors.transparent,
                        ),
                      )),
                ],
              )
            : contentLoading(),
      ),
    );
  }

  Widget contentLoading() {
    return TodoShimmer(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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

enum TodoCardTaskState { standard, loading }
