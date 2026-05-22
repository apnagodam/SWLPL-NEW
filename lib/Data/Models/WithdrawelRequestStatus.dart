// To parse this JSON data, do
//
//     final mainPagePdfModal = mainPagePdfModalFromJson(jsonString);

import 'dart:convert';

MainPagePdfModal mainPagePdfModalFromJson(String str) => MainPagePdfModal.fromJson(json.decode(str));

String mainPagePdfModalToJson(MainPagePdfModal data) => json.encode(data.toJson());

class MainPagePdfModal {
    dynamic status;
    dynamic message;
    Data? data;

    MainPagePdfModal({
        this.status,
        this.message,
        this.data,
    });

    factory MainPagePdfModal.fromJson(Map<String, dynamic> json) => MainPagePdfModal(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
    };
}

class Data {
    dynamic wareName;
    dynamic wareLocation;
    dynamic auditId;
    dynamic terminalId;
    dynamic supName;
    dynamic supPhone;
    dynamic auditorName;
    dynamic auditorPhone;
    dynamic amName;
    dynamic amPhone;
    dynamic ahName;
    dynamic ahPhone;
    dynamic bhName;
    dynamic bhPhone;
    dynamic stackImage;
    List<StackDatum>? stackData;
    List<QualityDatum>? qualityData;
    List<dynamic>? fumigationData;
    List<LockDatum>? lockData;
    List<AssetsDatum>? assetsData;
    List<CctvDatum>? cctvData;
    dynamic pvData;

    Data({
        this.wareName,
        this.wareLocation,
        this.auditId,
        this.terminalId,
        this.supName,
        this.supPhone,
        this.auditorName,
        this.auditorPhone,
        this.amName,
        this.amPhone,
        this.ahName,
        this.ahPhone,
        this.bhName,
        this.bhPhone,
        this.stackImage,
        this.stackData,
        this.qualityData,
        this.fumigationData,
        this.lockData,
        this.assetsData,
        this.cctvData,
        this.pvData,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        wareName: json["ware_name"],
        wareLocation: json["ware_location"],
        auditId: json["audit_id"],
        terminalId: json["terminal_id"],
        supName: json["sup_name"],
        supPhone: json["sup_phone"],
        auditorName: json["auditor_name"],
        auditorPhone: json["auditor_phone"],
        amName: json["am_name"],
        amPhone: json["am_phone"],
        ahName: json["ah_name"],
        ahPhone: json["ah_phone"],
        bhName: json["bh_name"],
        bhPhone: json["bh_phone"],
        stackImage: json["stack_image"],
        stackData: json["stack_data"] == null ? [] : List<StackDatum>.from(json["stack_data"]!.map((x) => StackDatum.fromJson(x))),
        qualityData: json["quality_data"] == null ? [] : List<QualityDatum>.from(json["quality_data"]!.map((x) => QualityDatum.fromJson(x))),
        fumigationData: json["fumigation_data"] == null ? [] : List<dynamic>.from(json["fumigation_data"]!.map((x) => x)),
        lockData: json["lock_data"] == null ? [] : List<LockDatum>.from(json["lock_data"]!.map((x) => LockDatum.fromJson(x))),
        assetsData: json["assets_data"] == null ? [] : List<AssetsDatum>.from(json["assets_data"]!.map((x) => AssetsDatum.fromJson(x))),
        cctvData: json["cctv_data"] == null ? [] : List<CctvDatum>.from(json["cctv_data"]!.map((x) => CctvDatum.fromJson(x))),
        pvData: json["pv_data"],
    );

    Map<String, dynamic> toJson() => {
        "ware_name": wareName,
        "ware_location": wareLocation,
        "audit_id": auditId,
        "terminal_id": terminalId,
        "sup_name": supName,
        "sup_phone": supPhone,
        "auditor_name": auditorName,
        "auditor_phone": auditorPhone,
        "am_name": amName,
        "am_phone": amPhone,
        "ah_name": ahName,
        "ah_phone": ahPhone,
        "bh_name": bhName,
        "bh_phone": bhPhone,
        "stack_image": stackImage,
        "stack_data": stackData == null ? [] : List<dynamic>.from(stackData!.map((x) => x.toJson())),
        "quality_data": qualityData == null ? [] : List<dynamic>.from(qualityData!.map((x) => x.toJson())),
        "fumigation_data": fumigationData == null ? [] : List<dynamic>.from(fumigationData!.map((x) => x)),
        "lock_data": lockData == null ? [] : List<dynamic>.from(lockData!.map((x) => x.toJson())),
        "assets_data": assetsData == null ? [] : List<dynamic>.from(assetsData!.map((x) => x.toJson())),
        "cctv_data": cctvData == null ? [] : List<dynamic>.from(cctvData!.map((x) => x.toJson())),
        "pv_data": pvData,
    };
}

class AssetsDatum {
    dynamic value;
    dynamic remark;
    dynamic assetName;

