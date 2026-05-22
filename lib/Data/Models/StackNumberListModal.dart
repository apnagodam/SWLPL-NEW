// To parse this JSON data, do
//
//     final stackNumberListModal = stackNumberListModalFromJson(jsonString);

import 'dart:convert';

StackNumberListModal stackNumberListModalFromJson(String str) => StackNumberListModal.fromJson(json.decode(str));

String stackNumberListModalToJson(StackNumberListModal data) => json.encode(data.toJson());

class StackNumberListModal {
    String? status;
    String? message;
    List<StackNumberList>? data;

    StackNumberListModal({
        this.status,
        this.message,
        this.data,
    });

    factory StackNumberListModal.fromJson(Map<String, dynamic> json) => StackNumberListModal(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? [] : List<StackNumberList>.from(json["data"]!.map((x) => StackNumberList.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class StackNumberList {
    String? stackNo;

    StackNumberList({
        this.stackNo,
    });

    factory StackNumberList.fromJson(Map<String, dynamic> json) => StackNumberList(
        stackNo: json["stack_no"],
    );

    Map<String, dynamic> toJson() => {
        "stack_no": stackNo,
    };
}
