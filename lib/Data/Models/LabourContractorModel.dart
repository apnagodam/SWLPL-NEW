// To parse this JSON data, do
//
//     final labourContractorModel = labourContractorModelFromMap(jsonString);

// ignore_for_file: unnecessary_question_mark

import 'dart:convert';

LabourContractorModel labourContractorModelFromMap(String str) =>
    LabourContractorModel.fromMap(json.decode(str));

String labourContractorModelToMap(LabourContractorModel data) =>
    json.encode(data.toMap());

class LabourContractorModel {
  String? status;
  String? message;
  Data? data;

  LabourContractorModel({
    this.status,
    this.message,
    this.data,
  });

  factory LabourContractorModel.fromMap(Map<String, dynamic> json) =>
      LabourContractorModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "message": message,
        "data": data?.toMap(),
      };
}

class Data {
  String? contractorName;
  dynamic? id;
  String? contractorPhone;
  dynamic? labourRate;

  Data({
    this.contractorName,
    this.id,
    this.contractorPhone,
    this.labourRate,
  });

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        contractorName: json["contractor_name"],
        id: json["id"],
        contractorPhone: json["contractor_phone"],
        labourRate: json["labour_rate"],
      );

  Map<String, dynamic> toMap() => {
        "contractor_name": contractorName,
        "id": id,
        "contractor_phone": contractorPhone,
        "labour_rate": labourRate,
      };
}
