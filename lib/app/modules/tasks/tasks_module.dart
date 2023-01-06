

import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_app/app/modules/tasks/tasks_page.dart';

class TasksModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
    ChildRoute(
      Modular.initialRoute,
      child: (_, args) => const TasksPage(),
    ),
  ];
}