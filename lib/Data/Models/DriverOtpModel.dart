// To parse this JSON data, do
//
//     final driverOtpModel = driverOtpModelFromMap(jsonString);

// ignore_for_file: unnecessary_question_mark

import 'dart:convert';

DriverOtpModel driverOtpModelFromMap(String str) => DriverOtpModel.fromMap(json.decode(str));

String driverOtpModelToMap(DriverOtpModel data) => json.encode(data.toMap());

class DriverOtpModel {
  String? status;
  String? type;
  String? message;
  dynamic? otp;

  DriverOtpModel({
    this.status,
    this.type,
    this.message,
    this.otp,
  });

  factory DriverOtpModel.fromMap(Map<String, dynamic> json) => DriverOtpModel(
    status: json["status"],
    type: json["type"],
    message: json["message"],
    otp: json["otp"],
  );

  Map<String, dynamic> toMap() => {
    "status": status,
    "type": type,
    "message": message,
    "otp": otp,
  };
}
