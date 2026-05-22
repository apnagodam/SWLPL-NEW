// To parse this JSON data, do
//
//     final attendenceRequestsInModel = attendenceRequestsInModelFromJson(jsonString);

import 'dart:convert';

AttendenceRequestsInModel attendenceRequestsInModelFromJson(String str) => AttendenceRequestsInModel.fromJson(json.decode(str));

String attendenceRequestsInModelToJson(AttendenceRequestsInModel data) => json.encode(data.toJson());

class AttendenceRequestsInModel {
  dynamic status;
  dynamic message;
  List<InAttenDatum>? inAttenData;

  AttendenceRequestsInModel({
    this.status,
    this.message,
    this.inAttenData,
  });

  factory AttendenceRequestsInModel.fromJson(Map<String, dynamic> json) => AttendenceRequestsInModel(
    status: json["status"],
    message: json["message"],
    inAttenData: json["in_atten_data"] == null ? [] : List<InAttenDatum>.from(json["in_atten_data"]!.map((x) => InAttenDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "in_atten_data": inAttenData == null ? [] : List<dynamic>.from(inAttenData!.map((x) => x.toJson())),
  };
}

class InAttenDatum {
  dynamic id;
  dynamic empId;
  dynamic firstName;
  dynamic lastName;
  DateTime? date;
  dynamic time;
  dynamic distance;
  dynamic location;
  dynamic image;

  InAttenDatum({
    this.id,
    this.empId,
    this.firstName,
    this.lastName,
    this.date,
    this.time,
    this.distance,
    this.location,
    this.image,
  });

  factory InAttenDatum.fromJson(Map<String, dynamic> json) => InAttenDatum(
    id: json["id"],
    empId: json["emp_id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    time: json["time"],
    distance: json["distance"],
    location: json["location"],
    image: json["image"],
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
  };
}
