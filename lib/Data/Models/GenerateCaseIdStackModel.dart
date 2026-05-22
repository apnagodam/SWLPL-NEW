// To parse this JSON data, do
//
//     final generateCaseIdStackModel = generateCaseIdStackModelFromJson(jsonString);

import 'dart:convert';

GenerateCaseIdStackModel generateCaseIdStackModelFromJson(String str) =>
    GenerateCaseIdStackModel.fromJson(json.decode(str));

String generateCaseIdStackModelToJson(GenerateCaseIdStackModel data) =>
    json.encode(data.toJson());

class GenerateCaseIdStackModel {
  dynamic status;
  dynamic message;
  List<StackDatum>? data;

  GenerateCaseIdStackModel({
    this.status,
    this.message,
    this.data,
  });

  factory GenerateCaseIdStackModel.fromJson(Map<String, dynamic> json) =>
      GenerateCaseIdStackModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<StackDatum>.from(
                json["data"]!.map((x) => StackDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class StackDatum {
  dynamic id;
  dynamic stackId;
  dynamic userId;
  dynamic reqCommodityId;
  dynamic reqStackType;
  dynamic stackNumber;
  dynamic requestWeight;
  dynamic inOutStatus;
  dynamic inwordBookingStatus;
  dynamic reqStactTotalWeight;
  dynamic reqStactRemaningWeight;
  dynamic vehicleNo;
  dynamic driverNumber;
  dynamic otp;
  dynamic aproveRejectUserId;
  dynamic newStackReqStatus;
  dynamic rentRate;
  dynamic commodityArrivalDate;
  dynamic isLockIn;
  dynamic tripId;
  dynamic releaseWeight;
  dynamic releaseBags;
  dynamic status;
  dynamic createdAt;
  dynamic updatedAt;

  StackDatum({
    this.id,
    this.stackId,
    this.userId,
    this.reqCommodityId,
    this.reqStackType,
    this.stackNumber,
    this.requestWeight,
    this.inOutStatus,
    this.inwordBookingStatus,
    this.reqStactTotalWeight,
    this.reqStactRemaningWeight,
    this.vehicleNo,
    this.driverNumber,
    this.otp,
    this.aproveRejectUserId,
    this.newStackReqStatus,
    this.rentRate,
    this.commodityArrivalDate,
    this.isLockIn,
    this.tripId,
    this.releaseWeight,
    this.releaseBags,
    this.status,
    this.createdAt,
    this.updatedAt,
  });
  bool districtFilterByName(String filter) {
    return this.stackNumber.toString().toLowerCase().trim().contains(filter);
  }

  factory StackDatum.fromJson(Map<String, dynamic> json) => StackDatum(
        id: json["id"],
        stackId: json["stack_id"],
        userId: json["user_id"],
        reqCommodityId: json["req_commodity_id"],
        reqStackType: json["req_stack_type"],
        stackNumber: json["stack_number"],
        requestWeight: json["request_weight"],
        inOutStatus: json["in_out_status"],
        inwordBookingStatus: json["inword_booking_status"],
        reqStactTotalWeight: json["req_stact_total_weight"],
        reqStactRemaningWeight: json["req_stact_remaning_weight"],
        vehicleNo: json["vehicle_no"],
        driverNumber: json["driver_number"],
        otp: json["otp"],
        aproveRejectUserId: json["aprove_reject_userId"],
        newStackReqStatus: json["new_stack_req_status"],
        rentRate: json["rent_rate"],
        commodityArrivalDate: json["commodity_arrival_date"] == null
            ? null
            : DateTime.parse(json["commodity_arrival_date"]),
        isLockIn: json["is_lock_in"],
        tripId: json["trip_id"],
        releaseWeight: json["release_weight"],
        releaseBags: json["release_bags"],
        status: json["status"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "stack_id": stackId,
        "user_id": userId,
        "req_commodity_id": reqCommodityId,
        "req_stack_type": reqStackType,
        "stack_number": stackNumber,
        "request_weight": requestWeight,
        "in_out_status": inOutStatus,
        "inword_booking_status": inwordBookingStatus,
        "req_stact_total_weight": reqStactTotalWeight,
        "req_stact_remaning_weight": reqStactRemaningWeight,
        "vehicle_no": vehicleNo,
        "driver_number": driverNumber,
        "otp": otp,
        "aprove_reject_userId": aproveRejectUserId,
        "new_stack_req_status": newStackReqStatus,
        "rent_rate": rentRate,
        "commodity_arrival_date":
            "${commodityArrivalDate!.year.toString().padLeft(4, '0')}-${commodityArrivalDate!.month.toString().padLeft(2, '0')}-${commodityArrivalDate!.day.toString().padLeft(2, '0')}",
        "is_lock_in": isLockIn,
        "trip_id": tripId,
        "release_weight": releaseWeight,
        "release_bags": releaseBags,
        "status": status,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
