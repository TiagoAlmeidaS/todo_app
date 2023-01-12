import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:todo_app/app/modules/tasks/interfaces/tasks_repository_interface.dart';

import '../../errors/tasks_errors.dart';
import '../../models/tasks_model.dart';

part 'search_task_controller.g.dart';

@Injectable()
class SearchTaskController = _SearchTaskControllerBase
    with _$SearchTaskController;

abstract class _SearchTaskControllerBase with Store {
  ITasksRepository iTasksRepository;

  _SearchTaskControllerBase(this.iTasksRepository) {
    fetchTasks();
  }

  @observable
  ObservableFuture<Either<TasksFailure, TasksModel>>? fetchTasksObservable;

  @observable
  TasksModel tasksModel = TasksModel();

  String userId = "12345";

  fetchTasks() async {
    fetchTasksObservable = iTasksRepository.fetchTasks(userId).asObservable();

    await fetchTasksObservable?.whenComplete(() => {
          fetchTasksObservable?.value?.fold((l) => null, (r) => tasksModel = r)
        });
  }
}
