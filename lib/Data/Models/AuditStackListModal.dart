// To parse this JSON data, do
//
//     final auditStackListModal = auditStackListModalFromJson(jsonString);

import 'dart:convert';

AuditStackListModal auditStackListModalFromJson(String str) => AuditStackListModal.fromJson(json.decode(str));

String auditStackListModalToJson(AuditStackListModal data) => json.encode(data.toJson());

class AuditStackListModal {
    dynamic status;
    dynamic message;
    Data? data;

    AuditStackListModal({
        this.status,
        this.message,
        this.data,
    });

    factory AuditStackListModal.fromJson(Map<String, dynamic> json) => AuditStackListModal(
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
    dynamic auditId;
    dynamic auditStack;
    dynamic auditQuality;
    dynamic auditPv;
    dynamic auditCctv;
    dynamic auditLock;
    dynamic auditFumigation;
    dynamic auditAssets;
    dynamic warehosueId;
    dynamic warehosueName;
    dynamic warehouseCode;

    Data({
        this.auditId,
        this.auditStack,
        this.auditQuality,
        this.auditPv,
        this.auditCctv,
        this.auditLock,
        this.auditFumigation,
        this.auditAssets,
        this.warehosueId,
        this.warehosueName,
        this.warehouseCode,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        auditId: json["audit_id"],
        auditStack: json["audit_stack"] == null ? null : DateTime.parse(json["audit_stack"]),
        auditQuality: json["audit_quality"] == null ? null : DateTime.parse(json["audit_quality"]),
        auditPv: json["audit_pv"] == null ? null : DateTime.parse(json["audit_pv"]),
        auditCctv: json["audit_cctv"] == null ? null : DateTime.parse(json["audit_cctv"]),
        auditLock: json["audit_lock"] == null ? null : DateTime.parse(json["audit_lock"]),
        auditFumigation: json["audit_fumigation"] == null ? null : DateTime.parse(json["audit_fumigation"]),
        auditAssets: json["audit_assets"] == null ? null : DateTime.parse(json["audit_assets"]),
        warehosueId: json["warehosue_id"],
        warehosueName: json["warehosue_name"],
        warehouseCode: json["warehouse_code"],
    );

    Map<String, dynamic> toJson() => {
        "audit_id": auditId,
        "audit_stack": auditStack?.toIso8601String(),
        "audit_quality": auditQuality?.toIso8601String(),
        "audit_pv": auditPv?.toIso8601String(),
        "audit_cctv": auditCctv?.toIso8601String(),
        "audit_lock": auditLock?.toIso8601String(),
        "audit_fumigation": auditFumigation?.toIso8601String(),
        "audit_assets": auditAssets?.toIso8601String(),
        "warehosue_id": warehosueId,
        "warehosue_name": warehosueName,
        "warehouse_code": warehouseCode,
    };
}
