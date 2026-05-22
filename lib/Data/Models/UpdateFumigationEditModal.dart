// To parse this JSON data, do
//
//     final fumigatiomUpdateEditModal = fumigatiomUpdateEditModalFromJson(jsonString);

import 'dart:convert';

FumigatiomUpdateEditModal fumigatiomUpdateEditModalFromJson(String str) => FumigatiomUpdateEditModal.fromJson(json.decode(str));

String fumigatiomUpdateEditModalToJson(FumigatiomUpdateEditModal data) => json.encode(data.toJson());

class FumigatiomUpdateEditModal {
    dynamic auditId;
    List<FumigationUpdateDatum>? data;

    FumigatiomUpdateEditModal({
        this.auditId,
        this.data,
    });

    factory FumigatiomUpdateEditModal.fromJson(Map<String, dynamic> json) => FumigatiomUpdateEditModal(
        auditId: json["audit_id"],
        data: json["data"] == null ? [] : List<FumigationUpdateDatum>.from(json["data"]!.map((x) => FumigationUpdateDatum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "audit_id": auditId,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class FumigationUpdateDatum {
    dynamic stackNo;
    DateTime? fumigationDate;
    dynamic remark;

    FumigationUpdateDatum({
        this.stackNo,
        this.fumigationDate,
        this.remark,
    });

    factory FumigationUpdateDatum.fromJson(Map<String, dynamic> json) => FumigationUpdateDatum(
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
