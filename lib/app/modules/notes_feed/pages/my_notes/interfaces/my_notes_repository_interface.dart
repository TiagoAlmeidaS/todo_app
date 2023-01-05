import 'package:dartz/dartz.dart';
import 'package:todo_app/app/modules/notes_feed/errors/notes_feed_error.dart';
import 'package:todo_app/app/modules/notes_feed/pages/my_notes/models/my_notes_model.dart';

abstract class IMyNotesRepository {
  Future<Either<NotesFeedFailure, MyNotesModel>> getMyNotes(String userId);
}