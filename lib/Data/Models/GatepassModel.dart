// To parse this JSON data, do
//
//     final gatepassModel = gatepassModelFromJson(jsonString);

import 'dart:convert';

GatepassModel gatepassModelFromJson(String str) =>
    GatepassModel.fromJson(json.decode(str));

String gatepassModelToJson(GatepassModel data) => json.encode(data.toJson());

class GatepassModel {
  dynamic status;
  dynamic message;
  Data? data;

  GatepassModel({
    this.status,
    this.message,
    this.data,
  });

  factory GatepassModel.fromJson(Map<String, dynamic> json) => GatepassModel(
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
  dynamic dharamKanta;
  dynamic kantaId;
  dynamic weight;
  dynamic averageWeight;
  dynamic noOfBags;
  dynamic displedgeBags;
  dynamic kantaParchiNo;
  dynamic custName;
  dynamic caseId;
  dynamic terminalName;
  dynamic stackNo;
  dynamic gatepassNo;
  dynamic vehicleNo;
  dynamic weightKg;
  dynamic firstKantaParchi;
  dynamic secondKantaParchi;
  dynamic transportId;
  dynamic transporterName;
  dynamic transporterPhoneNo;
  dynamic transporterType;
  dynamic labourType;
  dynamic labourContractor;
  dynamic whsName;
  dynamic secondQv;
  dynamic firstKantaTruckImage;
  dynamic secondKantaTruckImage;
  dynamic specialQv;
  dynamic secondKantaParchiNote;
dynamic secondQualityReportsNotes;
dynamic secondQualityImage;

  Data(
      {this.dharamKanta,
      this.kantaId,
      this.weight,
      this.averageWeight,
      this.noOfBags,
      this.displedgeBags,
      this.kantaParchiNo,
      this.custName,
      this.caseId,
      this.terminalName,
      this.stackNo,
      this.gatepassNo,
      this.vehicleNo,
      this.weightKg,
      this.firstKantaParchi,
      this.secondKantaParchi,
      this.transportId,
      this.transporterName,
      this.transporterPhoneNo,
      this.transporterType,
      this.labourType,
      this.labourContractor,
      this.whsName,
      this.secondQv,
      this.firstKantaTruckImage,
      this.secondKantaTruckImage,
      this.specialQv,
      this.secondKantaParchiNote,
this.secondQualityReportsNotes,
this.secondQualityImage,
      });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
      dharamKanta: json["dharam_kanta"],
      kantaId: json["kanta_id"],
      weight: json["weight"],
      averageWeight: json["average_weight"],
      noOfBags: json["no_of_bags"],
      displedgeBags: json["displedge_bags"],
      kantaParchiNo: json["kanta_parchi_no"],
      custName: json["cust_name"],
      caseId: json["case_id"],
      terminalName: json["terminal_name"],
      stackNo: json["stack_no"],
      gatepassNo: json["gatepass_no"],
      vehicleNo: json["vehicle_no"],
      weightKg: json["weight_kg"],
      firstKantaParchi: json["first_kanta_parchi"],
      secondKantaParchi: json["second_kanta_parchi"],
      transportId: json["transport_id"],
      transporterName: json["transporter_name"],
      transporterPhoneNo: json["transporter_phone_no"],
      transporterType: json["transporter_type"],
      labourType: json['labour_type'],
      labourContractor: json['labour_contractor'],
      whsName: json['emp_name'],
      secondQv: json['second_qv'],
      firstKantaTruckImage: json['first_kanta_truck'],
      secondKantaTruckImage: json['second_kanta_truck'],
      specialQv: json['special_qv'],
      secondKantaParchiNote: json['second_kanta_parchi_notes'],
      secondQualityReportsNotes: json['second_quality_reports_notes'],
      secondQualityImage: json['second_quality_image'],
      );

  Map<String, dynamic> toJson() => {
        "dharam_kanta": dharamKanta,
        "kanta_id": kantaId,
        "weight": weight,
        "average_weight": averageWeight,
        "no_of_bags": noOfBags,
        "displedge_bags": displedgeBags,
        "kanta_parchi_no": kantaParchiNo,
        "cust_name": custName,
        "case_id": caseId,
        "terminal_name": terminalName,
        "stack_no": stackNo,
        "gatepass_no": gatepassNo,
        "vehicle_no": vehicleNo,
        "weight_kg": weightKg,
        "first_kanta_parchi": firstKantaParchi,
        "second_kanta_parchi": secondKantaParchi,
        "transport_id": transportId,
        "transporter_name": transporterName,
        "transporter_phone_no": transporterPhoneNo,
        "transporter_type": transporterType,
        "labour_type": labourType,
        "labour_contractor": labourContractor,
        "emp_name": whsName,
        "second_qv": secondQv,
        "first_kanta_truck": firstKantaTruckImage,
        "second_kanta_truck": secondKantaTruckImage,
        "special_qv": specialQv,
        "second_kanta_parchi_note": secondKantaParchiNote,
        "second_quality_reports_notes": secondQualityReportsNotes,
        "second_quality_image": secondQualityImage,
      };
}
