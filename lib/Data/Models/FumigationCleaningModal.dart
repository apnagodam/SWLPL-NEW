// To parse this JSON data, do
//
//     final fumigationListModel = fumigationListModelFromJson(jsonString);

import 'dart:convert';

FumigationListModel fumigationListModelFromJson(String str) => FumigationListModel.fromJson(json.decode(str));

String fumigationListModelToJson(FumigationListModel data) => json.encode(data.toJson());

class FumigationListModel {
    dynamic status;
    dynamic message;
    List<Datum>? data;

    FumigationListModel({
        this.status,
        this.message,
        this.data,
    });

    factory FumigationListModel.fromJson(Map<String, dynamic> json) => FumigationListModel(
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
    dynamic date;
    dynamic nextDate;
    dynamic deGasDate;
    dynamic image;
    dynamic dose;
    dynamic remark;
    dynamic status;
    dynamic createdAt;
    dynamic updatedAt;
    dynamic fumiAgency;
    dynamic userName;
    dynamic warehouseName;

    Datum({
        this.id,
        this.terminalId,
        this.stackNo,
        this.commodity,
        this.date,
        this.nextDate,
        this.deGasDate,
        this.image,
        this.dose,
        this.remark,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.fumiAgency,
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
        deGasDate: json["de_gas_date"],
        image: json["image"],
        dose: json["dose"],
        remark: json["remark"],
        status: json["status"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        fumiAgency: json["fumi_agency"],
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
        "de_gas_date": deGasDate,
        "image": image,
        "dose": dose,
        "remark": remark,
        "status": status,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "fumi_agency": fumiAgency,
        "user_name": userName,
        "warehouse_name": warehouseName,
    };
}
