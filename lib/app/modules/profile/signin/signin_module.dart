import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_app/app/modules/profile/signin/signin_controller.dart';
import 'package:todo_app/app/modules/profile/signin/signin_page.dart';

class SigninModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => SigninController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (_, args) => const SigninPage(),
        ),
      ];
}
