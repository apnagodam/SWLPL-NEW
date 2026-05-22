// To parse this JSON data, do
//
//     final generateCaseIdTripIdModel = generateCaseIdTripIdModelFromJson(jsonString);

import 'dart:convert';

GenerateCaseIdTripIdModel generateCaseIdTripIdModelFromJson(String str) =>
    GenerateCaseIdTripIdModel.fromJson(json.decode(str));

String generateCaseIdTripIdModelToJson(GenerateCaseIdTripIdModel data) =>
    json.encode(data.toJson());

class GenerateCaseIdTripIdModel {
  dynamic status;
  dynamic message;
  List<TripIdDatum>? data;

  GenerateCaseIdTripIdModel({
    this.status,
    this.message,
    this.data,
  });

  factory GenerateCaseIdTripIdModel.fromJson(Map<String, dynamic> json) =>
      GenerateCaseIdTripIdModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<TripIdDatum>.from(
                json["data"]!.map((x) => TripIdDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class TripIdDatum {
  dynamic id;
  dynamic tripRequestId;

  TripIdDatum({
    this.id,
    this.tripRequestId,
  });

  bool filter(String filter) {
    return this.tripRequestId.toString().toLowerCase().trim().contains(filter);
  }

  factory TripIdDatum.fromJson(Map<String, dynamic> json) => TripIdDatum(
        id: json["id"],
        tripRequestId: json["trip_request_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "trip_request_id": tripRequestId,
      };
}
