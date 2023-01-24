import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_app/app/modules/notes_feed/pages/note/note_page.dart';
import 'package:todo_app/app/modules/notes_feed/pages/note/repositories/note_repository.dart';

import 'note_controller.dart';

class NoteModule extends Module {
  @override
  List<Bind> get binds => [
    Bind((i) => NoteRepository(i.get())),
    Bind((i) => NoteController(i.get(), i.get())),
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute(
      Modular.initialRoute,
      child: (_, args) => NotePage(noteModel: args.data),
    ),
  ];
}
