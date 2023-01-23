import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_app/app/modules/tasks/pages/task/repositories/task_repository.dart';
import 'package:todo_app/app/modules/tasks/pages/task/task_controller.dart';
import 'package:todo_app/app/modules/tasks/pages/task/task_page.dart';

class TaskModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => TaskController(i.get(), i.get())),
        Bind((i) => TaskRepository(i.get())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (_, args) => TaskPage(
            taskModel: args.data != null ? args.data['taskModel'] : null,
            isVisualization: args.data != null ? args.data['isVisualization'] : false,
          ),
        ),
      ];
}
