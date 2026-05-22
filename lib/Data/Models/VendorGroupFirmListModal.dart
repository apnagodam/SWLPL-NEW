// To parse this JSON data, do
//
//     final vendorGroupFirmListModal = vendorGroupFirmListModalFromJson(jsonString);

import 'dart:convert';

VendorGroupFirmListModal vendorGroupFirmListModalFromJson(String str) => VendorGroupFirmListModal.fromJson(json.decode(str));

String vendorGroupFirmListModalToJson(VendorGroupFirmListModal data) => json.encode(data.toJson());

class VendorGroupFirmListModal {
    dynamic status;
    dynamic message;
    List<Datum>? data;

    VendorGroupFirmListModal({
        this.status,
        this.message,
        this.data,
    });

    factory VendorGroupFirmListModal.fromJson(Map<String, dynamic> json) => VendorGroupFirmListModal(
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
    dynamic name;

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
