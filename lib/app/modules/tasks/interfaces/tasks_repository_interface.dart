import 'package:dartz/dartz.dart';
import 'package:todo_app/app/modules/tasks/errors/tasks_errors.dart';

import '../models/tasks_model.dart';

abstract class ITasksRepository {
  Future<Either<TasksFailure, TasksModel>> fetchTasks(String userId);
}