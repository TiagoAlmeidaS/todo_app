import 'dart:convert';

NoteModel notesModelFromMap(String str) =>
    NoteModel.fromMap(json.decode(str));

// String notesModelToMap(NoteModel data) => json.decode(data.toMap());

class NoteModel {
  String? id;
  String? title;
  String? description;
  String? dateCreated;
  String? dateUpdate;

  NoteModel({this.id, this.title, this.description, this.dateCreated, this.dateUpdate});

  NoteModel copyWith({String? id, String? title, String? description, String? dateCreated, String? dateUpdate}) => NoteModel(
        id: id ?? this.id,
        description: description ?? this.description,
        title: title ?? this.title,
        dateCreated: dateCreated ?? this.dateCreated,
        dateUpdate: dateUpdate ?? this.dateUpdate,
      );

  factory NoteModel.fromMap(Map<String, dynamic> json) => NoteModel(
    id: json["id"] ?? "",
    description: json["description"] ?? "",
    title: json["title"] ?? "",
    dateCreated: json["date_created"] ?? "",
    dateUpdate: json["date_update"] ?? "",
  );

  Map<String, dynamic> toMap() => {
    "id": id ?? "",
    "description": description ?? "",
    "title": title ?? "",
    "date_created": dateCreated ?? "",
    "date_update": dateUpdate ?? "",
  };
}
