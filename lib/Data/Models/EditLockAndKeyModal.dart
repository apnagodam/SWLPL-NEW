// To parse this JSON data, do
//
//     final editLockAndKeyModal = editLockAndKeyModalFromJson(jsonString);

import 'dart:convert';

EditLockAndKeyModal editLockAndKeyModalFromJson(String str) => EditLockAndKeyModal.fromJson(json.decode(str));

String editLockAndKeyModalToJson(EditLockAndKeyModal data) => json.encode(data.toJson());

class EditLockAndKeyModal {
    dynamic status;
    dynamic message;
    List<LockKeyDatum>? data;

    EditLockAndKeyModal({
        this.status,
        this.message,
        this.data,
    });

    factory EditLockAndKeyModal.fromJson(Map<String, dynamic> json) => EditLockAndKeyModal(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? [] : List<LockKeyDatum>.from(json["data"]!.map((x) => LockKeyDatum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class LockKeyDatum {
    dynamic auditId;
    dynamic lockNo;
    dynamic keyNo;
    dynamic sealNo;
    dynamic remark;

    LockKeyDatum({
        this.auditId,
        this.lockNo,
        this.keyNo,
        this.sealNo,
        this.remark,
    });

    factory LockKeyDatum.fromJson(Map<String, dynamic> json) => LockKeyDatum(
        auditId: json["audit_id"],
        lockNo: json["lock_no"],
        keyNo: json["key_no"],
        sealNo: json["seal_no"],
        remark: json["remark"],
    );

    Map<String, dynamic> toJson() => {
        "audit_id": auditId,
        "lock_no": lockNo,
        "key_no": keyNo,
        "seal_no": sealNo,
        "remark": remark,
    };
}
