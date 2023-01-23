import 'package:dartz/dartz.dart';
import 'package:todo_app/app/modules/tasks/errors/tasks_errors.dart';
import 'package:todo_app/app/modules/tasks/models/tasks_resume_model.dart';

import '../models/tasks_model.dart';

abstract class ITasksRepository {
  Future<Either<TasksFailure, TasksModel>> fetchTasks(String userId);
  Future<Either<TasksFailure, TasksModel>> filterTasks(String dateSelect);
  Future<Either<TasksFailure, TasksResumeModel>> fetchResumeTasks();
}