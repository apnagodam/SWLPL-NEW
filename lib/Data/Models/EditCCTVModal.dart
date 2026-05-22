// To parse this JSON data, do
//
//     final cctvAuditEditModal = cctvAuditEditModalFromJson(jsonString);

import 'dart:convert';

CctvAuditEditModal cctvAuditEditModalFromJson(String str) => CctvAuditEditModal.fromJson(json.decode(str));

String cctvAuditEditModalToJson(CctvAuditEditModal data) => json.encode(data.toJson());

class CctvAuditEditModal {
    dynamic status;
    dynamic message;
    List<Datum>? data;

    CctvAuditEditModal({
        this.status,
        this.message,
        this.data,
    });

    factory CctvAuditEditModal.fromJson(Map<String, dynamic> json) => CctvAuditEditModal(
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
    dynamic cameraNo;
    dynamic remark;

    Datum({
        this.auditId,
        this.cameraNo,
        this.remark,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        auditId: json["audit_id"],
        cameraNo: json["camera_no"],
        remark: json["remark"],
    );

    Map<String, dynamic> toJson() => {
        "audit_id": auditId,
        "camera_no": cameraNo,
        "remark": remark,
    };
}
