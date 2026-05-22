// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';

String qvRequestModeltoMap(AuditQvRequestModel data) =>
    json.encode(data.toMap());

class AuditQvRequestModel {
  String? terminal_id;
  String? commodity_id;
  String? stack_no;
  List<QVMOdel?> commodityList;

  AuditQvRequestModel(
      this.terminal_id, this.commodity_id, this.stack_no, this.commodityList);

  Map<String, dynamic> toMap() => {
        "terminal_id": terminal_id,
        "commodity_id": commodity_id,
        'stack_no': stack_no,
        "commodityList": commodityList == null
            ? []
            : List<dynamic>.from(commodityList.map((x) => x!.toMap())),
      };
}

class QVMOdel {
  String id;
  String value;
  QVMOdel(this.id, this.value);

  Map<String, dynamic> toMap() => {
        "id": id,
        "value": value,
      };
}
