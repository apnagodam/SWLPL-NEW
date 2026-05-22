// To parse this JSON data, do
//
//     final fumigatiomEditModal = fumigatiomEditModalFromJson(jsonString);

import 'dart:convert';

FumigationListingModel fumigationListingModelFromJson(String str) =>
    FumigationListingModel.fromJson(json.decode(str));

String fumigationListingModelToJson(FumigationListingModel data) =>
    json.encode(data.toJson());

class FumigationListingModel {
  String? status;
  String? message;
  List<Datum>? data;
  

  FumigationListingModel({
    this.status,
    this.message,
    this.data,
  });

  factory FumigationListingModel.fromJson(Map<String, dynamic> json) =>
      FumigationListingModel(
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
  int? auditId;
  String? stackNo;
  DateTime? fumigationDate;
  String? remark;

  Datum({
    this.auditId,
    this.stackNo,
    this.fumigationDate,
    this.remark,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        auditId: json["audit_id"],
        stackNo: json["stack_no"],
        fumigationDate: json["fumigation_date"] == null
            ? null
            : DateTime.parse(json["fumigation_date"]),
        remark: json["remark"],
      );

  Map<String, dynamic> toJson() => {
        "audit_id": auditId,
        "stack_no": stackNo,
        "fumigation_date":
            "${fumigationDate!.year.toString().padLeft(4, '0')}-${fumigationDate!.month.toString().padLeft(2, '0')}-${fumigationDate!.day.toString().padLeft(2, '0')}",
        "remark": remark,
      };
}
