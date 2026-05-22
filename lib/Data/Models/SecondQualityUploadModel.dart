// To parse this JSON data, do
//
//     final qualityUploadModel = qualityUploadModelFromMap(jsonString);

import 'dart:convert';

Secondqualityuploadmodel secondQualityUploadModelFromMap(String str) =>
    Secondqualityuploadmodel.fromMap(json.decode(str));

String secondQualityUploadModelToMap(Secondqualityuploadmodel data) =>
    json.encode(data.toMap());

class Secondqualityuploadmodel {
  String? caseId;
  String? reportFile;
  String? packagingType;
  String? infested;
  String? liveInsects;
  String? notes;
  String? inOut;
  String? extraClaim;
  String? sendToLab;
  String? sendToReportFile;
  List<CommodityList>? commodityList;

  Secondqualityuploadmodel({
    this.caseId,
    this.reportFile,
    this.packagingType,
    this.infested,
    this.liveInsects,
    this.notes,
    this.inOut,
    this.extraClaim,
    this.sendToLab,
    this.sendToReportFile,
    this.commodityList,
  });

// var formData = FormData.fromMap({
//   'case_id': caseId,
//   'report_file': reportFile,
//   "[commodityList][]": commodityList,
//   'packaging_type': packagingType,
//   'infested': infested,
//   'live_insects': liveInsects,
//   'notes': notes,
//   'commodity_img': commodityImage,
//   'extra_claim': extraClaim,
//   'send_to_lab': sendToLab,
//   'send_to_report_file': sendToLabFile,
//   'in_out': inOut
// });
  factory Secondqualityuploadmodel.fromMap(Map<String, dynamic> json) =>
      Secondqualityuploadmodel(
        caseId: json["case_id"],
        reportFile: json["report_file"],
        packagingType: json["packaging_type"],
        infested: json["infested"],
        liveInsects: json["live_insects"],
        notes: json["notes"],
        inOut: json["in_out"],
        extraClaim: json['extra_claim'],
        sendToLab: json['send_to_lab'],
        sendToReportFile: json['send_to_report_file'],
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
        "extra_claim": extraClaim,
        "send_to_lab": sendToLab,
        "send_to_report_file": sendToReportFile,
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
