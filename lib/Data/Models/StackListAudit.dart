// To parse this JSON data, do
//
//     final stackAuditListmodal = stackAuditListmodalFromJson(jsonString);

import 'dart:convert';

StackAuditListmodal stackAuditListmodalFromJson(String str) => StackAuditListmodal.fromJson(json.decode(str));

String stackAuditListmodalToJson(StackAuditListmodal data) => json.encode(data.toJson());

class StackAuditListmodal {
    dynamic status;
    dynamic message;
    List<Datum>? data;

    StackAuditListmodal({
        this.status,
        this.message,
        this.data,
    });

    factory StackAuditListmodal.fromJson(Map<String, dynamic> json) => StackAuditListmodal(
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
    dynamic terminalId;
    dynamic name;
    dynamic warehouseCode;

    Datum({
        this.auditId,
        this.terminalId,
        this.name,
        this.warehouseCode,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        auditId: json["audit_id"],
        terminalId: json["terminal_id"],
        name: json["name"],
        warehouseCode: json["warehouse_code"],
    );

    Map<String, dynamic> toJson() => {
        "audit_id": auditId,
        "terminal_id": terminalId,
        "name": name,
        "warehouse_code": warehouseCode,
    };
}
