import 'package:dartz/dartz.dart';
import 'package:todo_app/app/modules/notes_feed/errors/notes_feed_error.dart';
import 'package:todo_app/app/modules/notes_feed/models/my_notes_model.dart';
import 'package:todo_app/app/shared/services/http_client/http_client.dart';

import '../../../shared/services/http_client/errors/http_client_exception.dart';
import '../interfaces/notes_feed_repository_interface.dart';


class NotesFeedRepository implements INotesFeedRepository {
  HttpClient httpClient;

  NotesFeedRepository(this.httpClient);

  @override
  Future<Either<NotesFeedFailure, MyNotesModel>> fetchNotes(String userId) async {
    try {
      var response = await httpClient.get("/notes/client/$userId");
      MyNotesModel myNotesModel = MyNotesModel.fromMap(response.data);
      return right(myNotesModel);
    } on HttpClientException catch (e) {
      String message = e.data['messageError'] ??
          'Erro ao tentar carregar lista de notas';
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
          message: 'Erro ao tentar carregar lista de notas',
        ),
      );
    }
  }

  @override
  Future<Either<NotesFeedFailure, MyNotesModel>> filterNotes(String dateSelect) async {
    try {
      var response = await httpClient.get("/notes/$dateSelect/day");
      MyNotesModel notesModel = MyNotesModel.fromMap(response.data);
      return right(notesModel);
    } on HttpClientException catch (e) {
      String message = e.data['messageError'] ??
          'Erro ao tentar carregar as notas do dia selecionado';
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
          message: 'Erro ao tentar carregar as notas do dia selecionado',
        ),
      );
    }
  }
}
