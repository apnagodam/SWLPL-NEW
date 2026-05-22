// To parse this JSON data, do
//
//     final lockKeyPdfCreatemodal = lockKeyPdfCreatemodalFromJson(jsonString);

import 'dart:convert';

LockKeyPdfCreatemodal lockKeyPdfCreatemodalFromJson(String str) => LockKeyPdfCreatemodal.fromJson(json.decode(str));

String lockKeyPdfCreatemodalToJson(LockKeyPdfCreatemodal data) => json.encode(data.toJson());

class LockKeyPdfCreatemodal {
    dynamic status;
    dynamic message;
    Data? data;

    LockKeyPdfCreatemodal({
        this.status,
        this.message,
        this.data,
    });

    factory LockKeyPdfCreatemodal.fromJson(Map<String, dynamic> json) => LockKeyPdfCreatemodal(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
    };
}

class Data {
    dynamic wareName;
    dynamic auditId;
    dynamic terminalId;
    dynamic supName;
    dynamic supPhone;
    dynamic auditorName;
    dynamic auditorPhone;
    List<StackDatum>? stackData;

    Data({
        this.wareName,
        this.auditId,
        this.terminalId,
        this.supName,
        this.supPhone,
        this.auditorName,
        this.auditorPhone,
        this.stackData,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        wareName: json["ware_name"],
        auditId: json["audit_id"],
        terminalId: json["terminal_id"],
        supName: json["sup_name"],
        supPhone: json["sup_phone"],
        auditorName: json["auditor_name"],
        auditorPhone: json["auditor_phone"],
        stackData: json["stack_data"] == null ? [] : List<StackDatum>.from(json["stack_data"]!.map((x) => StackDatum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "ware_name": wareName,
        "audit_id": auditId,
        "terminal_id": terminalId,
        "sup_name": supName,
        "sup_phone": supPhone,
        "auditor_name": auditorName,
        "auditor_phone": auditorPhone,
        "stack_data": stackData == null ? [] : List<dynamic>.from(stackData!.map((x) => x.toJson())),
    };
}

class StackDatum {
    dynamic lockNo;
    dynamic sealNo;
    dynamic keyNo;
    dynamic remark;

    StackDatum({
        this.lockNo,
        this.sealNo,
        this.keyNo,
        this.remark,
    });

    factory StackDatum.fromJson(Map<String, dynamic> json) => StackDatum(
        lockNo: json["lock_no"],
        sealNo: json["seal_no"],
        keyNo: json["key_no"],
        remark: json["remark"],
    );

    Map<String, dynamic> toJson() => {
        "lock_no": lockNo,
        "seal_no": sealNo,
        "key_no": keyNo,
        "remark": remark,
    };
}
