import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'app_controller.g.dart';

@Injectable()
class AppController = _AppControllerBase with _$AppController;

abstract class _AppControllerBase with Store {

  _AppControllerBase(){
    getVariables();
  }

  @observable
  String? baseUrlVariable;

  getVariables() async {
    await dotenv.load(fileName: ".env");
    baseUrlVariable = dotenv.get("BASE_URL");
  }
}
