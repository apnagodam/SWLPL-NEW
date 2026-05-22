// To parse this JSON data, do
//
//     final assetsEditModal = assetsEditModalFromJson(jsonString);

import 'dart:convert';

AssetsEditModal assetsEditModalFromJson(String str) => AssetsEditModal.fromJson(json.decode(str));

String assetsEditModalToJson(AssetsEditModal data) => json.encode(data.toJson());

class AssetsEditModal {
    dynamic status;
    dynamic message;
    List<Datum>? data;

    AssetsEditModal({
        this.status,
        this.message,
        this.data,
    });

    factory AssetsEditModal.fromJson(Map<String, dynamic> json) => AssetsEditModal(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    dynamic auditId;
    dynamic assetId;
    dynamic value;
    dynamic remark;
    dynamic assetName;

    Datum({
        this.auditId,
        this.assetId,
        this.value,
        this.remark,
        this.assetName,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        auditId: json["audit_id"],
        assetId: json["asset_id"],
        value: json["value"],
        remark: json["remark"],
        assetName: json["asset_name"],
    );

    Map<String, dynamic> toJson() => {
        "audit_id": auditId,
        "asset_id": assetId,
        "value": value,
        "remark": remark,
        "asset_name": assetName,
    };
}
