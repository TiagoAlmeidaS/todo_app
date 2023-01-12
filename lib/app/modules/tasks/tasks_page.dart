import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:mobx/mobx.dart';
import 'package:todo_app/app/modules/components/todo_calendary/todo_calendary.dart';
import 'package:todo_app/app/modules/components/todo_card_task/todo_card_task.dart';
import 'package:todo_app/app/modules/components/todo_cards_resume/todo_cards_resume.dart';
import 'package:todo_app/app/modules/components/todo_header_page/todo_header_page.dart';
import 'package:todo_app/app/modules/components/todo_shimmer/todo_shimmer.dart';
import 'package:todo_app/app/modules/components/todo_title_page/todo_title_page.dart';
import 'package:todo_app/app/modules/tasks/pages/task/models/tasks_model.dart';
import 'package:todo_app/app/modules/tasks/routers/tasks_routers.dart';
import 'package:todo_app/app/modules/tasks/tasks_controller.dart';
import 'package:todo_app/app/shared/utils/utils.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({Key? key}) : super(key: key);

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  var controller = Modular.get<TasksController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: RefreshIndicator(
        child: SingleChildScrollView(
          child: Observer(
            builder: (context) {
              if (controller.fetchTasksObservable?.status ==
                  FutureStatus.pending) {
                return contentLoading();
              }

              if (controller.fetchTasksObservable?.status ==
                      FutureStatus.rejected ||
                  (controller.fetchTasksObservable?.value?.isLeft() ??
                      false)) {}

              return Column(
                children: [
                  TodoTitlePage(
                    firstLabel: "Todo",
                    secondLabel: "Tasks",
                    icon: LineAwesomeIcons.search,
                    actionIcon: () {
                      Modular.to.pushNamed(
                        TasksRoutes.searchTask.fullRoute,
                      );
                    },
                  ),
                  TodoCalendary(
                    temperature: 24,
                    timerNow: controller.dateNowFormmated,
                    location: "Sapé - PB",
                    isMinBoard: true,
                  ),
                  const TodoHeaderPage(label: "Resume"),
                  TodoCardsResume(
                    valueBackLog: controller.tasksModel.resume?.backlog,
                    valueCompleted: controller.tasksModel.resume?.completed,
                    valueDelayed: controller.tasksModel.resume?.delayed,
                    valueInProgress: controller.tasksModel.resume?.inProgress,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const TodoHeaderPage(
                    label: "Tasks",
                    icon: LineAwesomeIcons.plus_circle,
                  ),
                  ...?controller.tasksModel.tasks?.map((e) {
                    var date = Utils.timestampToData(e.dateInit ?? 0);
                    var dateFormat = DateFormat('dd/MM/yy').format(date);
                    return TodoCardTask(
                        title: e.title,
                        date: dateFormat,
                        statusTask: e.statusTask == TaskStatus.COMPLETED);
                  }),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              );
            },
          ),
        ),
        onRefresh: () async {
          controller.getTasks();
        },
      ),
    ));
  }

  Widget contentLoading() {
    return SingleChildScrollView(
      child: Column(
        children: const [
          TodoShimmer(
            child: TodoCalendary(
              margin: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 20,
              ),
              temperature: 24,
              location: "Sapé - PB",
              isMinBoard: true,
            ),
          ),
          TodoShimmer(
            child: TodoHeaderPage(
              label: "Carregando...",
            ),
          ),
          TodoShimmer(
            child: TodoCardsResume(),
          ),
          TodoShimmer(
            child: TodoHeaderPage(
              label: "Carregando...",
            ),
          ),
          TodoShimmer(
            child: TodoCardTask(
              title: "Carregando...",
            ),
          ),
          TodoShimmer(
            child: TodoCardTask(
              title: "Carregando...",
            ),
          ),
          TodoShimmer(
            child: TodoCardTask(
              title: "Carregando...",
            ),
          ),
          TodoShimmer(
            child: TodoCardTask(
              title: "Carregando...",
            ),
          ),
        ],
      ),
    );
  }
}
