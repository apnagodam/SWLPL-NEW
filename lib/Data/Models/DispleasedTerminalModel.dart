// To parse this JSON data, do
//
//     final displeasedTerminalModel = displeasedTerminalModelFromMap(jsonString);

import 'dart:convert';

DispleasedTerminalModel displeasedTerminalModelFromMap(String str) => DispleasedTerminalModel.fromMap(json.decode(str));

String displeasedTerminalModelToMap(DispleasedTerminalModel data) => json.encode(data.toMap());

class DispleasedTerminalModel {
  List<Datum>? data;
  String? status;
  String? message;

  DispleasedTerminalModel({
    this.data,
    this.status,
    this.message,
  });

  factory DispleasedTerminalModel.fromMap(Map<String, dynamic> json) => DispleasedTerminalModel(
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromMap(x))),
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toMap() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
    "status": status,
    "message": message,
  };
}

class Datum {
  String? fname;
  dynamic userId;

  Datum({
    this.fname,
    this.userId,
  });

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
    fname: json["fname"],
    userId: json["user_id"],
  );

  Map<String, dynamic> toMap() => {
    "fname": fname,
    "user_id": userId,
  };
}
