import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:todo_app/app/modules/notes_feed/pages/note/models/note_model.dart';

part 'note_controller.g.dart';

@Injectable()
class NoteController = _NoteControllerBase with _$NoteController;

abstract class _NoteControllerBase with Store {


  @observable
  TextEditingController titleController = TextEditingController();

  @observable
  TextEditingController descriptionController = TextEditingController();

  initValues(NoteModel? note){
    titleController.text = note?.title ?? '';
    descriptionController.text = note?.description ?? '';
  }
}
