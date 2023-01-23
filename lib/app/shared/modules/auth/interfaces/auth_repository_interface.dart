import 'package:dartz/dartz.dart';
import 'package:todo_app/app/shared/modules/auth/models/authentication_model.dart';

import '../errors/auth_failure.dart';

abstract class IAuthRepository {
  Future<Either<AuthFailure, AuthenticationOutput>> refreshToken(AuthenticationInput authenticationInput);
}
