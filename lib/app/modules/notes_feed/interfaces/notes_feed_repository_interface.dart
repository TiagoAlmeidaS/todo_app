import 'package:dartz/dartz.dart';
import 'package:todo_app/app/modules/notes_feed/errors/notes_feed_error.dart';

import '../models/my_notes_model.dart';

abstract class INotesFeedRepository {
  Future<Either<NotesFeedFailure, MyNotesModel>> fetchNotes(String userId);
  Future<Either<NotesFeedFailure, MyNotesModel>> filterNotes(String dateSelect);
}