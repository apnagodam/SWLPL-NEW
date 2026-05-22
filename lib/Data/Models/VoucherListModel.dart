// To parse this JSON data, do
//
//     final voucherListModel = voucherListModelFromMap(jsonString);

// ignore_for_file: unnecessary_question_mark

import 'dart:convert';

VoucherListModel voucherListModelFromMap(String str) =>
    VoucherListModel.fromMap(json.decode(str));

String voucherListModelToMap(VoucherListModel data) =>
    json.encode(data.toMap());

class VoucherListModel {
  Data? data;
  String? status;
  String? message;

  VoucherListModel({
    this.data,
    this.status,
    this.message,
  });

  factory VoucherListModel.fromMap(Map<String, dynamic> json) =>
      VoucherListModel(
        data: json["data"] == null ? null : Data.fromMap(json["data"]),
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toMap() => {
        "data": data?.toMap(),
        "status": status,
        "message": message,
      };
}

class Data {
  dynamic currentPage;
  List<Datum>? data;
  String? firstPageUrl;
  dynamic from;
  dynamic lastPage;
  String? lastPageUrl;
  List<Link>? links;
  String? nextPageUrl;
  String? path;
  String? perPage;
  dynamic prevPageUrl;
  dynamic to;
  dynamic total;

  Data({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        currentPage: json["current_page"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromMap(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        links: json["links"] == null
            ? []
            : List<Link>.from(json["links"]!.map((x) => Link.fromMap(x))),
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toMap() => {
        "current_page": currentPage,
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "links": links == null
            ? []
            : List<dynamic>.from(links!.map((x) => x.toMap())),
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
      };
}

class Datum {
  dynamic? id;
  dynamic? uniqueId;
  dynamic? userId;
  dynamic? terminalId;
  String? location;
  String? fromPlace;
  String? toPlace;
  String? conveyanceType;
  String? date;
  String? vehicleNo;
  String? startReading;
  String? endReading;
  String? kms;
  String? charges;
  String? otherExpense;
  String? total;
  String? finalPrize;
  String? image;
  String? purpose;
  dynamic? approvedBy;
  dynamic verifiedBy;
  String? image2;
  String? otherChargeImg;
  dynamic? verify;
  dynamic? status;
  dynamic? payment;
  String? notes;
  String? createdAt;
  String? updatedAt;
  String? firstName;
  String? lastName;
  String? datumEmpId;
  dynamic? designationId;
  String? fname;
  String? lname;
  String? empId;

  Datum({
    this.id,
    this.uniqueId,
    this.userId,
    this.terminalId,
    this.location,
    this.fromPlace,
    this.toPlace,
    this.conveyanceType,
    this.date,
    this.vehicleNo,
    this.startReading,
    this.endReading,
    this.kms,
    this.charges,
    this.otherExpense,
    this.total,
    this.finalPrize,
    this.image,
    this.purpose,
    this.approvedBy,
    this.verifiedBy,
    this.image2,
    this.otherChargeImg,
    this.verify,
    this.status,
    this.payment,
    this.notes,
    this.createdAt,
    this.updatedAt,
    this.firstName,
    this.lastName,
    this.datumEmpId,
    this.designationId,
    this.fname,
    this.lname,
    this.empId,
  });

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        id: json["id"],
        uniqueId: json["unique_id"],
        userId: json["user_id"],
        terminalId: json["terminal_id"],
        location: json["location"],
        fromPlace: json["from_place"],
        toPlace: json["to_place"],
        conveyanceType: json["conveyance_type"],
        date: json["date"],
        vehicleNo: json["vehicle_no"],
        startReading: json["start_reading"],
        endReading: json["end_reading"],
        kms: json["kms"],
        charges: json["charges"],
        otherExpense: json["other_expense"],
        total: json["total"],
        finalPrize: json["final_prize"],
        image: json["image"],
        purpose: json["purpose"],
        approvedBy: json["approved_by"],
        verifiedBy: json["verified_by"],
        image2: json["image_2"],
        otherChargeImg: json["other_charge_img"],
        verify: json["verify"],
        status: json["status"],
        payment: json["payment"],
        notes: json["notes"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        datumEmpId: json["emp_id"],
        designationId: json["designation_id"],
        fname: json["fname"],
        lname: json["lname"],
        empId: json["empId"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "unique_id": uniqueId,
        "user_id": userId,
        "terminal_id": terminalId,
        "location": location,
        "from_place": fromPlace,
        "to_place": toPlace,
        "conveyance_type": conveyanceType,
        "date": date,
        "vehicle_no": vehicleNo,
        "start_reading": startReading,
        "end_reading": endReading,
        "kms": kms,
        "charges": charges,
        "other_expense": otherExpense,
        "total": total,
        "final_prize": finalPrize,
        "image": image,
        "purpose": purpose,
        "approved_by": approvedBy,
        "verified_by": verifiedBy,
        "image_2": image2,
        "other_charge_img": otherChargeImg,
        "verify": verify,
        "status": status,
        "payment": payment,
        "notes": notes,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "first_name": firstName,
        "last_name": lastName,
        "emp_id": datumEmpId,
        "designation_id": designationId,
        "fname": fname,
        "lname": lname,
        "empId": empId,
      };
}

class Link {
  String? url;
  String? label;
  bool? active;

  Link({
    this.url,
    this.label,
    this.active,
  });

  factory Link.fromMap(Map<String, dynamic> json) => Link(
        url: json["url"],
        label: json["label"],
        active: json["active"],
      );

  Map<String, dynamic> toMap() => {
        "url": url,
        "label": label,
        "active": active,
      };
}
