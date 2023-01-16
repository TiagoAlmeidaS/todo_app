import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'profile_store.g.dart';

@Injectable()
class ProfileStore = _ProfileStoreBase with _$ProfileStore;

abstract class _ProfileStoreBase with Store {

  @observable
  String? customerName;

  setName(String str) => customerName = str;
  setEmail(String str) => emailName = str;
  setToken(String str) => token = str;

  @observable
  String? emailName;

  @observable
  String? token;
}
