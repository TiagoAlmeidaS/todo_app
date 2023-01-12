import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:todo_app/app/modules/components/todo_card_search/todo_card_search.dart';
import 'package:todo_app/app/modules/components/todo_text_form_field/todo_text_form_field.dart';
import 'package:todo_app/app/modules/components/todo_title_page/todo_title_page.dart';
import 'package:todo_app/app/modules/tasks/pages/search_task/search_task_controller.dart';

class SearchTaskPage extends StatefulWidget {
  const SearchTaskPage({Key? key}) : super(key: key);

  @override
  State<SearchTaskPage> createState() => _SearchTaskPageState();
}

class _SearchTaskPageState extends State<SearchTaskPage> {
  var controller = Modular.get<SearchTaskController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: SingleChildScrollView(
        child: Observer(builder: (context) {
          return Column(
            children: [
              const TodoTitlePage(firstLabel: "Search", secondLabel: "Task"),
              const TodoTextFormField(
                enabled: true,
                prefixIcon: LineAwesomeIcons.search,
                withShadow: true,
                hintText: "Ex: Primeira nota",
              ),
              ...?controller.tasksModel.tasks?.map(
                (task) => TodoCardSearch(
                  margin:  const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  title: task.title,
                  description: task.description,
                  dayCreation: task.dateInit,
                ),
              ),
            ],
          );
        }),
      )),
    );
  }
}
