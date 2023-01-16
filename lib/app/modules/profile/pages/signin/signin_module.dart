import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_app/app/modules/profile/pages/signin/repositories/signin_repository.dart';
import 'package:todo_app/app/modules/profile/pages/signin/signin_controller.dart';
import 'package:todo_app/app/modules/profile/pages/signin/signin_page.dart';

class SigninModule extends Module {
  @override
  List<Bind> get binds => [
        Bind(
          (i) => SigninRepository(i.get()),
        ),
        Bind(
          (i) => SigninController(i.get(), i.get()),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (_, args) => const SigninPage(),
        ),
      ];
}
