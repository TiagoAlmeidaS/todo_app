import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:todo_app/app/modules/profile/profile_store.dart';

part 'menu_profile_controller.g.dart';

@Injectable()
class MenuProfileController = _MenuProfileControllerBase with _$MenuProfileController;

abstract class _MenuProfileControllerBase with Store {
  final ProfileStore _profileStore;

  _MenuProfileControllerBase(this._profileStore);

  @computed
  get customerName => _profileStore.customerName;

  @computed
  get customerEmail => _profileStore.emailName;
}
