// To parse this JSON data, do
//
//     final vendorExpensesModal = vendorExpensesModalFromJson(jsonString);

import 'dart:convert';

VendorExpensesModal vendorExpensesModalFromJson(String str) => VendorExpensesModal.fromJson(json.decode(str));

String vendorExpensesModalToJson(VendorExpensesModal data) => json.encode(data.toJson());

class VendorExpensesModal {
    String? status;
    String? message;
    List<Datum>? data;

    VendorExpensesModal({
        this.status,
        this.message,
        this.data,
    });

    factory VendorExpensesModal.fromJson(Map<String, dynamic> json) => VendorExpensesModal(
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
    int? id;
    String? expensesName;

    Datum({
        this.id,
        this.expensesName,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        expensesName: json["expenses_name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "expenses_name": expensesName,
    };
}
