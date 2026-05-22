// To parse this JSON data, do
//
//     final vendorVoucherApproveListModal = vendorVoucherApproveListModalFromJson(jsonString);

import 'dart:convert';

VendorVoucherApproveListModal vendorVoucherApproveListModalFromJson(String str) => VendorVoucherApproveListModal.fromJson(json.decode(str));

String vendorVoucherApproveListModalToJson(VendorVoucherApproveListModal data) => json.encode(data.toJson());

class VendorVoucherApproveListModal {
    dynamic status;
    dynamic message;
    List<Datum>? data;

    VendorVoucherApproveListModal({
        this.status,
        this.message,
        this.data,
    });

    factory VendorVoucherApproveListModal.fromJson(Map<String, dynamic> json) => VendorVoucherApproveListModal(
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
    dynamic id;
    dynamic uniqueId;
    DateTime? date;
    dynamic groupFirm;
    dynamic employeeName;
    dynamic vendorName;
    dynamic warehouseName;
    dynamic expensesType;
    dynamic amount;
    dynamic expImage1;
    dynamic expImage2;
    dynamic purpose;
    DateTime? voucherFrom;
    DateTime? voucherTo;
    dynamic status;
    DateTime? createdAt;

    Datum({
        this.id,
        this.uniqueId,
        this.date,
        this.groupFirm,
        this.employeeName,
        this.vendorName,
        this.warehouseName,
        this.expensesType,
        this.amount,
        this.expImage1,
        this.expImage2,
        this.purpose,
        this.voucherFrom,
        this.voucherTo,
        this.status,
        this.createdAt,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        uniqueId: json["unique_id"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        groupFirm: json["group_firm"],
        employeeName: json["employee_name"],
        vendorName: json["vendor_name"],
        warehouseName: json["warehouse_name"],
        expensesType: json["expenses_type"],
        amount: json["amount"],
        expImage1: json["exp_image_1"],
        expImage2: json["exp_image_2"],
        purpose: json["purpose"],
        voucherFrom: json["voucher_from"] == null ? null : DateTime.parse(json["voucher_from"]),
        voucherTo: json["voucher_to"] == null ? null : DateTime.parse(json["voucher_to"]),
        status: json["status"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "unique_id": uniqueId,
        "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "group_firm": groupFirm,
        "employee_name": employeeName,
        "vendor_name": vendorName,
        "warehouse_name": warehouseName,
        "expenses_type": expensesType,
        "amount": amount,
        "exp_image_1": expImage1,
        "exp_image_2": expImage2,
        "purpose": purpose,
        "voucher_from": voucherFrom?.toIso8601String(),
        "voucher_to": voucherTo?.toIso8601String(),
        "status": status,
        "created_at": "${createdAt!.year.toString().padLeft(4, '0')}-${createdAt!.month.toString().padLeft(2, '0')}-${createdAt!.day.toString().padLeft(2, '0')}",
    };
}
