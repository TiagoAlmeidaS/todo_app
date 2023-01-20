import '../pages/task/models/tasks_model.dart';

class TasksModel {
  List<TaskModel>? tasks;

  TasksModel({this.tasks});

  TasksModel copyWith({List<TaskModel>? tasks}) => TasksModel(
    tasks: tasks ?? this.tasks,
  );

  factory TasksModel.fromMap(Map<String, dynamic> json) => TasksModel(
    tasks: List<TaskModel>.from(json["tasks"].map((x) => TaskModel.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "tasks": List<dynamic>.from(tasks!.map((e) => e.toMap())),
  };
}


