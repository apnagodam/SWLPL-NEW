// To parse this JSON data, do
//
//     final auditStackModel = auditStackModelFromJson(jsonString);

import 'dart:convert';

AuditStackModel auditStackModelFromJson(String str) =>
    AuditStackModel.fromJson(json.decode(str));

String auditStackModelToJson(AuditStackModel data) =>
    json.encode(data.toJson());

class AuditStackModel {
  dynamic status;
  dynamic message;
  List<Datum>? data;

  AuditStackModel({
    this.status,
    this.message,
    this.data,
  });

  factory AuditStackModel.fromJson(Map<String, dynamic> json) =>
      AuditStackModel(
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
  dynamic stackNumber;
  dynamic stackType;
  dynamic commodityId;
  dynamic commodityName;

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
