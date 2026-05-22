// To parse this JSON data, do
//
//     final sprayCleaningModal = sprayCleaningModalFromJson(jsonString);

import 'dart:convert';

SprayCleaningModal sprayCleaningModalFromJson(String str) => SprayCleaningModal.fromJson(json.decode(str));

String sprayCleaningModalToJson(SprayCleaningModal data) => json.encode(data.toJson());

class SprayCleaningModal {
    dynamic status;
    dynamic message;
    List<Datum>? data;

    SprayCleaningModal({
        this.status,
        this.message,
        this.data,
    });

    factory SprayCleaningModal.fromJson(Map<String, dynamic> json) => SprayCleaningModal(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    dynamic id;
    dynamic terminalId;
    DateTime? date;
    DateTime? nextDate;
    dynamic chemical;
    dynamic dose;
    dynamic image;
    dynamic generatedBy;
    dynamic remark;
    dynamic status;
    dynamic createdAt;
    dynamic updatedAt;
    UserName? userName;
    WarehouseName? warehouseName;

    Datum({
        this.id,
        this.terminalId,
        this.date,
        this.nextDate,
        this.chemical,
        this.dose,
        this.image,
        this.generatedBy,
        this.remark,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.userName,
        this.warehouseName,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        terminalId: json["terminal_id"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        nextDate: json["next_date"] == null ? null : DateTime.parse(json["next_date"]),
        chemical: json["chemical"],
        dose: json["dose"],
        image: json["image"],
        generatedBy: json["generated_by"],
        remark: json["remark"],
        status: json["status"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        userName: json["user_name"] == null ? null : UserName.fromJson(json["user_name"]),
        warehouseName: json["warehouse_name"] == null ? null : WarehouseName.fromJson(json["warehouse_name"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "terminal_id": terminalId,
        "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "next_date": "${nextDate!.year.toString().padLeft(4, '0')}-${nextDate!.month.toString().padLeft(2, '0')}-${nextDate!.day.toString().padLeft(2, '0')}",
        "chemical": chemical,
        "dose": dose,
        "image": image,
        "generated_by": generatedBy,
        "remark": remark,
        "status": status,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "user_name": userName?.toJson(),
        "warehouse_name": warehouseName?.toJson(),
    };
}

class UserName {
    dynamic id;
    dynamic fname;
    dynamic lname;
    dynamic phone;

    UserName({
        this.id,
        this.fname,
        this.lname,
        this.phone,
    });

    factory UserName.fromJson(Map<String, dynamic> json) => UserName(
        id: json["id"],
        fname: json["fname"],
        lname: json["lname"],
        phone: json["phone"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "fname": fname,
        "lname": lname,
        "phone": phone,
    };
}

class WarehouseName {
    dynamic id;
    dynamic name;
    dynamic warehouseCode;

    WarehouseName({
        this.id,
        this.name,
        this.warehouseCode,
    });

    factory WarehouseName.fromJson(Map<String, dynamic> json) => WarehouseName(
        id: json["id"],
        name: json["name"],
        warehouseCode: json["warehouse_code"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "warehouse_code": warehouseCode,
    };
}
