
import 'dart:convert';

ShowStackAuditModal showStackAuditModalFromJson(String str) => ShowStackAuditModal.fromJson(json.decode(str));

String showStackAuditModalToJson(ShowStackAuditModal data) => json.encode(data.toJson());

class ShowStackAuditModal {
    String? status;
    String? message;
    Warehouse? warehouse;
    List<StackDatum>? data;

    ShowStackAuditModal({
        this.status,
        this.message,
        this.warehouse,
        this.data,
    });

    factory ShowStackAuditModal.fromJson(Map<String, dynamic> json) => ShowStackAuditModal(
        status: json["status"],
        message: json["message"],
        warehouse: json["warehouse"] == null ? null : Warehouse.fromJson(json["warehouse"]),
        data: json["data"] == null ? [] : List<StackDatum>.from(json["data"]!.map((x) => StackDatum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "warehouse": warehouse?.toJson(),
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class StackDatum {
    String? stackNumber;
    String? category;
    int? commodityId;

    StackDatum({
        this.stackNumber,
        this.category,
        this.commodityId,
    });

    factory StackDatum.fromJson(Map<String, dynamic> json) => StackDatum(
        stackNumber: json["stack_number"],
        category: json["category"],
        commodityId: json["commodity_id"],
    );

    Map<String, dynamic> toJson() => {
        "stack_number": stackNumber,
        "category": category,
        "commodity_id": commodityId,
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
