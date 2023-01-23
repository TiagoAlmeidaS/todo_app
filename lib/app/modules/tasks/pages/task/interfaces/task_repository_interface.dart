import 'package:dartz/dartz.dart';
import 'package:todo_app/app/modules/tasks/errors/tasks_errors.dart';
import 'package:todo_app/app/modules/tasks/pages/task/models/task_input.dart';

abstract class ITaskRepository {
  Future<Either<TasksFailure, void>> newTask(TaskInput taskInput);
  Future<Either<TasksFailure, void>> updateTask(TaskInput taskInput, String idTask);
  Future<Either<TasksFailure, void>> deleteTask(String idTask);
}