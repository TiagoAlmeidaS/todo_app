import 'dart:convert';

TaskModel taskModelFromMap(String str) => TaskModel.fromMap(json.decode(str));

// String notesModelToMap(TaskModel data) => json.decode(data.toMap());

class TaskModel {
  final int? id;
  final int? idUser;
  final int? dateInit;
  final int? dateEnd;
  final String? title;
  final String? description;
  final int? status;
  final TaskStatus? statusTask;

  TaskModel({
    this.id,
    this.idUser,
    this.dateInit,
    this.dateEnd,
    this.title,
    this.description,
    this.status,
    this.statusTask,
  });

  TaskModel copyWith({
    int? id,
    int? idUser,
    int? dateInit,
    int? dateEnd,
    String? title,
    String? description,
    int? status,
    TaskStatus? statusTask,
  }) =>
      TaskModel(
        id: id ?? this.id,
        idUser: idUser ?? this.idUser,
        dateInit: dateInit ?? this.dateInit,
        dateEnd: dateEnd ?? this.dateEnd,
        title: title ?? this.title,
        description: description ?? this.description,
        status: status ?? this.status,
        statusTask: statusTask ?? this.statusTask,
      );

  factory TaskModel.fromMap(Map<String, dynamic> json) {
    TaskStatus? statusTask;
    if (json["status"] != null) {
      var status = json["status"];
      switch (status) {
        case 0:
          statusTask = TaskStatus.OPEN;
          break;
        case 1:
          statusTask = TaskStatus.PROCESS;
          break;
        case 2:
          statusTask = TaskStatus.DELAYED;
          break;
        case 3:
          statusTask = TaskStatus.COMPLETED;
          break;
        default:
          statusTask = TaskStatus.OPEN;
          break;
      }
    }
    return TaskModel(
      id: json["id"] ?? null,
      idUser: json["idUser"] ?? null,
      dateInit: json["date_init"] ?? null,
      dateEnd: json["date_end"] ?? null,
      title: json["title"] ?? null,
      description: json["description"] ?? null,
      status: json["status"] ?? null,
      statusTask: statusTask,
    );
  }

  Map<String, dynamic> toMap() => {
        "id": id ?? null,
        "idUser": idUser ?? null,
        "date_init": dateInit ?? null,
        "date_end": dateEnd ?? null,
        "title": title ?? null,
        "description": description ?? null,
        "status": status ?? null,
      };
}

enum TaskStatus { OPEN, PROCESS, DELAYED, COMPLETED }
