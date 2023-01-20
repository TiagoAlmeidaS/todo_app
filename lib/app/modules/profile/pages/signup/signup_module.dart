import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_app/app/modules/profile/pages/signup/repositories/signup_repository.dart';
import 'package:todo_app/app/modules/profile/pages/signup/signup_controller.dart';
import 'package:todo_app/app/modules/profile/pages/signup/signup_page.dart';

class SignupModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => SignupRepository(i.get())),
        Bind((i) => SignupController(i.get(), i.get(), i.get())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (_, args) => const SignupPage(),
        ),
      ];
}
