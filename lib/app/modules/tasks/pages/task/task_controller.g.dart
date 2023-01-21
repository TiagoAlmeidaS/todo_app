// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TaskController on _TaskControllerBase, Store {
  Computed<dynamic>? _$timerNowFormmatedComputed;

  @override
  dynamic get timerNowFormmated => (_$timerNowFormmatedComputed ??=
          Computed<dynamic>(() => super.timerNowFormmated,
              name: '_TaskControllerBase.timerNowFormmated'))
      .value;

  late final _$isToEditAtom =
      Atom(name: '_TaskControllerBase.isToEdit', context: context);

  @override
  bool get isToEdit {
    _$isToEditAtom.reportRead();
    return super.isToEdit;
  }

  @override
  set isToEdit(bool value) {
    _$isToEditAtom.reportWrite(value, super.isToEdit, () {
      super.isToEdit = value;
    });
  }

  late final _$taskModelAtom =
      Atom(name: '_TaskControllerBase.taskModel', context: context);

  @override
  TaskModel get taskModel {
    _$taskModelAtom.reportRead();
    return super.taskModel;
  }

  @override
  set taskModel(TaskModel value) {
    _$taskModelAtom.reportWrite(value, super.taskModel, () {
      super.taskModel = value;
    });
  }

  late final _$taskInputAtom =
      Atom(name: '_TaskControllerBase.taskInput', context: context);

  @override
  TaskInput get taskInput {
    _$taskInputAtom.reportRead();
    return super.taskInput;
  }

  @override
  set taskInput(TaskInput value) {
    _$taskInputAtom.reportWrite(value, super.taskInput, () {
      super.taskInput = value;
    });
  }

  late final _$saveTaskObservableAtom =
      Atom(name: '_TaskControllerBase.saveTaskObservable', context: context);

  @override
  ObservableFuture<Either<TasksFailure, void>?>? get saveTaskObservable {
    _$saveTaskObservableAtom.reportRead();
    return super.saveTaskObservable;
  }

  @override
  set saveTaskObservable(ObservableFuture<Either<TasksFailure, void>?>? value) {
    _$saveTaskObservableAtom.reportWrite(value, super.saveTaskObservable, () {
      super.saveTaskObservable = value;
    });
  }

  late final _$updateTaskObservableAtom =
      Atom(name: '_TaskControllerBase.updateTaskObservable', context: context);

  @override
  ObservableFuture<Either<TasksFailure, void>?>? get updateTaskObservable {
    _$updateTaskObservableAtom.reportRead();
    return super.updateTaskObservable;
  }

  @override
  set updateTaskObservable(
      ObservableFuture<Either<TasksFailure, void>?>? value) {
    _$updateTaskObservableAtom.reportWrite(value, super.updateTaskObservable,
        () {
      super.updateTaskObservable = value;
    });
  }

  late final _$deleteTaskObservableAtom =
      Atom(name: '_TaskControllerBase.deleteTaskObservable', context: context);

  @override
  ObservableFuture<Either<TasksFailure, void>?>? get deleteTaskObservable {
    _$deleteTaskObservableAtom.reportRead();
    return super.deleteTaskObservable;
  }

  @override
  set deleteTaskObservable(
      ObservableFuture<Either<TasksFailure, void>?>? value) {
    _$deleteTaskObservableAtom.reportWrite(value, super.deleteTaskObservable,
        () {
      super.deleteTaskObservable = value;
    });
  }

  late final _$dateInitModelAtom =
      Atom(name: '_TaskControllerBase.dateInitModel', context: context);

  @override
  DateTime? get dateInitModel {
    _$dateInitModelAtom.reportRead();
    return super.dateInitModel;
  }

  @override
  set dateInitModel(DateTime? value) {
    _$dateInitModelAtom.reportWrite(value, super.dateInitModel, () {
      super.dateInitModel = value;
    });
  }

  late final _$dateSeletedAtom =
      Atom(name: '_TaskControllerBase.dateSeleted', context: context);

  @override
  DateTime? get dateSeleted {
    _$dateSeletedAtom.reportRead();
    return super.dateSeleted;
  }

  @override
  set dateSeleted(DateTime? value) {
    _$dateSeletedAtom.reportWrite(value, super.dateSeleted, () {
      super.dateSeleted = value;
    });
  }

  late final _$isVisualizationAtom =
      Atom(name: '_TaskControllerBase.isVisualization', context: context);

  @override
  bool get isVisualization {
    _$isVisualizationAtom.reportRead();
    return super.isVisualization;
  }

  @override
  set isVisualization(bool value) {
    _$isVisualizationAtom.reportWrite(value, super.isVisualization, () {
      super.isVisualization = value;
    });
  }

  late final _$_TaskControllerBaseActionController =
      ActionController(name: '_TaskControllerBase', context: context);

  @override
  DateTime? toDateTime(String? str) {
    final _$actionInfo = _$_TaskControllerBaseActionController.startAction(
        name: '_TaskControllerBase.toDateTime');
    try {
      return super.toDateTime(str);
    } finally {
      _$_TaskControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  DateTime setDateEnd(DateTime time) {
    final _$actionInfo = _$_TaskControllerBaseActionController.startAction(
        name: '_TaskControllerBase.setDateEnd');
    try {
      return super.setDateEnd(time);
    } finally {
      _$_TaskControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  TodoTextInputMessage titleRulesOnChange(String? value) {
    final _$actionInfo = _$_TaskControllerBaseActionController.startAction(
        name: '_TaskControllerBase.titleRulesOnChange');
    try {
      return super.titleRulesOnChange(value);
    } finally {
      _$_TaskControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isToEdit: ${isToEdit},
taskModel: ${taskModel},
taskInput: ${taskInput},
saveTaskObservable: ${saveTaskObservable},
updateTaskObservable: ${updateTaskObservable},
deleteTaskObservable: ${deleteTaskObservable},
dateInitModel: ${dateInitModel},
dateSeleted: ${dateSeleted},
isVisualization: ${isVisualization},
timerNowFormmated: ${timerNowFormmated}
    ''';
  }
}
