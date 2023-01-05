import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:todo_app/app/modules/notes_feed/errors/notes_feed_error.dart';
import 'package:todo_app/app/modules/notes_feed/pages/my_notes/interfaces/my_notes_repository_interface.dart';
import 'package:todo_app/app/modules/notes_feed/pages/my_notes/models/my_notes_model.dart';

part 'my_notes_controller.g.dart';

@Injectable()
class MyNotesController = _MyNotesControllerBase with _$MyNotesController;

abstract class _MyNotesControllerBase with Store {
  IMyNotesRepository myNotesRepository;

  _MyNotesControllerBase(this.myNotesRepository){
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
