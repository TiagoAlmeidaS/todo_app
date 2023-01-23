import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_app/app/modules/notes_feed/notes_feed_controller.dart';
import 'package:todo_app/app/modules/notes_feed/notes_feed_page.dart';
import 'package:todo_app/app/modules/notes_feed/pages/note/note_module.dart';
import 'package:todo_app/app/modules/notes_feed/repositories/notes_feed_repository.dart';
import 'package:todo_app/app/modules/notes_feed/routers/notes_feed_routers.dart';

class NotesFeedModule extends Module {
  @override
  List<Bind> get binds => [
        Bind(
          (i) => NotesFeedController(i.get()),
        ),
        Bind(
          (i) => NotesFeedRepository(i.get()),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (_, args) => const NotesFeedPage(),
        ),
        ModuleRoute(
          NotesFeedRouters.note.shortRoute,
          module: NoteModule(),
        ),
      ];
}
