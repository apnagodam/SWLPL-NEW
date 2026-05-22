// To parse this JSON data, do
//
//     final fumigatonAuditModal = fumigatonAuditModalFromJson(jsonString);

import 'dart:convert';

FumigatonAuditModal fumigatonAuditModalFromJson(String str) => FumigatonAuditModal.fromJson(json.decode(str));

String fumigatonAuditModalToJson(FumigatonAuditModal data) => json.encode(data.toJson());

class FumigatonAuditModal {
    dynamic auditId;
    List<FumigationDatum>? data;

    FumigatonAuditModal({
        this.auditId,
        this.data,
    });

    factory FumigatonAuditModal.fromJson(Map<String, dynamic> json) => FumigatonAuditModal(
        auditId: json["audit_id"],
        data: json["data"] == null ? [] : List<FumigationDatum>.from(json["data"]!.map((x) => FumigationDatum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "audit_id": auditId,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class FumigationDatum {
    dynamic stackNo;
    DateTime? fumigationDate;
    dynamic remark;

    FumigationDatum({
        this.stackNo,
        this.fumigationDate,
        this.remark,
    });

    factory FumigationDatum.fromJson(Map<String, dynamic> json) => FumigationDatum(
        stackNo: json["stack_no"],
        fumigationDate: json["fumigation_date"] == null ? null : DateTime.parse(json["fumigation_date"]),
        remark: json["remark"],
    );

    Map<String, dynamic> toJson() => {
        "stack_no": stackNo,
        "fumigation_date": "${fumigationDate!.year.toString().padLeft(4, '0')}-${fumigationDate!.month.toString().padLeft(2, '0')}-${fumigationDate!.day.toString().padLeft(2, '0')}",
        "remark": remark,
    };
}
