// To parse this JSON data, do
//
//     final auditPvStackModel = auditPvStackModelFromJson(jsonString);

import 'dart:convert';

AuditPvStackModel auditPvStackModelFromJson(String str) =>
    AuditPvStackModel.fromJson(json.decode(str));

String auditPvStackModelToJson(AuditPvStackModel data) =>
    json.encode(data.toJson());

class AuditPvStackModel {
  String? status;
  String? message;
  List<Datum>? data;

  AuditPvStackModel({
    this.status,
    this.message,
    this.data,
  });

  factory AuditPvStackModel.fromJson(Map<String, dynamic> json) =>
      AuditPvStackModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  String? stackNumber;
  String? stackType;
  int? commodityId;
  String? commodityName;

  Datum({
    this.stackNumber,
    this.stackType,
    this.commodityId,
    this.commodityName,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        stackNumber: json["stack_number"],
        stackType: json["stack_type"],
        commodityId: json["commodity_id"],
        commodityName: json["commodity_name"],
      );

  Map<String, dynamic> toJson() => {
        "stack_number": stackNumber,
        "stack_type": stackType,
        "commodity_id": commodityId,
        "commodity_name": commodityName,
      };
}
