import 'package:dartz/dartz.dart';
import 'package:todo_app/app/modules/tasks/errors/tasks_errors.dart';
import 'package:todo_app/app/modules/tasks/pages/task/models/task_input.dart';
import 'package:todo_app/app/shared/services/http_client/http_client.dart';

import '../../../../../shared/services/http_client/errors/http_client_exception.dart';
import '../interfaces/task_repository_interface.dart';

class TaskRepository implements ITaskRepository {
  HttpClient httpClient;

  TaskRepository(this.httpClient);

  @override
  Future<Either<TasksFailure, void>> newTask(TaskInput taskInput) async {
    try {
      var response = await httpClient.post("/tasks", data: taskInput.toMap());
      return right(response.data);
    } on HttpClientException catch (e) {
      String message = e.data['messageError'] ??
          'Erro ao tentar criar uma tarefa';
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
          message: 'Erro ao tentar criar uma tarefa',
        ),
      );
    }
  }

  @override
  Future<Either<TasksFailure, void>> updateTask(TaskInput taskInput, String id) async {
    try {
      var response = await httpClient.put("/tasks/$id", data: taskInput.toMap());
      return right(response.data);
    } on HttpClientException catch (e) {
      String message = e.data['messageError'] ??
          'Erro ao tentar criar uma tarefa';
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
          message: 'Erro ao tentar criar uma tarefa',
        ),
      );
    }
  }

  @override
  Future<Either<TasksFailure, void>> deleteTask(String idTask) async {
    try {
      var response = await httpClient.delete("/tasks/$idTask");
      return right(response.data);
    } on HttpClientException catch (e) {
      String message = e.data['messageError'] ??
          'Erro ao tentar excluir';
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
          message: 'Erro ao tentar excluir',
        ),
      );
    }
  }



}