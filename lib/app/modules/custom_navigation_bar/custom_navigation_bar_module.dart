import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_app/app/modules/custom_navigation_bar/custom_navigation_bar.dart';
import 'package:todo_app/app/modules/profile/pages/menu_profile/menu_profile_controller.dart';
import 'package:todo_app/app/modules/profile/pages/signout/signout_controller.dart';
import 'package:todo_app/app/modules/tasks/pages/task/repositories/task_repository.dart';
import 'package:todo_app/app/modules/tasks/repositories/tasks_repository.dart';
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
        Bind((i) => TaskRepository(i.get())),
        Bind(
          (i) => TasksController(i.get(), i.get(), i.get()),
        ),
        Bind(
          (i) => TasksRepository(i.get()),
        ),
        Bind((i) => SignoutController(i.get())),
        Bind(
          (i) => MenuProfileController(i.get(), i.get()),
        )
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (_, args) => const CustomNavigationBar(),
        ),
      ];
}
