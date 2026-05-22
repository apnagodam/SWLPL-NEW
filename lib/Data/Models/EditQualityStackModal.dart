// To parse this JSON data, do
//
//     final stackQualityModal = stackQualityModalFromJson(jsonString);

import 'dart:convert';

StackQualityModal stackQualityModalFromJson(String str) => StackQualityModal.fromJson(json.decode(str));

String stackQualityModalToJson(StackQualityModal data) => json.encode(data.toJson());

class StackQualityModal {
    String? status;
    String? message;
    List<ParametersDatum>? parametersData;

    StackQualityModal({
        this.status,
        this.message,
        this.parametersData,
    });

    factory StackQualityModal.fromJson(Map<String, dynamic> json) => StackQualityModal(
        status: json["status"],
        message: json["message"],
        parametersData: json["parameters_data"] == null ? [] : List<ParametersDatum>.from(json["parameters_data"]!.map((x) => ParametersDatum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "parameters_data": parametersData == null ? [] : List<dynamic>.from(parametersData!.map((x) => x.toJson())),
    };
}

class ParametersDatum {
    int? auditId;
    int? parameterId;
    String? value;
    String? parameter;

    ParametersDatum({
        this.auditId,
        this.parameterId,
        this.value,
        this.parameter,
    });

    factory ParametersDatum.fromJson(Map<String, dynamic> json) => ParametersDatum(
        auditId: json["audit_id"],
        parameterId: json["parameter_id"],
        value: json["value"],
        parameter: json["parameter"],
    );

    Map<String, dynamic> toJson() => {
        "audit_id": auditId,
        "parameter_id": parameterId,
        "value": value,
        "parameter": parameter,
    };
}
