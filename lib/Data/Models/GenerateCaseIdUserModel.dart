// To parse this JSON data, do
//
//     final generateCaseIdStackModel = generateCaseIdStackModelFromJson(jsonString);

import 'dart:convert';

GenerateCaseIdUserModel generateCaseIdUserModelFromJson(String str) =>
    GenerateCaseIdUserModel.fromJson(json.decode(str));

String generateCaseIdUserModelToJson(GenerateCaseIdUserModel data) =>
    json.encode(data.toJson());

class GenerateCaseIdUserModel {
  dynamic status;
  dynamic message;
  List<GeneratedUserDatum>? data;

  GenerateCaseIdUserModel({
    this.status,
    this.message,
    this.data,
  });

  factory GenerateCaseIdUserModel.fromJson(Map<String, dynamic> json) =>
      GenerateCaseIdUserModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<GeneratedUserDatum>.from(
                json["data"]!.map((x) => GeneratedUserDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class GeneratedUserDatum {
  dynamic id;
  dynamic name;
  dynamic phone;

  GeneratedUserDatum({
    this.id,
    this.name,
    this.phone,
  });
  bool districtFilterByName(String filter) {
    return this.name.toString().toLowerCase().trim().contains(filter);
  }

  factory GeneratedUserDatum.fromJson(Map<String, dynamic> json) =>
      GeneratedUserDatum(
        id: json["id"],
        name: json["name"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone": phone,
      };
}
