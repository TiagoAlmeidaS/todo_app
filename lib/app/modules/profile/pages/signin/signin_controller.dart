import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:todo_app/app/modules/components/todo_text_form_field/todo_text_form_field_message.dart';
import 'package:todo_app/app/modules/profile/pages/signin/interface/signup_repository_interface.dart';
import 'package:todo_app/app/modules/profile/pages/signin/models/signin_model.dart';
import 'package:todo_app/app/shared/business/profile/signin/signin_rules.dart';
import 'package:todo_app/app/shared/business/rules_generics.dart';
import 'package:todo_app/app/shared/modules/auth/store/auth_store.dart';

import '../../errors/profile_error.dart';

part 'signin_controller.g.dart';

@Injectable()
class SigninController = _SigninControllerBase with _$SigninController;

abstract class _SigninControllerBase with Store {
  final AuthStore authStore;

  ISigninRepository iSigninRepository;

  _SigninControllerBase(this.iSigninRepository, this.authStore);

  @observable
  ObservableFuture<Either<ProfileFailure, SigninOutput>>? signOutputObservable;

  @observable
  bool isHidden = false;

  @observable
  bool isValidEmail = false;

  @observable
  bool isValidPassword = false;

  @computed
  get isValidButton => isValidEmail && isValidPassword;

  @observable
  SigninModel signinModel = SigninModel();

  setEmail(String str) {
    signinModel = signinModel.copyWith(email: str);
  }

  setPassword(String str) {
    signinModel = signinModel.copyWith(password: str);
  }

  @action
  TodoTextInputMessage emailRulesOnChange(String? value) {
    if (RulesGenerics.stringEmpty(value)) {
      return TodoTextInputMessage.error("the field is empty");
    }

    if (!SigninRules.isValidEmail(value)) {
      return TodoTextInputMessage.error("the e-mail is invalid");
    }

    isValidEmail = true;
    setEmail(value ?? "");
    return TodoTextInputMessage.none;
  }

  @action
  TodoTextInputMessage passwordRulesOnChange(String? value) {
    if (RulesGenerics.stringEmpty(value)) {
      return TodoTextInputMessage.error("the field is empty");
    }

    isValidPassword = true;
    setPassword(value ?? "");
    return TodoTextInputMessage.none;
  }

  login() async {
    signOutputObservable = iSigninRepository.signin(signinModel).asObservable();
    signOutputObservable?.whenComplete(
      () => signOutputObservable?.value?.fold(
        (l) => null,
        (r) {
          authStore.fetchAuthSignIn(
            customerName: r.name,
            customerId: r.id,
            token: r.token,
            customerEmail: r.email,
          );
        },
      ),
    );
  }
}
