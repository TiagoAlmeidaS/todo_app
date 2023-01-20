import 'package:dartz/dartz.dart';
import 'package:todo_app/app/modules/profile/pages/signup/models/singup_model.dart';
import 'package:todo_app/app/shared/services/http_client/http_client.dart';

import '../../../../../shared/services/http_client/errors/http_client_exception.dart';
import '../../../errors/profile_error.dart';
import '../interfaces/signup_repository_interface.dart';



class SignupRepository implements ISignupRepository {
  HttpClient httpClient;

  SignupRepository(this.httpClient);

  @override
  Future<Either<ProfileFailure, SignupOutput>> singup(SignupModel signupModel) async {
    try {
      var response = await httpClient.post("/users/register", data: signupModel.toMap());
      SignupOutput signupOutputModel = SignupOutput.fromMap(response.data);
      return right(signupOutputModel);
    } on HttpClientException catch (e) {
      String message = e.data['messageError'] ??
          'Erro ao tentar realizar um registro';
      int statusCode = e.statusCode ?? 400;
      return left(
        ProfileFailure(
          message: message,
          status: statusCode,
        ),
      );
    } catch (e) {
      return left(
        ProfileFailure(
          message: 'Erro ao tentar realizar um registro',
        ),
      );
    }
  }
}
