// To parse this JSON data, do
//
//     final updateStartAuditStackModal = updateStartAuditStackModalFromJson(jsonString);

import 'dart:convert';

UpdateStartAuditStackModal updateStartAuditStackModalFromJson(String str) => UpdateStartAuditStackModal.fromJson(json.decode(str));

String updateStartAuditStackModalToJson(UpdateStartAuditStackModal data) => json.encode(data.toJson());

class UpdateStartAuditStackModal {
    dynamic status;
    dynamic message;
    dynamic auditId;

    UpdateStartAuditStackModal({
        this.status,
        this.message,
        this.auditId,
    });

    factory UpdateStartAuditStackModal.fromJson(Map<String, dynamic> json) => UpdateStartAuditStackModal(
        status: json["status"],
        message: json["message"],
        auditId: json["audit_id"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "audit_id": auditId,
    };
}
