import 'package:dartz/dartz.dart';
import 'package:todo_app/app/modules/notes_feed/errors/notes_feed_error.dart';
import 'package:todo_app/app/modules/notes_feed/pages/note/models/note_model.dart';

abstract class INoteRepositoryInterface {
  Future<Either<NotesFeedFailure, NoteModel>> saveNote();
  Future<Either<NotesFeedFailure, NoteModel>> deleteNote();
  Future<Either<NotesFeedFailure, NoteModel>> editNote();
}