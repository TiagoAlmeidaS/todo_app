import 'package:dartz/dartz.dart';
import 'package:todo_app/app/modules/tasks/errors/tasks_errors.dart';
import 'package:todo_app/app/modules/tasks/interfaces/tasks_repository_interface.dart';
import 'package:todo_app/app/modules/tasks/models/tasks_resume_model.dart';

import '../../../shared/utils/load_json.dart';
import '../models/tasks_model.dart';

class TasksRepositoryMock implements ITasksRepository {
  @override
  Future<Either<TasksFailure, TasksModel>> fetchTasks(String userId) async {
    try {
      LoadJson json = LoadJson("tasks/get_tasks.json");
      var tasksJson = await json.getJSON();
      TasksModel myNotesModel = TasksModel.fromMap(tasksJson);
      return right(myNotesModel);
    } catch (e) {
      return left(
        TasksFailure(
          message: 'Erro ao tentar realizar doação de bônus',
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
  Future<Either<TasksFailure, TasksResumeModel>> fetchResumeTasks() {
    // TODO: implement fetchResumeTasks
    throw UnimplementedError();
  }

  @override
  Future<Either<TasksFailure, TasksModel>> filterTasks(String dateSelect) {
    // TODO: implement filterTasks
    throw UnimplementedError();
  }
}
