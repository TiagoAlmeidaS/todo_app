import 'package:dartz/dartz.dart';
import 'package:todo_app/app/modules/notes_feed/errors/notes_feed_error.dart';
import 'package:todo_app/app/modules/notes_feed/interfaces/notes_feed_repository_interface.dart';
import 'package:todo_app/app/shared/utils/load_json.dart';

import '../models/my_notes_model.dart';

class NotesFeedRepositoryMock implements INotesFeedRepository {
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

  @override
  Future<Either<NotesFeedFailure, MyNotesModel>> fetchNotes(String userId) {
    // TODO: implement fetchNotes
    throw UnimplementedError();
  }

  @override
  Future<Either<NotesFeedFailure, MyNotesModel>> filterNotes(String dateSelect) {
    // TODO: implement filterNotes
    throw UnimplementedError();
  }
}
