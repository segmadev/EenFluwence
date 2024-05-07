// To parse this JSON data, do
//
//     final task = taskFromJson(jsonString);

import 'dart:convert';

import 'package:enfluwence/utills/helpers/helper_functions.dart';
import 'package:get/get.dart';

Task taskFromJson(String str) => Task.fromJson(json.decode(str));

String taskToJson(Task data) => json.encode(data.toJson());

class Task {
  String? taskType;
  int totalNumberOfEngagements;
  int costPerEngagement;
  List<Caption>? captions;
  List<Question>? questions;

  static Task emptyTask() {
    return Task(
      taskType: "",
      totalNumberOfEngagements: 0,
      costPerEngagement: 0,
    );
  }

  Task({
    this.taskType,
    required this.totalNumberOfEngagements,
    required this.costPerEngagement,
    this.captions,
    this.questions,
  });

  Task copyWith({
    String? taskType,
    int? totalNumberOfEngagements,
    int? costPerEngagement,
    List<Caption>? captions,
    List<Question>? questions,
  }) =>
      Task(
        taskType: taskType ?? this.taskType,
        totalNumberOfEngagements:
            totalNumberOfEngagements ?? this.totalNumberOfEngagements,
        costPerEngagement: costPerEngagement ?? this.costPerEngagement,
        captions: captions ?? this.captions,
        questions: questions ?? this.questions,
      );

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        taskType: json["taskType"],
        totalNumberOfEngagements: json["totalNumberOfEngagements"],
        costPerEngagement: json["costPerEngagement"],
        captions: List<Caption>.from(
            json["captions"].map((x) => Caption.fromJson(x))),
        questions: List<Question>.from(
            json["questions"].map((x) => Question.fromJson(x))),
      );

  Map<String, dynamic> toJson() {
    if (taskType != "Social Media Campaign" && taskType != "Other Tasks") {
      return {
        "taskType": taskType,
        "totalNumberOfEngagements": totalNumberOfEngagements,
        "costPerEngagement": costPerEngagement,
      };
    } else if (taskType == "Social Media Campaign") {
      return {
        "taskType": taskType,
        "totalNumberOfEngagements": totalNumberOfEngagements,
        "costPerEngagement": costPerEngagement,
        "captions": (captions == null)
            ? null
            : List<dynamic>.from(captions!.map((x) => x.toJson())),
      };
    } else {
      // taskType == "Other Tasks"
      return {
        "taskType": taskType,
        "totalNumberOfEngagements": totalNumberOfEngagements,
        "costPerEngagement": costPerEngagement,
        "questions": (questions == null)
            ? null
            : List<dynamic>.from(questions!.map((x) => x.toJson())),
      };
    }
  }
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

class Question {
  String question;
  String answerType;
  List<Choice>? choices;

  Question({
    required this.question,
    required this.answerType,
    this.choices,
  });

  Question copyWith({
    String? question,
    String? answerType,
    List<Choice>? choices,
  }) =>
      Question(
        question: question ?? this.question,
        answerType: answerType ?? this.answerType,
        choices: choices ?? this.choices,
      );

  factory Question.fromJson(Map<String, dynamic> json) => Question(
        question: json["question"],
        answerType: json["answerType"],
        choices: json["choices"] == null
            ? []
            : List<Choice>.from(
                json["choices"]!.map((x) => Choice.fromJson(x))),
      );

  Map<String, dynamic> toJson() {
    if (answerType != "Multiple Choice") {
      return {
        "question": question,
        "answerType": answerType,
      };
    } else {
      return {
        "question": question,
        "answerType": answerType,
        "choices": (choices == null)
            ? null
            : List<dynamic>.from(choices!.map((x) => x.toJson())),
      };
    }
  }

  static Question emptyQuestion() {
    return Question(
        question: "",
        answerType: "",
        choices: <Choice>[Choice(text: ""), Choice(text: "")].obs);
  }
}

class Choice {
  int? index;
  String text;

  Choice({
    this.index,
    required this.text,
  });

  Choice copyWith({
    String? text,
  }) =>
      Choice(
        text: text ?? this.text,
      );

  factory Choice.fromJson(Map<String, dynamic> json) => Choice(
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
      };
}
