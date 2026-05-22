// To parse this JSON data, do
//
//     final baseResponse = baseResponseFromMap(jsonString);

// ignore_for_file: unnecessary_question_mark

import 'dart:convert';


BaseResponse baseResponseFromMap(String str) =>
    BaseResponse.fromMap(json.decode(str));

String baseResponseToMap(BaseResponse data) => json.encode(data.toMap());

class BaseResponse {
  dynamic? status;
  dynamic? message;
  dynamic? msg;

  BaseResponse({this.status, this.message, this.msg});

  factory BaseResponse.fromMap(Map<String, dynamic> json) => BaseResponse(
        status: json["status"],
        message: json["message"],
        msg: json["msg"],
      );

  Map<String, dynamic> toMap() =>
      {"status": status, "message": message, 'msg':msg};
}
