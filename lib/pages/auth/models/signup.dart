// To parse this JSON data, do
//
//     final signUp = signUpFromJson(jsonString);

import 'dart:convert';

SignUp signUpFromJson(String str) => SignUp.fromJson(json.decode(str));

String signUpToJson(SignUp data) => json.encode(data.toJson());

class SignUp {
  String email;
  String username;
  String password;

  SignUp({
    required this.email,
    required this.username,
    required this.password,
  });

  SignUp copyWith({
    String? email,
    String? username,
    String? password,
  }) =>
      SignUp(
        email: email ?? this.email,
        username: username ?? this.username,
        password: password ?? this.password,
      );

  factory SignUp.fromJson(Map<String, dynamic> json) => SignUp(
        email: json["email"],
        username: json["username"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "username": username,
        "password": password,
      };
}
