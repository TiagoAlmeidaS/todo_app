class TaskInput {

  final String? title;
  final String? description;
  final String? dateInit;
  final String? dateEnd;
  final String? idProject;

  TaskInput({this.title, this.description, this.dateInit, this.dateEnd,
    this.idProject});

  TaskInput copyWith({
    String? title,
    String? description,
    String? dateInit,
    String? dateEnd,
    String? idProject,
  }) =>
      TaskInput(
        title: title ?? this.title,
        description: description ?? this.description,
        dateInit: dateInit ?? this.dateInit,
        dateEnd: dateEnd ?? this.dateEnd,
        idProject: idProject ?? this.idProject,
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

  Map<String, dynamic> toMap() => {
    "date_init": dateInit ?? "",
    "date_end": dateEnd ?? "",
    "title": title ?? "",
    "description": description ?? "",
    "id_project": idProject ?? "",
  };
}