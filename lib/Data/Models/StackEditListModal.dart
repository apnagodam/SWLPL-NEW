// To parse this JSON data, do
//
//     final stackEditListModal = stackEditListModalFromJson(jsonString);

import 'dart:convert';

StackEditListModal stackEditListModalFromJson(String str) => StackEditListModal.fromJson(json.decode(str));

String stackEditListModalToJson(StackEditListModal data) => json.encode(data.toJson());

class StackEditListModal {
    String? status;
    String? message;
    List<Datum>? data;

    StackEditListModal({
        this.status,
        this.message,
        this.data,
    });

    factory StackEditListModal.fromJson(Map<String, dynamic> json) => StackEditListModal(
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
    int? auditId;
    String? stackNo;
    int? terminalId;
    String? name;
    String? warehouseCode;

    Datum({
        this.auditId,
        this.stackNo,
        this.terminalId,
        this.name,
        this.warehouseCode,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        auditId: json["audit_id"],
        stackNo: json["stack_no"],
        terminalId: json["terminal_id"],
        name: json["name"],
        warehouseCode: json["warehouse_code"],
    );

    Map<String, dynamic> toJson() => {
        "audit_id": auditId,
        "stack_no": stackNo,
        "terminal_id": terminalId,
        "name": name,
        "warehouse_code": warehouseCode,
    };
}
