// To parse this JSON data, do
//
//     final cleaningModal = cleaningModalFromJson(jsonString);

import 'dart:convert';

CleaningModal cleaningModalFromJson(String str) => CleaningModal.fromJson(json.decode(str));

String cleaningModalToJson(CleaningModal data) => json.encode(data.toJson());

class CleaningModal {
    dynamic status;
    dynamic message;
    List<Datum>? data;

    CleaningModal({
        this.status,
        this.message,
        this.data,
    });

    factory CleaningModal.fromJson(Map<String, dynamic> json) => CleaningModal(
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
    dynamic image;
    dynamic remark;
    dynamic status;
    dynamic createdAt;
    dynamic updatedAt;
    dynamic userName;
    dynamic userPhone;
    dynamic warehouseName;

    Datum({
        this.id,
        this.terminalId,
        this.date,
        this.nextDate,
        this.image,
        this.remark,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.userName,
        this.userPhone,
        this.warehouseName,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        terminalId: json["terminal_id"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        nextDate: json["next_date"] == null ? null : DateTime.parse(json["next_date"]),
        image: json["image"],
        remark: json["remark"],
        status: json["status"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        userName: json["user_name"],
        userPhone: json["user_phone"],
        warehouseName: json["warehouse_name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "terminal_id": terminalId,
        "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "next_date": "${nextDate!.year.toString().padLeft(4, '0')}-${nextDate!.month.toString().padLeft(2, '0')}-${nextDate!.day.toString().padLeft(2, '0')}",
        "image": image,
        "remark": remark,
        "status": status,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "user_name": userName,
        "user_phone": userPhone,
        "warehouse_name": warehouseName,
    };
}
