// To parse this JSON data, do
//
//     final labourContractorRateModel = labourContractorRateModelFromJson(jsondynamic);

import 'dart:convert';

LabourContractorRateModel labourContractorRateModelFromJson(dynamic str) =>
    LabourContractorRateModel.fromJson(json.decode(str));

dynamic labourContractorRateModelToJson(LabourContractorRateModel data) =>
    json.encode(data.toJson());

class LabourContractorRateModel {
  dynamic status;
  dynamic message;
  Data? data;

  LabourContractorRateModel({
    this.status,
    this.message,
    this.data,
  });

  factory LabourContractorRateModel.fromJson(Map<dynamic, dynamic> json) =>
      LabourContractorRateModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<dynamic, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  dynamic contractorPhone;
  dynamic labourRate;

  Data({
    this.contractorPhone,
    this.labourRate,
  });

  factory Data.fromJson(Map<dynamic, dynamic> json) => Data(
        contractorPhone: json["contractor_phone"],
        labourRate: json["labour_rate"],
      );

  Map<dynamic, dynamic> toJson() => {
        "contractor_phone": contractorPhone,
        "labour_rate": labourRate,
      };
}
