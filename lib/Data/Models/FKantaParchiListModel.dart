// To parse this JSON data, do
//
//     final fKantaParchiListModel = fKantaParchiListModelFromMap(jsonString);

import 'dart:convert';

FKantaParchiListModel fKantaParchiListModelFromMap(String str) => FKantaParchiListModel.fromMap(json.decode(str));

String fKantaParchiListModelToMap(FKantaParchiListModel data) => json.encode(data.toMap());

class FKantaParchiListModel {
  dynamic status;
  dynamic message;
  Data? data;
  List<DharemKanta>? dharemKanta;

  FKantaParchiListModel({
    this.status,
    this.message,
    this.data,
    this.dharemKanta,
  });

  factory FKantaParchiListModel.fromMap(Map<String, dynamic> json) => FKantaParchiListModel(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromMap(json["data"]),
    dharemKanta: json["dharem_kanta"] == null ? [] : List<DharemKanta>.from(json["dharem_kanta"]!.map((x) => DharemKanta.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "status": status,
    "message": message,
    "data": data?.toMap(),
    "dharem_kanta": dharemKanta == null ? [] : List<dynamic>.from(dharemKanta!.map((x) => x.toMap())),
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
  dynamic caseId;
  dynamic gatePass;
  dynamic inOut;
  dynamic customerUid;
  dynamic commodityId;
  dynamic terminalId;
  dynamic stackRowId;
  dynamic stackNumber;
  dynamic totalWeight;
  dynamic vehicleNo;
  dynamic noOfBags;
  dynamic driverPhone;
  dynamic cancelNotes;
  dynamic spotToken;
  dynamic isRed;
  dynamic staffId;
  dynamic status;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic phone;
  dynamic custFname;
  dynamic custLname;
  dynamic kPCaseId;
  dynamic dharamKanta;
  dynamic kantaParchiNumber;
  dynamic netWeight;
  dynamic kantaName;
  dynamic kantaPlace;
  dynamic file;
  dynamic file2;
  dynamic file3;
  dynamic notes;
  dynamic userPriceFname;
  dynamic userPriceLname;
  dynamic lbCaseId;

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
    this.custFname,
    this.custLname,
    this.kPCaseId,
    this.dharamKanta,
    this.kantaParchiNumber,
    this.netWeight,
    this.kantaName,
    this.kantaPlace,
    this.file,
    this.file2,
    this.file3,
    this.notes,
    this.userPriceFname,
    this.userPriceLname,
    this.lbCaseId
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
    custFname: json["cust_fname"],
    custLname: json["cust_lname"],
    kPCaseId: json["k_p_case_id"],
    dharamKanta: json["dharam_kanta"],
    kantaParchiNumber: json["kanta_parchi_number"],
    netWeight: json["net_weight"],
    kantaName: json["kanta_name"],
    kantaPlace: json["kanta_place"],
    file: json["file"],
    file2: json["file_2"],
    file3: json["file_3"],
    notes: json["notes"],
    userPriceFname: json["user_price_fname"],
    userPriceLname: json["user_price_lname"],
    lbCaseId: json['l_b_case_id']
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
    "cust_fname": custFname,
    "cust_lname": custLname,
    "k_p_case_id": kPCaseId,
    "dharam_kanta": dharamKanta,
    "kanta_parchi_number": kantaParchiNumber,
    "net_weight": netWeight,
    "kanta_name": kantaName,
    "kanta_place": kantaPlace,
    "file": file,
    "file_2": file2,
    "file_3": file3,
    "notes": notes,
    "user_price_fname": userPriceFname,
    "user_price_lname": userPriceLname,
    'l_b_case_id':lbCaseId
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

class DharemKanta {
  dynamic id;
  dynamic name;
  dynamic operatorName;
  dynamic phone;
  dynamic location;
  dynamic length;
  dynamic capicity;
  dynamic stateId;
  dynamic districtId;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic status;

  DharemKanta({
    this.id,
    this.name,
    this.operatorName,
    this.phone,
    this.location,
    this.length,
    this.capicity,
    this.stateId,
    this.districtId,
    this.createdAt,
    this.updatedAt,
    this.status,
  });

  factory DharemKanta.fromMap(Map<String, dynamic> json) => DharemKanta(
    id: json["id"],
    name: json["name"],
    operatorName: json["operator_name"],
    phone: json["phone"],
    location: json["location"],
    length: json["length"],
    capicity: json["capicity"],
    stateId: json["state_id"],
    districtId: json["district_id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    status: json["status"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "operator_name": operatorName,
    "phone": phone,
    "location": location,
    "length": length,
    "capicity": capicity,
    "state_id": stateId,
    "district_id": districtId,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "status": status,
  };
}
