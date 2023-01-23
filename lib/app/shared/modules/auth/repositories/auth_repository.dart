import 'package:dartz/dartz.dart';
import 'package:todo_app/app/shared/modules/auth/errors/auth_failure.dart';
import 'package:todo_app/app/shared/modules/auth/interfaces/auth_repository_interface.dart';
import 'package:todo_app/app/shared/modules/auth/models/authentication_model.dart';
import 'package:todo_app/app/shared/services/http_client/http_client.dart';

import '../../../services/http_client/errors/http_client_exception.dart';

class AuthRepository implements IAuthRepository {

  HttpClient httpClient;

  AuthRepository(this.httpClient);

  @override
  Future<Either<AuthFailure, AuthenticationOutput>> refreshToken(AuthenticationInput authenticationInput) async {
    try {
      var response = await httpClient.post("/users/authentication");
      AuthenticationOutput authenticationOutput = AuthenticationOutput.fromMap(response.data);
      return right(authenticationOutput);
    } on HttpClientException catch (e) {
      String message = e.data['messageError'] ??
          'Erro interno';
      int statusCode = e.statusCode ?? 400;
      return left(
        AuthFailure(
          statusMessage: message,
          statusCode: statusCode,
        ),
      );
    } catch (e) {
      return left(
        AuthFailure(
          statusMessage: "Erro interno",
          statusCode: 500,
        ),
      );
    }

  }

}