import 'package:dartz/dartz.dart';

import '../errors/auth_failure.dart';

abstract class IAuthRepository {
  Future<Either<AuthFailure, String>> refreshToken(String token);
}
