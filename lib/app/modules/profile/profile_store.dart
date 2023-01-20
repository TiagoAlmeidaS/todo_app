import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import '../../shared/services/local_storage/local_storage_service.dart';
part 'profile_store.g.dart';

@Injectable()
class ProfileStore = _ProfileStoreBase with _$ProfileStore;

abstract class _ProfileStoreBase with Store {

  LocalStorageService localStorageService;

  _ProfileStoreBase(this.localStorageService);

  @observable
  String? name;

  setName(String str) => name = str;

}
