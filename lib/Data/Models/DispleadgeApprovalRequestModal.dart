// To parse this JSON data, do
//
//     final displedgeApprovalRequestModal = displedgeApprovalRequestModalFromJson(jsonString);

import 'dart:convert';

DispledgeApprovalRequestModal displedgeApprovalRequestModalFromJson(String str) => DispledgeApprovalRequestModal.fromJson(json.decode(str));

String displedgeApprovalRequestModalToJson(DispledgeApprovalRequestModal data) => json.encode(data.toJson());

class DispledgeApprovalRequestModal {
  dynamic status;
  dynamic message;
  List<Datum>? data;

  DispledgeApprovalRequestModal({
    this.status,
    this.message,
    this.data,
  });

  factory DispledgeApprovalRequestModal.fromJson(Map<String, dynamic> json) => DispledgeApprovalRequestModal(
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
  dynamic requestTo;
  dynamic userName;
  dynamic warehouseName;
  dynamic commodity;
  dynamic stackNo;
  dynamic netWeight;
  dynamic bags;
  dynamic empDisplegeNotes;
  dynamic displedgeImage;
  dynamic notes;
  dynamic status;
  DateTime? createdAt;

  Datum({
    this.id,
    this.requestTo,
    this.userName,
    this.warehouseName,
    this.commodity,
    this.stackNo,
    this.netWeight,
    this.bags,
    this.empDisplegeNotes,
    this.displedgeImage,
    this.notes,
    this.status,
    this.createdAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    requestTo: json["request_to"],
    userName: json["user_name"],
    warehouseName: json["warehouse_name"],
    commodity: json["commodity"],
    stackNo: json["stack_no"],
    netWeight: json["net_weight"],
    bags: json["bags"],
    empDisplegeNotes: json["emp_displege_notes"],
    displedgeImage: json["displedge_image"],
    notes: json["notes"],
    status: json["status"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "request_to": requestTo,
    "user_name": userName,
    "warehouse_name": warehouseName,
    "commodity": commodity,
    "stack_no": stackNo,
    "net_weight": netWeight,
    "bags": bags,
    "emp_displege_notes": empDisplegeNotes,
    "displedge_image": displedgeImage,
    "notes": notes,
    "status": status,
    "created_at": "${createdAt!.year.toString().padLeft(4, '0')}-${createdAt!.month.toString().padLeft(2, '0')}-${createdAt!.day.toString().padLeft(2, '0')}",
  };
}