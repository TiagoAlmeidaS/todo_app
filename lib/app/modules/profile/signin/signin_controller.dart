import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:todo_app/app/modules/components/todo_text_form_field/todo_text_form_field_message.dart';
import 'package:todo_app/app/shared/business/profile/signin/signin_rules.dart';
import 'package:todo_app/app/shared/business/rules_generics.dart';

part 'signin_controller.g.dart';

@Injectable()
class SigninController = _SigninControllerBase with _$SigninController;

abstract class _SigninControllerBase with Store {
  

  @action
  TodoTextInputMessage emailRulesOnChange(String? value) {
    if(RulesGenerics.stringEmpty(value)){
      return TodoTextInputMessage.error("the field is empty");
    }

    if(!SigninRules.isValidEmail(value)){
      return TodoTextInputMessage.error("the e-mail is invalid");
    }

    return TodoTextInputMessage.none;
  }
}
