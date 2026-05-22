// To parse this JSON data, do
//
//     final assetsPdfCreatemodal = assetsPdfCreatemodalFromJson(jsonString);

import 'dart:convert';

AssetsPdfCreatemodal assetsPdfCreatemodalFromJson(String str) => AssetsPdfCreatemodal.fromJson(json.decode(str));

String assetsPdfCreatemodalToJson(AssetsPdfCreatemodal data) => json.encode(data.toJson());

class AssetsPdfCreatemodal {
    dynamic status;
    dynamic message;
    Data? data;

    AssetsPdfCreatemodal({
        this.status,
        this.message,
        this.data,
    });

    factory AssetsPdfCreatemodal.fromJson(Map<String, dynamic> json) => AssetsPdfCreatemodal(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
    };
}

class Data {
    dynamic wareName;
    dynamic auditId;
    dynamic terminalId;
    dynamic supName;
    dynamic supPhone;
    dynamic auditorName;
    dynamic auditorPhone;
    List<StackDatum>? stackData;

    Data({
        this.wareName,
        this.auditId,
        this.terminalId,
        this.supName,
        this.supPhone,
        this.auditorName,
        this.auditorPhone,
        this.stackData,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        wareName: json["ware_name"],
        auditId: json["audit_id"],
        terminalId: json["terminal_id"],
        supName: json["sup_name"],
        supPhone: json["sup_phone"],
        auditorName: json["auditor_name"],
        auditorPhone: json["auditor_phone"],
        stackData: json["stack_data"] == null ? [] : List<StackDatum>.from(json["stack_data"]!.map((x) => StackDatum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "ware_name": wareName,
        "audit_id": auditId,
        "terminal_id": terminalId,
        "sup_name": supName,
        "sup_phone": supPhone,
        "auditor_name": auditorName,
        "auditor_phone": auditorPhone,
        "stack_data": stackData == null ? [] : List<dynamic>.from(stackData!.map((x) => x.toJson())),
    };
}

class StackDatum {
    dynamic value;
    dynamic remark;
    dynamic assetName;

    StackDatum({
        this.value,
        this.remark,
        this.assetName,
    });

    factory StackDatum.fromJson(Map<String, dynamic> json) => StackDatum(
        value: json["value"],
        remark: json["remark"],
        assetName: json["asset_name"],
    );

    Map<String, dynamic> toJson() => {
        "value": value,
        "remark": remark,
        "asset_name": assetName,
    };
}
