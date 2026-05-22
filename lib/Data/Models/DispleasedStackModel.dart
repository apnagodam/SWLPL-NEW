// To parse this JSON data, do
//
//     final displeasedStackModel = displeasedStackModelFromMap(jsonString);

import 'dart:convert';

DispleasedStackModel displeasedStackModelFromMap(String str) => DispleasedStackModel.fromMap(json.decode(str));

String displeasedStackModelToMap(DispleasedStackModel data) => json.encode(data.toMap());

class DispleasedStackModel {
  List<Datum>? data;
  String? status;
  String? message;

  DispleasedStackModel({
    this.data,
    this.status,
    this.message,
  });

  factory DispleasedStackModel.fromMap(Map<String, dynamic> json) => DispleasedStackModel(
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
  dynamic stackId;
  String? stackNo;

  Datum({
    this.stackId,
    this.stackNo,
  });

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
    stackId: json["stack_id"],
    stackNo: json["stack_no"],
  );

  Map<String, dynamic> toMap() => {
    "stack_id": stackId,
    "stack_no": stackNo,
  };
}
