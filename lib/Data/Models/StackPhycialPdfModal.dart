// To parse this JSON data, do
//
//     final stackPhycialPdfCreatemodal = stackPhycialPdfCreatemodalFromJson(jsonString);

import 'dart:convert';

StackPhycialPdfCreatemodal stackPhycialPdfCreatemodalFromJson(String str) => StackPhycialPdfCreatemodal.fromJson(json.decode(str));

String stackPhycialPdfCreatemodalToJson(StackPhycialPdfCreatemodal data) => json.encode(data.toJson());

class StackPhycialPdfCreatemodal {
    dynamic status;
    dynamic message;
    Data? data;

    StackPhycialPdfCreatemodal({
        this.status,
        this.message,
        this.data,
    });

    factory StackPhycialPdfCreatemodal.fromJson(Map<String, dynamic> json) => StackPhycialPdfCreatemodal(
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
        stackData: json["stack_data"] == null ? [] : List<StackDatum>.from(json["stack_data"]!.map((x) => StackDatum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "ware_name": wareName,
        "audit_id": auditId,
        "terminal_id": terminalId,
        "sup_name": supName,
        "sup_phone": supPhone,
        "auditor_name": auditorName,
        "auditor_phone": auditorPhone,
        "stack_data": stackData == null ? [] : List<dynamic>.from(stackData!.map((x) => x.toJson())),
    };
}

class StackDatum {
    dynamic stackNo;
    dynamic commodityId;
    dynamic auditBags;
    dynamic invBags;
    dynamic bagDifference;
    dynamic remark;
    dynamic category;

    StackDatum({
        this.stackNo,
        this.commodityId,
        this.auditBags,
        this.invBags,
        this.bagDifference,
        this.remark,
        this.category,
    });

    factory StackDatum.fromJson(Map<String, dynamic> json) => StackDatum(
        stackNo: json["stack_no"],
        commodityId: json["commodity_id"],
        auditBags: json["audit_bags"],
        invBags: json["inv_bags"],
        bagDifference: json["bag_difference"],
        remark: json["remark"],
        category: json["category"],
    );

    Map<String, dynamic> toJson() => {
        "stack_no": stackNo,
        "commodity_id": commodityId,
        "audit_bags": auditBags,
        "inv_bags": invBags,
        "bag_difference": bagDifference,
        "remark": remark,
        "category": category,
    };
}
