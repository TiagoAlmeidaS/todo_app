import 'package:dartz/dartz.dart';
import 'package:todo_app/app/modules/notes_feed/errors/notes_feed_error.dart';
import 'package:todo_app/app/modules/notes_feed/pages/my_notes/interfaces/my_notes_repository_interface.dart';
import 'package:todo_app/app/modules/notes_feed/pages/my_notes/models/my_notes_model.dart';

import '../../../../../shared/utils/load_json.dart';

class MyNotesRepositoryMock implements IMyNotesRepository {
  @override
  Future<Either<NotesFeedFailure, MyNotesModel>> getMyNotes(
      String userId) async {
    try {
      LoadJson json = LoadJson("notes_feed/my_notes/my_notes_contract.json");
      var myNotesJson = await json.getJSON();
      MyNotesModel myNotesModel = MyNotesModel.fromMap(myNotesJson);
      return right(myNotesModel);
    } catch (e) {
      return left(
        NotesFeedFailure(message: 'Erro ao tentar realizar doação de bônus'),
      );
    }
  }
}
