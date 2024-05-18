// To parse this JSON data, do
//
//     final tasksList = tasksListFromJson(jsonString);

import 'dart:convert';

import 'package:enfluwence/pages/general/models/user.dart';

class TasksList {
  int engagements;
  bool isPaid;
  int views;
  bool isCompleted;
  String id;
  User influencer;
  Type type;
  bool isCampaign;
  int totalNumberOfEngagements;
  int costPerEngagement;
  int totalCost;
  DateTime createdAt;
  DateTime updatedAt;

  TasksList({
    required this.engagements,
    required this.isPaid,
    required this.views,
    required this.isCompleted,
    required this.id,
    required this.influencer,
    required this.type,
    required this.isCampaign,
    required this.totalNumberOfEngagements,
    required this.costPerEngagement,
    required this.totalCost,
    required this.createdAt,
    required this.updatedAt,
  });

  static List<TasksList> tasksListFromJson(String str) =>
      List<TasksList>.from(json.decode(str).map((x) => TasksList.fromJson(x)));

  static String tasksListToJson(List<TasksList> data) =>
      json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

  TasksList copyWith({
    int? engagements,
    bool? isPaid,
    int? views,
    bool? isCompleted,
    String? id,
    User? influencer,
    Type? type,
    bool? isCampaign,
    int? totalNumberOfEngagements,
    int? costPerEngagement,
    int? totalCost,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      TasksList(
        engagements: engagements ?? this.engagements,
        isPaid: isPaid ?? this.isPaid,
        views: views ?? this.views,
        isCompleted: isCompleted ?? this.isCompleted,
        id: id ?? this.id,
        influencer: influencer ?? this.influencer,
        type: type ?? this.type,
        isCampaign: isCampaign ?? this.isCampaign,
        totalNumberOfEngagements:
            totalNumberOfEngagements ?? this.totalNumberOfEngagements,
        costPerEngagement: costPerEngagement ?? this.costPerEngagement,
        totalCost: totalCost ?? this.totalCost,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory TasksList.fromJson(Map<String, dynamic> json) => TasksList(
        engagements: json["engagements"],
        isPaid: json["isPaid"],
        views: json["views"],
        isCompleted: json["isCompleted"],
        id: json["_id"],
        influencer: User.fromJson(json["influencer"]),
        type: Type.fromJson(json["type"]),
        isCampaign: json["isCampaign"],
        totalNumberOfEngagements: json["totalNumberOfEngagements"],
        costPerEngagement: json["costPerEngagement"],
        totalCost: json["totalCost"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "engagements": engagements,
        "isPaid": isPaid,
        "views": views,
        "isCompleted": isCompleted,
        "_id": id,
        "influencer": influencer.toJson(),
        "type": type.toJson(),
        "isCampaign": isCampaign,
        "totalNumberOfEngagements": totalNumberOfEngagements,
        "costPerEngagement": costPerEngagement,
        "totalCost": totalCost,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}

class Type {
  String id;
  String name;
  int v;

  Type({
    required this.id,
    required this.name,
    required this.v,
  });

  Type copyWith({
    String? id,
    String? name,
    int? v,
  }) =>
      Type(
        id: id ?? this.id,
        name: name ?? this.name,
        v: v ?? this.v,
      );

  factory Type.fromJson(Map<String, dynamic> json) => Type(
        id: json["_id"],
        name: json["name"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "__v": v,
      };
}
