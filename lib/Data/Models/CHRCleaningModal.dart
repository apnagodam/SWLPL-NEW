// To parse this JSON data, do
//
//     final chrCleaningModal = chrCleaningModalFromJson(jsonString);

import 'dart:convert';

ChrCleaningModal chrCleaningModalFromJson(String str) => ChrCleaningModal.fromJson(json.decode(str));

String chrCleaningModalToJson(ChrCleaningModal data) => json.encode(data.toJson());

class ChrCleaningModal {
    dynamic status;
    dynamic message;
    List<Datum>? data;

    ChrCleaningModal({
        this.status,
        this.message,
        this.data,
    });

    factory ChrCleaningModal.fromJson(Map<String, dynamic> json) => ChrCleaningModal(
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
    dynamic stackNo;
    dynamic commodity;
    DateTime? date;
    DateTime? nextDate;
    dynamic image;
    dynamic live;
    dynamic remark;
    dynamic status;
    dynamic createdAt;
    dynamic updatedAt;
    dynamic userName;
    dynamic warehouseName;

    Datum({
        this.id,
        this.terminalId,
        this.stackNo,
        this.commodity,
        this.date,
        this.nextDate,
        this.image,
        this.live,
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
        stackNo: json["stack_no"],
        commodity: json["commodity"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        nextDate: json["next_date"] == null ? null : DateTime.parse(json["next_date"]),
        image: json["image"],
        live: json["live"],
        remark: json["remark"],
        status: json["status"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        userName: json["user_name"],
        warehouseName: json["warehouse_name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "terminal_id": terminalId,
        "stack_no": stackNo,
        "commodity": commodity,
        "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "next_date": "${nextDate!.year.toString().padLeft(4, '0')}-${nextDate!.month.toString().padLeft(2, '0')}-${nextDate!.day.toString().padLeft(2, '0')}",
        "image": image,
        "live": live,
        "remark": remark,
        "status": status,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "user_name": userName,
        "warehouse_name": warehouseName,
    };
}
