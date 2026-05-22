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
    askReason: json["ask_reason"],
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toMap() => {
    "ask_reason": askReason,
    "status": status,
    "message": message,
  };
}
