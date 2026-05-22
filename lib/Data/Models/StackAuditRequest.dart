// To parse this JSON data, do
//
//     final stackAuditRequest = stackAuditRequestFromJson(jsonString);

import 'dart:convert';

StackAuditRequest stackAuditRequestFromJson(String str) =>
    StackAuditRequest.fromJson(json.decode(str));

String stackAuditRequestToJson(StackAuditRequest data) =>
    json.encode(data.toJson());

class StackAuditRequest {
  int? auditId;
  List<StackDatum>? data;

  StackAuditRequest({
    this.auditId,
    this.data,
  });

  factory StackAuditRequest.fromJson(Map<String, dynamic> json) =>
      StackAuditRequest(
        auditId: json["audit_id"],
        data: json["data"] == null
            ? []
            : List<StackDatum>.from(
                json["data"]!.map((x) => StackDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "audit_id": auditId,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class StackDatum {
  String? stackNo;
  String? auditBags;

  StackDatum({
    this.stackNo,
    this.auditBags,
  });

  factory StackDatum.fromJson(Map<String, dynamic> json) => StackDatum(
        stackNo: json["stack_no"],
        auditBags: json["audit_bags"],
      );

  Map<String, dynamic> toJson() => {
        "stack_no": stackNo,
        "audit_bags": auditBags,
      };
}
