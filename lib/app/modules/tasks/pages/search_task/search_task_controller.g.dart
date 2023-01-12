// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_task_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SearchTaskController on _SearchTaskControllerBase, Store {
  late final _$fetchTasksObservableAtom = Atom(
      name: '_SearchTaskControllerBase.fetchTasksObservable', context: context);

  @override
  ObservableFuture<Either<TasksFailure, TasksModel>>? get fetchTasksObservable {
    _$fetchTasksObservableAtom.reportRead();
    return super.fetchTasksObservable;
  }

  @override
  set fetchTasksObservable(
      ObservableFuture<Either<TasksFailure, TasksModel>>? value) {
    _$fetchTasksObservableAtom.reportWrite(value, super.fetchTasksObservable,
        () {
      super.fetchTasksObservable = value;
    });
  }

  late final _$tasksModelAtom =
      Atom(name: '_SearchTaskControllerBase.tasksModel', context: context);

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

  @override
  String toString() {
    return '''
fetchTasksObservable: ${fetchTasksObservable},
tasksModel: ${tasksModel}
    ''';
  }
}
