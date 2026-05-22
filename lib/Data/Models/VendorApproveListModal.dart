// To parse this JSON data, do
//
//     final vendorApproveNameListModal = vendorApproveNameListModalFromJson(jsonString);

import 'dart:convert';

VendorApproveNameListModal vendorApproveNameListModalFromJson(String str) =>
    VendorApproveNameListModal.fromJson(json.decode(str));

String vendorApproveNameListModalToJson(VendorApproveNameListModal data) =>
    json.encode(data.toJson());

class VendorApproveNameListModal {
  String? status;
  String? message;
  List<Datum>? data;

  VendorApproveNameListModal({
    this.status,
    this.message,
    this.data,
  });

  factory VendorApproveNameListModal.fromJson(Map<String, dynamic> json) =>
      VendorApproveNameListModal(
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
  int? id;
  String? firstName;
  String? lastName;
  String? empId;

  Datum({
    this.id,
    this.firstName,
    this.lastName,
    this.empId,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        empId: json["emp_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "emp_id": empId,
      };
}
