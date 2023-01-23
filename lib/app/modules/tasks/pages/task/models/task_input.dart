class TaskInput {

  final String? title;
  final String? description;
  final String? dateInit;
  final String? dateEnd;
  final String? idProject;
  final String? status;

  TaskInput({this.title, this.description, this.dateInit, this.dateEnd,
    this.idProject, this.status});

  TaskInput copyWith({
    String? title,
    String? description,
    String? dateInit,
    String? dateEnd,
    String? idProject,
    String? status,
  }) =>
      TaskInput(
        title: title ?? this.title,
        description: description ?? this.description,
        dateInit: dateInit ?? this.dateInit,
        dateEnd: dateEnd ?? this.dateEnd,
        idProject: idProject ?? this.idProject,
        status: status ?? this.status,
      );

  factory TaskInput.fromMap(Map<String, dynamic> json) {
    return TaskInput(
      dateInit: json["date_init"] ?? "",
      dateEnd: json["date_end"] ?? "",
      title: json["title"] ?? "",
      description: json["description"] ?? "",
      idProject: json["id_project"] ?? "",
    );
  }

  Map<String, dynamic> toMapSave() => {
    "date_init": dateInit ?? "",
    "date_end": dateEnd ?? "",
    "title": title ?? "",
    "description": description ?? "",
    "id_project": idProject ?? "",
  };

  Map<String, dynamic> toMapEdit() => {
    "date_init": dateInit ?? "",
    "date_end": dateEnd ?? "",
    "title": title ?? "",
    "description": description ?? "",
    "id_project": idProject ?? "",
    "status": status ?? "",
  };
}