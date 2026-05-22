// To parse this JSON data, do
//
//     final qualityParametersModel = qualityParametersModelFromMap(jsonString);

import 'dart:convert';

QualityParametersModel qualityParametersModelFromMap(String str) =>
    QualityParametersModel.fromMap(json.decode(str));


String qualityParametersModelToMap(QualityParametersModel data) =>
    json.encode(data.toMap());
class QualityParametersModel {
  String? status;
  String? message;
  dynamic commodityQuality;
  List<FirstQualityDatum>? data;

  QualityParametersModel({
    this.status,
    this.message,
    this.commodityQuality,
    this.data,
  });

factory QualityParametersModel.fromMap(Map<String, dynamic> json) =>
    QualityParametersModel(
      status: json["status"],
      message: json["message"],
      commodityQuality: json["commodity_quality"],
      data: json["data"] == null
          ? []
          : List<FirstQualityDatum>.from(
              json["data"]!.map((x) => FirstQualityDatum.fromMap(x))),
    );

 Map<String, dynamic> toMap() => {
      "status": status,
      "message": message,
      "commodity_quality": commodityQuality,
      "data": data == null
          ? []
          : List<dynamic>.from(data!.map((x) => x.toMap())),
    };
}
// Datum datumFromMap(String str) => Datum.fromMap(json.decode(str));

// String datumToMap(Datum datum) => jsonEncode(datum.toMap());
class FirstQualityDatum {
  dynamic id;
  String? name;
  String? value;
  dynamic min;
  dynamic max;

  // ADD THIS
  dynamic commodityQuality;

  FirstQualityDatum({
    this.id,
    this.name,
    this.value,
    this.min,
    this.max,

    // ADD THIS
    this.commodityQuality,
  });

  factory FirstQualityDatum.fromMap(Map<String, dynamic> json) =>
      FirstQualityDatum(
        id: json["id"],
        name: json["name"],
        value: json['value'],
        min: json["min"],
        max: json["max"],

        // ADD THIS
        commodityQuality: json["commodity_quality"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "value": value,
        "min": min,
        "max": max,

        // ADD THIS
        "commodity_quality": commodityQuality,
      };
}