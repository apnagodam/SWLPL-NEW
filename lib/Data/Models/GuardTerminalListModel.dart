// To parse this JSON data, do
//
//     final guardTerminalListModel = guardTerminalListModelFromJson(jsonString);

import 'dart:convert';

GuardTerminalListModel guardTerminalListModelFromJson(String str) =>
    GuardTerminalListModel.fromJson(json.decode(str));

String guardTerminalListModelToJson(GuardTerminalListModel data) =>
    json.encode(data.toJson());

class GuardTerminalListModel {
  dynamic status;
  dynamic message;
  List<GuardTerminalDatum>? data;

  GuardTerminalListModel({
    this.status,
    this.message,
    this.data,
  });

  factory GuardTerminalListModel.fromJson(Map<String, dynamic> json) =>
      GuardTerminalListModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<GuardTerminalDatum>.from(
                json["data"]!.map((x) => GuardTerminalDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class GuardTerminalDatum {
  dynamic id;
  dynamic name;

  GuardTerminalDatum({
    this.id,
    this.name,
  });

  factory GuardTerminalDatum.fromJson(Map<String, dynamic> json) =>
      GuardTerminalDatum(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };

  bool districtFilterByName(String filter) {
    return this.name.toString().toLowerCase().trim().contains(filter);
  }
}
