import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_app/app/modules/components/todo_shimmer/todo_shimmer.dart';
import 'package:todo_app/app/shared/utils/theme/i_theme.dart';

class TodoCardsResume extends StatefulWidget {
  const TodoCardsResume({
    Key? key,
    this.padding,
    this.valueBackLog,
    this.valueInProgress,
    this.valueDelayed,
    this.valueCompleted,
    this.status = TodoCardsResumeStatus.standard,
  }) : super(key: key);

  final EdgeInsets? padding;
  final String? valueBackLog;
  final String? valueInProgress;
  final String? valueDelayed;
  final String? valueCompleted;
  final TodoCardsResumeStatus? status;

  @override
  State<TodoCardsResume> createState() => _TodoCardsResumeState();
}

class _TodoCardsResumeState extends State<TodoCardsResume> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.padding ??
          const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      child: SingleChildScrollView(
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            cardResume(true, Modular.get<ITodoTheme>().colorsStatusTasks[1]!,
                "Backlog", widget.valueBackLog ?? "0"),
            const SizedBox(
              width: 10,
            ),
            cardResume(true, Modular.get<ITodoTheme>().colorsStatusTasks[2]!,
                "In Progress", widget.valueInProgress ?? "0"),
            const SizedBox(
              width: 10,
            ),
            cardResume(true, Modular.get<ITodoTheme>().colorsStatusTasks[4]!,
                "Completed", widget.valueCompleted ?? "0"),
          ],
        ),
      ),
    );
  }

  Widget cardResume(
      bool isMin, Color colorCard, String labelCard, String valueCard) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            stops: const [0.05, 0.05], colors: [colorCard, Colors.white]),
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
        boxShadow: [
          BoxShadow(
            color:
                Modular.get<ITodoTheme>().shadesOfDark[500]!.withOpacity(0.16),
            offset: const Offset(0, 2),
            blurRadius: 2,
          ),
        ],
      ),
      padding: const EdgeInsets.all(10),
      child: Container(
          width: isMin ? 100 : 150,
          color: Colors.white,
          child: widget.status == TodoCardsResumeStatus.loading
              ? const TodoShimmer()
              : Column(
                  crossAxisAlignment: isMin
                      ? CrossAxisAlignment.center
                      : CrossAxisAlignment.end,
                  children: isMin
                      ? [
                          Text(
                            labelCard,
                            style: Modular.get<ITodoTheme>()
                                .labelCardsResume
                                .copyWith(fontSize: 14, color: colorCard),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            valueCard,
                            style: Modular.get<ITodoTheme>()
                                .numberTaskCardResume
                                .copyWith(fontSize: 24),
                          ),
                        ]
                      : [
                          Text(
                            labelCard,
                            style: Modular.get<ITodoTheme>()
                                .labelCardsResume
                                .copyWith(fontSize: 24, color: colorCard),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            valueCard,
                            style: Modular.get<ITodoTheme>()
                                .numberTaskCardResume
                                .copyWith(fontSize: 14),
                          ),
                        ],
                )),
    );
  }
}

enum TodoCardsResumeStatus { standard, loading }
