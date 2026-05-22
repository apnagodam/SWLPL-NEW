// // To parse this JSON data, do
// //
// //     final holidaysModel = holidaysModelFromJson(jsonString);

// import 'dart:convert';

// HolidaysModel holidaysModelFromJson(String str) =>
//     HolidaysModel.fromJson(json.decode(str));

// String holidaysModelToJson(HolidaysModel data) => json.encode(data.toJson());

// class HolidaysModel {
//   dynamic status;
//   dynamic message;
//   List<Datum>? data;

//   HolidaysModel({
//     this.status,
//     this.message,
//     this.data,
//   });

//   factory HolidaysModel.fromJson(Map<String, dynamic> json) => HolidaysModel(
//         status: json["status"],
//         message: json["message"],
//         data: json["data"] == null
//             ? []
//             : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "status": status,
//         "message": message,
//         "data": data == null
//             ? []
//             : List<dynamic>.from(data!.map((x) => x.toJson())),
//       };
// }

// class Datum {
//   dynamic id;
//   dynamic date;
//   dynamic reason;
//   dynamic status;

//   Datum({
//     this.id,
//     this.date,
//     this.reason,
//     this.status,
//   });

//   factory Datum.fromJson(Map<String, dynamic> json) => Datum(
//         id: json["id"],
//         date: json["date"] == null ? null : DateTime.parse(json["date"]),
//         reason: json["reason"],
//         status: json["status"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "date":
//             "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
//         "reason": reason,
//         "status": status,
//       };
// }
// To parse this JSON data, do
//
//     final holidaysModel = holidaysModelFromJson(jsonString);

import 'dart:convert';

HolidaysModel holidaysModelFromJson(String str) =>
    HolidaysModel.fromJson(json.decode(str));

String holidaysModelToJson(HolidaysModel data) => json.encode(data.toJson());

class HolidaysModel {
  dynamic status;
  dynamic message;
  List<Datum>? data;
  Due? spDue;
  Due? clDue;
  List<Due>? chrDue;
  List<Due>? fumDue;

  HolidaysModel({
    this.status,
    this.message,
    this.data,
    this.spDue,
    this.clDue,
    this.chrDue,
    this.fumDue,
  });

  factory HolidaysModel.fromJson(Map<String, dynamic> json) => HolidaysModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        spDue: json["sp_due"] == null ? null : Due.fromJson(json["sp_due"]),
        clDue: json["cl_due"] == null ? null : Due.fromJson(json["cl_due"]),
        chrDue: json["chr_due"] == null
            ? []
            : List<Due>.from(json["chr_due"]!.map((x) => Due.fromJson(x))),
        fumDue: json["fum_due"] == null
            ? []
            : List<Due>.from(json["fum_due"]!.map((x) => Due.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "sp_due": spDue?.toJson(),
        "cl_due": clDue?.toJson(),
        "chr_due": chrDue == null
            ? []
            : List<dynamic>.from(chrDue!.map((x) => x.toJson())),
        "fum_due": fumDue == null
            ? []
            : List<dynamic>.from(fumDue!.map((x) => x.toJson())),
      };
}

class Due {
  dynamic nextDate;

  Due({
    this.nextDate,
  });

  factory Due.fromJson(Map<String, dynamic> json) => Due(
        nextDate: json["next_date"] == null
            ? null
            : DateTime.parse(json["next_date"]),
      );

  Map<String, dynamic> toJson() => {
        "next_date":
            "${nextDate!.year.toString().padLeft(4, '0')}-${nextDate!.month.toString().padLeft(2, '0')}-${nextDate!.day.toString().padLeft(2, '0')}",
      };
}

class Datum {
  dynamic id;
  dynamic date;
  dynamic reason;
  dynamic status;

  Datum({
    this.id,
    this.date,
    this.reason,
    this.status,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        reason: json["reason"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "reason": reason,
        "status": status,
      };
}
