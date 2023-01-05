import 'dart:convert';

import 'notes_model.dart';

MyNotesModel notesModelFromMap(String str) =>
    MyNotesModel.fromMap(json.decode(str));

// String notesModelToMap(MyNotesModel data) => json.decode(data.toMap());

class MyNotesModel {
  List<NoteModel>? myNotes;

  MyNotesModel({this.myNotes});

  MyNotesModel copyWith({List<NoteModel>? myNotes}) => MyNotesModel(
        myNotes: myNotes ?? this.myNotes,
      );

  factory MyNotesModel.fromMap(Map<String, dynamic> json) => MyNotesModel(
        myNotes: json["myNotes"] == null
            ? null
            : List<NoteModel>.from(
                json["myNotes"].map(
                  (x) => NoteModel.fromMap(x),
                ),
              ),
      );

  Map<String, dynamic> toMap() => {
        "myNotes": myNotes == null
            ? null
            : List<dynamic>.from(
                myNotes!.map(
                  (x) => x.toMap(),
                ),
              ),
      };
}
