// To parse this JSON data, do
//
//     final pvResponseModel = pvResponseModelFromMap(jsonString);

import 'dart:convert';

PvResponseModel pvResponseModelFromMap(String str) => PvResponseModel.fromMap(json.decode(str));

String pvResponseModelToMap(PvResponseModel data) => json.encode(data.toMap());

class PvResponseModel {
  List<Datum>? terminalData;
  List<Datum>? stackData;
  String? status;
  String? message;

  PvResponseModel({
    this.terminalData,
    this.stackData,
    this.status,
    this.message,
  });

  factory PvResponseModel.fromMap(Map<String, dynamic> json) => PvResponseModel(
    terminalData: json["terminal_data"] == null ? [] : List<Datum>.from(json["terminal_data"]!.map((x) => Datum.fromMap(x))),
    stackData: json["stack_data"] == null ? [] : List<Datum>.from(json["stack_data"]!.map((x) => Datum.fromMap(x))),
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toMap() => {
    "terminal_data": terminalData == null ? [] : List<dynamic>.from(terminalData!.map((x) => x.toMap())),
    "stack_data": stackData == null ? [] : List<dynamic>.from(stackData!.map((x) => x.toMap())),
    "status": status,
    "message": message,
  };
}

class Datum {
  int? id;
  int? terminalId;
  String? stackNo;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? name;
  String? warehouseCode;
  int? warehouseId;

  Datum({
    this.id,
    this.terminalId,
    this.stackNo,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.name,
    this.warehouseCode,
    this.warehouseId,
  });

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
    id: json["id"],
    terminalId: json["terminal_id"],
    stackNo: json["stack_no"],
    status: json["status"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    name: json["name"],
    warehouseCode: json["warehouse_code"],
    warehouseId: json["warehouse_id"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "terminal_id": terminalId,
    "stack_no": stackNo,
    "status": status,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "name": name,
    "warehouse_code": warehouseCode,
    "warehouse_id": warehouseId,
  };
}
