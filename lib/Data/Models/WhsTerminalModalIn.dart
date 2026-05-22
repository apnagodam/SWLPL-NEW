// To parse this JSON data, do
//
//     final whsTerminalInModal = whsTerminalInModalFromJson(jsonString);

import 'dart:convert';

WhsTerminalInModal whsTerminalInModalFromJson(String str) => WhsTerminalInModal.fromJson(json.decode(str));

String whsTerminalInModalToJson(WhsTerminalInModal data) => json.encode(data.toJson());

class WhsTerminalInModal {
    String? status;
    String? message;
    String? warehouseName;
    List<GateDatum>? gateData;
    List<LockDatum>? lockData;

    WhsTerminalInModal({
        this.status,
        this.message,
        this.warehouseName,
        this.gateData,
        this.lockData,
    });

    factory WhsTerminalInModal.fromJson(Map<String, dynamic> json) => WhsTerminalInModal(
        status: json["status"],
        message: json["message"],
        warehouseName: json["warehouse_name"],
        gateData: json["gate_data"] == null ? [] : List<GateDatum>.from(json["gate_data"]!.map((x) => GateDatum.fromJson(x))),
        lockData: json["lock_data"] == null ? [] : List<LockDatum>.from(json["lock_data"]!.map((x) => LockDatum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "warehouse_name": warehouseName,
        "gate_data": gateData == null ? [] : List<dynamic>.from(gateData!.map((x) => x.toJson())),
        "lock_data": lockData == null ? [] : List<dynamic>.from(lockData!.map((x) => x.toJson())),
    };
}

class GateDatum {
    String? gateNo;
    String? lockNo;

    GateDatum({
        this.gateNo,
        this.lockNo,
    });

    factory GateDatum.fromJson(Map<String, dynamic> json) => GateDatum(
        gateNo: json["gate_no"],
        lockNo: json["lock_no"],
    );

    Map<String, dynamic> toJson() => {
        "gate_no": gateNo,
        "lock_no": lockNo,
    };
}

class LockDatum {
    String? shutterNo;
    String? lockNo;

    LockDatum({
        this.shutterNo,
        this.lockNo,
    });

    factory LockDatum.fromJson(Map<String, dynamic> json) => LockDatum(
        shutterNo: json["shutter_no"],
        lockNo: json["lock_no"],
    );

    Map<String, dynamic> toJson() => {
        "shutter_no": shutterNo,
        "lock_no": lockNo,
    };
}
