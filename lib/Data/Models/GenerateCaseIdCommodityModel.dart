// To parse this JSON data, do
//
//     final generateCaseIdCommodityModel = generateCaseIdCommodityModelFromJson(jsonString);

import 'dart:convert';

GenerateCaseIdCommodityModel generateCaseIdCommodityModelFromJson(String str) =>
    GenerateCaseIdCommodityModel.fromJson(json.decode(str));

String generateCaseIdCommodityModelToJson(GenerateCaseIdCommodityModel data) =>
    json.encode(data.toJson());

class GenerateCaseIdCommodityModel {
  dynamic status;
  dynamic message;
  List<CommodityDatum>? data;

  GenerateCaseIdCommodityModel({
    this.status,
    this.message,
    this.data,
  });

  factory GenerateCaseIdCommodityModel.fromJson(Map<String, dynamic> json) =>
      GenerateCaseIdCommodityModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<CommodityDatum>.from(
                json["data"]!.map((x) => CommodityDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class CommodityDatum {
  dynamic id;
  dynamic name;

  CommodityDatum({
    this.id,
    this.name,
  });
  bool districtFilterByName(String filter) {
    return this.name.toString().toLowerCase().trim().contains(filter);
  }

  factory CommodityDatum.fromJson(Map<String, dynamic> json) => CommodityDatum(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
