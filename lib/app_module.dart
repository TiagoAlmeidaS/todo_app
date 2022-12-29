import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_app/app/modules/profile/signin/signin_module.dart';
import 'package:todo_app/app/shared/utils/theme/default/default_theme.dart';
import 'package:todo_app/app/shared/utils/theme/i_theme.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind<ITodoTheme>((i) => DefaultTheme()),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          '/profile',
          module: SigninModule(),
        ),
      ];
}
