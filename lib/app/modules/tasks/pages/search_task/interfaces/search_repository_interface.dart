import 'package:dartz/dartz.dart';
import 'package:todo_app/app/modules/tasks/errors/tasks_errors.dart';
import 'package:todo_app/app/modules/tasks/models/tasks_model.dart';

abstract class ISearchRepository {
  Future<Either<TasksFailure, TasksModel>> searchTask(String titleSearch);
}