// To parse this JSON data, do
//
//     final levelWiseModel = levelWiseModelFromMap(jsonString);

import 'dart:convert';

LevelWiseModel levelWiseModelFromMap(String str) =>
    LevelWiseModel.fromMap(json.decode(str));

String levelWiseModelToMap(LevelWiseModel data) => json.encode(data.toMap());

class LevelWiseModel {
  String? status;
  String? message;
  List<Datum>? data;
  dynamic requestCount;
  List<WarehouseName>? warehouseName;
  List<ErrorName>? errorName;

  LevelWiseModel({
    this.status,
    this.message,
    this.data,
    this.requestCount,
    this.warehouseName,
    this.errorName,
  });

  factory LevelWiseModel.fromMap(Map<String, dynamic> json) => LevelWiseModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromMap(x))),
        requestCount: json["request_count"],
        warehouseName: json["warehouse_name"] == null
            ? []
            : List<WarehouseName>.from(
                json["warehouse_name"]!.map((x) => WarehouseName.fromMap(x))),
        errorName: json["errorName"] == null
            ? []
            : List<ErrorName>.from(
                json["errorName"]!.map((x) => ErrorName.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "message": message,
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
        "request_count": requestCount,
        "warehouse_name": warehouseName == null
            ? []
            : List<dynamic>.from(warehouseName!.map((x) => x.toMap())),
        "errorName": errorName == null
            ? []
            : List<dynamic>.from(errorName!.map((x) => x.toMap())),
      };
}

class Datum {
  dynamic id;
  dynamic userId;
  dynamic designationId;
  String? empId;
  String? firstName;
  String? lastName;
  String? phone;
  String? email;
  DateTime? dob;
  DateTime? doj;
  DateTime? doe;
  String? personalPhone;
  String? address;
  String? post;
  String? bankName;
  String? branchName;
  String? accountNo;
  String? ifsCode;
  String? panCard;
  String? aadharCard;
  String? bankPassbook;
  String? passportImage;
  String? aadharImage;
  String? aadharImageB;
  String? pancardImage;
  dynamic terminal;
  dynamic sendEmail;
  String? twoWheelerRate;
  String? fourWheelerRate;
  dynamic enableByUserId;
  dynamic disableByUserId;
  dynamic status;
  String? createdAt;
  String? updatedAt;

  Datum({
    this.id,
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
    this.sendEmail,
    this.twoWheelerRate,
    this.fourWheelerRate,
    this.enableByUserId,
    this.disableByUserId,
    this.status,
    this.createdAt,
    this.updatedAt,
  });
  bool stateFilterByName(String filter) {
    return this.firstName.toString().toLowerCase().trim().contains(filter);
  }
  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
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
        sendEmail: json["send_email"],
        twoWheelerRate: json["two_wheeler_rate"],
        fourWheelerRate: json["four_wheeler_rate"],
        enableByUserId: json["enable_by_userId"],
        disableByUserId: json["disable_by_userId"],
        status: json["status"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

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
        "send_email": sendEmail,
        "two_wheeler_rate": twoWheelerRate,
        "four_wheeler_rate": fourWheelerRate,
        "enable_by_userId": enableByUserId,
        "disable_by_userId": disableByUserId,
        "status": status,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}

class ErrorName {
  dynamic id;
  String? errorName;
  dynamic status;
  String? createdAt;
  String? updatedAt;

