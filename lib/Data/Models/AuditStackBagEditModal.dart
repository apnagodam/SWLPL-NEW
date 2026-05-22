// To parse this JSON data, do
//
//     final auditStackbagEditModal = auditStackbagEditModalFromJson(jsonString);

import 'dart:convert';

AuditStackbagEditModal auditStackbagEditModalFromJson(String str) => AuditStackbagEditModal.fromJson(json.decode(str));

String auditStackbagEditModalToJson(AuditStackbagEditModal data) => json.encode(data.toJson());

class AuditStackbagEditModal {
    dynamic status;
    dynamic message;
    List<Datum>? data;

    AuditStackbagEditModal({
        this.status,
        this.message,
        this.data,
    });

    factory AuditStackbagEditModal.fromJson(Map<String, dynamic> json) => AuditStackbagEditModal(
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
    dynamic stackNo;
    dynamic auditBags;
    dynamic remark;
    dynamic category;
    dynamic commodityId;

    Datum({
        this.auditId,
        this.stackNo,
        this.auditBags,
        this.remark,
        this.category,
        this.commodityId,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        auditId: json["audit_id"],
        stackNo: json["stack_no"],
        auditBags: json["audit_bags"],
        remark: json["remark"],
        category: json["category"],
        commodityId: json["commodity_id"],
    );

    Map<String, dynamic> toJson() => {
        "audit_id": auditId,
        "stack_no": stackNo,
        "audit_bags": auditBags,
        "remark": remark,
        "category": category,
        "commodity_id": commodityId,
    };
}
