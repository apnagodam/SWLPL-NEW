// To parse this JSON data, do
//
//     final transporterListModel = transporterListModelFromMap(jsonString);

import 'dart:convert';

TransporterListModel transporterListModelFromMap(String str) => TransporterListModel.fromMap(json.decode(str));

String transporterListModelToMap(TransporterListModel data) => json.encode(data.toMap());

class TransporterListModel {
  List<Datum>? data;
  String? status;
  String? message;

  TransporterListModel({
    this.data,
    this.status,
    this.message,
  });

  factory TransporterListModel.fromMap(Map<String, dynamic> json) => TransporterListModel(
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromMap(x))),
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toMap() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
    "status": status,
    "message": message,
  };
}

class Datum {
  dynamic id;
  String? transporterUniqueId;
  String? transporterName;
  String? transporterFirmName;
  dynamic transporterAge;
  String? transporterEmail;
  String? transporterPhoneNo;
  String? transporterLocation;
  String? transporterBankName;
  String? transporterAccountNumber;
  String? transporterIfscCode;
  String? transporterRate;
  String? vehicleNo;
  String? transporterPancardNumber;
  String? transporterAadharNumber;
  String? transporterGstNumber;
  String? transporterProfileImage;
  String? transporterPancardImage;
  String? transporterAadharImage;
  String? transporterGstImage;
  String? bankPassbookImage;
  String? transporterRcImage;
  dynamic verifyStatus;
  dynamic status;
  String? createdAt;
  String? updatedAt;

  Datum({
    this.id,
    this.transporterUniqueId,
    this.transporterName,
    this.transporterFirmName,
    this.transporterAge,
    this.transporterEmail,
    this.transporterPhoneNo,
    this.transporterLocation,
    this.transporterBankName,
    this.transporterAccountNumber,
    this.transporterIfscCode,
    this.transporterRate,
    this.vehicleNo,
    this.transporterPancardNumber,
    this.transporterAadharNumber,
    this.transporterGstNumber,
    this.transporterProfileImage,
    this.transporterPancardImage,
    this.transporterAadharImage,
    this.transporterGstImage,
    this.bankPassbookImage,
    this.transporterRcImage,
    this.verifyStatus,
    this.status,
    this.createdAt,
    this.updatedAt,
  });
  bool districtFilterByName(String filter) {
    return this.transporterName.toString().toLowerCase().trim().contains(filter);
  }
  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
    id: json["id"],
    transporterUniqueId: json["transporter_unique_id"],
    transporterName: json["transporter_name"],
    transporterFirmName: json["transporter_firm_name"],
    transporterAge: json["transporter_age"],
    transporterEmail: json["transporter_email"],
    transporterPhoneNo: json["transporter_phone_no"],
    transporterLocation: json["transporter_location"],
    transporterBankName: json["transporter_bank_name"],
    transporterAccountNumber: json["transporter_account_number"],
    transporterIfscCode: json["transporter_ifsc_code"],
    transporterRate: json["transporter_rate"],
    vehicleNo: json["vehicle_no"],
    transporterPancardNumber: json["transporter_pancard_number"],
    transporterAadharNumber: json["transporter_aadhar_number"],
    transporterGstNumber: json["transporter_gst_number"],
    transporterProfileImage: json["transporter_profile_image"],
    transporterPancardImage: json["transporter_pancard_image"],
    transporterAadharImage: json["transporter_aadhar_image"],
    transporterGstImage: json["transporter_gst_image"],
    bankPassbookImage: json["bank_passbook_image"],
    transporterRcImage: json["transporter_rc_image"],
    verifyStatus: json["verify_status"],
    status: json["status"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "transporter_unique_id": transporterUniqueId,
    "transporter_name": transporterName,
    "transporter_firm_name": transporterFirmName,
    "transporter_age": transporterAge,
    "transporter_email": transporterEmail,
    "transporter_phone_no": transporterPhoneNo,
    "transporter_location": transporterLocation,
    "transporter_bank_name": transporterBankName,
    "transporter_account_number": transporterAccountNumber,
    "transporter_ifsc_code": transporterIfscCode,
    "transporter_rate": transporterRate,
    "vehicle_no": vehicleNo,
    "transporter_pancard_number": transporterPancardNumber,
    "transporter_aadhar_number": transporterAadharNumber,
    "transporter_gst_number": transporterGstNumber,
    "transporter_profile_image": transporterProfileImage,
    "transporter_pancard_image": transporterPancardImage,
    "transporter_aadhar_image": transporterAadharImage,
    "transporter_gst_image": transporterGstImage,
    "bank_passbook_image": bankPassbookImage,
    "transporter_rc_image": transporterRcImage,
    "verify_status": verifyStatus,
    "status": status,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}
