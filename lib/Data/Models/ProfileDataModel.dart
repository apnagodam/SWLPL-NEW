// To parse this JSON data, do
//
//     final profileDataModel = profileDataModelFromMap(jsonString);

import 'dart:convert';

ProfileDataModel profileDataModelFromMap(String str) =>
    ProfileDataModel.fromMap(json.decode(str));

String profileDataModelToMap(ProfileDataModel data) =>
    json.encode(data.toMap());

class ProfileDataModel {
  ProfileData? profileData;
  dynamic status;
  dynamic message;

  ProfileDataModel({
    this.profileData,
    this.status,
    this.message,
  });

  factory ProfileDataModel.fromMap(Map<String, dynamic> json) =>
      ProfileDataModel(
        profileData: json["profile_data"] == null
            ? null
            : ProfileData.fromMap(json["profile_data"]),
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toMap() => {
        "profile_data": profileData?.toMap(),
        "status": status,
        "message": message,
      };
}

class ProfileData {
  dynamic id;
  dynamic userId;
  dynamic designationId;
  dynamic empId;
  dynamic firstName;
  dynamic lastName;
  dynamic phone;
  dynamic email;
  DateTime? dob;
  DateTime? doj;
  DateTime? doe;
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
  dynamic employerId;
  dynamic status;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic postingLocation;
  dynamic attenApproveBy;
  dynamic familyMember;
  dynamic memberPhone;
  dynamic workHours;
  dynamic power;
  dynamic terminalName;
  dynamic manditaxAvailability;
  dynamic isQualityAssayer;
  ProfileData(
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
      this.employerId,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.postingLocation,
      this.attenApproveBy,
      this.familyMember,
      this.memberPhone,
      this.workHours,
      this.power,this.terminalName,this.manditaxAvailability,this.isQualityAssayer});

  factory ProfileData.fromMap(Map<String, dynamic> json) => ProfileData(
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
      doe: json["doe"] == null ? null : DateTime.parse(json["doe"]),
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
      employerId: json["employer_id"],
      status: json["status"],
      createdAt: json["created_at"],
      updatedAt: json["updated_at"],
      postingLocation: json["posting_location"],
      attenApproveBy: json["atten_approve_by"],
      familyMember: json["family_member"],
      memberPhone: json["member_phone"],
      workHours: json["work_hours"],
      power: json['power'],
      terminalName: json['terminal_name'],
      manditaxAvailability: json['terminamandi_tax'],
      isQualityAssayer: json['is_quality_assayer']);

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
        "doe":
            "${doe!.year.toString().padLeft(4, '0')}-${doe!.month.toString().padLeft(2, '0')}-${doe!.day.toString().padLeft(2, '0')}",
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
        "employer_id": employerId,
        "status": status,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "posting_location": postingLocation,
        "atten_approve_by": attenApproveBy,
        "family_member": familyMember,
        "member_phone": memberPhone,
        "work_hours": workHours,
        "power": power,
        "terminal_name":terminalName,
        "terminamandi_tax":manditaxAvailability,
        "is_quality_assayer": isQualityAssayer,
      };
}
