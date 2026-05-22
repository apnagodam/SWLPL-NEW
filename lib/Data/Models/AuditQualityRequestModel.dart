// To parse this JSON data, do
//
//     final auditQualityRequestModel = auditQualityRequestModelFromJson(jsonString);

import 'dart:convert';

AuditQualityRequestModel auditQualityRequestModelFromJson(String str) =>
    AuditQualityRequestModel.fromJson(json.decode(str));

String auditQualityRequestModelToJson(AuditQualityRequestModel data) =>
    json.encode(data.toJson());

class AuditQualityRequestModel {
  dynamic auditId;
  dynamic stackNo;
  dynamic commodityId;
  dynamic remark = 'ok';
  List<AuditQualityDatum>? data;

  AuditQualityRequestModel({
    this.auditId,
    this.stackNo,
    this.commodityId,
    this.remark,
    this.data,
  });

  factory AuditQualityRequestModel.fromJson(Map<String, dynamic> json) =>
      AuditQualityRequestModel(
        auditId: json["audit_id"],
        stackNo: json["stack_no"],
        commodityId: json["commodity_id"],
        remark: json['remark'],
        data: json["data"] == null
            ? []
            : List<AuditQualityDatum>.from(
                json["data"]!.map((x) => AuditQualityDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "audit_id": auditId,
        "stack_no": stackNo,
        "commodity_id": commodityId,
        "remark": remark,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class AuditQualityDatum {
  dynamic id;
  dynamic value;

  AuditQualityDatum({
    this.id,
    this.value,
  });

  factory AuditQualityDatum.fromJson(Map<String, dynamic> json) =>
      AuditQualityDatum(
        id: json["id"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "value": value,
      };
}
