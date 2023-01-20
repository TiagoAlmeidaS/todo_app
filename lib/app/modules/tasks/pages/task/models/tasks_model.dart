import 'dart:convert';

TaskModel taskModelFromMap(String str) => TaskModel.fromMap(json.decode(str));

class TaskModel {
  final String? id;
  final String? idUser;
  final String? dateInit;
  final String? dateEnd;
  final String? title;
  final String? description;
  final String? status;
  final String? idProject;
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
    this.idProject,
  });

  TaskModel copyWith({
    String? id,
    String? idUser,
    String? dateInit,
    String? dateEnd,
    String? title,
    String? description,
    String? status,
    TaskStatus? statusTask,
    String? idProject
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
        idProject: idProject ?? this.idProject,
      );

  factory TaskModel.fromMap(Map<String, dynamic> json) {
    TaskStatus? statusTask;
    if (json["status"] != null) {
      var status = json["status"];
      switch (status) {
        case "OPEN":
          statusTask = TaskStatus.OPEN;
          break;
        case "PROCESS":
          statusTask = TaskStatus.PROCESS;
          break;
        case "COMPLETED":
          statusTask = TaskStatus.COMPLETED;
          break;
        default:
          statusTask = TaskStatus.OPEN;
          break;
      }
    }
    return TaskModel(
      id: json["id"] ?? "",
      idUser: json["id_user"] ?? "",
      dateInit: json["date_init"] ?? "",
      dateEnd: json["date_end"] ?? "",
      title: json["title"] ?? "",
      description: json["description"] ?? "",
      status: json["status"] ?? "",
      idProject: json["id_project"] ?? "",
      statusTask: statusTask,
    );
  }

  Map<String, dynamic> toMap() => {
        "id": id ?? "",
        "id_user": idUser ?? "",
        "date_init": dateInit ?? "",
        "date_end": dateEnd ?? "",
        "title": title ?? "",
        "description": description ?? "",
        "status": status ?? "",
        "id_project": status ?? "",
      };
}

enum TaskStatus { OPEN, PROCESS, COMPLETED }
