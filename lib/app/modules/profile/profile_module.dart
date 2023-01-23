import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_app/app/modules/profile/pages/signin/signin_module.dart';
import 'package:todo_app/app/modules/profile/pages/signout/signout_module.dart';
import 'package:todo_app/app/modules/profile/pages/signup/signup_module.dart';
import 'package:todo_app/app/modules/profile/pages/welcome/welcome_module.dart';
import 'package:todo_app/app/modules/profile/profile_store.dart';
import 'package:todo_app/app/modules/profile/routers/profile_routers.dart';

class ProfileModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => ProfileStore(i.get())),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          ProfileRouters.signin.shortRoute,
          module: SigninModule(),
        ),
        ModuleRoute(
          ProfileRouters.signup.shortRoute,
          module: SignupModule(),
        ),
        ModuleRoute(
          ProfileRouters.welcome.shortRoute,
          module: WelcomeModule(),
        ),
        ModuleRoute(
          ProfileRouters.signout.shortRoute,
          module: SignoutModule(),
        ),
      ];
}
