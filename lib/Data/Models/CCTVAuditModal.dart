// To parse this JSON data, do
//
//     final cctvAuditModal = cctvAuditModalFromJson(jsonString);

import 'dart:convert';

CctvAuditModal cctvAuditModalFromJson(String str) => CctvAuditModal.fromJson(json.decode(str));

String cctvAuditModalToJson(CctvAuditModal data) => json.encode(data.toJson());

class CctvAuditModal {
    dynamic auditId;
    List<CCTVDatum>? data;

    CctvAuditModal({
        this.auditId,
        this.data,
    });

    factory CctvAuditModal.fromJson(Map<String, dynamic> json) => CctvAuditModal(
        auditId: json["audit_id"],
        data: json["data"] == null ? [] : List<CCTVDatum>.from(json["data"]!.map((x) => CCTVDatum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "audit_id": auditId,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class CCTVDatum {
    dynamic cameraNo;
    dynamic remark;

    CCTVDatum({
        this.cameraNo,
        this.remark,
    });

    factory CCTVDatum.fromJson(Map<String, dynamic> json) => CCTVDatum(
        cameraNo: json["camera_no"],
        remark: json["remark"],
    );

    Map<String, dynamic> toJson() => {
        "camera_no": cameraNo,
        "remark": remark,
    };
}
