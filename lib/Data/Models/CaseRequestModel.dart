// To parse this JSON data, do
//
//     final caseRequestModel = caseRequestModelFromMap(jsonString);

// ignore_for_file: unnecessary_question_mark

import 'dart:convert';

CaseRequestModel caseRequestModelFromMap(String str) => CaseRequestModel.fromMap(json.decode(str));

String caseRequestModelToMap(CaseRequestModel data) => json.encode(data.toMap());

class CaseRequestModel {
  String? status;
  String? message;
  List<InwardRequestDatum>? inwardRequestData;
  List<OutwardRequestDatum>? outwardRequestData;
  dynamic inwardCount;
  dynamic outwardCount;

  CaseRequestModel({
    this.status,
    this.message,
    this.inwardRequestData,
    this.outwardRequestData,
    this.inwardCount,
    this.outwardCount,
  });

  factory CaseRequestModel.fromMap(Map<String, dynamic> json) => CaseRequestModel(
    status: json["status"],
    message: json["message"],
    inwardRequestData: json["inward_request_data"] == null ? [] : List<InwardRequestDatum>.from(json["inward_request_data"]!.map((x) => InwardRequestDatum.fromMap(x))),
    outwardRequestData: json["outward_request_data"] == null ? [] : List<OutwardRequestDatum>.from(json["outward_request_data"]!.map((x) => OutwardRequestDatum.fromMap(x))),
    inwardCount: json["inward_count"],
    outwardCount: json["outward_count"],
  );

  Map<String, dynamic> toMap() => {
    "status": status,
    "message": message,
    "inward_request_data": inwardRequestData == null ? [] : List<dynamic>.from(inwardRequestData!.map((x) => x.toMap())),
    "outward_request_data": outwardRequestData == null ? [] : List<dynamic>.from(outwardRequestData!.map((x) => x.toMap())),
    "inward_count": inwardCount,
    "outward_count": outwardCount,
  };
}

class InwardRequestDatum {
  String? terminalName;
  dynamic terminalId;
  String? inOutType;
  String? userName;
  dynamic userId;
  String? userNumber;
  String? commodity;
  dynamic commodityId;
  String? stackNumber;
  dynamic stackId;
  dynamic stackRequestRowid;
  dynamic wgtInKg;
  String? wgtInQtl;
  String? driverNumber;
  String? vehicleNumber;

  InwardRequestDatum({
    this.terminalName,
    this.terminalId,
    this.inOutType,
    this.userName,
    this.userId,
    this.userNumber,
    this.commodity,
    this.commodityId,
    this.stackNumber,
    this.stackId,
    this.stackRequestRowid,
    this.wgtInKg,
    this.wgtInQtl,
    this.driverNumber,
    this.vehicleNumber,
  });

  factory InwardRequestDatum.fromMap(Map<String, dynamic> json) => InwardRequestDatum(
    terminalName: json["terminal_name"],
    terminalId: json["terminal_id"],
    inOutType: json["in_out_type"],
    userName: json["user_name"],
    userId: json["user_id"],
    userNumber: json["user_number"],
    commodity: json["commodity"],
    commodityId: json["commodity_id"],
    stackNumber: json["stack_number"],
    stackId: json["stack_id"],
    stackRequestRowid: json["stack_request_rowid"],
    wgtInKg: json["wgt_in_kg"],
    wgtInQtl: json["wgt_in_qtl"],
    driverNumber: json["driver_number"],
    vehicleNumber: json["vehicle_number"],
  );

  Map<String, dynamic> toMap() => {
    "terminal_name": terminalName,
    "terminal_id": terminalId,
    "in_out_type": inOutType,
    "user_name": userName,
    "user_id": userId,
    "user_number": userNumber,
    "commodity": commodity,
    "commodity_id": commodityId,
    "stack_number": stackNumber,
    "stack_id": stackId,
    "stack_request_rowid": stackRequestRowid,
    "wgt_in_kg": wgtInKg,
    "wgt_in_qtl": wgtInQtl,
    "driver_number": driverNumber,
    "vehicle_number": vehicleNumber,
  };
}

class OutwardRequestDatum {
  String? terminalName;
  dynamic terminalId;
  String? inOutType;
  String? userName;
  dynamic userId;
  String? userNumber;
  String? commodity;
  dynamic commodityId;
  String? stackNumber;
  dynamic stackId;
  dynamic? stackRequestRowid;
  dynamic wgtInKg;
  String? wgtInQtl;
  String? driverNumber;
  String? vehicleNumber;
  dynamic releaseBags;
  dynamic releaseWeight;

  OutwardRequestDatum({
    this.terminalName,
    this.terminalId,
    this.inOutType,
    this.userName,
    this.userId,
    this.userNumber,
    this.commodity,
    this.commodityId,
    this.stackNumber,
    this.stackId,
    this.stackRequestRowid,
    this.wgtInKg,
    this.wgtInQtl,
    this.driverNumber,
    this.vehicleNumber,
    this.releaseBags,
    this.releaseWeight,
  });

  factory OutwardRequestDatum.fromMap(Map<String, dynamic> json) => OutwardRequestDatum(
    terminalName: json["terminal_name"],
    terminalId: json["terminal_id"],
    inOutType: json["in_out_type"],
    userName: json["user_name"],
    userId: json["user_id"],
    userNumber: json["user_number"],
    commodity: json["commodity"],
    commodityId: json["commodity_id"],
    stackNumber: json["stack_number"],
    stackId: json["stack_id"],
    stackRequestRowid: json["stack_request_rowid"],
    wgtInKg: json["wgt_in_kg"],
    wgtInQtl: json["wgt_in_qtl"],
    driverNumber: json["driver_number"],
    vehicleNumber: json["vehicle_number"],
    releaseBags: json["release_bags"],
    releaseWeight: json["release_weight"],
  );

  Map<String, dynamic> toMap() => {
    "terminal_name": terminalName,
    "terminal_id": terminalId,
    "in_out_type": inOutType,
    "user_name": userName,
    "user_id": userId,
    "user_number": userNumber,
    "commodity": commodity,
    "commodity_id": commodityId,
    "stack_number": stackNumber,
    "stack_id": stackId,
    "stack_request_rowid": stackRequestRowid,
    "wgt_in_kg": wgtInKg,
    "wgt_in_qtl": wgtInQtl,
    "driver_number": driverNumber,
    "vehicle_number": vehicleNumber,
    "release_bags": releaseBags,
    "release_weight": releaseWeight,
  };
}
