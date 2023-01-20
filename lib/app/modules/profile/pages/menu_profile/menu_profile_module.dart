import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_app/app/modules/profile/pages/menu_profile/menu_profile_controller.dart';
import 'package:todo_app/app/modules/profile/pages/menu_profile/menu_profile_page.dart';

class MenuProfileModule extends Module {
  @override
  List<Bind> get binds => [
    Bind(
          (i) => MenuProfileController(i.get()),
    ),
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute(
      Modular.initialRoute,
      child: (_, args) => const MenuProfilePage(),
    ),
  ];
}
