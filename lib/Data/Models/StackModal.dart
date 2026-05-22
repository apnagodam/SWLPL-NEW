// To parse this JSON data, do
//
//     final stackAuditModal = stackAuditModalFromJson(jsonString);

import 'dart:convert';

StackAuditModal stackAuditModalFromJson(String str) =>
    StackAuditModal.fromJson(json.decode(str));

String stackAuditModalToJson(StackAuditModal data) =>
    json.encode(data.toJson());

class StackAuditModal {
  dynamic status;
  dynamic message;
  List<AuditDatum>? data;

  StackAuditModal({
    this.status,
    this.message,
    this.data,
  });

  factory StackAuditModal.fromJson(Map<String, dynamic> json) =>
      StackAuditModal(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<AuditDatum>.from(
                json["data"]!.map((x) => AuditDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class AuditDatum {
  dynamic auditId;

  AuditDatum({
    this.auditId,
  });

  factory AuditDatum.fromJson(Map<String, dynamic> json) => AuditDatum(
        auditId: json["audit_id"],
      );

  Map<String, dynamic> toJson() => {
        "audit_id": auditId,
      };
}
