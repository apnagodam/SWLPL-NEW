// To parse this JSON data, do
//
//     final qualityUploadModel = qualityUploadModelFromMap(jsonString);

import 'dart:convert';
import 'dart:io';

QualityUploadModel qualityUploadModelFromMap(String str) =>
    QualityUploadModel.fromMap(json.decode(str));

String qualityUploadModelToMap(QualityUploadModel data) =>
    json.encode(data.toMap());

class QualityUploadModel {
  String? caseId;
  File? reportFile;
  String? packagingType;
  String? infested;
  String? liveInsects;
  String? notes;
  String? inOut;
  List<CommodityList>? commodityList;
 
  QualityUploadModel({
    this.caseId,
    this.reportFile,
    this.packagingType,
    this.infested,
    this.liveInsects,
    this.notes,
    this.inOut,
    this.commodityList,
  });

  factory QualityUploadModel.fromMap(Map<String, dynamic> json) =>
      QualityUploadModel(
        caseId: json["case_id"],
        reportFile: json["report_file"],
        packagingType: json["packaging_type"],
        infested: json["infested"],
        liveInsects: json["live_insects"],
        notes: json["notes"],
        inOut: json["in_out"],
        commodityList: json["commodityList"] == null
            ? []
            : List<CommodityList>.from(
                json["commodityList"]!.map((x) => CommodityList.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "case_id": caseId,
        "report_file": reportFile,
        "packaging_type": packagingType,
        "infested": infested,
        "live_insects": liveInsects,
        "notes": notes,
        "in_out": inOut,
        "commodityList": commodityList == null
            ? []
            : List<dynamic>.from(commodityList!.map((x) => x.toMap())),
      };
}

class CommodityList {
  dynamic id;
  String? value;
  dynamic min;
  dynamic max;
  String? name;

  CommodityList({
    this.id,
    this.value,
    this.min,
    this.max,
    this.name,
  });

  factory CommodityList.fromMap(Map<String, dynamic> json) => CommodityList(
        id: json["id"],
        value: json["value"],
        min: json["min"],
        max: json["max"],
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "value": value,
        "min": min,
        "max": max,
        "name": name,
      };
}
