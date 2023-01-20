import 'package:dartz/dartz.dart';
import 'package:todo_app/app/modules/profile/pages/signup/models/singup_model.dart';

import '../../../errors/profile_error.dart';

abstract class ISignupRepository {
  Future<Either<ProfileFailure, SignupOutput>> singup(SignupModel signupModel);
}