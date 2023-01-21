import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:todo_app/app/modules/tasks/errors/tasks_errors.dart';
import 'package:todo_app/app/modules/tasks/pages/task/interfaces/task_repository_interface.dart';
import 'package:todo_app/app/modules/tasks/pages/task/models/task_input.dart';
import 'package:todo_app/app/modules/tasks/pages/task/models/tasks_model.dart';
import 'package:todo_app/app/shared/utils/utils.dart';

import '../../../../shared/business/rules_generics.dart';
import '../../../components/todo_text_form_field/todo_text_form_field_message.dart';
import '../../tasks_controller.dart';

part 'task_controller.g.dart';

@Injectable()
class TaskController = _TaskControllerBase with _$TaskController;

abstract class _TaskControllerBase with Store {
  final ITaskRepository iTaskRepository;
  final TasksController tasksController;

  _TaskControllerBase(this.iTaskRepository, this.tasksController);

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @observable
  bool isToEdit = false;

  @observable
  TaskModel taskModel = TaskModel();

  @observable
  TaskInput taskInput = TaskInput();

  @observable
  ObservableFuture<Either<TasksFailure, void>?>? saveTaskObservable;

  @observable
  ObservableFuture<Either<TasksFailure, void>?>? updateTaskObservable;

  @observable
  ObservableFuture<Either<TasksFailure, void>?>? deleteTaskObservable;

  @computed
  get timerNowFormmated => Utils.dateNowFormmated();

  @action
  DateTime? toDateTime(String? str) {
    if (str?.isEmpty ?? false) {
      return DateTime.now();
    }
    return DateTime.parse(str!);
  }

  @observable
  DateTime? dateInitModel = DateTime.now();

  @observable
  DateTime? dateSeleted;

  @observable
  bool isVisualization = false;

  @action
  DateTime setDateEnd(DateTime time) {
    dateSeleted = time;
    return time;
  }

  @action
  TodoTextInputMessage titleRulesOnChange(String? value) {
    if (RulesGenerics.stringEmpty(value)) {
      return TodoTextInputMessage.error("O campo está vazio");
    }

    taskModel = taskModel.copyWith(title: value);

    return TodoTextInputMessage.none;
  }

  initTaskModel(TaskModel? taskModel, bool? isView) {
    isVisualization = isView ?? false;
    dateInitModel =
        DateTime.parse(taskModel?.dateEnd ?? DateTime.now().toString());
    titleController.text = taskModel?.title ?? "";
    descriptionController.text = taskModel?.description ?? "";
  }

  deleteTask() {
    deleteTaskObservable =
        iTaskRepository.deleteTask(taskModel.id!).asObservable();

    deleteTaskObservable?.whenComplete(
      () => deleteTaskObservable?.value?.fold(
        (l) => null,
        (r) => null,
      ),
    );
  }

  updateTask() {}

  saveTask() {
    taskInput = taskInput.copyWith(
      title: taskModel.title,
      description: descriptionController.text,
      idProject: taskModel.idProject,
      dateEnd: dateSeleted.toString(),
      dateInit: DateTime.now().toString(),
    );

    saveTaskObservable = iTaskRepository.newTask(taskInput).asObservable();

    saveTaskObservable?.whenComplete(
      () => saveTaskObservable?.value?.fold(
        (l) => null,
        (r) => tasksController.getTasks(),
      ),
    );
  }

  completedTask() {}
}
