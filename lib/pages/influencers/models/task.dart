// To parse this JSON data, do
//
//     final task = taskFromJson(jsonString);

import 'dart:convert';

Task taskFromJson(String str) => Task.fromJson(json.decode(str));

String taskToJson(Task data) => json.encode(data.toJson());

class Task {
  String? taskType;
  int? totalNumberOfEngagements;
  int? costPerEngagement;
  List<Caption>? captions;

  Task({
    this.taskType,
    this.totalNumberOfEngagements,
    this.costPerEngagement,
    this.captions,
  });
  static Task emptyTask() {
    return Task(
      taskType: "",
      totalNumberOfEngagements: 0,
      costPerEngagement: 0,
      captions: null,
    );
  }

  Task copyWith({
    String? taskType,
    int? totalNumberOfEngagements,
    int? costPerEngagement,
    List<Caption>? captions,
  }) =>
      Task(
        taskType: taskType ?? this.taskType,
        totalNumberOfEngagements:
            totalNumberOfEngagements ?? this.totalNumberOfEngagements,
        costPerEngagement: costPerEngagement ?? this.costPerEngagement,
        captions: captions ?? this.captions,
      );

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        taskType: json["taskType"],
        totalNumberOfEngagements: json["totalNumberOfEngagements"],
        costPerEngagement: json["costPerEngagement"],
        captions: List<Caption>.from(
            json["captions"].map((x) => Caption.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "taskType": taskType,
        "totalNumberOfEngagements": totalNumberOfEngagements,
        "costPerEngagement": costPerEngagement,
        "captions": captions == null
            ? {}
            : List<dynamic>.from(captions!.map((x) => x.toJson())),
      };
}

class Caption {
  int? index;
  String? socialMedia;
  String? text;
  String? url;

  Caption({
    this.index,
    this.socialMedia,
    this.text,
    this.url,
  });

  static Caption emptyCaption() {
    return Caption(
      socialMedia: "",
      text: "",
      url: "",
    );
  }

  Caption copyWith({
    String? socialMedia,
    String? text,
    String? url,
  }) =>
      Caption(
        socialMedia: socialMedia ?? this.socialMedia,
        text: text ?? this.text,
        url: url ?? this.url,
      );

  factory Caption.fromJson(Map<String, dynamic> json) => Caption(
        socialMedia: json["socialMedia"],
        text: json["text"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "socialMedia": socialMedia,
        "text": text,
        "url": url,
      };
}
