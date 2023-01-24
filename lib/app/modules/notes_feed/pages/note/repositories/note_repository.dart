import 'package:dartz/dartz.dart';
import 'package:todo_app/app/modules/notes_feed/errors/notes_feed_error.dart';
import 'package:todo_app/app/modules/notes_feed/pages/note/models/note_model.dart';
import 'package:todo_app/app/shared/services/http_client/http_client.dart';

import '../../../../../shared/services/http_client/errors/http_client_exception.dart';
import '../interfaces/note_repository_interface.dart';

class NoteRepository implements INoteRepository {
  HttpClient httpClient;

  NoteRepository(this.httpClient);

  @override
  Future<Either<NotesFeedFailure, int>> deleteNote(String idNote) async {
    try {
      var response = await httpClient.delete("/notes/$idNote");
      return right(response.statusCode ?? 200);
    } on HttpClientException catch (e) {
      String message = e.data['messageError'] ?? 'Erro ao tentar excluir';
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
          message: 'Erro ao tentar excluir',
        ),
      );
    }
  }

  @override
  Future<Either<NotesFeedFailure, NoteModel>> editNote(NoteModel note) async {
    try {
      var response = await httpClient.put(
        "/notes/${note.id}",
        data: note.toMapSave(),
      );
      NoteModel noteModel = NoteModel.fromMap(response.data);
      return right(noteModel);
    } on HttpClientException catch (e) {
      String message = e.data['messageError'] ?? 'Erro ao tentar uma nota';
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
          message: 'Erro ao tentar editar uma nota',
        ),
      );
    }
  }

  @override
  Future<Either<NotesFeedFailure, NoteModel>> saveNote(
      NoteModel note) async {
    try {
      var response =
          await httpClient.post("/notes", data: note.toMapSave(),);
      NoteModel noteModel = NoteModel.fromMap(response.data);
      return right(noteModel);
    } on HttpClientException catch (e) {
      String message =
          e.data['messageError'] ?? 'Erro ao tentar criar uma tarefa';
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
          message: 'Erro ao tentar criar uma tarefa',
        ),
      );
    }
  }
}
