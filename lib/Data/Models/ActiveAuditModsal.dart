// To parse this JSON data, do
//
//     final activeAuditModal = activeAuditModalFromJson(jsonString);

import 'dart:convert';

ActiveAuditModal activeAuditModalFromJson(String str) => ActiveAuditModal.fromJson(json.decode(str));

String activeAuditModalToJson(ActiveAuditModal data) => json.encode(data.toJson());

class ActiveAuditModal {
    String? status;
    String? message;
    List<Datum>? data;

    ActiveAuditModal({
        this.status,
        this.message,
        this.data,
    });

    factory ActiveAuditModal.fromJson(Map<String, dynamic> json) => ActiveAuditModal(
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
    int? id;
    int? auditId;
    DateTime? startDate;
    DateTime? createdAt;
    DateTime? updatedAt;
    String? warehouseName;
    String? warehouseCode;

    Datum({
        this.id,
        this.auditId,
        this.startDate,
        this.createdAt,
        this.updatedAt,
        this.warehouseName,
        this.warehouseCode,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        auditId: json["audit_id"],
        startDate: json["start_date"] == null ? null : DateTime.parse(json["start_date"]),
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        warehouseName: json["warehouse_name"],
        warehouseCode: json["warehouse_code"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "audit_id": auditId,
        "start_date": "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "warehouse_name": warehouseName,
        "warehouse_code": warehouseCode,
    };
}
