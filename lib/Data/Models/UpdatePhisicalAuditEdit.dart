// To parse this JSON data, do
//
//     final physicalAuditUpdateModal = physicalAuditUpdateModalFromJson(jsonString);

import 'dart:convert';

PhysicalAuditUpdateModal physicalAuditUpdateModalFromJson(String str) => PhysicalAuditUpdateModal.fromJson(json.decode(str));

String physicalAuditUpdateModalToJson(PhysicalAuditUpdateModal data) => json.encode(data.toJson());

class PhysicalAuditUpdateModal {
    dynamic auditId;
    List<PhysicalDatum>? data;

    PhysicalAuditUpdateModal({
        this.auditId,
        this.data,
    });

    factory PhysicalAuditUpdateModal.fromJson(Map<String, dynamic> json) => PhysicalAuditUpdateModal(
        auditId: json["audit_id"],
        data: json["data"] == null ? [] : List<PhysicalDatum>.from(json["data"]!.map((x) => PhysicalDatum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "audit_id": auditId,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class PhysicalDatum {
    dynamic stackNo;
    dynamic auditBags;
    dynamic remark;
    dynamic commodityId;

    PhysicalDatum({
        this.stackNo,
        this.auditBags,
        this.remark,
        this.commodityId,
    });

    factory PhysicalDatum.fromJson(Map<String, dynamic> json) => PhysicalDatum(
        stackNo: json["stack_no"],
        auditBags: json["audit_bags"],
        remark: json["remark"],
        commodityId: json["commodity_id"],
    );

    Map<String, dynamic> toJson() => {
        "stack_no": stackNo,
        "audit_bags": auditBags,
        "remark": remark,
        "commodity_id": commodityId,
    };
}
