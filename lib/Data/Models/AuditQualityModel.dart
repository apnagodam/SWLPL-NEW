// To parse this JSON data, do
//
//     final auditQualityModel = auditQualityModelFromJson(jsonString);

import 'dart:convert';

AuditQualityModel auditQualityModelFromJson(String str) =>
    AuditQualityModel.fromJson(json.decode(str));

String auditQualityModelToJson(AuditQualityModel data) =>
    json.encode(data.toJson());

class AuditQualityModel {
  dynamic status;
  dynamic message;
  List<DataArray>? dataArray;

  AuditQualityModel({
    this.status,
    this.message,
    this.dataArray,
  });

  factory AuditQualityModel.fromJson(Map<String, dynamic> json) =>
      AuditQualityModel(
        status: json["status"],
        message: json["message"],
        dataArray: json["data_array"] == null
            ? []
            : List<DataArray>.from(
                json["data_array"]!.map((x) => DataArray.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data_array": dataArray == null
            ? []
            : List<dynamic>.from(dataArray!.map((x) => x.toJson())),
      };
}

class DataArray {
  dynamic id;
  dynamic name;

  DataArray({
    this.id,
    this.name,
  });

  factory DataArray.fromJson(Map<String, dynamic> json) => DataArray(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
