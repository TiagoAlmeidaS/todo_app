import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'menu_profile_controller.g.dart';

@Injectable()
class MenuProfileController = _MenuProfileControllerBase with _$MenuProfileController;

abstract class _MenuProfileControllerBase with Store {

}
