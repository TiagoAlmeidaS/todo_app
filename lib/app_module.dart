import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_app/app/modules/custom_navigation_bar/custom_navigation_bar_module.dart';
import 'package:todo_app/app/modules/custom_navigation_bar/routers/custom_navigation_router.dart';
import 'package:todo_app/app/modules/notes_feed/routers/notes_feed_routers.dart';
import 'package:todo_app/app/modules/profile/profile_module.dart';
import 'package:todo_app/app/modules/profile/profile_store.dart';
import 'package:todo_app/app/modules/profile/routers/profile_routers.dart';
import 'package:todo_app/app/modules/splash/splash_module.dart';
import 'package:todo_app/app/modules/tasks/routers/tasks_routers.dart';
import 'package:todo_app/app/modules/tasks/tasks_module.dart';
import 'package:todo_app/app/shared/modules/auth/repositories/auth_local_repository.dart';
import 'package:todo_app/app/shared/modules/auth/repositories/auth_repository.dart';
import 'package:todo_app/app/shared/modules/auth/store/auth_store.dart';
import 'package:todo_app/app/shared/services/http_client/dio/dio_custom.dart';
import 'package:todo_app/app/shared/services/http_client/http_client.dart';
import 'package:todo_app/app/shared/services/local_storage/local_storage_service.dart';
import 'package:todo_app/app/shared/utils/theme/default/default_theme.dart';
import 'package:todo_app/app/shared/utils/theme/i_theme.dart';
import 'package:todo_app/app_controller.dart';

import 'app/modules/notes_feed/notes_feed_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind((i) => DioCustom()),
        Bind<ITodoTheme>((i) => DefaultTheme()),
        Bind((i) => HttpClient(i.get())),
        Bind((i) => LocalStorageService()),
        Bind((i) => AuthRepository(i.get())),
        Bind((i) => AuthLocalRepository(i.get())),
        Bind((i) => AuthStore(i.get(), i.get(), i.get())),
        Bind((i) => ProfileStore(i.get())),
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
          CustomNavigationRouter.customNavigation.shortRoute,
          module: CustomNavigationBarModule(),
        )
      ];
}
