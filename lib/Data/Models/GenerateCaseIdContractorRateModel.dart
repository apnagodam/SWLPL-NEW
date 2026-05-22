// To parse this JSON data, do
//
//     final generateCaseIdContractorRateModel = generateCaseIdContractorRateModelFromJson(jsonString);

import 'dart:convert';

GenerateCaseIdContractorRateModel generateCaseIdContractorRateModelFromJson(
        String str) =>
    GenerateCaseIdContractorRateModel.fromJson(json.decode(str));

String generateCaseIdContractorRateModelToJson(
        GenerateCaseIdContractorRateModel data) =>
    json.encode(data.toJson());

class GenerateCaseIdContractorRateModel {
  dynamic status;
  dynamic message;
  ContractorRateDatum? data;

  GenerateCaseIdContractorRateModel({
    this.status,
    this.message,
    this.data,
  });

  factory GenerateCaseIdContractorRateModel.fromJson(
          Map<String, dynamic> json) =>
      GenerateCaseIdContractorRateModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? null
            : ContractorRateDatum.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class ContractorRateDatum {
  dynamic id;
  dynamic contractorName;
  dynamic contractorPhone;
  dynamic labourRate;

  ContractorRateDatum({
    this.id,
    this.contractorName,
    this.contractorPhone,
    this.labourRate,
  });

  factory ContractorRateDatum.fromJson(Map<String, dynamic> json) =>
      ContractorRateDatum(
        id: json["id"],
        contractorName: json["contractor_name"],
        contractorPhone: json["contractor_phone"],
        labourRate: json["labour_rate"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "contractor_name": contractorName,
        "contractor_phone": contractorPhone,
        "labour_rate": labourRate,
      };
}
