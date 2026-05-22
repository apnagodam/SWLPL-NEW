// To parse this JSON data, do
//
//     final employeeWalletStatementModel = employeeWalletStatementModelFromJson(jsonString);

import 'dart:convert';

EmployeeWalletStatementModel employeeWalletStatementModelFromJson(String str) => EmployeeWalletStatementModel.fromJson(json.decode(str));

String employeeWalletStatementModelToJson(EmployeeWalletStatementModel data) => json.encode(data.toJson());

class EmployeeWalletStatementModel {
  dynamic status;
  dynamic message;
  List<Datum>? data;

  EmployeeWalletStatementModel({
    this.status,
    this.message,
    this.data,
  });

  factory EmployeeWalletStatementModel.fromJson(Map<String, dynamic> json) => EmployeeWalletStatementModel(
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
  dynamic userId;
  dynamic label;
  dynamic narration;
  dynamic referenceNo;
  dynamic amount;
  dynamic type;
  dynamic balance;
  dynamic days;
  dynamic remark;
  dynamic date;
  dynamic status;

  Datum({
    this.id,
    this.userId,
    this.label,
    this.narration,
    this.referenceNo,
    this.amount,
    this.type,
    this.balance,
    this.days,
    this.remark,
    this.date,
    this.status,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    userId: json["user_id"],
    label: json["label"],
    narration: json["narration"],
    referenceNo: json["reference_no"],
    amount: json["amount"],
    type: json["type"],
    balance: json["balance"],
    days: json["days"],
    remark: json["remark"],
    date: json["date"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "label": label,
    "narration": narration,
    "reference_no": referenceNo,
    "amount": amount,
    "type": type,
    "balance": balance,
    "days": days,
    "remark": remark,
    "date": date,
    "status": status,
  };
}
