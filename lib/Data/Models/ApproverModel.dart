// To parse this JSON data, do
//
//     final approverModel = approverModelFromMap(jsonString);

import 'dart:convert';

ApproverModel approverModelFromMap(String str) => ApproverModel.fromMap(json.decode(str));

String approverModelToMap(ApproverModel data) => json.encode(data.toMap());

class ApproverModel {
  String? status;
  String? message;
  List<Employee>? employees;

  ApproverModel({
    this.status,
    this.message,
    this.employees,
  });

  factory ApproverModel.fromMap(Map<String, dynamic> json) => ApproverModel(
    status: json["status"],
    message: json["message"],
    employees: json["employees"] == null ? [] : List<Employee>.from(json["employees"]!.map((x) => Employee.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "status": status,
    "message": message,
    "employees": employees == null ? [] : List<dynamic>.from(employees!.map((x) => x.toMap())),
  };
}

class Employee {
  dynamic id;
  String? employee;

  Employee({
    this.id,
    this.employee,
  });

  factory Employee.fromMap(Map<String, dynamic> json) => Employee(
    id: json["id"],
    employee: json["employee"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "employee": employee,
  };
}
