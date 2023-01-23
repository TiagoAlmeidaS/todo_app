import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_app/app/modules/profile/pages/signout/signout_controller.dart';
import 'package:todo_app/app/modules/profile/pages/signup/signup_page.dart';

class SignoutModule extends Module {
  @override
  List<Bind> get binds => [
    Bind((i) => SignoutController(i.get())),
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute(
      Modular.initialRoute,
      child: (_, args) => const SignupPage(),
    ),
  ];
}
