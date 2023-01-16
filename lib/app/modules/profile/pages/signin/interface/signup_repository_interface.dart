import 'package:dartz/dartz.dart';
import 'package:todo_app/app/modules/profile/pages/signin/models/signin_model.dart';

import '../../../errors/profile_error.dart';

abstract class ISigninRepository {
  Future<Either<ProfileFailure, SigninOutput>> signin(SigninModel signinModel);
}