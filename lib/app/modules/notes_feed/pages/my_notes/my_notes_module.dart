import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_app/app/modules/notes_feed/pages/my_notes/mocks/my_notes_repository_mock.dart';
import 'package:todo_app/app/modules/notes_feed/pages/my_notes/my_notes_controller.dart';
import 'package:todo_app/app/modules/notes_feed/pages/my_notes/my_notes_page.dart';

class MyNotesModule extends Module {
  @override
  List<Bind> get binds => [
    Bind(
          (i) => MyNotesRepositoryMock(),
    ),
        Bind(
          (i) => MyNotesController(i.get()),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (_, args) => const MyNotesPage(),
        ),
      ];
}
