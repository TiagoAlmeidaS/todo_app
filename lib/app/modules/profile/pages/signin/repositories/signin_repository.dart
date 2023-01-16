import 'package:dartz/dartz.dart';
import 'package:todo_app/app/modules/profile/pages/signin/models/signin_model.dart';
import 'package:todo_app/app/shared/services/http_client/http_client.dart';

import '../../../../../shared/services/http_client/errors/http_client_exception.dart';
import '../../../errors/profile_error.dart';
import '../interface/signup_repository_interface.dart';



class SigninRepository implements ISigninRepository {
  HttpClient httpClient;

  SigninRepository(this.httpClient);

  @override
  Future<Either<ProfileFailure, SigninOutput>> signin(SigninModel signinModel) async {
    try {
      var response = await httpClient.post("/user/login", data: signinModel.toMap());
      SigninOutput signinOutputModel = SigninOutput.fromMap(response.data);
      return right(signinOutputModel);
    } on HttpClientException catch (e) {
      String message = e.data['messageError'] ??
          'Erro ao tentar realizar login';
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
          message: 'Erro ao tentar realizar o login',
        ),
      );
    }
  }
}
