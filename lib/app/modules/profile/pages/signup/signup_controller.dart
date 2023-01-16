import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:todo_app/app/modules/components/todo_text_form_field/todo_text_form_field_message.dart';
import 'package:todo_app/app/modules/profile/pages/signup/interfaces/signup_repository_interface.dart';
import 'package:todo_app/app/modules/profile/pages/signup/models/singup_model.dart';
import 'package:todo_app/app/shared/business/profile/signin/signin_rules.dart';
import 'package:todo_app/app/shared/business/rules_generics.dart';

import '../../errors/profile_error.dart';
import '../../profile_store.dart';

part 'signup_controller.g.dart';

@Injectable()
class SignupController = _SignupControllerBase with _$SignupController;

abstract class _SignupControllerBase with Store {
  ISignupRepository iSignupRepository;
  ProfileStore _profileStore;

  _SignupControllerBase(this.iSignupRepository, this._profileStore);

  @observable
  SignupModel? signupModel = SignupModel();

  @observable
  ObservableFuture<Either<ProfileFailure, SignupOutput>>?
      signupOutputObservable;

  @action
  setName(String str) {
    signupModel = signupModel?.copyWith(name: str);
  }

  setEmail(String? str) {
    signupModel = signupModel?.copyWith(email: str);
  }

  setPassword(String? str) {
    signupModel = signupModel?.copyWith(password: str);
  }

  @observable
  String? password;

  @observable
  bool? passwodIsValid;

  @observable
  bool? emailIsValid;

  @computed
  get isValidRegister => (passwodIsValid ?? false) && (emailIsValid ?? false);

  @action
  TodoTextInputMessage emailRulesOnChange(String? value) {
    if (RulesGenerics.stringEmpty(value)) {
      emailIsValid = false;
      return TodoTextInputMessage.error("the field is empty");
    }

    if (!SigninRules.isValidEmail(value)) {
      emailIsValid = false;
      return TodoTextInputMessage.error("the e-mail is invalid");
    }

    setEmail(value);
    emailIsValid = true;
    return TodoTextInputMessage.none;
  }

  @action
  TodoTextInputMessage passwordRulesOnChange(String? value) {
    if (RulesGenerics.stringEmpty(value)) {
      passwodIsValid = false;
      return TodoTextInputMessage.error("the field is empty");
    }

    password = value;
    return TodoTextInputMessage.none;
  }

  @action
  TodoTextInputMessage confirmPasswordRulesOnChange(String? value) {
    if (RulesGenerics.stringEmpty(value)) {
      passwodIsValid = false;
      return TodoTextInputMessage.error("the field is empty");
    }

    if (password != value) {
      passwodIsValid = false;
      return TodoTextInputMessage.error("password are diferent!");
    }

    passwodIsValid = true;
    setPassword(value);
    return TodoTextInputMessage.none;
  }

  signup() {
    signupOutputObservable =
        iSignupRepository.singup(signupModel!).asObservable();

    signupOutputObservable?.whenComplete(
      () => signupOutputObservable?.value?.fold(
        (l) => null,
        (r) {
          _profileStore.setToken(r.token ?? "");
          _profileStore.setEmail(r.email ?? "");
          _profileStore.setName(r.name ?? "");
        },
      ),
    );
  }
}
