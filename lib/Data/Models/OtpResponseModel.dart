// To parse this JSON data, do
//
//     final otpResponseModel = otpResponseModelFromMap(jsonString);

import 'dart:convert';

OtpResponseModel otpResponseModelFromMap(String str) =>
    OtpResponseModel.fromMap(json.decode(str));

String otpResponseModelToMap(OtpResponseModel data) =>
    json.encode(data.toMap());

// To parse this JSON data, do
//
//     final otpResponseModel = otpResponseModelFromMap(jsonString);

class OtpResponseModel {
  dynamic authorization;
  UserDetails? userDetails;
  dynamic status;
  dynamic message;

  OtpResponseModel({
    this.authorization,
    this.userDetails,
    this.status,
    this.message,
  });

  factory OtpResponseModel.fromJson(String str) =>
      OtpResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OtpResponseModel.fromMap(Map<String, dynamic> json) =>
      OtpResponseModel(
        authorization: json["Authorization"],
        userDetails: json["user_details"] == null
            ? null
            : UserDetails.fromMap(json["user_details"]),
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toMap() => {
        "Authorization": authorization,
        "user_details": userDetails?.toMap(),
        "status": status,
        "message": message,
      };
}

class UserDetails {
  dynamic id;
  dynamic userId;
  dynamic designationId;
  dynamic empId;
  dynamic firstName;
  dynamic lastName;
  dynamic phone;
  dynamic email;
  dynamic dob;
  dynamic doj;
  dynamic doe;
  dynamic shiftStart;
  dynamic shiftEnd;
  dynamic personalPhone;
  dynamic address;
  dynamic post;
  dynamic bankName;
  dynamic branchName;
  dynamic accountNo;
  dynamic ifsCode;
  dynamic panCard;
  dynamic aadharCard;
  dynamic bankPassbook;
  dynamic passportImage;
  dynamic aadharImage;
  dynamic aadharImageB;
  dynamic pancardImage;
  dynamic terminal;
  dynamic officePosting;
  dynamic sendEmail;
  dynamic twoWheelerRate;
  dynamic fourWheelerRate;
  dynamic enableByUserId;
  dynamic disableByUserId;
  dynamic status;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic postingLocation;
  dynamic attenApproveBy;
  dynamic levelId;
  dynamic stateId;
  dynamic districtId;
  dynamic designation;
  dynamic location;
  dynamic attenLat;
  dynamic attenLong;
  dynamic power;
  dynamic terminalName;
  dynamic manditaxAvailability;

  UserDetails(
      {this.id,
      this.userId,
      this.designationId,
      this.empId,
      this.firstName,
      this.lastName,
      this.phone,
      this.email,
      this.dob,
      this.doj,
      this.doe,
      this.shiftStart,
      this.shiftEnd,
      this.personalPhone,
      this.address,
      this.post,
      this.bankName,
      this.branchName,
      this.accountNo,
      this.ifsCode,
      this.panCard,
      this.aadharCard,
      this.bankPassbook,
      this.passportImage,
      this.aadharImage,
      this.aadharImageB,
      this.pancardImage,
      this.terminal,
      this.officePosting,
      this.sendEmail,
      this.twoWheelerRate,
      this.fourWheelerRate,
      this.enableByUserId,
      this.disableByUserId,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.postingLocation,
      this.attenApproveBy,
      this.levelId,
      this.stateId,
      this.districtId,
      this.designation,
      this.location,
      this.attenLat,
      this.attenLong,
      this.power,
      this.terminalName,
      this.manditaxAvailability});

  factory UserDetails.fromJson(String str) =>
      UserDetails.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserDetails.fromMap(Map<String, dynamic> json) => UserDetails(
      id: json["id"],
      userId: json["user_id"],
      designationId: json["designation_id"],
      empId: json["emp_id"],
      firstName: json["first_name"],
      lastName: json["last_name"],
      phone: json["phone"],
      email: json["email"],
      dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
      doj: json["doj"] == null ? null : DateTime.parse(json["doj"]),
      doe: json["doe"],
      shiftStart: json["shift_start"],
      shiftEnd: json["shift_end"],
      personalPhone: json["personal_phone"],
      address: json["address"],
      post: json["post"],
      bankName: json["bank_name"],
      branchName: json["branch_name"],
      accountNo: json["account_no"],
      ifsCode: json["ifs_code"],
      panCard: json["pan_card"],
      aadharCard: json["aadhar_card"],
      bankPassbook: json["bank_passbook"],
      passportImage: json["passport_image"],
      aadharImage: json["aadhar_image"],
      aadharImageB: json["aadhar_image_b"],
      pancardImage: json["pancard_image"],
      terminal: json["terminal"],
      officePosting: json["office_posting"],
      sendEmail: json["send_email"],
      twoWheelerRate: json["two_wheeler_rate"],
      fourWheelerRate: json["four_wheeler_rate"],
      enableByUserId: json["enable_by_userId"],
      disableByUserId: json["disable_by_userId"],
      status: json["status"],
      createdAt: json["created_at"] == null
          ? null
          : DateTime.parse(json["created_at"]),
      updatedAt: json["updated_at"] == null
          ? null
          : DateTime.parse(json["updated_at"]),
      postingLocation: json["posting_location"],
      attenApproveBy: json["atten_approve_by"],
      levelId: json["level_id"],
      stateId: json["state_id"],
      districtId: json["district_id"],
      designation: json["designation"],
      location: json["location"],
      attenLat: json["atten_lat"],
      attenLong: json["atten_long"],
      power: json['power'],
      terminalName: json['terminal_name'],
      manditaxAvailability: json['terminamandi_tax']);

  Map<String, dynamic> toMap() => {
        "id": id,
        "user_id": userId,
        "designation_id": designationId,
        "emp_id": empId,
        "first_name": firstName,
        "last_name": lastName,
        "phone": phone,
        "email": email,
        "dob":
            "${dob!.year.toString().padLeft(4, '0')}-${dob!.month.toString().padLeft(2, '0')}-${dob!.day.toString().padLeft(2, '0')}",
        "doj":
            "${doj!.year.toString().padLeft(4, '0')}-${doj!.month.toString().padLeft(2, '0')}-${doj!.day.toString().padLeft(2, '0')}",
        "doe": doe,
        "shift_start": shiftStart,
        "shift_end": shiftEnd,
        "personal_phone": personalPhone,
        "address": address,
        "post": post,
        "bank_name": bankName,
        "branch_name": branchName,
        "account_no": accountNo,
        "ifs_code": ifsCode,
        "pan_card": panCard,
        "aadhar_card": aadharCard,
        "bank_passbook": bankPassbook,
        "passport_image": passportImage,
        "aadhar_image": aadharImage,
        "aadhar_image_b": aadharImageB,
        "pancard_image": pancardImage,
        "terminal": terminal,
        "office_posting": officePosting,
        "send_email": sendEmail,
        "two_wheeler_rate": twoWheelerRate,
        "four_wheeler_rate": fourWheelerRate,
        "enable_by_userId": enableByUserId,
        "disable_by_userId": disableByUserId,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "posting_location": postingLocation,
        "atten_approve_by": attenApproveBy,
        "level_id": levelId,
        "state_id": stateId,
        "district_id": districtId,
        "designation": designation,
        "location": location,
        "atten_lat": attenLat,
        "atten_long": attenLong,
        'power': power,
        "terminal_name": terminalName,
        "terminamandi_tax": manditaxAvailability
      };
}
