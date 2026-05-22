// To parse this JSON data, do
//
//     final cctvUpdateModal = cctvUpdateModalFromJson(jsonString);

import 'dart:convert';

CctvUpdateModal cctvUpdateModalFromJson(String str) => CctvUpdateModal.fromJson(json.decode(str));

String cctvUpdateModalToJson(CctvUpdateModal data) => json.encode(data.toJson());

class CctvUpdateModal {
    int? auditId;
    List<CameraDatum>? data;

    CctvUpdateModal({
        this.auditId,
        this.data,
    });

    factory CctvUpdateModal.fromJson(Map<String, dynamic> json) => CctvUpdateModal(
        auditId: json["audit_id"],
        data: json["data"] == null ? [] : List<CameraDatum>.from(json["data"]!.map((x) => CameraDatum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "audit_id": auditId,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class CameraDatum {
    String? cameraNo;
    String? remark;

    CameraDatum({
        this.cameraNo,
        this.remark,
    });

    factory CameraDatum.fromJson(Map<String, dynamic> json) => CameraDatum(
        cameraNo: json["camera_no"],
        remark: json["remark"],
    );

    Map<String, dynamic> toJson() => {
        "camera_no": cameraNo,
        "remark": remark,
    };
}
