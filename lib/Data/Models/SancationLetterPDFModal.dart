// To parse this JSON data, do
//
//     final sancationLetterPdfModal = sancationLetterPdfModalFromJson(jsonString);

import 'dart:convert';

SancationLetterPdfModal sancationLetterPdfModalFromJson(String str) => SancationLetterPdfModal.fromJson(json.decode(str));

String sancationLetterPdfModalToJson(SancationLetterPdfModal data) => json.encode(data.toJson());

class SancationLetterPdfModal {
    dynamic status;
    dynamic message;
    List<Datum>? data;

    SancationLetterPdfModal({
        this.status,
        this.message,
        this.data,
    });

    factory SancationLetterPdfModal.fromJson(Map<String, dynamic> json) => SancationLetterPdfModal(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    dynamic date;
    dynamic sanctionId;
    dynamic userName;
    dynamic bankName;
    dynamic sanctionDate;
    dynamic userPhone;
    dynamic interestRate;
    dynamic processingFee;

    Datum({
        this.date,
        this.sanctionId,
        this.userName,
        this.bankName,
        this.sanctionDate,
        this.userPhone,
        this.interestRate,
        this.processingFee,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        date: json["date"],
        sanctionId: json["sanction_id"],
        userName: json["user_name"],
        bankName: json["bank_name"],
        sanctionDate: json["sanction_date"],
        userPhone: json["user_phone"],
        interestRate: json["interest_rate"],
        processingFee: json["processing_fee"],
    );

    Map<String, dynamic> toJson() => {
        "date": date,
        "sanction_id": sanctionId,
        "user_name": userName,
        "bank_name": bankName,
        "sanction_date": sanctionDate,
        "user_phone": userPhone,
        "interest_rate": interestRate,
        "processing_fee": processingFee,
    };
}
