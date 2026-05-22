// To parse this JSON data, do
//
//     final chrQualityPerameterModal = chrQualityPerameterModalFromJson(jsonString);

import 'dart:convert';

ChrQualityPerameterModal chrQualityPerameterModalFromJson(String str) => ChrQualityPerameterModal.fromJson(json.decode(str));

String chrQualityPerameterModalToJson(ChrQualityPerameterModal data) => json.encode(data.toJson());

class ChrQualityPerameterModal {
    dynamic status;
    dynamic message;
    List<Datum>? data;

    ChrQualityPerameterModal({
        this.status,
        this.message,
        this.data,
    });

    factory ChrQualityPerameterModal.fromJson(Map<String, dynamic> json) => ChrQualityPerameterModal(
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
    dynamic parameter;
    dynamic value;

    Datum({
        this.parameter,
        this.value,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        parameter: json["parameter"],
        value: json["value"],
    );

    Map<String, dynamic> toJson() => {
        "parameter": parameter,
        "value": value,
    };
}