  ErrorName({
    this.id,
    this.errorName,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory ErrorName.fromMap(Map<String, dynamic> json) => ErrorName(
        id: json["id"],
        errorName: json["error_name"],
        status: json["status"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "error_name": errorName,
        "status": status,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}

class WarehouseName {
  dynamic id;
  dynamic wspId;
  dynamic mandiSamitiId;
  String? warehouseCode;
  dynamic type;
  String? name;
  dynamic nameHi;
  String? facilityIds;
  String? bankIds;
  String? image;
  String? gstImage;
  dynamic gatepassStart;
  dynamic gatepassEnd;
  dynamic noOfStacks;
  dynamic dharamKanta;
  String? labourContractor;
  dynamic contractorPhone;
  String? labourRate;
  String? latitude;
  String? longitude;
  String? pincode;
  String? agrementFromDate;
  String? agrementToDate;
  String? terminalOpenDate;
  dynamic terminalCloseDate;
  dynamic rentAmount;
  String? gstArrNumber;
  dynamic agShare;
  dynamic wdraAgreement;
  String? wdraAgreementId;
  dynamic wspRent;
  dynamic fixRentPerMonth;
  dynamic minRent;
  dynamic maxRent;
  dynamic wspSharing;
  dynamic lockIn;
  dynamic mixLockIn;
  dynamic status;
  String? createdAt;
  String? updatedAt;

  WarehouseName({
    this.id,
    this.wspId,
    this.mandiSamitiId,
    this.warehouseCode,
    this.type,
    this.name,
    this.nameHi,
    this.facilityIds,
    this.bankIds,
    this.image,
    this.gstImage,
    this.gatepassStart,
    this.gatepassEnd,
    this.noOfStacks,
    this.dharamKanta,
    this.labourContractor,
    this.contractorPhone,
    this.labourRate,
    this.latitude,
    this.longitude,
    this.pincode,
    this.agrementFromDate,
    this.agrementToDate,
    this.terminalOpenDate,
    this.terminalCloseDate,
    this.rentAmount,
    this.gstArrNumber,
    this.agShare,
    this.wdraAgreement,
    this.wdraAgreementId,
    this.wspRent,
    this.fixRentPerMonth,
    this.minRent,
    this.maxRent,
    this.wspSharing,
    this.lockIn,
    this.mixLockIn,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory WarehouseName.fromMap(Map<String, dynamic> json) => WarehouseName(
        id: json["id"],
        wspId: json["wsp_id"],
        mandiSamitiId: json["mandi_samiti_id"],
        warehouseCode: json["warehouse_code"],
        type: json["type"],
        name: json["name"],
        nameHi: json["name_hi"],
        facilityIds: json["facility_ids"],
        bankIds: json["bank_ids"],
        image: json["image"],
        gstImage: json["gst_image"],
        gatepassStart: json["gatepass_start"],
        gatepassEnd: json["gatepass_end"],
        noOfStacks: json["no_of_stacks"],
        dharamKanta: json["dharam_kanta"],
        labourContractor: json["labour_contractor"],
        contractorPhone: json["contractor_phone"],
        labourRate: json["labour_rate"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        pincode: json["pincode"],
        agrementFromDate: json["agrement_from_date"],
        agrementToDate: json["agrement_to_date"],
        terminalOpenDate: json["terminal_open_date"],
        terminalCloseDate: json["terminal_close_date"],
        rentAmount: json["rent_amount"],
        gstArrNumber: json["gst_arr_number"],
        agShare: json["ag_share"],
        wdraAgreement: json["wdra_agreement"],
        wdraAgreementId: json["wdra_agreement_id"],
        wspRent: json["wsp_rent"],
        fixRentPerMonth: json["fix_rent_per_month"],
        minRent: json["min_rent"],
        maxRent: json["max_rent"],
        wspSharing: json["wsp_sharing"],
        lockIn: json["lock_in"],
        mixLockIn: json["mix_lock_in"],
        status: json["status"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "wsp_id": wspId,
        "mandi_samiti_id": mandiSamitiId,
        "warehouse_code": warehouseCode,
        "type": type,
        "name": name,
        "name_hi": nameHi,
        "facility_ids": facilityIds,
        "bank_ids": bankIds,
        "image": image,
        "gst_image": gstImage,
        "gatepass_start": gatepassStart,
        "gatepass_end": gatepassEnd,
        "no_of_stacks": noOfStacks,
        "dharam_kanta": dharamKanta,
        "labour_contractor": labourContractor,
        "contractor_phone": contractorPhone,
        "labour_rate": labourRate,
        "latitude": latitude,
        "longitude": longitude,
        "pincode": pincode,
        "agrement_from_date": agrementFromDate,
        "agrement_to_date": agrementToDate,
        "terminal_open_date": terminalOpenDate,
        "terminal_close_date": terminalCloseDate,
        "rent_amount": rentAmount,
        "gst_arr_number": gstArrNumber,
        "ag_share": agShare,
        "wdra_agreement": wdraAgreement,
        "wdra_agreement_id": wdraAgreementId,
        "wsp_rent": wspRent,
        "fix_rent_per_month": fixRentPerMonth,
        "min_rent": minRent,
        "max_rent": maxRent,
        "wsp_sharing": wspSharing,
        "lock_in": lockIn,
        "mix_lock_in": mixLockIn,
        "status": status,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
