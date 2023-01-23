class AuthenticationInput {
  final String? id;
  final String? name;
  final String? token;

  AuthenticationInput({this.id, this.name, this.token});

  AuthenticationInput copyWith({
    String? id,
    String? token,
    String? name,
  }) =>
      AuthenticationInput(
        id: id ?? this.id,
        token: token ?? this.token,
        name: name ?? this.name,
      );

  factory AuthenticationInput.fromMap(Map<String, dynamic> json) =>
      AuthenticationInput(
        id: json["id"] ?? "",
        token: json["token"] ?? "",
        name: json["name"] ?? "",
      );

  Map<String, dynamic> toMap() => {
        "id": id ?? "",
        "token": token ?? "",
        "name": name ?? "",
      };
}

class AuthenticationOutput {
  final String? token;

  AuthenticationOutput({this.token});

  AuthenticationOutput copyWith({
    String? token,
  }) =>
      AuthenticationOutput(
        token: token ?? this.token,
      );

  factory AuthenticationOutput.fromMap(Map<String, dynamic> json) =>
      AuthenticationOutput(
        token: json["token"] ?? "",
      );

  Map<String, dynamic> toMap() => {
        "token": token ?? "",
      };
}
