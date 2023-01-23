import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:todo_app/app/modules/components/todo_flush_bar/todo_flush_bar.dart';
import 'package:todo_app/app/modules/tasks/errors/tasks_errors.dart';
import 'package:todo_app/app/modules/tasks/interfaces/tasks_repository_interface.dart';
import 'package:todo_app/app/modules/tasks/models/tasks_model.dart';
import 'package:todo_app/app/modules/tasks/models/tasks_resume_model.dart';
import 'package:todo_app/app/modules/tasks/pages/task/interfaces/task_repository_interface.dart';
import 'package:todo_app/app/shared/modules/auth/store/auth_store.dart';
import 'package:todo_app/app/shared/utils/enum/todo_enum.dart';

import '../../shared/utils/utils.dart';

part 'tasks_controller.g.dart';

@Injectable()
class TasksController = _TasksControllerBase with _$TasksController;

abstract class _TasksControllerBase with Store {
  final ITasksRepository iTasksRepository;
  final ITaskRepository iTaskRepository;
  final AuthStore _authStore;

  _TasksControllerBase(
      this.iTasksRepository, this.iTaskRepository, this._authStore) {
    getResumeTasks();
    getTasks();
  }

  @observable
  ObservableFuture<Either<TasksFailure, TasksModel>?>? fetchTasksObservable;

  @observable
  TasksModel tasksModel = TasksModel();

  @observable
  ObservableFuture<Either<TasksFailure, TasksResumeModel>?>?
      fetchResumeTasksObservable;

  @observable
  ObservableFuture<Either<TasksFailure, void>?>? deleteTasksObservable;

  @observable
  DateTime selected = DateTime.now();

  @observable
  ObservableFuture<Either<TasksFailure, TasksModel>?>?
      tasksByDayTasksObservable;

  @observable
  TasksResumeModel tasksResumeModel = TasksResumeModel();

  @computed
  get dateNowFormmated => Utils.dateNowFormmated();


  void getTasks() async {
    fetchTasksObservable =
        iTasksRepository.fetchTasks(_authStore.customerId).asObservable();

    await fetchTasksObservable?.whenComplete(
      () => {
        fetchTasksObservable?.value?.fold(
          (l) => null,
          (r) => tasksModel = r,
        )
      },
    );
  }

  void getResumeTasks() async {
    fetchResumeTasksObservable =
        iTasksRepository.fetchResumeTasks().asObservable();

    await fetchResumeTasksObservable?.whenComplete(() => {
          fetchResumeTasksObservable?.value
              ?.fold((l) => null, (r) => tasksResumeModel = r)
        });
  }

  void getFilterByDay(DateTime? dateTime) {
    selected = dateTime!;
    var dateTimeString = Utils.dateDDMMYYTimer(dateTime);
    fetchTasksObservable =
        iTasksRepository.filterTasks(dateTimeString).asObservable();

    fetchTasksObservable?.whenComplete(
      () => fetchTasksObservable?.value?.fold(
        (l) => TodoFlushBar(color: FlushBarColor.ERROR, message: l.message),
        (r) => tasksModel = r,
      ),
    );
  }

  void deleteTask(String? id) {
    deleteTasksObservable = iTaskRepository.deleteTask(id!).asObservable();

    deleteTasksObservable?.whenComplete(
      () => deleteTasksObservable?.value?.fold(
        (l) => null,
        (r) {
          getTasks();
          getResumeTasks();
        },
      ),
    );
  }
}
