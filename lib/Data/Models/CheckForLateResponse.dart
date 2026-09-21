// To parse this JSON data, do
//
//     final checkForLateResponse = checkForLateResponseFromMap(jsonString);

import 'dart:convert';

CheckForLateResponse checkForLateResponseFromMap(String str) => CheckForLateResponse.fromMap(json.decode(str));

String checkForLateResponseToMap(CheckForLateResponse data) => json.encode(data.toMap());

class CheckForLateResponse {
  int? askReason;
  int? status;
  String? message;

  CheckForLateResponse({
    this.askReason,
    this.status,
    this.message,
  });

  factory CheckForLateResponse.fromMap(Map<String, dynamic> json) => CheckForLateResponse(
    askReason: json["ask_reason"] != null ? int.tryParse(json["ask_reason"].toString()) : null,
    status: json["status"] != null ? int.tryParse(json["status"].toString()) : null,
    message: json["message"]?.toString(),
  );

  Map<String, dynamic> toMap() => {
    "ask_reason": askReason,
    "status": status,
    "message": message,
  };
}
