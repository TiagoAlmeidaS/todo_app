import 'dart:convert';

SignupModel signupModelFromMap(String str) =>
    SignupModel.fromMap(json.decode(str));

class SignupModel {
  String? name;
  String? email;
  String? password;

  SignupModel({this.name, this.email, this.password});

  SignupModel copyWith({String? name, String? email, String? password}) =>
      SignupModel(
          name: name ?? this.name,
          email: email ?? this.email,
          password: password ?? this.password);

  factory SignupModel.fromMap(Map<String, dynamic> json) => SignupModel(
        name: json["name"] == null ? null : json["name"],
        email: json["email"] == null ? null : json["email"],
        password: json["password"] == null ? null : json["password"],
      );

  Map<String, dynamic> toMap() => {
        "name": name == null ? null : name,
        "email": email == null ? null : email,
        "password": password == null ? null : password,
      };
}

class SignupOutput {
  String? token;
  String? id;
  String? email;
  String? name;

  SignupOutput({this.token, this.id, this.email, this.name});

  SignupOutput copyWith(
          {String? token, String? id, String? email, String? name}) =>
      SignupOutput(
        token: token ?? this.token,
        email: email ?? this.email,
        id: id ?? this.id,
        name: name ?? this.name,
      );

  factory SignupOutput.fromMap(Map<String, dynamic> json) => SignupOutput(
        token: json["token"] == null ? null : json["token"],
        id: json["id"] == null ? null : json["id"],
        email: json["email"] == null ? null : json["email"],
        name: json["name"] == null ? null : json["name"],
      );

  Map<String, dynamic> toMap() => {
        "token": token == null ? null : token,
        "id": id == null ? null : id,
        "email": email == null ? null : email,
        "name": name == null ? null : name,
      };
}
