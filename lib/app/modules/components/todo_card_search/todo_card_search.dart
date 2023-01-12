import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_app/app/modules/components/todo_shimmer/todo_shimmer.dart';
import 'package:todo_app/app/shared/utils/theme/i_theme.dart';
import 'package:todo_app/app/shared/utils/utils.dart';

class TodoCardSearch extends StatefulWidget {
  const TodoCardSearch({
    Key? key,
    this.dayCreation,
    this.title,
    this.description,
    this.state = TodoCardSearchStatus.standard,
    this.margin,
  }) : super(key: key);

  final int? dayCreation;
  final String? title;
  final String? description;
  final TodoCardSearchStatus? state;
  final EdgeInsets? margin;

  @override
  State<TodoCardSearch> createState() => _TodoCardSearchState();
}

class _TodoCardSearchState extends State<TodoCardSearch> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin ??
          const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: widget.state == TodoCardSearchStatus.loading ? [] : [
          BoxShadow(
            color:
                Modular.get<ITodoTheme>().shadesOfDark[500]!.withOpacity(0.16),
            offset: const Offset(0, 2),
            blurRadius: 2,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: widget.state == TodoCardSearchStatus.loading
            ? contentLoading()
            : [
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Modular.get<ITodoTheme>().primaryColorLighter,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        Utils.dateFormmated(widget.dayCreation ?? 0),
                        maxLines: 1,
                        style: Modular.get<ITodoTheme>()
                            .dateCreationCardSearch
                            .copyWith(
                              fontSize: 14,
                            ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Container(
                        height: 1.5,
                        width: 59,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        Utils.hourFormmated(widget.dayCreation ?? 0),
                        maxLines: 1,
                        style: Modular.get<ITodoTheme>()
                            .dateCreationCardSearch
                            .copyWith(
                              fontSize: 22,
                            ),
                      ),
                    ],
                  ),
                ),
                Expanded(child: Container(
                  padding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title ?? "",
                        maxLines: 1,
                        style: Modular.get<ITodoTheme>().titleCardSearch,
                      ),
                      if (widget.description != null) ...{
                        const SizedBox(
                          height: 2,
                        ),
                        Text(
                          widget.description ?? "",
                          maxLines: 1,
                          style:
                          Modular.get<ITodoTheme>().descriptionCardSearch,
                        ),
                      }
                    ],
                  ),
                )),
              ],
      ),
    );
  }

  List<Widget> contentLoading() {
    return [
      Expanded(
        child: TodoShimmer(
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 5,
            ),
            decoration: BoxDecoration(
              color: Modular.get<ITodoTheme>().primaryColorLighter,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
            ),
            child: Column(
              children: [
                const Text(
                  "Carregando...",
                ),
                Text(
                  "Carregando...",
                  style: Modular.get<ITodoTheme>()
                      .dateCreationCardSearch
                      .copyWith(
                    fontSize: 22,
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    ];
  }
}

enum TodoCardSearchStatus { standard, loading }
