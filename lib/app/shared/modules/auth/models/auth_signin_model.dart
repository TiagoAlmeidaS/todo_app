import 'dart:convert';

AuthSignInModel authSignInModelFromMap(String str) =>
    AuthSignInModel.fromMap(json.decode(str));

String authSignInModelToMap(AuthSignInModel data) => json.encode(data.toMap());

class AuthSignInModel {
  AuthSignInModel({
    this.customerId,
    this.customerName,
    this.token,
    this.email,
  });

  String? customerId;
  String? token;
  String? email;
  String? customerName;

  AuthSignInModel copyWith({
    String? customerId,
    String? token,
    String? email,
    String? customerName,
  }) =>
      AuthSignInModel(
        customerId: customerId ?? this.customerId,
        token: token ?? this.token,
        email: email ?? this.email,
        customerName: customerName ?? this.customerName,
      );

  factory AuthSignInModel.fromMap(Map<String, dynamic> json) => AuthSignInModel(
        customerId: json["id"] ?? "",
        token: json["token"] ?? "",
        email: json["email"] ?? "",
        customerName: json["name"] ?? "",
      );

  Map<String, dynamic> toMap() => {
        "id": customerId ?? "",
        "token": token ?? "",
        "email": email ?? "",
        "name": customerName ?? "",
      };
}
