// To parse this JSON data, do
//
//     final auditStackQualityModal = auditStackQualityModalFromJson(jsonString);

import 'dart:convert';

AuditStackQualityModal auditStackQualityModalFromJson(String str) => AuditStackQualityModal.fromJson(json.decode(str));

String auditStackQualityModalToJson(AuditStackQualityModal data) => json.encode(data.toJson());

class AuditStackQualityModal {
    String? status;
    String? message;
    Warehouse? warehouse;
    List<StackDatum>? data;

    AuditStackQualityModal({
        this.status,
        this.message,
        this.warehouse,
        this.data,
    });

    factory AuditStackQualityModal.fromJson(Map<String, dynamic> json) => AuditStackQualityModal(
        status: json["status"],
        message: json["message"],
        warehouse: json["warehouse"] == null ? null : Warehouse.fromJson(json["warehouse"]),
        data: json["data"] == null ? [] : List<StackDatum>.from(json["data"]!.map((x) => StackDatum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "warehouse": warehouse?.toJson(),
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class StackDatum {
    String? stackNo;

    StackDatum({
        this.stackNo,
    });

    factory StackDatum.fromJson(Map<String, dynamic> json) => StackDatum(
        stackNo: json["stack_no"],
    );

    Map<String, dynamic> toJson() => {
        "stack_no": stackNo,
    };
}

class Warehouse {
    String? warehouseName;
    int? id;

    Warehouse({
        this.warehouseName,
        this.id,
    });

    factory Warehouse.fromJson(Map<String, dynamic> json) => Warehouse(
        warehouseName: json["warehouse_name"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "warehouse_name": warehouseName,
        "id": id,
    };
}
