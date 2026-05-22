// To parse this JSON data, do
//
//     final commdityAuditModal = commdityAuditModalFromJson(jsonString);

import 'dart:convert';

CommdityAuditModal commdityAuditModalFromJson(String str) => CommdityAuditModal.fromJson(json.decode(str));

String commdityAuditModalToJson(CommdityAuditModal data) => json.encode(data.toJson());

class CommdityAuditModal {
    String? status;
    String? message;
    List<CommdityDatum>? data;

    CommdityAuditModal({
        this.status,
        this.message,
        this.data,
    });

    factory CommdityAuditModal.fromJson(Map<String, dynamic> json) => CommdityAuditModal(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? [] : List<CommdityDatum>.from(json["data"]!.map((x) => CommdityDatum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class CommdityDatum {
    String? stackNo;
    int? commodityId;
    String? category;

    CommdityDatum({
        this.stackNo,
        this.commodityId,
        this.category,
    });

    factory CommdityDatum.fromJson(Map<String, dynamic> json) => CommdityDatum(
        stackNo: json["stack_no"],
        commodityId: json["commodity_id"],
        category: json["category"],
    );

    Map<String, dynamic> toJson() => {
        "stack_no": stackNo,
        "commodity_id": commodityId,
        "category": category,
    };
}
