import 'package:dartz/dartz.dart';
import 'package:todo_app/app/modules/notes_feed/errors/notes_feed_error.dart';
import 'package:todo_app/app/modules/notes_feed/pages/my_notes/interfaces/my_notes_repository_interface.dart';
import 'package:todo_app/app/modules/notes_feed/pages/my_notes/models/my_notes_model.dart';
import 'package:todo_app/app/shared/services/http_client/http_client.dart';

import '../../../../../shared/services/http_client/errors/http_client_exception.dart';

class MyNotesRepository implements IMyNotesRepository {
  HttpClient httpClient;

  MyNotesRepository(this.httpClient);

  @override
  Future<Either<NotesFeedFailure, MyNotesModel>> getMyNotes(
      String userId) async {
    try {
      var response = await httpClient.get("/my_notes/$userId");
      MyNotesModel myNotesModel = MyNotesModel.fromMap(response.data);
      return right(myNotesModel);
    } on HttpClientException catch (e) {
      String message = e.data['messageError'] ??
          'Erro ao tentar carregar lista de instituições';
      int statusCode = e.statusCode ?? 400;
      return left(
        NotesFeedFailure(
          message: message,
          status: statusCode,
        ),
      );
    } catch (e) {
      return left(
        NotesFeedFailure(
          message: 'Erro ao tentar carregar lista de instituições',
        ),
      );
    }
  }
}
