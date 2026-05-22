// To parse this JSON data, do
//
//     final stackWiseCommdityModal = stackWiseCommdityModalFromJson(jsonString);

import 'dart:convert';

StackWiseCommdityModal stackWiseCommdityModalFromJson(String str) => StackWiseCommdityModal.fromJson(json.decode(str));

String stackWiseCommdityModalToJson(StackWiseCommdityModal data) => json.encode(data.toJson());

class StackWiseCommdityModal {
    String? status;
    String? message;
    String? commodity;
    List<Parameter>? parameters;

    StackWiseCommdityModal({
        this.status,
        this.message,
        this.commodity,
        this.parameters,
    });

    factory StackWiseCommdityModal.fromJson(Map<String, dynamic> json) => StackWiseCommdityModal(
        status: json["status"],
        message: json["message"],
        commodity: json["commodity"],
        parameters: json["parameters"] == null ? [] : List<Parameter>.from(json["parameters"]!.map((x) => Parameter.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "commodity": commodity,
        "parameters": parameters == null ? [] : List<dynamic>.from(parameters!.map((x) => x.toJson())),
    };
}

class Parameter {
    int? id;
    String? parameter;

    Parameter({
        this.id,
        this.parameter,
    });

    factory Parameter.fromJson(Map<String, dynamic> json) => Parameter(
        id: json["id"],
        parameter: json["parameter"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "parameter": parameter,
    };
}
