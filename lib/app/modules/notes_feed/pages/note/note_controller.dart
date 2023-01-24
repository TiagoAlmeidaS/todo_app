import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:todo_app/app/modules/notes_feed/errors/notes_feed_error.dart';
import 'package:todo_app/app/modules/notes_feed/notes_feed_controller.dart';
import 'package:todo_app/app/modules/notes_feed/pages/note/interfaces/note_repository_interface.dart';
import 'package:todo_app/app/modules/notes_feed/pages/note/models/note_model.dart';

part 'note_controller.g.dart';

@Injectable()
class NoteController = _NoteControllerBase with _$NoteController;

abstract class _NoteControllerBase with Store {
  final INoteRepository noteRepository;
  final NotesFeedController notesController;

  _NoteControllerBase(this.noteRepository, this.notesController);

  @observable
  TextEditingController titleController = TextEditingController();

  @observable
  TextEditingController descriptionController = TextEditingController();

  initValues(NoteModel? note) {
    titleController.text = note?.title ?? '';
    descriptionController.text = note?.description ?? '';
  }

  @observable
  ObservableFuture<Either<NotesFeedFailure, NoteModel>?>? saveObservable;

  saveNote(NoteModel noteModel) async {
    noteModel = noteModel.copyWith(
      title: titleController.text,
      description: descriptionController.text,
    );
    if (noteModel.id != "") {
      saveObservable = noteRepository.editNote(noteModel).asObservable();
    } else {
      saveObservable = noteRepository.saveNote(noteModel).asObservable();
    }

    await saveObservable?.whenComplete(
        () => saveObservable?.value?.fold((l) => null, (r) => null));
  }

  @observable
  ObservableFuture<Either<NotesFeedFailure, int>?>? deleteObservable;

  deleteNote(String idNote) async {
    deleteObservable = noteRepository.deleteNote(idNote).asObservable();
    deleteObservable?.whenComplete(
      () => deleteObservable?.value?.fold(
        (l) => null,
        (r) {
          notesController.getMyNotes();
        },
      ),
    );
  }
}
