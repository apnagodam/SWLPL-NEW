// To parse this JSON data, do
//
//     final advanceListingModel = advanceListingModelFromMap(jsonString);

import 'dart:convert';

AdvanceListingModel advanceListingModelFromMap(String str) => AdvanceListingModel.fromMap(json.decode(str));

String advanceListingModelToMap(AdvanceListingModel data) => json.encode(data.toMap());

class AdvanceListingModel {
  dynamic status;
  Data? data;

  AdvanceListingModel({
    this.status,
    this.data,
  });

  factory AdvanceListingModel.fromMap(Map<String, dynamic> json) => AdvanceListingModel(
    status: json["status"],
    data: json["data"] == null ? null : Data.fromMap(json["data"]),
  );

  Map<String, dynamic> toMap() => {
    "status": status,
    "data": data?.toMap(),
  };
}

class Data {
  dynamic currentPage;
  List<Datum>? data;
  dynamic firstPageUrl;
  dynamic from;
  dynamic lastPage;
  dynamic lastPageUrl;
  List<Link>? links;
  dynamic nextPageUrl;
  dynamic path;
  dynamic perPage;
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
  dynamic uniqueId;
  dynamic requestedAmount;
  dynamic approvedAmount;
  dynamic approvedBy;
  dynamic verifiedBy;
  dynamic poutId;
  dynamic fundAccountId;
  dynamic contactId;
  dynamic status;
  dynamic paymentDate;
  dynamic notes;
  dynamic createdAt;
  dynamic updatedAt;

  Datum({
    this.id,
    this.userId,
    this.uniqueId,
    this.requestedAmount,
    this.approvedAmount,
    this.approvedBy,
    this.verifiedBy,
    this.poutId,
    this.fundAccountId,
    this.contactId,
    this.status,
    this.paymentDate,
    this.notes,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
    id: json["id"],
    userId: json["user_id"],
    uniqueId: json["unique_id"],
    requestedAmount: json["requested_amount"],
    approvedAmount: json["approved_amount"],
    approvedBy: json["approved_by"],
    verifiedBy: json["verified_by"],
    poutId: json["pout_id"],
    fundAccountId: json["fund_account_id"],
    contactId: json["contact_id"],
    status: json["status"],
    paymentDate: json["payment_date"],
    notes: json["notes"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "user_id": userId,
    "unique_id": uniqueId,
    "requested_amount": requestedAmount,
    "approved_amount": approvedAmount,
    "approved_by": approvedBy,
    "verified_by": verifiedBy,
    "pout_id": poutId,
    "fund_account_id": fundAccountId,
    "contact_id": contactId,
    "status": status,
    "payment_date": paymentDate,
    "notes": notes,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}

class Link {
  dynamic url;
  dynamic label;
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
