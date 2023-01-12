


import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:todo_app/app/modules/tasks/errors/tasks_errors.dart';
import 'package:todo_app/app/modules/tasks/interfaces/tasks_repository_interface.dart';
import 'package:todo_app/app/modules/tasks/models/tasks_model.dart';

import '../../shared/utils/utils.dart';


part 'tasks_controller.g.dart';

@Injectable()
class TasksController = _TasksControllerBase with _$TasksController;

abstract class _TasksControllerBase with Store {
  ITasksRepository iTasksRepository;

  _TasksControllerBase(this.iTasksRepository){
    getTasks();
  }

  String userId = "12345";

  @observable
  ObservableFuture<Either<TasksFailure, TasksModel>>?
  fetchTasksObservable;

  @observable
  TasksModel tasksModel = TasksModel();

  @computed
  get dateNowFormmated => Utils.dateNowFormmated();

  void getTasks() async {
    fetchTasksObservable = iTasksRepository.fetchTasks(userId).asObservable();

    await fetchTasksObservable?.whenComplete(() => {
      fetchTasksObservable?.value?.fold((l) => null, (r) => tasksModel = r)
    });
  }
}
