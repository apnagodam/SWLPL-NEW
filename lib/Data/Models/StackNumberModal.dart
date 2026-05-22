// To parse this JSON data, do
//
//     final stackNumberMOdal = stackNumberMOdalFromJson(jsonString);

import 'dart:convert';

StackNumberMOdal stackNumberMOdalFromJson(String str) =>
    StackNumberMOdal.fromJson(json.decode(str));

String stackNumberMOdalToJson(StackNumberMOdal data) =>
    json.encode(data.toJson());

class StackNumberMOdal {
  String? status;
  String? message;
  List<StackDatum>? data;

  StackNumberMOdal({
    this.status,
    this.message,
    this.data,
  });

  factory StackNumberMOdal.fromJson(Map<String, dynamic> json) =>
      StackNumberMOdal(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<StackDatum>.from(
                json["data"]!.map((x) => StackDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class StackDatum {
  String? stackNo;

  StackDatum({
    this.stackNo,
  });

  factory StackDatum.fromJson(Map<String, dynamic> json) => StackDatum(
        stackNo: json["stack_no"],
      );

  Map<String, dynamic> toJson() => {
        "stack_no": stackNo,
      };
}
