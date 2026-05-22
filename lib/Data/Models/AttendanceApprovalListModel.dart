// To parse this JSON data, do
//
//     final attendanceApprovalListModel = attendanceApprovalListModelFromJson(jsonString);

import 'dart:convert';

AttendanceApprovalListModel attendanceApprovalListModelFromJson(String str) => AttendanceApprovalListModel.fromJson(json.decode(str));

String attendanceApprovalListModelToJson(AttendanceApprovalListModel data) => json.encode(data.toJson());

class AttendanceApprovalListModel {
  dynamic status;
  dynamic message;
  dynamic penCount;
  List<AttenDatum>? attenData;

  AttendanceApprovalListModel({
    this.status,
    this.message,
    this.penCount,
    this.attenData,
  });

  factory AttendanceApprovalListModel.fromJson(Map<String, dynamic> json) => AttendanceApprovalListModel(
    status: json["status"],
    message: json["message"],
    penCount: json["pen_count"],
    attenData: json["atten_data"] == null ? [] : List<AttenDatum>.from(json["atten_data"]!.map((x) => AttenDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "pen_count": penCount,
    "atten_data": attenData == null ? [] : List<dynamic>.from(attenData!.map((x) => x.toJson())),
  };
}

class AttenDatum {
  dynamic id;
  dynamic userId;
  dynamic date;
  dynamic inTime;
  dynamic inLocation;
  dynamic inImage;
  dynamic inStatus;
  dynamic inLatitude;
  dynamic inLongitude;
  dynamic inDistance;
  dynamic inApprove;
  dynamic inRemark;
  dynamic inVerify;
  dynamic outTime;
  dynamic outLocation;
  dynamic outImage;
  dynamic outStatus;
  dynamic outLatitude;
  dynamic outLongitude;
  dynamic outDistance;
  dynamic approvedBy;
  dynamic outRemark;
  dynamic outApprove;
  dynamic outVerify;
  dynamic remark;
  dynamic status;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic inDistanceWeb;
  dynamic outDistanceWeb;
  dynamic totalApproveReq;
  dynamic outUserPurpose;
  dynamic inUserPurpose;
  Employee? employee;

  AttenDatum({
    this.id,
    this.userId,
    this.date,
    this.inTime,
    this.inLocation,
    this.inImage,
    this.inStatus,
    this.inLatitude,
    this.inLongitude,
    this.inDistance,
    this.inApprove,
    this.inRemark,
    this.inVerify,
    this.outTime,
    this.outLocation,
    this.outImage,
    this.outStatus,
    this.outLatitude,
    this.outLongitude,
    this.outDistance,
    this.approvedBy,
    this.outRemark,
    this.outApprove,
    this.outVerify,
    this.remark,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.inDistanceWeb,
    this.outDistanceWeb,
    this.totalApproveReq,
    this.outUserPurpose,
    this.inUserPurpose,
    this.employee,
  });

  factory AttenDatum.fromJson(Map<String, dynamic> json) => AttenDatum(
    id: json["id"],
    userId: json["user_id"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    inTime: json["in_time"],
    inLocation: json["in_location"],
    inImage: json["in_image"],
    inStatus: json["in_status"],
    inLatitude: json["in_latitude"],
    inLongitude: json["in_longitude"],
    inDistance: json["in_distance"],
    inApprove: json["in_approve"],
    inRemark: json["in_remark"],
    inVerify: json["in_verify"],
    outTime: json["out_time"],
    outLocation: json["out_location"],
    outImage: json["out_image"],
    outStatus: json["out_status"],
    outLatitude: json["out_latitude"],
    outLongitude: json["out_longitude"],
    outDistance: json["out_distance"],
    approvedBy: json["approved_by"],
    outRemark: json["out_remark"],
    outApprove: json["out_approve"],
    outVerify: json["out_verify"],
    remark: json["remark"],
    status: json["status"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    inDistanceWeb: json["in_distance_web"],
    outDistanceWeb: json["out_distance_web"],
    totalApproveReq: json["total_approve_req"],
    outUserPurpose: json["out_user_purpose"],
    inUserPurpose: json["in_user_purpose"],
    employee: json["employee"] == null ? null : Employee.fromJson(json["employee"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
    "in_time": inTime,
    "in_location": inLocation,
    "in_image": inImage,
    "in_status": inStatus,
    "in_latitude": inLatitude,
    "in_longitude": inLongitude,
    "in_distance": inDistance,
    "in_approve": inApprove,
    "in_remark": inRemark,
    "in_verify": inVerify,
    "out_time": outTime,
    "out_location": outLocation,
    "out_image": outImage,
    "out_status": outStatus,
    "out_latitude": outLatitude,
    "out_longitude": outLongitude,
    "out_distance": outDistance,
    "approved_by": approvedBy,
    "out_remark": outRemark,
    "out_approve": outApprove,
    "out_verify": outVerify,
    "remark": remark,
    "status": status,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "in_distance_web": inDistanceWeb,
    "out_distance_web": outDistanceWeb,
    "total_approve_req": totalApproveReq,
    "out_user_purpose": outUserPurpose,
    "in_user_purpose": inUserPurpose,
    "employee": employee?.toJson(),
  };
}

class Employee {
  dynamic userId;
  dynamic empId;
  dynamic firstName;
  dynamic lastName;

  Employee({
    this.userId,
    this.empId,
    this.firstName,
    this.lastName,
  });

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
    userId: json["user_id"],
    empId: json["emp_id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "emp_id": empId,
    "first_name": firstName,
    "last_name": lastName,
  };
}
