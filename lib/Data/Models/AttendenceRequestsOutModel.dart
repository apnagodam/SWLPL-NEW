// To parse this JSON data, do
//
//     final attendenceRequestsOutModel = attendenceRequestsOutModelFromJson(jsonString);

import 'dart:convert';

AttendenceRequestsOutModel attendenceRequestsOutModelFromJson(String str) => AttendenceRequestsOutModel.fromJson(json.decode(str));

String attendenceRequestsOutModelToJson(AttendenceRequestsOutModel data) => json.encode(data.toJson());

class AttendenceRequestsOutModel {
  dynamic status;
  dynamic message;
  List<OutAttenDatum>? outAttenData;

  AttendenceRequestsOutModel({
    this.status,
    this.message,
    this.outAttenData,
  });

  factory AttendenceRequestsOutModel.fromJson(Map<String, dynamic> json) => AttendenceRequestsOutModel(
    status: json["status"],
    message: json["message"],
    outAttenData: json["out_atten_data"] == null ? [] : List<OutAttenDatum>.from(json["out_atten_data"]!.map((x) => OutAttenDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "out_atten_data": outAttenData == null ? [] : List<dynamic>.from(outAttenData!.map((x) => x.toJson())),
  };
}

class OutAttenDatum {
  dynamic id;
  dynamic empId;
  dynamic firstName;
  dynamic lastName;
  DateTime? date;
  dynamic time;
  dynamic distance;
  dynamic location;
  dynamic image;
  dynamic outRemark;

  OutAttenDatum({
    this.id,
    this.empId,
    this.firstName,
    this.lastName,
    this.date,
    this.time,
    this.distance,
    this.location,
    this.image,
    this.outRemark,
  });

  factory OutAttenDatum.fromJson(Map<String, dynamic> json) => OutAttenDatum(
    id: json["id"],
    empId: json["emp_id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    time: json["time"],
    distance: json["distance"],
    location: json["location"],
    image: json["image"],
    outRemark: json["out_remark"] ?? json["outRemark"] ?? json["user_purpose"] ?? json["remark"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "emp_id": empId,
    "first_name": firstName,
    "last_name": lastName,
    "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
    "time": time,
    "distance": distance,
    "location": location,
    "image": image,
    "out_remark": outRemark,
  };
}
