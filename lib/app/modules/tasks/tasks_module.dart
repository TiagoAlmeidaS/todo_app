import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_app/app/modules/tasks/mocks/tasks_repository_mock.dart';
import 'package:todo_app/app/modules/tasks/pages/search_task/search_task_module.dart';
import 'package:todo_app/app/modules/tasks/routers/tasks_routers.dart';
import 'package:todo_app/app/modules/tasks/tasks_controller.dart';
import 'package:todo_app/app/modules/tasks/tasks_page.dart';

class TasksModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => TasksController(i.get())),
        Bind((i) => TasksRepositoryMock()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (_, args) => const TasksPage(),
        ),
        ModuleRoute(
          TasksRoutes.searchTask.shortRoute,
          module: SearchTaskModule(),
        ),
      ];
}
