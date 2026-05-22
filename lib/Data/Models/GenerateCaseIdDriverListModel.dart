// To parse this JSON data, do
//
//     final generateCaseIdDriverListModel = generateCaseIdDriverListModelFromJson(jsonString);

import 'dart:convert';

GenerateCaseIdDriverListModel generateCaseIdDriverListModelFromJson(
        String str) =>
    GenerateCaseIdDriverListModel.fromJson(json.decode(str));

String generateCaseIdDriverListModelToJson(
        GenerateCaseIdDriverListModel data) =>
    json.encode(data.toJson());

class GenerateCaseIdDriverListModel {
  dynamic status;
  dynamic message;
  Data? data;

  GenerateCaseIdDriverListModel({
    this.status,
    this.message,
    this.data,
  });

  factory GenerateCaseIdDriverListModel.fromJson(Map<String, dynamic> json) =>
      GenerateCaseIdDriverListModel(
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
  dynamic driverNumber;
  dynamic vehicleNo;
  dynamic vehicleType;

  Data({
    this.driverNumber,
    this.vehicleNo,
    this.vehicleType,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        driverNumber: json["driver_number"],
        vehicleNo: json["vehicle_no"],
        vehicleType: json["vehicle_type"],
      );

  Map<String, dynamic> toJson() => {
        "driver_number": driverNumber,
        "vehicle_no": vehicleNo,
        "vehicle_type": vehicleType,
      };
}
