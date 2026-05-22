// To parse this JSON data, do
//
//     final attendanceStatusModel = attendanceStatusModelFromMap(jsonString);

import 'dart:convert';

AttendanceStatusModel attendanceStatusModelFromMap(String str) => AttendanceStatusModel.fromMap(json.decode(str));

String attendanceStatusModelToMap(AttendanceStatusModel data) => json.encode(data.toMap());

class AttendanceStatusModel {
  dynamic clockStatus;
  dynamic status;
  dynamic message;

  AttendanceStatusModel({
    this.clockStatus,
    this.status,
    this.message,
  });

  factory AttendanceStatusModel.fromMap(Map<String, dynamic> json) => AttendanceStatusModel(
    clockStatus: json["clock_status"],
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toMap() => {
    "clock_status": clockStatus,
    "status": status,
    "message": message,
  };
}
