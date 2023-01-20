import 'package:dartz/dartz.dart';

import '../../../services/local_storage/local_storage_service.dart';
import '../errors/auth_failure.dart';
import '../models/auth_signin_model.dart';

class AuthLocalRepository {
  final LocalStorageService _localStorageService;

  AuthLocalRepository(this._localStorageService);

  Future<Either<AuthFailure, AuthSignInModel>>
  fetchAuthSignInFromLocal() async {
    try {
      Map<String, dynamic>? localData =
      await _localStorageService.get('auth_options');
      if (localData == null || localData.isEmpty) {
        return left(AuthFailure(900, 'Erro ao recuperar os dados', {}));
      }
      AuthSignInModel model = AuthSignInModel.fromMap(localData);
      return right(model);
    } catch (e) {
      return left(AuthFailure(900, 'Erro ao recuperar os dados', {}));
    }
  }
}
