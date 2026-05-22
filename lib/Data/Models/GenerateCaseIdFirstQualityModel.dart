// To parse this JSON data, do
//
//     final generateCaseIdFirstQualityModel = generateCaseIdFirstQualityModelFromJson(jsonString);

import 'dart:convert';

GenerateCaseIdFirstQualityModel generateCaseIdFirstQualityModelFromJson(
        String str) =>
    GenerateCaseIdFirstQualityModel.fromJson(json.decode(str));

String generateCaseIdFirstQualityModelToJson(
        GenerateCaseIdFirstQualityModel data) =>
    json.encode(data.toJson());

class GenerateCaseIdFirstQualityModel {
  dynamic status;
  dynamic message;
  List<FirstQualityDatum>? data;

  GenerateCaseIdFirstQualityModel({
    this.status,
    this.message,
    this.data,
  });

  factory GenerateCaseIdFirstQualityModel.fromJson(Map<String, dynamic> json) =>
      GenerateCaseIdFirstQualityModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<FirstQualityDatum>.from(json["data"]!.map((x) => FirstQualityDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class FirstQualityDatum {
  dynamic id;
  dynamic userId;
  dynamic caseId;
  dynamic parameterId;
  dynamic value;
  dynamic createdAt;
  dynamic updatedAt;
  QualityParameters? qualityParameters;

  FirstQualityDatum({
    this.id,
    this.userId,
    this.caseId,
    this.parameterId,
    this.value,
    this.createdAt,
    this.updatedAt,
    this.qualityParameters,
  });

  factory FirstQualityDatum.fromJson(Map<String, dynamic> json) => FirstQualityDatum(
        id: json["id"],
        userId: json["user_id"],
        caseId: json["case_id"],
        parameterId: json["parameter_id"],
        value: json["value"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        qualityParameters: json["quality_parameters"] == null
            ? null
            : QualityParameters.fromJson(json["quality_parameters"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "case_id": caseId,
        "parameter_id": parameterId,
        "value": value,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "quality_parameters": qualityParameters?.toJson(),
      };
}

class QualityParameters {
  dynamic id;
  dynamic parameter;
  dynamic status;
  dynamic createdAt;
  dynamic updatedAt;

  QualityParameters({
    this.id,
    this.parameter,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory QualityParameters.fromJson(Map<String, dynamic> json) =>
      QualityParameters(
        id: json["id"],
        parameter: json["parameter"],
        status: json["status"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "parameter": parameter,
        "status": status,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
