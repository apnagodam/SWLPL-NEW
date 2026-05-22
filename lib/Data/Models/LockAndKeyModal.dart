// To parse this JSON data, do
//
//     final lockAndKeyModal = lockAndKeyModalFromJson(jsonString);

import 'dart:convert';


LockAndKeyModal lockAndKeyModalFromJson(String str) =>
    LockAndKeyModal.fromJson(json.decode(str));

String lockAndKeyModalToJson(LockAndKeyModal data) =>
    json.encode(data.toJson());

class LockAndKeyModal {
  dynamic auditId;
  List<LockKeyDatum>? data;

  LockAndKeyModal({
    this.auditId,
    this.data,
  });

  factory LockAndKeyModal.fromJson(Map<String, dynamic> json) =>
      LockAndKeyModal(
        auditId: json["audit_id"],
        data: json["data"] == null
            ? []
            : List<LockKeyDatum>.from(
                json["data"]!.map((x) => LockKeyDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "audit_id": auditId,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class LockKeyDatum {
  dynamic lockNo;
  dynamic keyNo;
  dynamic sealNo;
  dynamic remark;

  LockKeyDatum({
    this.lockNo,
    this.keyNo,
    this.sealNo,
    this.remark,
  });

  factory LockKeyDatum.fromJson(Map<String, dynamic> json) => LockKeyDatum(
        lockNo: json["lock_no"],
        keyNo: json["key_no"],
        sealNo: json["seal_no"],
        remark: json["remark"],
      );

  Map<String, dynamic> toJson() => {
        "lock_no": lockNo,
        "key_no": keyNo,
        "seal_no": sealNo,
        "remark": remark,
      };
}
