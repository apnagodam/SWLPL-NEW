// To parse this JSON data, do
//
//     final sQualityListingModel = sQualityListingModelFromMap(jsonString);

import 'dart:convert';

SQualityListingModel sQualityListingModelFromMap(String str) => SQualityListingModel.fromMap(json.decode(str));

String sQualityListingModelToMap(SQualityListingModel data) => json.encode(data.toMap());

class SQualityListingModel {
  String? status;
  String? message;
  Data? data;

  SQualityListingModel({
    this.status,
    this.message,
    this.data,
  });

  factory SQualityListingModel.fromMap(Map<String, dynamic> json) => SQualityListingModel(
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
  String? caseId;
  String? gatePass;
  String? inOut;
  dynamic customerUid;
  dynamic commodityId;
  dynamic terminalId;
  dynamic stackRowId;
  String? stackNumber;
  String? totalWeight;
  String? vehicleNo;
  dynamic noOfBags;
  String? driverPhone;
  dynamic cancelNotes;
  dynamic spotToken;
  dynamic isRed;
  dynamic staffId;
  dynamic status;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? phone;
  String? sKPAvgWeight;
  String? custFname;
  dynamic custLname;
  String? sQRCaseId;
  dynamic sendToLab;
  String? liveInsects;
  String? imge;
  dynamic commodityImg;
  String? notes;
  String? userPriceFname;
  String? userPriceLname;
  String? sKPCaseId;
  dynamic sKPBags;
  String? sKPWeight;
  String? fKPCaseId;
  dynamic commodityQuality;

  Datum({
    this.id,
    this.caseId,
    this.gatePass,
    this.inOut,
    this.customerUid,
    this.commodityId,
    this.terminalId,
    this.stackRowId,
    this.stackNumber,
    this.totalWeight,
    this.vehicleNo,
    this.noOfBags,
    this.driverPhone,
    this.cancelNotes,
    this.spotToken,
    this.isRed,
    this.staffId,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.phone,
    this.sKPAvgWeight,
    this.custFname,
    this.custLname,
    this.sQRCaseId,
    this.sendToLab,
    this.liveInsects,
    this.imge,
    this.commodityImg,
    this.notes,
    this.userPriceFname,
    this.userPriceLname,
    this.sKPCaseId,
    this.sKPBags,
    this.sKPWeight,
    this.fKPCaseId,
    this.commodityQuality,
  });

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
    id: json["id"],
    caseId: json["case_id"],
    gatePass: json["gate_pass"],
    inOut: json["in_out"],
    customerUid: json["customer_uid"],
    commodityId: json["commodity_id"],
    terminalId: json["terminal_id"],
    stackRowId: json["stack_row_id"],
    stackNumber: json["stack_number"],
    totalWeight: json["total_weight"],
    vehicleNo: json["vehicle_no"],
    noOfBags: json["no_of_bags"],
    driverPhone: json["driver_phone"],
    cancelNotes: json["cancel_notes"],
    spotToken: json["spot_token"],
    isRed: json["is_red"],
    staffId: json["staff_id"],
    status: json["status"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    phone: json["phone"],
    sKPAvgWeight: json["s_k_p_avg_weight"],
    custFname: json["cust_fname"],
    custLname: json["cust_lname"],
    sQRCaseId: json["s_q_r_case_id"],
    sendToLab: json["send_to_lab"],
    liveInsects: json["live_insects"],
    imge: json["imge"],
    commodityImg: json["commodity_img"],
    notes: json["notes"],
    userPriceFname: json["user_price_fname"],
    userPriceLname: json["user_price_lname"],
    sKPCaseId: json["s_k_p_case_id"],
    sKPBags: json["s_k_p_bags"],
    sKPWeight: json["s_k_p_weight"],
    fKPCaseId: json["f_k_p_case_id"],
    commodityQuality: json["commodity_quality"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "case_id": caseId,
    "gate_pass": gatePass,
    "in_out": inOut,
    "customer_uid": customerUid,
    "commodity_id": commodityId,
    "terminal_id": terminalId,
    "stack_row_id": stackRowId,
    "stack_number": stackNumber,
    "total_weight": totalWeight,
    "vehicle_no": vehicleNo,
    "no_of_bags": noOfBags,
    "driver_phone": driverPhone,
    "cancel_notes": cancelNotes,
    "spot_token": spotToken,
    "is_red": isRed,
    "staff_id": staffId,
    "status": status,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "phone": phone,
    "s_k_p_avg_weight": sKPAvgWeight,
    "cust_fname": custFname,
    "cust_lname": custLname,
    "s_q_r_case_id": sQRCaseId,
    "send_to_lab": sendToLab,
    "live_insects": liveInsects,
    "imge": imge,
    "commodity_img": commodityImg,
    "notes": notes,
    "user_price_fname": userPriceFname,
    "user_price_lname": userPriceLname,
    "s_k_p_case_id": sKPCaseId,
    "s_k_p_bags": sKPBags,
    "s_k_p_weight": sKPWeight,
    "f_k_p_case_id": fKPCaseId,
    "commodity_quality": commodityQuality,
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
