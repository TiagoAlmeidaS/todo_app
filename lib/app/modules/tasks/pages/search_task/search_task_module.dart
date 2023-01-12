

import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_app/app/modules/tasks/mocks/tasks_repository_mock.dart';
import 'package:todo_app/app/modules/tasks/pages/search_task/search_task_controller.dart';
import 'package:todo_app/app/modules/tasks/pages/search_task/search_task_page.dart';

class SearchTaskModule extends Module {

  @override
  List<Bind> get binds => [
    Bind((i) => TasksRepositoryMock()),
    Bind((i) => SearchTaskController(i.get()))
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute(
      Modular.initialRoute,
      child: (_, args) => const SearchTaskPage(),
    ),
  ];
}