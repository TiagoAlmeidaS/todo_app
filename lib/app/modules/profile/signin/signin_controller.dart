import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'signin_controller.g.dart';

@Injectable()
// ignore: library_private_types_in_public_api
class SigninController = _SigninControllerBase with _$SigninController;

abstract class _SigninControllerBase with Store {
  void validatorSignin() {
    return print("tap");
  }
}
