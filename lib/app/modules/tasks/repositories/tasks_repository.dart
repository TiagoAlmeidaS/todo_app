import 'package:dartz/dartz.dart';
import 'package:todo_app/app/modules/tasks/errors/tasks_errors.dart';
import 'package:todo_app/app/modules/tasks/models/tasks_model.dart';
import 'package:todo_app/app/modules/tasks/models/tasks_resume_model.dart';
import 'package:todo_app/app/shared/services/http_client/http_client.dart';
import '../../../shared/services/http_client/errors/http_client_exception.dart';
import '../interfaces/tasks_repository_interface.dart';

class TasksRepository implements ITasksRepository {
  HttpClient httpClient;

  TasksRepository(this.httpClient);

  @override
  Future<Either<TasksFailure, TasksModel>> fetchTasks(String userId) async {
    try {
      var response = await httpClient.get("/tasks/client/$userId");
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

  @override
  Future<Either<TasksFailure, TasksModel>> fetchTask(String userId, String nameTask) {
    // TODO: implement fetchTask
    throw UnimplementedError();
  }

  @override
  Future<Either<TasksFailure, TasksModel>> filterTasks(String userId, int dateSelect) {
    // TODO: implement filterTasks
    throw UnimplementedError();
  }

  @override
  Future<Either<TasksFailure, TasksResumeModel>> fetchResumeTasks() async {
    try {
      var response = await httpClient.get("/tasks/resume");
      TasksResumeModel tasksResumeModel = TasksResumeModel.fromMap(response.data);
      return right(tasksResumeModel);
    } on HttpClientException catch (e) {
      String message = e.data['messageError'] ??
          'Erro ao tentar carregar resumo das atividades';
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
          message: 'Erro ao tentar carregar resumo das atividades',
        ),
      );
    }
  }

}