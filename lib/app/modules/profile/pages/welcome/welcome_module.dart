
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_app/app/modules/profile/pages/welcome/welcome_controller.dart';
import 'package:todo_app/app/modules/profile/pages/welcome/welcome_page.dart';

class WelcomeModule extends Module {
  @override
  List<Bind> get binds => [
    Bind(
          (i) => WelcomeController(i.get()),
    ),
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute(
      Modular.initialRoute,
      child: (_, args) => const WelcomePage(),
    ),
  ];
}
