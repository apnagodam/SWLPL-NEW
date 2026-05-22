// // To parse this JSON data, do
// //
// //     final fumigationCleaningModal = fumigationCleaningModalFromJson(jsonString);

// import 'dart:convert';

// FumigationCleaningModal fumigationCleaningModalFromJson(String str) => FumigationCleaningModal.fromJson(json.decode(str));

// String fumigationCleaningModalToJson(FumigationCleaningModal data) => json.encode(data.toJson());

// class FumigationCleaningModal {
//     dynamic status;
//     dynamic message;
//     List<Terminal>? terminals;

//     FumigationCleaningModal({
//         this.status,
//         this.message,
//         this.terminals,
//     });

//     factory FumigationCleaningModal.fromJson(Map<String, dynamic> json) => FumigationCleaningModal(
//         status: json["status"],
//         message: json["message"],
//         terminals: json["terminals"] == null ? [] : List<Terminal>.from(json["terminals"]!.map((x) => Terminal.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "status": status,
//         "message": message,
//         "terminals": terminals == null ? [] : List<dynamic>.from(terminals!.map((x) => x.toJson())),
//     };
// }

// class Terminal {
//     dynamic id;
//     dynamic name;
//     dynamic warehouseCode;

//     Terminal({
//         this.id,
//         this.name,
//         this.warehouseCode,
//     });

//     factory Terminal.fromJson(Map<String, dynamic> json) => Terminal(
//         id: json["id"],
//         name: json["name"],
//         warehouseCode: json["warehouse_code"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "warehouse_code": warehouseCode,
//     };
// }
// To parse this JSON data, do
//
//     final allterminalList = allterminalListFromJson(jsonString);

import 'dart:convert';

AllterminalList allterminalListFromJson(String str) => AllterminalList.fromJson(json.decode(str));

String allterminalListToJson(AllterminalList data) => json.encode(data.toJson());

class AllterminalList {
    String? status;
    String? message;
    List<Terminal>? terminals;

    AllterminalList({
        this.status,
        this.message,
        this.terminals,
    });

    factory AllterminalList.fromJson(Map<String, dynamic> json) => AllterminalList(
        status: json["status"],
        message: json["message"],
        terminals: json["terminals"] == null ? [] : List<Terminal>.from(json["terminals"]!.map((x) => Terminal.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "terminals": terminals == null ? [] : List<dynamic>.from(terminals!.map((x) => x.toJson())),
    };
}

class Terminal {
    int? id;
    String? name;
    String? warehouseCode;

    Terminal({
        this.id,
        this.name,
        this.warehouseCode,
    });

    factory Terminal.fromJson(Map<String, dynamic> json) => Terminal(
        id: json["id"],
        name: json["name"],
        warehouseCode: json["warehouse_code"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "warehouse_code": warehouseCode,
    };
}
