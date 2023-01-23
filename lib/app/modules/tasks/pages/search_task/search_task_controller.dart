import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:todo_app/app/modules/tasks/interfaces/tasks_repository_interface.dart';
import 'package:todo_app/app/shared/modules/auth/store/auth_store.dart';

import '../../../components/todo_text_form_field/todo_text_form_field_message.dart';
import '../../errors/tasks_errors.dart';
import '../../models/tasks_model.dart';
import 'interfaces/search_repository_interface.dart';

part 'search_task_controller.g.dart';

@Injectable()
class SearchTaskController = _SearchTaskControllerBase
    with _$SearchTaskController;

abstract class _SearchTaskControllerBase with Store {
  ITasksRepository iTasksRepository;
  ISearchRepository iSearchRepository;

  _SearchTaskControllerBase(this.iTasksRepository, this.iSearchRepository) {
    fetchTasks();
  }

  @observable
  ObservableFuture<Either<TasksFailure, TasksModel>>? fetchTasksObservable;

  @observable
  TasksModel tasksModel = TasksModel();

  @action
  TodoTextInputMessage searchRulesOnLeave(String? str) {
    searchTasks(str);
    return TodoTextInputMessage.none;
  }

  fetchTasks() async {
    fetchTasksObservable = iTasksRepository
        .fetchTasks(Modular.get<AuthStore>().customerId)
        .asObservable();

    await fetchTasksObservable?.whenComplete(() => {
          fetchTasksObservable?.value?.fold((l) => null, (r) => tasksModel = r)
        });
  }

  searchTasks(String? searchTasks) async {
    fetchTasksObservable =
        iSearchRepository.searchTask(searchTasks ?? "").asObservable();

    fetchTasksObservable?.whenComplete(
      () => fetchTasksObservable?.value?.fold(
        (l) => null,
        (r) => tasksModel,
      ),
    );
  }
}
