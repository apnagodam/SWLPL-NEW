// To parse this JSON data, do
//
//     final dharamKantaModel = dharamKantaModelFromMap(jsondynamic);

import 'dart:convert';

DharamKantaModel dharamKantaModelFromMap(dynamic str) =>
    DharamKantaModel.fromMap(json.decode(str));

dynamic dharamKantaModelToMap(DharamKantaModel data) =>
    json.encode(data.toMap());

class DharamKantaModel {
  dynamic status;
  dynamic message;
  Data? data;

  DharamKantaModel({
    this.status,
    this.message,
    this.data,
  });

  factory DharamKantaModel.fromMap(Map<dynamic, dynamic> json) =>
      DharamKantaModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromMap(json["data"]),
      );

  Map<dynamic, dynamic> toMap() => {
        "status": status,
        "message": message,
        "data": data?.toMap(),
      };
}

class Data {
  dynamic kantaParchiNumber;
  dynamic kantaName;
  dynamic kantaId;
  dynamic truckPhoto;

  Data({this.kantaParchiNumber, this.kantaName, this.kantaId, this.truckPhoto});

  factory Data.fromMap(Map<dynamic, dynamic> json) => Data(
      kantaParchiNumber: json["kanta_parchi_number"],
      kantaName: json["kanta_name"],
      kantaId: json["kanta_id"],
      truckPhoto: json['truck_photo']);

  Map<dynamic, dynamic> toMap() => {
        "kanta_parchi_number": kantaParchiNumber,
        "kanta_name": kantaName,
        "kanta_id": kantaId,
        "truck_photo": truckPhoto
      };
}
