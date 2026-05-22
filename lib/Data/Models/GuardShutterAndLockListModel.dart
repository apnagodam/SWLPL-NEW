// To parse this JSON data, do
//
//     final guardShutterAndLockListModel = guardShutterAndLockListModelFromJson(jsondynamic);

// ignore_for_file: unnecessary_question_mark

import 'dart:convert';

GuardShutterAndLockListModel guardShutterAndLockListModelFromJson(
        dynamic str) =>
    GuardShutterAndLockListModel.fromJson(json.decode(str));

dynamic guardShutterAndLockListModelToJson(GuardShutterAndLockListModel data) =>
    json.encode(data.toJson());

class GuardShutterAndLockListModel {
  dynamic? status;
  dynamic? message;
  List<LockDatum>? lockData;
  List<GateDatum>? gateData;

  GuardShutterAndLockListModel({
    this.status,
    this.message,
    this.lockData,
    this.gateData,
  });

  factory GuardShutterAndLockListModel.fromJson(Map<dynamic, dynamic> json) =>
      GuardShutterAndLockListModel(
        status: json["status"],
        message: json["message"],
        lockData: json["lock_data"] == null
            ? []
            : List<LockDatum>.from(
                json["lock_data"]!.map((x) => LockDatum.fromJson(x))),
        gateData: json["gate_data"] == null
            ? []
            : List<GateDatum>.from(
                json["gate_data"]!.map((x) => GateDatum.fromJson(x))),
      );

  Map<dynamic, dynamic> toJson() => {
        "status": status,
        "message": message,
        "lock_data": lockData == null
            ? []
            : List<dynamic>.from(lockData!.map((x) => x.toJson())),
        "gate_data": gateData == null
            ? []
            : List<dynamic>.from(gateData!.map((x) => x.toJson())),
      };
}

class GateDatum {
  dynamic? gateNo;

  GateDatum({
    this.gateNo,
  });

  factory GateDatum.fromJson(Map<dynamic, dynamic> json) => GateDatum(
        gateNo: json["gate_no"],
      );

  Map<dynamic, dynamic> toJson() => {
        "gate_no": gateNo,
      };
}

class LockDatum {
  dynamic? shutterNo;

  LockDatum({
    this.shutterNo,
  });

  factory LockDatum.fromJson(Map<dynamic, dynamic> json) => LockDatum(
        shutterNo: json["shutter_no"],
      );

  Map<dynamic, dynamic> toJson() => {
        "shutter_no": shutterNo,
      };
}
