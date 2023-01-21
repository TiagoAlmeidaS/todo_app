// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasks_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TasksController on _TasksControllerBase, Store {
  Computed<dynamic>? _$dateNowFormmatedComputed;

  @override
  dynamic get dateNowFormmated => (_$dateNowFormmatedComputed ??=
          Computed<dynamic>(() => super.dateNowFormmated,
              name: '_TasksControllerBase.dateNowFormmated'))
      .value;

  late final _$fetchTasksObservableAtom =
      Atom(name: '_TasksControllerBase.fetchTasksObservable', context: context);

  @override
  ObservableFuture<Either<TasksFailure, TasksModel>?>?
      get fetchTasksObservable {
    _$fetchTasksObservableAtom.reportRead();
    return super.fetchTasksObservable;
  }

  @override
  set fetchTasksObservable(
      ObservableFuture<Either<TasksFailure, TasksModel>?>? value) {
    _$fetchTasksObservableAtom.reportWrite(value, super.fetchTasksObservable,
        () {
      super.fetchTasksObservable = value;
    });
  }

  late final _$tasksModelAtom =
      Atom(name: '_TasksControllerBase.tasksModel', context: context);

  @override
  TasksModel get tasksModel {
    _$tasksModelAtom.reportRead();
    return super.tasksModel;
  }

  @override
  set tasksModel(TasksModel value) {
    _$tasksModelAtom.reportWrite(value, super.tasksModel, () {
      super.tasksModel = value;
    });
  }

  late final _$fetchResumeTasksObservableAtom = Atom(
      name: '_TasksControllerBase.fetchResumeTasksObservable',
      context: context);

  @override
  ObservableFuture<Either<TasksFailure, TasksResumeModel>?>?
      get fetchResumeTasksObservable {
    _$fetchResumeTasksObservableAtom.reportRead();
    return super.fetchResumeTasksObservable;
  }

  @override
  set fetchResumeTasksObservable(
      ObservableFuture<Either<TasksFailure, TasksResumeModel>?>? value) {
    _$fetchResumeTasksObservableAtom
        .reportWrite(value, super.fetchResumeTasksObservable, () {
      super.fetchResumeTasksObservable = value;
    });
  }

  late final _$deleteTasksObservableAtom = Atom(
      name: '_TasksControllerBase.deleteTasksObservable', context: context);

  @override
  ObservableFuture<Either<TasksFailure, void>?>? get deleteTasksObservable {
    _$deleteTasksObservableAtom.reportRead();
    return super.deleteTasksObservable;
  }

  @override
  set deleteTasksObservable(
      ObservableFuture<Either<TasksFailure, void>?>? value) {
    _$deleteTasksObservableAtom.reportWrite(value, super.deleteTasksObservable,
        () {
      super.deleteTasksObservable = value;
    });
  }

  late final _$selectedAtom =
      Atom(name: '_TasksControllerBase.selected', context: context);

  @override
  DateTime get selected {
    _$selectedAtom.reportRead();
    return super.selected;
  }

  @override
  set selected(DateTime value) {
    _$selectedAtom.reportWrite(value, super.selected, () {
      super.selected = value;
    });
  }

  late final _$tasksByDayTasksObservableAtom = Atom(
      name: '_TasksControllerBase.tasksByDayTasksObservable', context: context);

  @override
  ObservableFuture<Either<TasksFailure, TasksModel>?>?
      get tasksByDayTasksObservable {
    _$tasksByDayTasksObservableAtom.reportRead();
    return super.tasksByDayTasksObservable;
  }

  @override
  set tasksByDayTasksObservable(
      ObservableFuture<Either<TasksFailure, TasksModel>?>? value) {
    _$tasksByDayTasksObservableAtom
        .reportWrite(value, super.tasksByDayTasksObservable, () {
      super.tasksByDayTasksObservable = value;
    });
  }

  late final _$tasksResumeModelAtom =
      Atom(name: '_TasksControllerBase.tasksResumeModel', context: context);

  @override
  TasksResumeModel get tasksResumeModel {
    _$tasksResumeModelAtom.reportRead();
    return super.tasksResumeModel;
  }

  @override
  set tasksResumeModel(TasksResumeModel value) {
    _$tasksResumeModelAtom.reportWrite(value, super.tasksResumeModel, () {
      super.tasksResumeModel = value;
    });
  }

  @override
  String toString() {
    return '''
fetchTasksObservable: ${fetchTasksObservable},
tasksModel: ${tasksModel},
fetchResumeTasksObservable: ${fetchResumeTasksObservable},
deleteTasksObservable: ${deleteTasksObservable},
selected: ${selected},
tasksByDayTasksObservable: ${tasksByDayTasksObservable},
tasksResumeModel: ${tasksResumeModel},
dateNowFormmated: ${dateNowFormmated}
    ''';
  }
}
