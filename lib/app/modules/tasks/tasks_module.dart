import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_app/app/modules/tasks/pages/search_task/search_task_module.dart';
import 'package:todo_app/app/modules/tasks/pages/task/repositories/task_repository.dart';
import 'package:todo_app/app/modules/tasks/pages/task/task_module.dart';
import 'package:todo_app/app/modules/tasks/repositories/tasks_repository.dart';
import 'package:todo_app/app/modules/tasks/routers/tasks_routers.dart';
import 'package:todo_app/app/modules/tasks/tasks_controller.dart';
import 'package:todo_app/app/modules/tasks/tasks_page.dart';

class TasksModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => TaskRepository(i.get())),
        Bind((i) => TasksController(i.get(), i.get())),
        Bind((i) => TasksRepository(i.get())),
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
        ModuleRoute(
          TasksRoutes.task.shortRoute,
          module: TaskModule(),
        )
      ];
}
