import 'package:dartz/dartz.dart';

import '../errors/auth_failure.dart';
import '../models/auth_signout_model.dart';

abstract class IAuthRepository {
  Future<Either<AuthFailure, AuthSignOutModel>> signOut({
    required int? customerID,
  });
}
