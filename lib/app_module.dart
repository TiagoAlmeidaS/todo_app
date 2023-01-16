import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_app/app/modules/custom_navigation_bar/custom_navigation_bar_module.dart';
import 'package:todo_app/app/modules/notes_feed/routers/notes_feed_routers.dart';
import 'package:todo_app/app/modules/profile/profile_module.dart';
import 'package:todo_app/app/modules/profile/routers/profile_routers.dart';
import 'package:todo_app/app/modules/splash/splash_module.dart';
import 'package:todo_app/app/modules/tasks/routers/tasks_routers.dart';
import 'package:todo_app/app/modules/tasks/tasks_module.dart';
import 'package:todo_app/app/shared/services/http_client/dio/dio_custom.dart';
import 'package:todo_app/app/shared/services/http_client/http_client.dart';
import 'package:todo_app/app/shared/utils/theme/default/default_theme.dart';
import 'package:todo_app/app/shared/utils/theme/i_theme.dart';
import 'package:todo_app/app_controller.dart';

import 'app/modules/notes_feed/notes_feed_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind((i) => Dio()),
        Bind((i) => DioCustom(i.get())),
        Bind<ITodoTheme>((i) => DefaultTheme()),
        Bind((i) => HttpClient(i.get())),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          Modular.initialRoute,
          module: SplashModule(),
        ),
        ModuleRoute(
          ProfileRouters.profile.shortRoute,
          module: ProfileModule(),
        ),
        ModuleRoute(
          NotesFeedRouters.notesFeed.shortRoute,
          module: NotesFeedModule(),
        ),
        ModuleRoute(
          TasksRoutes.tasks.shortRoute,
          module: TasksModule(),
        ),
        ModuleRoute(
          '/custom_navigation_bar',
          module: CustomNavigationBarModule(),
        )
      ];
}
