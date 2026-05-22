
import 'dart:convert';

StackSaveSummaryModal stackSaveSummaryModalFromJson(String str) => StackSaveSummaryModal.fromJson(json.decode(str));

String stackSaveSummaryModalToJson(StackSaveSummaryModal data) => json.encode(data.toJson());

class StackSaveSummaryModal {
    int? auditId;
    List<SaveDatum>? data;

    StackSaveSummaryModal({
        this.auditId,
        this.data,
    });

    factory StackSaveSummaryModal.fromJson(Map<String, dynamic> json) => StackSaveSummaryModal(
        auditId: json["audit_id"],
        data: json["data"] == null ? [] : List<SaveDatum>.from(json["data"]!.map((x) => SaveDatum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "audit_id": auditId,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class SaveDatum {
    String? stackNo;
    String? auditBags;
    String? remark;
    int? commodityId;

    SaveDatum({
        this.stackNo,
        this.auditBags,
        this.remark,
        this.commodityId,
    });

    factory SaveDatum.fromJson(Map<String, dynamic> json) => SaveDatum(
        stackNo: json["stack_no"],
        auditBags: json["audit_bags"],
        remark: json["remark"],
        commodityId: json["commdity_id"],
    );

    Map<String, dynamic> toJson() => {
        "stack_no": stackNo,
        "audit_bags": auditBags,
        "remark": remark,
        "commodity_id": commodityId,
    };
}
