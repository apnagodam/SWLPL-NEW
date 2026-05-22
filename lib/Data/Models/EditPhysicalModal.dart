// To parse this JSON data, do
//
//     final physicalAuditEditModal = physicalAuditEditModalFromJson(jsonString);

import 'dart:convert';

PhysicalAuditEditModal physicalAuditEditModalFromJson(String str) => PhysicalAuditEditModal.fromJson(json.decode(str));

String physicalAuditEditModalToJson(PhysicalAuditEditModal data) => json.encode(data.toJson());

class PhysicalAuditEditModal {
    String? status;
    String? message;
    List<Datum>? data;

    PhysicalAuditEditModal({
        this.status,
        this.message,
        this.data, String? Id,
    });

    factory PhysicalAuditEditModal.fromJson(Map<String, dynamic> json) => PhysicalAuditEditModal(
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
    int? auditBags;
    String? remark;
    String? category;
    int? categoryId;

    Datum({
        this.auditId,
        this.stackNo,
        this.auditBags,
        this.remark,
        this.category,
        this.categoryId,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        auditId: json["audit_id"],
        stackNo: json["stack_no"],
        auditBags: json["audit_bags"],
        remark: json["remark"],
        category: json["category"],
        categoryId: json["category_id"],
    );

    Map<String, dynamic> toJson() => {
        "audit_id": auditId,
        "stack_no": stackNo,
        "audit_bags": auditBags,
        "remark": remark,
        "category": category,
        "category_id": categoryId,
    };
}
