// To parse this JSON data, do
//
//     final caseIdResponseModel = caseIdResponseModelFromMap(jsonString);

import 'dart:convert';

CaseIdResponseModel caseIdResponseModelFromMap(String str) =>
    CaseIdResponseModel.fromMap(json.decode(str));

String caseIdResponseModelToMap(CaseIdResponseModel data) =>
    json.encode(data.toMap());

class CaseIdResponseModel {
  String? status;
  String? message;
  Data? data;

  CaseIdResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory CaseIdResponseModel.fromMap(Map<String, dynamic> json) =>
      CaseIdResponseModel(
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
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromMap(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        links: json["links"] == null
            ? []
            : List<Link>.from(json["links"]!.map((x) => Link.fromMap(x))),
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toMap() => {
        "current_page": currentPage,
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "links": links == null
            ? []
            : List<dynamic>.from(links!.map((x) => x.toMap())),
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
  String? createdAt;
  String? updatedAt;
  String? phone;
  String? custFname;
  String? cateName;
  String? commodityType;
  String? warehouseCode;
  String? terminalName;
  dynamic truckbook;
  dynamic truckbookDate;
  dynamic labourbook;
  dynamic labourbookDate;
  dynamic firstKantaParchi;
  dynamic firstKantaParchiDate;
  dynamic firstKantaDhramkanta;
  dynamic firstQuality;
  dynamic firstQualityDate;
  dynamic fQTagging;
  dynamic fQTaggingDate;
  dynamic sKParchi;
  dynamic sKParchiDate;
  dynamic sKDhramkanta;
  dynamic sKPAvgWeight;
  dynamic sQualityReport;
  dynamic sQualityDate;
  dynamic sendToLab;
  dynamic cctvDate;
  dynamic cctvReport;
  dynamic ivrReport;
  dynamic ivrDate;
  dynamic preGatepassReport;
  dynamic preGatepassDate;
  dynamic gatepassReport;
  dynamic releaseWeight;
  dynamic releaseBags;
  dynamic cancelCaseId;
  dynamic commodityQuality;

  Datum(
      {this.id,
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
      this.cateName,
      this.commodityType,
      this.warehouseCode,
      this.terminalName,
      this.truckbook,
      this.truckbookDate,
      this.labourbook,
      this.labourbookDate,
      this.firstKantaParchi,
      this.firstKantaParchiDate,
      this.firstKantaDhramkanta,
      this.firstQuality,
      this.firstQualityDate,
      this.fQTagging,
      this.fQTaggingDate,
      this.sKParchi,
      this.sKParchiDate,
      this.sKDhramkanta,
      this.sKPAvgWeight,
      this.sQualityReport,
      this.sQualityDate,
      this.sendToLab,
      this.cctvDate,
      this.cctvReport,
      this.ivrReport,
      this.ivrDate,
      this.preGatepassReport,
      this.preGatepassDate,
      this.gatepassReport,
      this.releaseWeight,
      this.releaseBags,
      this.cancelCaseId,
      this.commodityQuality});

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
      createdAt: json["created_at"],
      updatedAt: json["updated_at"],
      phone: json["phone"],
      custFname: json["cust_fname"],
      cateName: json["cate_name"],
      commodityType: json["commodity_type"],
      warehouseCode: json["warehouse_code"],
      terminalName: json["terminal_name"],
      truckbook: json["truckbook"],
      truckbookDate: json["truckbook_date"],
      labourbook: json["labourbook"],
      labourbookDate: json["labourbook_date"],
      firstKantaParchi: json["first_kanta_parchi"],
      firstKantaParchiDate: json["first_kanta_parchi_date"],
      firstKantaDhramkanta: json["first_kanta_dhramkanta"],
      firstQuality: json["first_quality"],
      firstQualityDate: json["first_quality_date"],
      fQTagging: json["f_q_tagging"],
      fQTaggingDate: json["f_q_tagging_date"],
      sKParchi: json["s_k_parchi"],
      sKParchiDate: json["s_k_parchi_date"],
      sKDhramkanta: json["s_k_dhramkanta"],
      sKPAvgWeight: json["s_k_p_avg_weight"],
      sQualityReport: json["s_quality_report"],
      sQualityDate: json["s_quality_date"],
      sendToLab: json["send_to_lab"],
      cctvDate: json["cctv_date"],
      cctvReport: json["cctv_report"],
      ivrReport: json["ivr_report"],
      ivrDate: json["ivr_date"],
      preGatepassReport: json["pre_gatepass_report"],
      preGatepassDate: json["pre_gatepass_date"],
      gatepassReport: json["gatepass_report"],
      releaseWeight: json['release_weight'],
releaseBags: json['release_bags'],
cancelCaseId: json['cancel_case'],
commodityQuality: json['commodity_quality']);

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
        "created_at": createdAt,
        "updated_at": updatedAt,
        "phone": phone,
        "cust_fname": custFname,
        "cate_name": cateName,
        "commodity_type": commodityType,
        "warehouse_code": warehouseCode,
        "terminal_name": terminalName,
        "truckbook": truckbook,
        "truckbook_date": truckbookDate,
        "labourbook": labourbook,
        "labourbook_date": labourbookDate,
        "first_kanta_parchi": firstKantaParchi,
        "first_kanta_parchi_date": firstKantaParchiDate,
        "first_kanta_dhramkanta": firstKantaDhramkanta,
        "first_quality": firstQuality,
        "first_quality_date": firstQualityDate,
        "f_q_tagging": fQTagging,
        "f_q_tagging_date": fQTaggingDate,
        "s_k_parchi": sKParchi,
        "s_k_parchi_date": sKParchiDate,
        "s_k_dhramkanta": sKDhramkanta,
        "s_k_p_avg_weight": sKPAvgWeight,
        "s_quality_report": sQualityReport,
        "s_quality_date": sQualityDate,
        "send_to_lab": sendToLab,
        "cctv_date": cctvDate,
        "cctv_report": cctvReport,
        "ivr_report": ivrReport,
        "ivr_date": ivrDate,
        "pre_gatepass_report": preGatepassReport,
        "pre_gatepass_date": preGatepassDate,
        "gatepass_report": gatepassReport,
        "release_weight": releaseWeight,
        "release_bags": releaseBags,
        "cancel_case": cancelCaseId,
        "commodity_quality": commodityQuality
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
