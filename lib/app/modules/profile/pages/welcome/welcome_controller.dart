import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:todo_app/app/modules/profile/profile_store.dart';

import '../../../../shared/business/rules_generics.dart';
import '../../../components/todo_text_form_field/todo_text_form_field_message.dart';

part 'welcome_controller.g.dart';

@Injectable()
class WelcomeController = _WelcomeControllerBase with _$WelcomeController;

abstract class _WelcomeControllerBase with Store {

  ProfileStore _profileStore;

  _WelcomeControllerBase(this._profileStore);

  @observable
  bool? isValidButton;

  @observable
  String? name;

  @action
  TodoTextInputMessage nameRulesOnChange(String? value) {

    if(RulesGenerics.stringEmpty(value)){
      isValidButton = false;
      return TodoTextInputMessage.error("the field is empty");
    }

    isValidButton = true;
    name = value ?? "";
    return TodoTextInputMessage.none;
  }

  @action
  TodoTextInputMessage nameRulesOnLeave(String? value) {

    if(RulesGenerics.stringEmpty(value)){
      isValidButton = false;
      return TodoTextInputMessage.error("the field is empty");
    }

    isValidButton = true;
    return TodoTextInputMessage.none;
  }

  @action
  TodoTextInputMessage helperHint() {
      return TodoTextInputMessage.helper("necessário primeiro nome");
  }

  @action
  void saveName(){
    _profileStore.setName(name!);
  }
}
