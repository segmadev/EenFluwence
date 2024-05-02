// To parse this JSON data, do
//
//     final verifyEmail = verifyEmailFromJson(jsonString);

import 'dart:convert';

VerifyEmail verifyEmailFromJson(String str) => VerifyEmail.fromJson(json.decode(str));

String verifyEmailToJson(VerifyEmail data) => json.encode(data.toJson());

class VerifyEmail {
    String email;
    String code;

    VerifyEmail({
        required this.email,
        required this.code,
    });

    VerifyEmail copyWith({
        String? email,
        String? code,
    }) => 
        VerifyEmail(
            email: email ?? this.email,
            code: code ?? this.code,
        );

    factory VerifyEmail.fromJson(Map<String, dynamic> json) => VerifyEmail(
        email: json["email"],
        code: json["code"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "code": code,
    };
}
