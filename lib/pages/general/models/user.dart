// To parse this JSON data, do
//
//     final influencer = influencerFromJson(jsonString);

import 'dart:convert';

import 'package:enfluwence/utills/local_storage/storage_utility.dart';

var storage = ALocalStorage();
User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  bool isAdmin;
  bool isInfluencer;
  String avatar;
  bool isVerified;
  bool isSuspended;
  bool isDeleted;
  String id;
  String email;
  String username;
  String? address;
  String? country;
  String? facebook;
  String? instagram;
  String? name;
  String? phoneNumber;
  String? state;
  String? twitter;
  String? whatsapp;

  User({
    required this.isAdmin,
    required this.isInfluencer,
    required this.avatar,
    required this.isVerified,
    required this.isSuspended,
    required this.isDeleted,
    required this.id,
    required this.email,
    required this.username,
    this.address,
    this.country,
    this.facebook,
    this.instagram,
    this.name,
    this.phoneNumber,
    this.state,
    this.twitter,
    this.whatsapp,
  });

  User copyWith({
    bool? isAdmin,
    bool? isInfluencer,
    String? avatar,
    bool? isVerified,
    bool? isSuspended,
    bool? isDeleted,
    String? id,
    String? email,
    String? username,
    String? address,
    String? country,
    String? facebook,
    String? instagram,
    String? name,
    String? phoneNumber,
    String? state,
    String? twitter,
    String? whatsapp,
  }) =>
      User(
        isAdmin: isAdmin ?? this.isAdmin,
        isInfluencer: isInfluencer ?? this.isInfluencer,
        avatar: avatar ?? this.avatar,
        isVerified: isVerified ?? this.isVerified,
        isSuspended: isSuspended ?? this.isSuspended,
        isDeleted: isDeleted ?? this.isDeleted,
        id: id ?? this.id,
        email: email ?? this.email,
        username: username ?? this.username,
        address: address ?? this.address,
        country: country ?? this.country,
        facebook: facebook ?? this.facebook,
        instagram: instagram ?? this.instagram,
        name: name ?? this.name,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        state: state ?? this.state,
        twitter: twitter ?? this.twitter,
        whatsapp: whatsapp ?? this.whatsapp,
      );

  factory User.fromJson(Map<String, dynamic> json) => User(
        isAdmin: json["isAdmin"],
        isInfluencer: json["isInfluencer"],
        avatar: json["avatar"],
        isVerified: json["isVerified"],
        isSuspended: json["isSuspended"],
        isDeleted: json["isDeleted"],
        id: json["_id"],
        email: json["email"],
        username: json["username"],
        address: json["address"],
        country: json["country"],
        facebook: json["facebook"],
        instagram: json["instagram"],
        name: json["name"],
        phoneNumber: json["phoneNumber"],
        state: json["state"],
        twitter: json["twitter"],
        whatsapp: json["whatsapp"],
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
        "address": address,
        "country": country,
        "facebook": facebook,
        "instagram": instagram,
        "name": name,
        "phoneNumber": phoneNumber,
        "state": state,
        "twitter": twitter,
        "whatsapp": whatsapp,
      };

  static final user = User.fromJson(storage.readData("currentUser"));
}

// To parse this JSON data, do
//
//     final userUpdate = userUpdateFromJson(jsonString);

UserUpdate userUpdateFromJson(String str) =>
    UserUpdate.fromJson(json.decode(str));

String userUpdateToJson(UserUpdate data) => json.encode(data.toJson());

class UserUpdate {
  String? avatar;
  String name;
  String phoneNumber;
  String address;
  String state;
  String country;
  String facebook;
  String whatsapp;
  String twitter;
  String instagram;

  UserUpdate({
    this.avatar = "",
    required this.name,
    required this.phoneNumber,
    required this.address,
    required this.state,
    required this.country,
    required this.facebook,
    required this.whatsapp,
    required this.twitter,
    required this.instagram,
  });

  UserUpdate copyWith({
    String? avatar,
    String? name,
    String? phoneNumber,
    String? address,
    String? state,
    String? country,
    String? facebook,
    String? whatsapp,
    String? twitter,
    String? instagram,
  }) =>
      UserUpdate(
        avatar: avatar ?? this.avatar,
        name: name ?? this.name,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        address: address ?? this.address,
        state: state ?? this.state,
        country: country ?? this.country,
        facebook: facebook ?? this.facebook,
        whatsapp: whatsapp ?? this.whatsapp,
        twitter: twitter ?? this.twitter,
        instagram: instagram ?? this.instagram,
      );

  factory UserUpdate.fromJson(Map<String, dynamic> json) => UserUpdate(
        avatar: json["avatar"],
        name: json["name"],
        phoneNumber: json["phoneNumber"],
        address: json["address"],
        state: json["state"],
        country: json["country"],
        facebook: json["facebook"],
        whatsapp: json["whatsapp"],
        twitter: json["twitter"],
        instagram: json["instagram"],
      );

  Map<String, dynamic> toJson() => {
        "avatar": avatar,
        "name": name,
        "phoneNumber": phoneNumber,
        "address": address,
        "state": state,
        "country": country,
        "facebook": facebook,
        "whatsapp": whatsapp,
        "twitter": twitter,
        "instagram": instagram,
      };

  static UserUpdate empty() {
    return UserUpdate(
        name: "",
        phoneNumber: "",
        address: "",
        state: "",
        country: "",
        facebook: "",
        whatsapp: "",
        twitter: "",
        instagram: "");
  }
}
