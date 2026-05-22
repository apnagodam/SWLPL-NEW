// To parse this JSON data, do
//
//     final dharamKantaListingModel = dharamKantaListingModelFromMap(jsonString);

import 'dart:convert';

DharamKantaListingModel dharamKantaListingModelFromMap(String str) => DharamKantaListingModel.fromMap(json.decode(str));

String dharamKantaListingModelToMap(DharamKantaListingModel data) => json.encode(data.toMap());

class DharamKantaListingModel {
  String? status;
  String? message;
  Data? data;
  List<DharemKanta>? dharemKanta;

  DharamKantaListingModel({
    this.status,
    this.message,
    this.data,
    this.dharemKanta,
  });

  factory DharamKantaListingModel.fromMap(Map<String, dynamic> json) => DharamKantaListingModel(
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
  String? firstPageUrl;
  dynamic from;
  dynamic lastPage;
  String? lastPageUrl;
  List<Link>? links;
  String? nextPageUrl;
  String? path;
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
  String? caseId;
  String? gatePass;
  String? inOut;
  dynamic customerUid;
  String? location;
  dynamic commodityId;
  dynamic terminalId;
  dynamic stackRowId;
  String? stackNumber;
  String? totalWeight;
  String? vehicleNo;
  dynamic leadGenUid;
  dynamic leadConvUid;
  String? purpose;
  String? fpoUsers;
  String? fpoUserId;
  String? gatePassCdfUserName;
  String? coldwinName;
  String? purchaseName;
  String? loanName;
  String? saleName;
  dynamic noOfBags;
  dynamic driverOtp;
  String? driverPhone;
  dynamic cancelNotes;
  dynamic approvedRemark;
  dynamic spotToken;
  dynamic isRed;
  dynamic staffId;
  dynamic status;
  String? createdAt;
  String? updatedAt;
  String? phone;
  String? custFname;
  dynamic custLname;
  String? kPCaseId;
  String? dharamKanta;
  dynamic rstNo;
  dynamic bags;
  String? grossWeight;
  String? tareWeight;
  String? netWeight;
  dynamic grossDateTime;
  dynamic tareDateTime;
  dynamic charges;
  dynamic vNo;
  String? kantaName;
  String? kantaPlace;
  String? file;
  String? file2;
  String? file3;
  String? notes;
  String? userPriceFname;
  String? userPriceLname;
  String? lBCaseId;
  String? fQCaseId;

  Datum({
    this.id,
    this.caseId,
    this.gatePass,
    this.inOut,
    this.customerUid,
    this.location,
    this.commodityId,
    this.terminalId,
    this.stackRowId,
    this.stackNumber,
    this.totalWeight,
    this.vehicleNo,
    this.leadGenUid,
    this.leadConvUid,
    this.purpose,
    this.fpoUsers,
    this.fpoUserId,
    this.gatePassCdfUserName,
    this.coldwinName,
    this.purchaseName,
    this.loanName,
    this.saleName,
    this.noOfBags,
    this.driverOtp,
    this.driverPhone,
    this.cancelNotes,
    this.approvedRemark,
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
    this.rstNo,
    this.bags,
    this.grossWeight,
    this.tareWeight,
    this.netWeight,
    this.grossDateTime,
    this.tareDateTime,
    this.charges,
    this.vNo,
    this.kantaName,
    this.kantaPlace,
    this.file,
    this.file2,
    this.file3,
    this.notes,
    this.userPriceFname,
    this.userPriceLname,
    this.lBCaseId,
    this.fQCaseId,
  });

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
    id: json["id"],
    caseId: json["case_id"],
    gatePass: json["gate_pass"],
    inOut: json["in_out"],
    customerUid: json["customer_uid"],
    location: json["location"],
    commodityId: json["commodity_id"],
    terminalId: json["terminal_id"],
    stackRowId: json["stack_row_id"],
    stackNumber: json["stack_number"],
    totalWeight: json["total_weight"],
    vehicleNo: json["vehicle_no"],
    leadGenUid: json["lead_gen_uid"],
    leadConvUid: json["lead_conv_uid"],
    purpose: json["purpose"],
    fpoUsers: json["fpo_users"],
    fpoUserId: json["fpo_user_id"],
    gatePassCdfUserName: json["gate_pass_cdf_user_name"],
    coldwinName: json["coldwin_name"],
    purchaseName: json["purchase_name"],
    loanName: json["loan_name"],
    saleName: json["sale_name"],
    noOfBags: json["no_of_bags"],
    driverOtp: json["driver_otp"],
    driverPhone: json["driver_phone"],
    cancelNotes: json["cancel_notes"],
    approvedRemark: json["approved_remark"],
    spotToken: json["spot_token"],
    isRed: json["is_red"],
    staffId: json["staff_id"],
    status: json["status"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    phone: json["phone"],
    custFname: json["cust_fname"],
    custLname: json["cust_lname"],
    kPCaseId: json["k_p_case_id"],
    dharamKanta: json["dharam_kanta"],
    rstNo: json["rst_no"],
    bags: json["bags"],
    grossWeight: json["gross_weight"],
    tareWeight: json["tare_weight"],
    netWeight: json["net_weight"],
    grossDateTime: json["gross_date_time"],
    tareDateTime: json["tare_date_time"],
    charges: json["charges"],
    vNo: json["v_no"],
    kantaName: json["kanta_name"],
    kantaPlace: json["kanta_place"],
    file: json["file"],
    file2: json["file_2"],
    file3: json["file_3"],
    notes: json["notes"],
    userPriceFname: json["user_price_fname"],
    userPriceLname: json["user_price_lname"],
    lBCaseId: json["l_b_case_id"],
    fQCaseId: json["f_q_case_id"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "case_id": caseId,
    "gate_pass": gatePass,
    "in_out": inOut,
    "customer_uid": customerUid,
    "location": location,
    "commodity_id": commodityId,
    "terminal_id": terminalId,
    "stack_row_id": stackRowId,
    "stack_number": stackNumber,
    "total_weight": totalWeight,
    "vehicle_no": vehicleNo,
    "lead_gen_uid": leadGenUid,
    "lead_conv_uid": leadConvUid,
    "purpose": purpose,
    "fpo_users": fpoUsers,
    "fpo_user_id": fpoUserId,
    "gate_pass_cdf_user_name": gatePassCdfUserName,
    "coldwin_name": coldwinName,
    "purchase_name": purchaseName,
    "loan_name": loanName,
    "sale_name": saleName,
    "no_of_bags": noOfBags,
    "driver_otp": driverOtp,
    "driver_phone": driverPhone,
    "cancel_notes": cancelNotes,
    "approved_remark": approvedRemark,
    "spot_token": spotToken,
    "is_red": isRed,
    "staff_id": staffId,
    "status": status,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "phone": phone,
    "cust_fname": custFname,
    "cust_lname": custLname,
    "k_p_case_id": kPCaseId,
    "dharam_kanta": dharamKanta,
    "rst_no": rstNo,
    "bags": bags,
    "gross_weight": grossWeight,
    "tare_weight": tareWeight,
    "net_weight": netWeight,
    "gross_date_time": grossDateTime,
    "tare_date_time": tareDateTime,
    "charges": charges,
    "v_no": vNo,
    "kanta_name": kantaName,
    "kanta_place": kantaPlace,
    "file": file,
    "file_2": file2,
    "file_3": file3,
    "notes": notes,
    "user_price_fname": userPriceFname,
    "user_price_lname": userPriceLname,
    "l_b_case_id": lBCaseId,
    "f_q_case_id": fQCaseId,
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

class DharemKanta {
  dynamic id;
  String? name;
  String? operatorName;
  String? phone;
  String? location;
  String? length;
  String? capicity;
  String? stateId;
  String? districtId;
  String? createdAt;
  String? updatedAt;
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
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
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
    "created_at": createdAt,
    "updated_at": updatedAt,
    "status": status,
  };
}
