// To parse this JSON data, do
//
//     final assetsUpdateModal = assetsUpdateModalFromJson(jsonString);

import 'dart:convert';

AssetsUpdateModal assetsUpdateModalFromJson(String str) =>
    AssetsUpdateModal.fromJson(json.decode(str));

String assetsUpdateModalToJson(AssetsUpdateModal data) =>
    json.encode(data.toJson());

class AssetsUpdateModal {
  dynamic auditId;
  List<UpdateDatum>? data;

  AssetsUpdateModal({
    this.auditId,
    this.data,
  });

  factory AssetsUpdateModal.fromJson(Map<String, dynamic> json) =>
      AssetsUpdateModal(
        auditId: json["audit_id"],
        data: json["data"] == null
            ? []
            : List<UpdateDatum>.from(
                json["data"]!.map((x) => UpdateDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "audit_id": auditId,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class UpdateDatum {
  dynamic assetId;
  dynamic value;
  dynamic remark;

  UpdateDatum({
    this.assetId,
    this.value,
    this.remark,
  });

  factory UpdateDatum.fromJson(Map<String, dynamic> json) => UpdateDatum(
        assetId: json["asset_id"],
        value: json["value"],
        remark: json["remark"],
      );

  Map<String, dynamic> toJson() => {
        "asset_id": assetId,
        "value": value,
        "remark": remark,
      };
}
