import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../shared/modules/auth/store/auth_store.dart';

part 'signout_controller.g.dart';

@Injectable()
class SignoutController = _SignoutControllerBase with _$SignoutController;

abstract class _SignoutControllerBase with Store {
  final AuthStore _authStore;

  _SignoutControllerBase(
      this._authStore,
      );

  logout() {
    _authStore.fetchAuthSignOut();
  }
}
