// To parse this JSON data, do
//
//     final fumigationPdfCreatemodal = fumigationPdfCreatemodalFromJson(jsonString);

import 'dart:convert';

FumigationPdfCreatemodal fumigationPdfCreatemodalFromJson(String str) =>
    FumigationPdfCreatemodal.fromJson(json.decode(str));

String fumigationPdfCreatemodalToJson(FumigationPdfCreatemodal data) =>
    json.encode(data.toJson());

class FumigationPdfCreatemodal {
  dynamic status;
  dynamic message;
  Data? data;

  FumigationPdfCreatemodal({
    this.status,
    this.message,
    this.data,
  });

  factory FumigationPdfCreatemodal.fromJson(Map<String, dynamic> json) =>
      FumigationPdfCreatemodal(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  dynamic wareName;
  dynamic auditId;
  dynamic terminalId;
  dynamic supName;
  dynamic supPhone;
  dynamic auditorName;
  dynamic auditorPhone;
  List<StackDatum>? stackData;

  Data({
    this.wareName,
    this.auditId,
    this.terminalId,
    this.supName,
    this.supPhone,
    this.auditorName,
    this.auditorPhone,
    this.stackData,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        wareName: json["ware_name"],
        auditId: json["audit_id"],
        terminalId: json["terminal_id"],
        supName: json["sup_name"],
        supPhone: json["sup_phone"],
        auditorName: json["auditor_name"],
        auditorPhone: json["auditor_phone"],
        stackData: json["stack_data"] == null
            ? []
            : List<StackDatum>.from(
                json["stack_data"]!.map((x) => StackDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ware_name": wareName,
        "audit_id": auditId,
        "terminal_id": terminalId,
        "sup_name": supName,
        "sup_phone": supPhone,
        "auditor_name": auditorName,
        "auditor_phone": auditorPhone,
        "stack_data": stackData == null
            ? []
            : List<dynamic>.from(stackData!.map((x) => x.toJson())),
      };
}

class StackDatum {
  dynamic stackNo;
  dynamic fumigationDate;
  dynamic remark;
  dynamic prevFumigation;
  dynamic nextFumigation;

  StackDatum({
    this.stackNo,
    this.fumigationDate,
    this.remark,
    this.prevFumigation,
    this.nextFumigation,
  });

  factory StackDatum.fromJson(Map<String, dynamic> json) => StackDatum(
        stackNo: json["stack_no"],
        fumigationDate: json["fumigation_date"] == null
            ? null
            : DateTime.parse(json["fumigation_date"]),
        remark: json["remark"],
        prevFumigation: json["prev_fumigation"] == null
            ? null
            : DateTime.parse(json["prev_fumigation"]),
        nextFumigation: json["next_fumigation"] == null
            ? null
            : DateTime.parse(json["next_fumigation"]),
      );

  Map<String, dynamic> toJson() => {
        "stack_no": stackNo,
        "fumigation_date":
            "${fumigationDate!.year.toString().padLeft(4, '0')}-${fumigationDate!.month.toString().padLeft(2, '0')}-${fumigationDate!.day.toString().padLeft(2, '0')}",
        "remark": remark,
        "prev_fumigation":
            "${prevFumigation!.year.toString().padLeft(4, '0')}-${prevFumigation!.month.toString().padLeft(2, '0')}-${prevFumigation!.day.toString().padLeft(2, '0')}",
        "next_fumigation":
            "${nextFumigation!.year.toString().padLeft(4, '0')}-${nextFumigation!.month.toString().padLeft(2, '0')}-${nextFumigation!.day.toString().padLeft(2, '0')}",
      };
}
