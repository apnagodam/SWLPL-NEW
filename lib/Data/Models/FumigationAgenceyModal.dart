// To parse this JSON data, do
//
//     final fumigationAgencyModal = fumigationAgencyModalFromJson(jsonString);

import 'dart:convert';

FumigationAgencyModal fumigationAgencyModalFromJson(String str) => FumigationAgencyModal.fromJson(json.decode(str));

String fumigationAgencyModalToJson(FumigationAgencyModal data) => json.encode(data.toJson());

class FumigationAgencyModal {
    dynamic status;
    dynamic message;
    List<Datum>? data;

    FumigationAgencyModal({
        this.status,
        this.message,
        this.data,
    });

    factory FumigationAgencyModal.fromJson(Map<String, dynamic> json) => FumigationAgencyModal(
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
    dynamic agencyName;

    Datum({
        this.id,
        this.agencyName,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        agencyName: json["agency_name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "agency_name": agencyName,
    };
}
