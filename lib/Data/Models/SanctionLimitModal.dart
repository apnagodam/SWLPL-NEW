
import 'dart:convert';

SanctionlimitModal sanctionlimitModalFromJson(String str) =>
    SanctionlimitModal.fromJson(json.decode(str));

String sanctionlimitModalToJson(SanctionlimitModal data) =>
    json.encode(data.toJson());

class SanctionlimitModal {
  dynamic status;
  dynamic message;
  List<Datum>? data;

  SanctionlimitModal({
    this.status,
    this.message,
    this.data,
  });

  factory SanctionlimitModal.fromJson(Map<String, dynamic> json) =>
      SanctionlimitModal(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  dynamic id;
  dynamic userName;
  dynamic sanctionId;
  dynamic bankName; 
  dynamic interestRate;
  dynamic pf;
  dynamic ltr;
  dynamic requestedAmount;
  dynamic approvedAmount;
  dynamic status; 
  dynamic docVerification; 
  dynamic action;
  dynamic downloads;

  Datum({
    this.id,
    this.userName,
    this.sanctionId,
    this.bankName,
    this.interestRate,
    this.pf,
    this.ltr,
    this.requestedAmount,
    this.approvedAmount,
    this.status,
    this.docVerification,
    this.action,
    this.downloads,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        userName: json["user_name"],
        sanctionId: json["sanction_id"],
        bankName: json["bank_name"], 
        interestRate: json["interest_rate"],
        pf: json["pf"],
        ltr: json["ltr"],
        requestedAmount: json["requested_amount"],
        approvedAmount: json["approved_amount"],
        status: json["status"], 
        docVerification:
            json["doc_verification"], 
        action: json["action"],
        downloads: json["downloads"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_name": userName,
        "sanction_id": sanctionId,
        "bank_name": bankName, 
        "interest_rate": interestRate,
        "pf": pf,
        "ltr": ltr,
        "requested_amount": requestedAmount,
        "approved_amount": approvedAmount,
        "status": status, 
        "doc_verification": docVerification, 
        "action": action,
        "downloads": downloads,
      };
}
