// To parse this JSON data, do
//
//     final assetsModal = assetsModalFromJson(jsonString);

import 'dart:convert';

AssetsModal assetsModalFromJson(String str) => AssetsModal.fromJson(json.decode(str));

String assetsModalToJson(AssetsModal data) => json.encode(data.toJson());

class AssetsModal {
    String? status;
    String? message;
    Warehouse? warehouse;
    List<Datum>? data;

    AssetsModal({
        this.status,
        this.message,
        this.warehouse,
        this.data,
    });

    factory AssetsModal.fromJson(Map<String, dynamic> json) => AssetsModal(
        status: json["status"],
        message: json["message"],
        warehouse: json["warehouse"] == null ? null : Warehouse.fromJson(json["warehouse"]),
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "warehouse": warehouse?.toJson(),
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    int? id;
    String? name;

    Datum({
        this.id,
        this.name,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}

class Warehouse {
    String? warehouseName;
    int? id;

    Warehouse({
        this.warehouseName,
        this.id,
    });

    factory Warehouse.fromJson(Map<String, dynamic> json) => Warehouse(
        warehouseName: json["warehouse_name"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "warehouse_name": warehouseName,
        "id": id,
    };
}
