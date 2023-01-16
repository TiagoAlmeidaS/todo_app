import 'dart:convert';

SigninModel SigninModelFromMap(String str) =>
    SigninModel.fromMap(json.decode(str));

class SigninModel {
  String? email;
  String? password;

  SigninModel({this.email, this.password});

  SigninModel copyWith({String? email, String? password}) => SigninModel(
      email: email ?? this.email,
      password: password ?? this.password
  );

  factory SigninModel.fromMap(Map<String, dynamic> json) => SigninModel(
    email: json["email"] == null ? null : json["email"],
    password: json["password"] == null ? null : json["password"],
  );

  Map<String, dynamic> toMap() => {
    "email": email == null ? null : email,
    "password": password == null ? null : password,
  };
}

class SigninOutput {
  String? token;
  String? email;
  String? name;

  SigninOutput({this.token, this.email, this.name});

  SigninOutput copyWith({String? token, String? email, String? name}) => SigninOutput(
      token: token ?? this.token,
      email: email ?? this.email,
      name: name ?? this.name,
  );

  factory SigninOutput.fromMap(Map<String, dynamic> json) => SigninOutput(
    token: json["token"] == null ? null : json["token"],
    email: json["email"] == null ? null : json["email"],
    name: json["name"] == null ? null : json["name"],
  );

  Map<String, dynamic> toMap() => {
    "token": token == null ? null : token,
    "email": email == null ? null : email,
    "name": name == null ? null : name,
  };
}