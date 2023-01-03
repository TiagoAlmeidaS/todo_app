import 'dart:convert';

NotesModel notesModelFromMap(String str) =>
    NotesModel.fromMap(json.decode(str));

// String notesModelToMap(NotesModel data) => json.decode(data.toMap());

class NotesModel {
  int? id;
  String? title;
  String? body;

  NotesModel({this.id, this.title, this.body});

  NotesModel copyWith({int? id, String? title, String? body}) => NotesModel(
        id: id ?? this.id,
        body: body ?? this.body,
        title: title ?? this.title,
      );

  factory NotesModel.fromMap(Map<String, dynamic> json) => NotesModel(
    id: json["id"] == null ? null : json["id"],
    body: json["body"] == null ? null : json["body"],
    title: json["title"] == null ? null : json["title"],
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "body": body == null ? null : body,
    "title": title == null ? null : title,
  };
}
