import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_app/app/modules/notes_feed/routers/notes_feed_routers.dart';
import 'package:todo_app/app/modules/profile/profile_module.dart';
import 'package:todo_app/app/modules/profile/routers/profile_routers.dart';
import 'package:todo_app/app/modules/splash/splash_module.dart';
import 'package:todo_app/app/shared/utils/theme/default/default_theme.dart';
import 'package:todo_app/app/shared/utils/theme/i_theme.dart';

import 'app/modules/notes_feed/notes_feed_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind<ITodoTheme>((i) => DefaultTheme()),
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
      ];
}
