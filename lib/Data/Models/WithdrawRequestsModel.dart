// To parse this JSON data, do
//
//     final withdrawRequestsModel = withdrawRequestsModelFromJson(jsonString);

import 'dart:convert';

WithdrawRequestsModel withdrawRequestsModelFromJson(String str) =>
    WithdrawRequestsModel.fromJson(json.decode(str));

String withdrawRequestsModelToJson(WithdrawRequestsModel data) =>
    json.encode(data.toJson());

class WithdrawRequestsModel {
  dynamic status;
  dynamic message;
  List<Datum>? data;

  WithdrawRequestsModel({
    this.status,
    this.message,
    this.data,
  });

  factory WithdrawRequestsModel.fromJson(Map<String, dynamic> json) =>
      WithdrawRequestsModel(
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
  dynamic userId;
  dynamic requestedAmount;
  dynamic approvedAmount;
  dynamic status;
  dynamic notes;
  dynamic createdAt;
  dynamic remark;
  dynamic firstName;
  dynamic lastName;
  dynamic empId;

  Datum({
    this.id,
    this.userId,
    this.requestedAmount,
    this.approvedAmount,
    this.status,
    this.notes,
    this.createdAt,
    this.remark,
    this.firstName,
    this.lastName,
    this.empId,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        userId: json["user_id"],
        requestedAmount: json["requested_amount"],
        approvedAmount: json["approved_amount"],
        status: json["status"],
        notes: json["notes"],
        createdAt: json["created_at"],
        remark: json["remark"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        empId: json["emp_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "requested_amount": requestedAmount,
        "approved_amount": approvedAmount,
        "status": status,
        "notes": notes,
        "created_at": createdAt,
        "remark": remark,
        "first_name": firstName,
        "last_name": lastName,
        "emp_id": empId,
      };
}
