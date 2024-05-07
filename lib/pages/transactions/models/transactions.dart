// To parse this JSON data, do
//
//     final transactions = transactionsFromJson(jsonString);

import 'dart:convert';

Transactions transactionsFromJson(String str) =>
    Transactions.fromJson(json.decode(str));

String transactionsToJson(Transactions data) => json.encode(data.toJson());

class Transactions {
  List<Transaction> transactions;

  Transactions({
    required this.transactions,
  });

  Transactions copyWith({
    List<Transaction>? transactions,
  }) =>
      Transactions(
        transactions: transactions ?? this.transactions,
      );

  factory Transactions.fromJson(Map<String, dynamic> json) => Transactions(
        transactions: List<Transaction>.from(
            json["transactions"].map((x) => Transaction.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "transactions": List<dynamic>.from(transactions.map((x) => x.toJson())),
      };
}

class Transaction {
  DateTime date;
  String time;
  String id;
  int amount;
  String from;
  String to;
  String type;
  String status;
  String description;
  String reference;

  Transaction({
    required this.date,
    required this.time,
    required this.id,
    required this.amount,
    required this.from,
    required this.to,
    required this.type,
    required this.status,
    required this.description,
    required this.reference,
  });

  Transaction copyWith({
    DateTime? date,
    String? time,
    String? id,
    int? amount,
    String? from,
    String? to,
    String? type,
    String? status,
    String? description,
    String? reference,
  }) =>
      Transaction(
        date: date ?? this.date,
        time: time ?? this.time,
        id: id ?? this.id,
        amount: amount ?? this.amount,
        from: from ?? this.from,
        to: to ?? this.to,
        type: type ?? this.type,
        status: status ?? this.status,
        description: description ?? this.description,
        reference: reference ?? this.reference,
      );

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        date: DateTime.parse(json["date"]),
        time: json["time"],
        id: json["_id"],
        amount: json["amount"],
        from: json["from"],
        to: json["to"],
        type: json["type"],
        status: json["status"],
        description: json["description"],
        reference: json["reference"],
      );

  Map<String, dynamic> toJson() => {
        "date": date.toIso8601String(),
        "time": time,
        "_id": id,
        "amount": amount,
        "from": from,
        "to": to,
        "type": type,
        "status": status,
        "description": description,
        "reference": reference,
      };
}

class Transactionss {
  static List getTrans() {
    var recent = [
      {
        "id": 1,
        "icon":
            "https://freelogopng.com/images/all_img/1690643640twitter-x-icon-png.png",
        "title": "Twitter Campaign",
        "description": "Debit your account for Twitter Campaign",
        "amount": 3000,
        "type": "debit",
        "date": 1713260337,
      },
      {
        "id": 2,
        "icon":
            "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e7/Instagram_logo_2016.svg/2048px-Instagram_logo_2016.svg.png",
        "title": "Instagram Campaign",
        "description": "Debit your account for Instagram Campaign",
        "amount": 2000,
        "type": "credit",
        "date": 1713260337,
      },
      {
        "id": 2,
        "icon":
            "https://www.iconpacks.net/icons/2/free-youtube-logo-icon-2431-thumb.png",
        "title": "Youtube Campaign",
        "description": "Debit your account for Youtube Campaign",
        "amount": 200,
        "type": "debit",
        "date": 1713260337,
      },
    ];
    return recent;
  }
}
