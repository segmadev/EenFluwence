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



// jucks

// Influencer influencerFromJson(String str) =>
//     Influencer.fromJson(json.decode(str));

// String influencerToJson(Influencer data) => json.encode(data.toJson());


// class Influencer {
//   bool isAdmin;
//   bool isInfluencer;
//   String avatar;
//   bool isVerified;
//   bool isSuspended;
//   bool isDeleted;
//   String id;
//   String email;
//   String username;

//   Influencer({
//     required this.isAdmin,
//     required this.isInfluencer,
//     required this.avatar,
//     required this.isVerified,
//     required this.isSuspended,
//     required this.isDeleted,
//     required this.id,
//     required this.email,
//     required this.username,
//   });

//   Influencer copyWith({
//     bool? isAdmin,
//     bool? isInfluencer,
//     String? avatar,
//     bool? isVerified,
//     bool? isSuspended,
//     bool? isDeleted,
//     String? id,
//     String? email,
//     String? username,
//   }) =>
//       Influencer(
//         isAdmin: isAdmin ?? this.isAdmin,
//         isInfluencer: isInfluencer ?? this.isInfluencer,
//         avatar: avatar ?? this.avatar,
//         isVerified: isVerified ?? this.isVerified,
//         isSuspended: isSuspended ?? this.isSuspended,
//         isDeleted: isDeleted ?? this.isDeleted,
//         id: id ?? this.id,
//         email: email ?? this.email,
//         username: username ?? this.username,
//       );

//   factory Influencer.fromJson(Map<String, dynamic> json) => Influencer(
//         isAdmin: json["isAdmin"],
//         isInfluencer: json["isInfluencer"],
//         avatar: json["avatar"],
//         isVerified: json["isVerified"],
//         isSuspended: json["isSuspended"],
//         isDeleted: json["isDeleted"],
//         id: json["_id"],
//         email: json["email"],
//         username: json["username"],
//       );

//   Map<String, dynamic> toJson() => {
//         "isAdmin": isAdmin,
//         "isInfluencer": isInfluencer,
//         "avatar": avatar,
//         "isVerified": isVerified,
//         "isSuspended": isSuspended,
//         "isDeleted": isDeleted,
//         "_id": id,
//         "email": email,
//         "username": username,
//       };

// }
