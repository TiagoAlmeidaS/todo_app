import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_app/app/modules/splash/splash_controller.dart';
import 'package:todo_app/app/modules/splash/splash_page.dart';

class SplashModule extends Module {
  @override
  List<Bind> get binds => [
    Bind((i) => SplashController(i.get()))
  ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (_, args) => const SplashPage(),
        ),
      ];
}