    AssetsDatum({
        this.value,
        this.remark,
        this.assetName,
    });

    factory AssetsDatum.fromJson(Map<String, dynamic> json) => AssetsDatum(
        value: json["value"],
        remark: json["remark"],
        assetName: json["asset_name"],
    );

    Map<String, dynamic> toJson() => {
        "value": value,
        "remark": remark,
        "asset_name": assetName,
    };
}

class CctvDatum {
    dynamic cameraNo;
    dynamic remark;

    CctvDatum({
        this.cameraNo,
        this.remark,
    });

    factory CctvDatum.fromJson(Map<String, dynamic> json) => CctvDatum(
        cameraNo: json["camera_no"],
        remark: json["remark"],
    );

    Map<String, dynamic> toJson() => {
        "camera_no": cameraNo,
        "remark": remark,
    };
}

class LockDatum {
    dynamic lockNo;
    dynamic sealNo;
    dynamic keyNo;
    dynamic remark;

    LockDatum({
        this.lockNo,
        this.sealNo,
        this.keyNo,
        this.remark,
    });

    factory LockDatum.fromJson(Map<String, dynamic> json) => LockDatum(
        lockNo: json["lock_no"],
        sealNo: json["seal_no"],
        keyNo: json["key_no"],
        remark: json["remark"],
    );

    Map<String, dynamic> toJson() => {
        "lock_no": lockNo,
        "seal_no": sealNo,
        "key_no": keyNo,
        "remark": remark,
    };
}

class QualityDatum {
    dynamic stackNo;
    dynamic commodityId;
    dynamic remark;
    dynamic category;
    dynamic qualityData;

    QualityDatum({
        this.stackNo,
        this.commodityId,
        this.remark,
        this.category,
        this.qualityData,
    });

    factory QualityDatum.fromJson(Map<String, dynamic> json) => QualityDatum(
        stackNo: json["stack_no"],
        commodityId: json["commodity_id"],
        remark: json["remark"],
        category: json["category"],
        qualityData: json["quality_data"],
    );

    Map<String, dynamic> toJson() => {
        "stack_no": stackNo,
        "commodity_id": commodityId,
        "remark": remark,
        "category": category,
        "quality_data": qualityData,
    };
}

class StackDatum {
    dynamic stackNo;
    dynamic commodityId;
    dynamic auditBags;
    dynamic invBags;
    dynamic bagDifference;
    dynamic remark;
    dynamic category;

    StackDatum({
        this.stackNo,
        this.commodityId,
        this.auditBags,
        this.invBags,
        this.bagDifference,
        this.remark,
        this.category,
    });

    factory StackDatum.fromJson(Map<String, dynamic> json) => StackDatum(
        stackNo: json["stack_no"],
        commodityId: json["commodity_id"],
        auditBags: json["audit_bags"],
        invBags: json["inv_bags"],
        bagDifference: json["bag_difference"],
        remark: json["remark"],
        category: json["category"],
    );

    Map<String, dynamic> toJson() => {
        "stack_no": stackNo,
        "commodity_id": commodityId,
        "audit_bags": auditBags,
        "inv_bags": invBags,
        "bag_difference": bagDifference,
        "remark": remark,
        "category": category,
    };
}
