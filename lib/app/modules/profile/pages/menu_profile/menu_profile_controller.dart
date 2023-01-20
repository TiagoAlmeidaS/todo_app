import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:todo_app/app/shared/modules/auth/store/auth_store.dart';

part 'menu_profile_controller.g.dart';

@Injectable()
class MenuProfileController = _MenuProfileControllerBase with _$MenuProfileController;

abstract class _MenuProfileControllerBase with Store {
  final AuthStore _authStore;

  _MenuProfileControllerBase(this._authStore);

  @computed
  get customerName => _authStore.customerName;

  @computed
  get customerEmail => _authStore.customerEmail;
}
