import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'my_notes_controller.g.dart';

@Injectable()
class MyNotesController = _MyNotesControllerBase with _$MyNotesController;

abstract class _MyNotesControllerBase with Store {
}
