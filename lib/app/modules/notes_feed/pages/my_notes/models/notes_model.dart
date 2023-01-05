import 'dart:convert';

NoteModel notesModelFromMap(String str) =>
    NoteModel.fromMap(json.decode(str));

// String notesModelToMap(NoteModel data) => json.decode(data.toMap());

class NoteModel {
  int? id;
  String? title;
  String? description;
  int? createAt;

  NoteModel({this.id, this.title, this.description, this.createAt});

  NoteModel copyWith({int? id, String? title, String? description, int? createAt}) => NoteModel(
        id: id ?? this.id,
        description: description ?? this.description,
        title: title ?? this.title,
        createAt: createAt ?? this.createAt
      );

  factory NoteModel.fromMap(Map<String, dynamic> json) => NoteModel(
    id: json["id"] == null ? null : json["id"],
    description: json["description"] == null ? null : json["description"],
    title: json["title"] == null ? null : json["title"],
    createAt: json["createAt"] == null ? null : json["createAt"],
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "description": description == null ? null : description,
    "title": title == null ? null : title,
    "createAt": createAt == null ? null : createAt,
  };
}
