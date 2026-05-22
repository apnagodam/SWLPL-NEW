// To parse this JSON data, do
//
//     final whsTerminalOutModal = whsTerminalOutModalFromJson(jsonString);

import 'dart:convert';

WhsTerminalOutModal whsTerminalOutModalFromJson(String str) => WhsTerminalOutModal.fromJson(json.decode(str));

String whsTerminalOutModalToJson(WhsTerminalOutModal data) => json.encode(data.toJson());

class WhsTerminalOutModal {
    dynamic status;
    dynamic message;
    dynamic warehouseName;
    List<GateDatum>? gateData;
    List<LockDatum>? lockData;

    WhsTerminalOutModal({
        this.status,
        this.message,
        this.warehouseName,
        this.gateData,
        this.lockData,
    });

    factory WhsTerminalOutModal.fromJson(Map<String, dynamic> json) => WhsTerminalOutModal(
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
    dynamic gateNo;
    dynamic lockNo;

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
    dynamic shutterNo;
    dynamic lockNo;

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
