import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_app/app/modules/custom_navigation_bar/custom_navigation_bar.dart';
import 'package:todo_app/app/modules/tasks/mocks/tasks_repository_mock.dart';
import 'package:todo_app/app/modules/tasks/tasks_controller.dart';

import '../notes_feed/mocks/notes_feed_repository_mock.dart';
import '../notes_feed/notes_feed_controller.dart';

class CustomNavigationBarModule extends Module {
  @override
  List<Bind> get binds => [
        Bind(
          (i) => NotesFeedController(i.get()),
        ),
        Bind(
          (i) => NotesFeedRepositoryMock(),
        ),
        Bind(
              (i) => TasksController(i.get()),
        ),
        Bind(
              (i) => TasksRepositoryMock(),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (_, args) => const CustomNavigationBar(),
        ),
      ];
}
