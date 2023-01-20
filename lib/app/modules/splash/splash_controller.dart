import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:todo_app/app/shared/modules/auth/store/auth_store.dart';

part 'splash_controller.g.dart';

@Injectable()
class SplashController = _SplashControllerBase with _$SplashController;

abstract class _SplashControllerBase with Store {
  final AuthStore authStore;

  _SplashControllerBase(
      this.authStore,
      );

  @action
  Future<void> startSplash() async {
    await authStore.initializer();
  }
}
