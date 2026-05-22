// To parse this JSON data, do
//
//     final pvStackAuditModel = pvStackAuditModelFromJson(jsonString);

import 'dart:convert';


PvStackAuditModel pvStackAuditModelFromJson(String str) =>
    PvStackAuditModel.fromJson(json.decode(str));

String pvStackAuditModelToJson(PvStackAuditModel data) =>
    json.encode(data.toJson());

class PvStackAuditModel {
  dynamic terminalId;
  dynamic stackNo;
  dynamic auditId;
  dynamic commodityId;
  dynamic remark;
  List<BlockNoDatum>? blockNo;

  PvStackAuditModel( {
    this.terminalId,
    this.stackNo,
    this.auditId,
    this.commodityId,
    this.remark,
    this.blockNo,
  });

  factory PvStackAuditModel.fromJson(Map<String, dynamic> json) =>
      PvStackAuditModel(
        terminalId: json["terminal_id"],
        stackNo: json["stack_no"],
        auditId: json["audit_id"],
        commodityId: json["commodity_id"],
        remark: json["remark"],
        blockNo: json["block_no"] == null
            ? []
            : List<BlockNoDatum>.from(
                json["block_no"]!.map((x) => BlockNoDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "terminal_id": terminalId,
        "stack_no": stackNo,
        "audit_id": auditId,
        "commodity_id": commodityId,
        "remark": remark,
        "block_no": blockNo == null
            ? []
            : List<dynamic>.from(blockNo!.map((x) => x.toJson())),
      };
}

class BlockNoDatum {
  dynamic blockNo;
  dynamic dhang;
  dynamic danda;
  dynamic height;
  dynamic plusMinus;
  dynamic total;

  BlockNoDatum({
    this.blockNo,
    this.dhang,
    this.danda,
    this.height,
    this.plusMinus,
    this.total,
  });

  factory BlockNoDatum.fromJson(Map<String, dynamic> json) => BlockNoDatum(
        blockNo: json["block_no"],
        dhang: json["dhang"],
        danda: json["danda"],
        height: json["height"],
        plusMinus: json["plusMinus"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "block_no": blockNo,
        "dhang": dhang,
        "danda": danda,
        "height": height,
        "plusMinus": plusMinus,
        "total": total,
      };
}
