import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:todo_app/app/modules/notes_feed/errors/notes_feed_error.dart';

import 'interfaces/notes_feed_repository_interface.dart';
import 'models/my_notes_model.dart';

part 'notes_feed_controller.g.dart';

@Injectable()
class NotesFeedController = _NotesFeedControllerBase with _$NotesFeedController;

abstract class _NotesFeedControllerBase with Store {
  INotesFeedRepository myNotesRepository;

  _NotesFeedControllerBase(this.myNotesRepository){
   getMyNotes();
  }

  String userId = "12345";

  @observable
  ObservableFuture<Either<NotesFeedFailure, MyNotesModel>>?
  myNotesObservable;

  @observable
  MyNotesModel myNotesModel = MyNotesModel();

  getMyNotes() async {
    myNotesObservable = myNotesRepository.getMyNotes(userId).asObservable();
    myNotesObservable?.whenComplete(() => {
      myNotesObservable?.value?.fold((l) => null, (r) => myNotesModel = r)
    });
  }
}
