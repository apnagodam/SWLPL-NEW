// To parse this JSON data, do
//
//     final vendorListModal = vendorListModalFromJson(jsonString);

import 'dart:convert';

VendorListModal vendorListModalFromJson(String str) => VendorListModal.fromJson(json.decode(str));

String vendorListModalToJson(VendorListModal data) => json.encode(data.toJson());

class VendorListModal {
    dynamic status;
    dynamic message;
    List<VendorDatum>? data;

    VendorListModal({
        this.status,
        this.message,
        this.data,
    });

    factory VendorListModal.fromJson(Map<String, dynamic> json) => VendorListModal(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? [] : List<VendorDatum>.from(json["data"]!.map((x) => VendorDatum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class VendorDatum {
    dynamic id;
    dynamic vendorFirstName;
    dynamic vendorLastName;
    dynamic phone;

    VendorDatum({
        this.id,
        this.vendorFirstName,
        this.vendorLastName,
        this.phone,
    });

    factory VendorDatum.fromJson(Map<String, dynamic> json) => VendorDatum(
        id: json["id"],
        vendorFirstName: json["vendor_first_name"],
        vendorLastName: json["vendor_last_name"],
        phone: json["phone"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "vendor_first_name": vendorFirstName,
        "vendor_last_name": vendorLastName,
        "phone": phone,
    };
}
