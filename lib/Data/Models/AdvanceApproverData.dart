// To parse this JSON data, do
//
//     final advanceApproverData = advanceApproverDataFromMap(jsonString);

import 'dart:convert';

AdvanceApproverData advanceApproverDataFromMap(String str) =>
    AdvanceApproverData.fromMap(json.decode(str));

String advanceApproverDataToMap(AdvanceApproverData data) =>
    json.encode(data.toMap());

class AdvanceApproverData {
  dynamic status;
  dynamic message;
  Data? data;

  AdvanceApproverData({
    this.status,
    this.message,
    this.data,
  });

  factory AdvanceApproverData.fromMap(Map<String, dynamic> json) =>
      AdvanceApproverData(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "message": message,
        "data": data?.toMap(),
      };
}

class Data {
  dynamic userId;
  dynamic firstName;
  dynamic lastName;
  dynamic empId;

  Data({
    this.userId,
    this.firstName,
    this.lastName,
    this.empId,
  });

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        userId: json["user_id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        empId: json["emp_id"],
      );

  Map<String, dynamic> toMap() => {
        "user_id": userId,
        "first_name": firstName,
        "last_name": lastName,
        "emp_id": empId,
      };
}
