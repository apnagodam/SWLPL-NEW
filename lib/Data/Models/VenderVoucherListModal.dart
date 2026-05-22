// To parse this JSON data, do
//
//     final vendorVoucherListModal = vendorVoucherListModalFromJson(jsondynamic);

import 'dart:convert';

VendorVoucherListModal vendorVoucherListModalFromJson(dynamic str) =>
    VendorVoucherListModal.fromJson(json.decode(str));

dynamic vendorVoucherListModalToJson(VendorVoucherListModal data) =>
    json.encode(data.toJson());

class VendorVoucherListModal {
  dynamic status;
  dynamic message;
  List<Datum>? data;

  VendorVoucherListModal({
    this.status,
    this.message,
    this.data,
  });

  factory VendorVoucherListModal.fromJson(Map<dynamic, dynamic> json) =>
      VendorVoucherListModal(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<dynamic, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
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
  dynamic finalPrice;
  dynamic expImage1;
  dynamic expImage2;
  dynamic purpose;
  dynamic notes;
  dynamic approvalFor;
  dynamic paymentStatus;
  dynamic voucherFrom;
  dynamic voucherTo;
  dynamic verfiyStatus;
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
    this.finalPrice,
    this.expImage1,
    this.expImage2,
    this.purpose,
    this.notes,
    this.approvalFor,
    this.paymentStatus,
    this.voucherFrom,
    this.voucherTo,
    this.verfiyStatus,
    this.status,
    this.createdAt,
  });

  factory Datum.fromJson(Map<dynamic, dynamic> json) => Datum(
        id: json["id"],
        uniqueId: json["unique_id"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        groupFirm: json["group_firm"],
        employeeName: json["employee_name"],
        vendorName: json["vendor_name"],
        warehouseName: json["warehouse_name"],
        expensesType: json["expenses_type"],
        amount: json["amount"],
        finalPrice: json["final_price"],
        expImage1: json["exp_image_1"],
        expImage2: json["exp_image_2"],
        purpose: json["purpose"],
        notes: json["notes"],
        approvalFor: json["approval_for"],
        paymentStatus: json["payment_status"],
        voucherFrom: json["voucher_from"],
        voucherTo: json["voucher_to"],
        verfiyStatus: json["verfiy_status"],
        status: json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
      );

  Map<dynamic, dynamic> toJson() => {
        "id": id,
        "unique_id": uniqueId,
        "date": date,
        "group_firm": groupFirm,
        "employee_name": employeeName,
        "vendor_name": vendorName,
        "warehouse_name": warehouseName,
        "expenses_type": expensesType,
        "amount": amount,
        "final_price": finalPrice,
        "exp_image_1": expImage1,
        "exp_image_2": expImage2,
        "purpose": purpose,
        "notes": notes,
        "approval_for": approvalFor,
        "payment_status": paymentStatus,
        "voucher_from": voucherFrom,
        "voucher_to": voucherTo,
        "verfiy_status": verfiyStatus,
        "status": status,
        "created_at": createdAt,
      };
}
