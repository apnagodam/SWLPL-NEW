// To parse this JSON data, do
//
//     final commdityParametersModal = commdityParametersModalFromJson(jsonString);

import 'dart:convert';

CommdityParametersModal commdityParametersModalFromJson(String str) => CommdityParametersModal.fromJson(json.decode(str));

String commdityParametersModalToJson(CommdityParametersModal data) => json.encode(data.toJson());

class CommdityParametersModal {
    String? status;
    String? message;
    List<Datum>? data;

    CommdityParametersModal({
        this.status,
        this.message,
        this.data,
    });

    factory CommdityParametersModal.fromJson(Map<String, dynamic> json) => CommdityParametersModal(
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
    int? id;
    String? name;

    Datum({
        this.id,
        this.name,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
