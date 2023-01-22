import 'package:dartz/dartz.dart';
import 'package:todo_app/app/modules/tasks/errors/tasks_errors.dart';
import 'package:todo_app/app/modules/tasks/models/tasks_model.dart';
import 'package:todo_app/app/modules/tasks/pages/search_task/interfaces/search_repository_interface.dart';
import 'package:todo_app/app/shared/services/http_client/http_client.dart';

import '../../../../../shared/services/http_client/errors/http_client_exception.dart';

class SearchRepository implements ISearchRepository {

  HttpClient httpClient;

  SearchRepository(this.httpClient);

  @override
  Future<Either<TasksFailure, TasksModel>> searchTask(String titleSearch) async {
    try {
      var response = await httpClient.get("/tasks/search/$titleSearch");
      TasksModel tasksModel = TasksModel.fromMap(response.data);
      return right(tasksModel);
    } on HttpClientException catch (e) {
      String message = e.data['messageError'] ??
          'Erro ao tentar carregar lista de tarefas';
      int statusCode = e.statusCode ?? 400;
      return left(
        TasksFailure(
          message: message,
          status: statusCode,
        ),
      );
    } catch (e) {
      return left(
        TasksFailure(
          message: 'Erro ao tentar carregar lista de tarefas',
        ),
      );
    }
  }

}