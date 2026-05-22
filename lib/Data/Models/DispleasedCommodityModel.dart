// To parse this JSON data, do
//
//     final displeasedCommodityModel = displeasedCommodityModelFromMap(jsonString);

import 'dart:convert';

DispleasedCommodityModel displeasedCommodityModelFromMap(String str) => DispleasedCommodityModel.fromMap(json.decode(str));

String displeasedCommodityModelToMap(DispleasedCommodityModel data) => json.encode(data.toMap());

class DispleasedCommodityModel {
  List<Datum>? data;
  String? status;
  String? message;

  DispleasedCommodityModel({
    this.data,
    this.status,
    this.message,
  });

  factory DispleasedCommodityModel.fromMap(Map<String, dynamic> json) => DispleasedCommodityModel(
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromMap(x))),
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toMap() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
    "status": status,
    "message": message,
  };
}

class Datum {
  dynamic commodity;
  String? category;

  Datum({
    this.commodity,
    this.category,
  });

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
    commodity: json["commodity"],
    category: json["category"],
  );

  Map<String, dynamic> toMap() => {
    "commodity": commodity,
    "category": category,
  };
}
