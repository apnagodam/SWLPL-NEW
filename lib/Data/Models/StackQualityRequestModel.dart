// To parse this JSON data, do
//
//     final stackQualityRequestModel = stackQualityRequestModelFromJson(jsonString);

import 'dart:convert';

StackQualityRequestModel stackQualityRequestModelFromJson(String str) =>
    StackQualityRequestModel.fromJson(json.decode(str));

String stackQualityRequestModelToJson(StackQualityRequestModel data) =>
    json.encode(data.toJson());

class StackQualityRequestModel {
  dynamic auditId;
  dynamic stackNo;
  dynamic commodityId;
  dynamic remark;
  List<QualityDatum>? data;

  StackQualityRequestModel({
    this.auditId,
    this.stackNo,
    this.commodityId,
    this.remark,
    this.data,
  });

  factory StackQualityRequestModel.fromJson(Map<String, dynamic> json) =>
      StackQualityRequestModel(
        auditId: json["audit_id"],
        stackNo: json["stack_no"],
        commodityId: json["commodity_id"],
        remark: json["remark"],
        data: json["data"] == null
            ? []
            : List<QualityDatum>.from(json["data"]!.map((x) => QualityDatum.fromJson(x))),
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

class QualityDatum {
  dynamic id;
  dynamic value;

  QualityDatum({
    this.id,
    this.value,
  });

  factory QualityDatum.fromJson(Map<String, dynamic> json) => QualityDatum(
        id: json["id"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "value": value,
      };
}
