import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_app/app/modules/notes_feed/pages/my_notes/my_notes_module.dart';
import 'package:todo_app/app/modules/notes_feed/routers/notes_feed_routers.dart';

class NotesFeedModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          NotesFeedRouters.myNotes.shortRoute,
          module: MyNotesModule(),
        ),
      ];
}
