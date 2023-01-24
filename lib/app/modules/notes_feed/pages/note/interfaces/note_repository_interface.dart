import 'package:dartz/dartz.dart';
import 'package:todo_app/app/modules/notes_feed/errors/notes_feed_error.dart';
import 'package:todo_app/app/modules/notes_feed/pages/note/models/note_model.dart';

abstract class INoteRepository {
  Future<Either<NotesFeedFailure, NoteModel>> saveNote(NoteModel noteModel);
  Future<Either<NotesFeedFailure, int>> deleteNote(String idNote);
  Future<Either<NotesFeedFailure, NoteModel>> editNote(NoteModel noteModel);
}