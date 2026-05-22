// To parse this JSON data, do
//
//     final generateCaseIdContractorModel = generateCaseIdContractorModelFromJson(jsonString);

import 'dart:convert';

GenerateCaseIdContractorModel generateCaseIdContractorModelFromJson(
        String str) =>
    GenerateCaseIdContractorModel.fromJson(json.decode(str));

String generateCaseIdContractorModelToJson(
        GenerateCaseIdContractorModel data) =>
    json.encode(data.toJson());

class GenerateCaseIdContractorModel {
  dynamic status;
  dynamic message;
  List<ContractorDatum>? data;

  GenerateCaseIdContractorModel({
    this.status,
    this.message,
    this.data,
  });

  factory GenerateCaseIdContractorModel.fromJson(Map<String, dynamic> json) =>
      GenerateCaseIdContractorModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<ContractorDatum>.from(
                json["data"]!.map((x) => ContractorDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class ContractorDatum {
  dynamic id;
  dynamic contractorName;
  dynamic contractorPhone;

  ContractorDatum({
    this.id,
    this.contractorName,
    this.contractorPhone,
  });
  bool districtFilterByName(String filter) {
    return this.contractorName.toString().toLowerCase().trim().contains(filter);
  }

  factory ContractorDatum.fromJson(Map<String, dynamic> json) =>
      ContractorDatum(
        id: json["id"],
        contractorName: json["contractor_name"],
        contractorPhone: json["contractor_phone"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "contractor_name": contractorName,
        "contractor_phone": contractorPhone,
      };
}
