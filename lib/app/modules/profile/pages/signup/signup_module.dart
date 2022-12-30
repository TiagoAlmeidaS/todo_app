import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_app/app/modules/profile/pages/signup/signup_controller.dart';
import 'package:todo_app/app/modules/profile/pages/signup/signup_page.dart';

class SignupModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => SignupController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (_, args) => const SignupPage(),
        ),
      ];
}
