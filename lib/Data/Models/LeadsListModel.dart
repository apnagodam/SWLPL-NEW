// To parse this JSON data, do
//
//     final leadsListModel = leadsListModelFromMap(jsonString);

import 'dart:convert';

LeadsListModel leadsListModelFromMap(String str) => LeadsListModel.fromMap(json.decode(str));

String leadsListModelToMap(LeadsListModel data) => json.encode(data.toMap());

class LeadsListModel {
  String? status;
  String? message;
  Data? data;

  LeadsListModel({
    this.status,
    this.message,
    this.data,
  });

  factory LeadsListModel.fromMap(Map<String, dynamic> json) => LeadsListModel(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromMap(json["data"]),
  );

  Map<String, dynamic> toMap() => {
    "status": status,
    "message": message,
    "data": data?.toMap(),
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
  dynamic nextPageUrl;
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
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromMap(x))),
    firstPageUrl: json["first_page_url"],
    from: json["from"],
    lastPage: json["last_page"],
    lastPageUrl: json["last_page_url"],
    links: json["links"] == null ? [] : List<Link>.from(json["links"]!.map((x) => Link.fromMap(x))),
    nextPageUrl: json["next_page_url"],
    path: json["path"],
    perPage: json["per_page"],
    prevPageUrl: json["prev_page_url"],
    to: json["to"],
    total: json["total"],
  );

  Map<String, dynamic> toMap() => {
    "current_page": currentPage,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
    "first_page_url": firstPageUrl,
    "from": from,
    "last_page": lastPage,
    "last_page_url": lastPageUrl,
    "links": links == null ? [] : List<dynamic>.from(links!.map((x) => x.toMap())),
    "next_page_url": nextPageUrl,
    "path": path,
    "per_page": perPage,
    "prev_page_url": prevPageUrl,
    "to": to,
    "total": total,
  };
}

class Datum {
  dynamic id;
  dynamic userId;
  String? customerName;
  String? phone;
  String? location;
  dynamic commodityId;
  String? quantity;
  dynamic terminalId;
  String? commodityDate;
  String? purpose;
  dynamic status;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? cateName;
  dynamic commodityType;
  String? terminalName;
  String? warehouseCode;
  String? firstName;
  String? lastName;

  Datum({
    this.id,
    this.userId,
    this.customerName,
    this.phone,
    this.location,
    this.commodityId,
    this.quantity,
    this.terminalId,
    this.commodityDate,
    this.purpose,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.cateName,
    this.commodityType,
    this.terminalName,
    this.warehouseCode,
    this.firstName,
    this.lastName,
  });

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
    id: json["id"],
    userId: json["user_id"],
    customerName: json["customer_name"],
    phone: json["phone"],
    location: json["location"],
    commodityId: json["commodity_id"],
    quantity: json["quantity"],
    terminalId: json["terminal_id"],
    commodityDate: json["commodity_date"],
    purpose: json["purpose"],
    status: json["status"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    cateName: json["cate_name"],
    commodityType: json["commodity_type"],
    terminalName: json["terminal_name"],
    warehouseCode: json["warehouse_code"],
    firstName: json["first_name"],
    lastName: json["last_name"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "user_id": userId,
    "customer_name": customerName,
    "phone": phone,
    "location": location,
    "commodity_id": commodityId,
    "quantity": quantity,
    "terminal_id": terminalId,
    "commodity_date": commodityDate,
    "purpose": purpose,
    "status": status,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "cate_name": cateName,
    "commodity_type": commodityType,
    "terminal_name": terminalName,
    "warehouse_code": warehouseCode,
    "first_name": firstName,
    "last_name": lastName,
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
