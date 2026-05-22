// To parse this JSON data, do
//
//     final vendorExpensesTerminalModal = vendorExpensesTerminalModalFromJson(jsonString);

import 'dart:convert';

VendorExpensesTerminalModal vendorExpensesTerminalModalFromJson(String str) => VendorExpensesTerminalModal.fromJson(json.decode(str));

String vendorExpensesTerminalModalToJson(VendorExpensesTerminalModal data) => json.encode(data.toJson());

class VendorExpensesTerminalModal {
    String? status;
    String? message;
    List<Datum>? data;

    VendorExpensesTerminalModal({
        this.status,
        this.message,
        this.data,
    });

    factory VendorExpensesTerminalModal.fromJson(Map<String, dynamic> json) => VendorExpensesTerminalModal(
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
    String? name;
    String? warehouseCode;

    Datum({
        this.id,
        this.name,
        this.warehouseCode,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        warehouseCode: json["warehouse_code"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "warehouse_code": warehouseCode,
    };
}
