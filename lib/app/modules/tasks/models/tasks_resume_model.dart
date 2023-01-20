class TasksResumeModel {
  final int? open;
  final int? process;
  final int? completed;

  TasksResumeModel({this.open, this.process, this.completed});

  TasksResumeModel copyWith({
    int? open,
    int? process,
    int? completed,
  }) =>
      TasksResumeModel(
        open: open ?? this.open,
        process: process ?? this.process,
        completed: completed ?? this.completed,
      );

  factory TasksResumeModel.fromMap(Map<String, dynamic> json) => TasksResumeModel(
    open: json["open"] ?? 0,
    process: json["process"] ?? 0,
    completed: json["completed"] ?? 0,
  );

  Map<String, dynamic> toMap() => {
    "open": open ?? 0,
    "process": process ?? 0,
    "completed": completed ?? 0,
  };
}