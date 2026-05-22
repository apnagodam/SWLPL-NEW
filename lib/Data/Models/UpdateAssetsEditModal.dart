// To parse this JSON data, do
//
//     final assetsUpdateRequestModel = assetsUpdateRequestModelFromJson(jsonString);

import 'dart:convert';

AssetsUpdateRequestModel assetsUpdateRequestModelFromJson(String str) => AssetsUpdateRequestModel.fromJson(json.decode(str));

String assetsUpdateRequestModelToJson(AssetsUpdateRequestModel data) => json.encode(data.toJson());

class AssetsUpdateRequestModel {
    dynamic auditId;
    List<AssetsUpdateDatum>? data;

    AssetsUpdateRequestModel({
        this.auditId,
        this.data,
    });

    factory AssetsUpdateRequestModel.fromJson(Map<String, dynamic> json) => AssetsUpdateRequestModel(
        auditId: json["audit_id"],
        data: json["data"] == null ? [] : List<AssetsUpdateDatum>.from(json["data"]!.map((x) => AssetsUpdateDatum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "audit_id": auditId,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class AssetsUpdateDatum {
    dynamic assetId;
    dynamic value;
    dynamic remark;

    AssetsUpdateDatum({
        this.assetId,
        this.value,
        this.remark,
    });

    factory AssetsUpdateDatum.fromJson(Map<String, dynamic> json) => AssetsUpdateDatum(
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
