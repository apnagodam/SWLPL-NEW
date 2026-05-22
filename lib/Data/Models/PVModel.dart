import 'dart:convert';

import 'package:emp_apnagodam/Presentation/UI/PV/PVScreen.dart';
import 'package:flutter/cupertino.dart';

String pvModeltoMap(Pvmodel data) => json.encode(data.toMap());

class Pvmodel {
  String? terminalId;
  double? stackNo;
  String? commodityId;
  List<BlockNo>? blockNo;

  Pvmodel({this.terminalId, this.stackNo, this.commodityId, this.blockNo});

  Map<String, dynamic> toMap() => {
        "terminal_id": terminalId,
        "stack_no": stackNo,
        "commodity_id": commodityId,
        "block_no": blockNo == null
            ? []
            : List<dynamic>.from(blockNo!.map((x) => x.toMap())),
      };
}

class BlockNo {
  String? block_no;
  String? danda;

  String? dhang;

  String? height;

  String? plusMinus;

  String? total;
  String? no_of_blocks;

  PlusMinusType plusMinusType = PlusMinusType.plusType;
  TextEditingController textEditingController = TextEditingController();

  BlockNo({
    this.block_no,
    this.danda,
    this.dhang,
    required this.height,
    this.plusMinus,
    this.no_of_blocks,
  });

  Map<String, dynamic> toMap() => {
        "block_no": block_no ?? "0",
        "danda": danda ?? "0",
        "dhang": dhang ?? "0",
        "height": height ?? "1",
        "plusMinus": plusMinus ?? "0",
        "total": total ?? "0",
        "no_of_blocks": no_of_blocks ?? "0",
      };
}
