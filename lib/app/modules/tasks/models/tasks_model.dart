import '../pages/task/models/tasks_model.dart';

class TasksModel {
  List<TaskModel>? tasks;
  final Resume? resume;

  TasksModel({this.tasks, this.resume});

  TasksModel copyWith({Resume? resume, List<TaskModel>? tasks}) => TasksModel(
    resume: resume ?? this.resume,
    tasks: tasks ?? this.tasks,
  );

  factory TasksModel.fromMap(Map<String, dynamic> json) => TasksModel(
    tasks: List<TaskModel>.from(json["tasks"].map((x) => TaskModel.fromMap(x))),
    resume: Resume.fromMap(json['resume']),
  );

  Map<String, dynamic> toMap() => {
    "tasks": List<dynamic>.from(tasks!.map((e) => e.toMap())),
    "resume": resume!.toMap(),
  };
}

class Resume {
  final String? backlog;
  final String? inProgress;
  final String? delayed;
  final String? completed;

  Resume({this.backlog, this.inProgress, this.delayed, this.completed});

  Resume copyWith({
    String? backlog,
    String? inProgress,
    String? delayed,
    String? completed,
  }) =>
      Resume(
        backlog: backlog ?? this.backlog,
        inProgress: inProgress ?? this.inProgress,
        delayed: delayed ?? this.delayed,
        completed: completed ?? this.completed,
      );

  factory Resume.fromMap(Map<String, dynamic> json) => Resume(
    backlog: json["backlog"] ?? null,
    inProgress: json["in_progress"] ?? null,
    delayed: json["delayed"] ?? null,
    completed: json["completed"] ?? null,
  );

  Map<String, dynamic> toMap() => {
    "backlog": backlog ?? null,
    "in_progress": inProgress ?? null,
    "delayed": delayed ?? null,
    "completed": completed ?? null,
  };
}
