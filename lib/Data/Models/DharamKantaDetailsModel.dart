// To parse this JSON data, do
//
//     final dharamKantaDetailsModel = dharamKantaDetailsModelFromMap(jsonString);

import 'dart:convert';

DharamKantaDetailsModel dharamKantaDetailsModelFromMap(String str) => DharamKantaDetailsModel.fromMap(json.decode(str));

String dharamKantaDetailsModelToMap(DharamKantaDetailsModel data) => json.encode(data.toMap());

class DharamKantaDetailsModel {
  String? status;
  String? message;
  Data? data;

  DharamKantaDetailsModel({
    this.status,
    this.message,
    this.data,
  });

  factory DharamKantaDetailsModel.fromMap(Map<String, dynamic> json) => DharamKantaDetailsModel(
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
  String? name;
  dynamic id;

  Data({
    this.name,
    this.id,
  });

  factory Data.fromMap(Map<String, dynamic> json) => Data(
    name: json["name"],
    id: json["id"],
  );

  Map<String, dynamic> toMap() => {
    "name": name,
    "id": id,
  };
}
