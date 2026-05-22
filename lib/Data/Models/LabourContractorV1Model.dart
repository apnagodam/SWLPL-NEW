// To parse this JSON data, do
//
//     final labourContractorV1Model = labourContractorV1ModelFromJson(jsonString);

import 'dart:convert';

LabourContractorV1Model labourContractorV1ModelFromJson(String str) =>
    LabourContractorV1Model.fromJson(json.decode(str));

String labourContractorV1ModelToJson(LabourContractorV1Model data) =>
    json.encode(data.toJson());

class LabourContractorV1Model {
  dynamic status;
  dynamic message;
  List<LabourDatum>? data;

  LabourContractorV1Model({
    this.status,
    this.message,
    this.data,
  });

  factory LabourContractorV1Model.fromJson(Map<String, dynamic> json) =>
      LabourContractorV1Model(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<LabourDatum>.from(json["data"]!.map((x) => LabourDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class LabourDatum {
  dynamic id;
  dynamic contractorName;
  dynamic contractorPhone;

  LabourDatum({
    this.id,
    this.contractorName,
    this.contractorPhone,
  });

  factory LabourDatum.fromJson(Map<String, dynamic> json) => LabourDatum(
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
