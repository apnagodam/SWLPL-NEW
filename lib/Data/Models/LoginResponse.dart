// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  dynamic phone;
  dynamic status;
  dynamic otp;
  dynamic message;

  LoginModel({
    this.phone,
    this.status,
    this.otp,
    this.message,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    phone: json["phone"],
    status: json["status"],
    otp: json["otp"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "phone": phone,
    "status": status,
    "otp": otp,
    "message": message,
  };
}
