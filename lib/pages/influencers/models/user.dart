// To parse this JSON data, do
//
//     final influencer = influencerFromJson(jsonString);

import 'dart:convert';

import 'package:enfluwence/utills/local_storage/storage_utility.dart';

Influencer influencerFromJson(String str) =>
    Influencer.fromJson(json.decode(str));

String influencerToJson(Influencer data) => json.encode(data.toJson());
var storage = ALocalStorage();

class Influencer {
  bool isAdmin;
  bool isInfluencer;
  String avatar;
  bool isVerified;
  bool isSuspended;
  bool isDeleted;
  String id;
  String email;
  String username;

  Influencer({
    required this.isAdmin,
    required this.isInfluencer,
    required this.avatar,
    required this.isVerified,
    required this.isSuspended,
    required this.isDeleted,
    required this.id,
    required this.email,
    required this.username,
  });

  Influencer copyWith({
    bool? isAdmin,
    bool? isInfluencer,
    String? avatar,
    bool? isVerified,
    bool? isSuspended,
    bool? isDeleted,
    String? id,
    String? email,
    String? username,
  }) =>
      Influencer(
        isAdmin: isAdmin ?? this.isAdmin,
        isInfluencer: isInfluencer ?? this.isInfluencer,
        avatar: avatar ?? this.avatar,
        isVerified: isVerified ?? this.isVerified,
        isSuspended: isSuspended ?? this.isSuspended,
        isDeleted: isDeleted ?? this.isDeleted,
        id: id ?? this.id,
        email: email ?? this.email,
        username: username ?? this.username,
      );

  factory Influencer.fromJson(Map<String, dynamic> json) => Influencer(
        isAdmin: json["isAdmin"],
        isInfluencer: json["isInfluencer"],
        avatar: json["avatar"],
        isVerified: json["isVerified"],
        isSuspended: json["isSuspended"],
        isDeleted: json["isDeleted"],
        id: json["_id"],
        email: json["email"],
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
        "isAdmin": isAdmin,
        "isInfluencer": isInfluencer,
        "avatar": avatar,
        "isVerified": isVerified,
        "isSuspended": isSuspended,
        "isDeleted": isDeleted,
        "_id": id,
        "email": email,
        "username": username,
      };
  static final user = Influencer.fromJson(storage.readData("currentUser"));
}

class User {
  static Influencer user = Influencer.user;

  // static Map<String, dynamic> transaction = {

  // }
}
