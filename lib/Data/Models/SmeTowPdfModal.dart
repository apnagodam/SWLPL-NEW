// // To parse this JSON data, do
// //
// //     final smeTowPdfModal = smeTowPdfModalFromJson(jsonString);

// import 'dart:convert';

// SmeTowPdfModal smeTowPdfModalFromJson(String str) => SmeTowPdfModal.fromJson(json.decode(str));

// String smeTowPdfModalToJson(SmeTowPdfModal data) => json.encode(data.toJson());

// class SmeTowPdfModal {
//     dynamic status;
//     dynamic message;
//     List<Datum>? data;

//     SmeTowPdfModal({
//         this.status,
//         this.message,
//         this.data,
//     });

//     factory SmeTowPdfModal.fromJson(Map<String, dynamic> json) => SmeTowPdfModal(
//         status: json["status"],
//         message: json["message"],
//         data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "status": status,
//         "message": message,
//         "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
//     };
// }

// class Datum {
//     dynamic executionDate;
//     dynamic userName;
//     dynamic userAddress;
//     dynamic userPhone;
//     dynamic userEmail;
//     dynamic applicationDate;
//     dynamic bankName;
//     dynamic bankAddress;
//     dynamic approvedAmount;
//     dynamic financeAmount;
//     dynamic interestRate;
//     dynamic bankTenor;
//     dynamic finalDate;

//     Datum({
//         this.executionDate,
//         this.userName,
//         this.userAddress,
//         this.userPhone,
//         this.userEmail,
//         this.applicationDate,
//         this.bankName,
//         this.bankAddress,
//         this.approvedAmount,
//         this.financeAmount,
//         this.interestRate,
//         this.bankTenor,
//         this.finalDate,
//     });

//     factory Datum.fromJson(Map<String, dynamic> json) => Datum(
//         executionDate: json["execution_date"],
//         userName: json["user_name"],
//         userAddress: json["user_address"],
//         userPhone: json["user_phone"],
//         userEmail: json["user_email"],
//         applicationDate: json["application_date"],
//         bankName: json["bank_name"],
//         bankAddress: json["bank_address"],
//         approvedAmount: json["approved_amount"],
//         financeAmount: json["finance_amount"],
//         interestRate: json["interest_rate"],
//         bankTenor: json["bank_tenor"],
//         finalDate: json["final_date"],
//     );

//     Map<String, dynamic> toJson() => {
//         "execution_date": executionDate,
//         "user_name": userName,
//         "user_address": userAddress,
//         "user_phone": userPhone,
//         "user_email": userEmail,
//         "application_date": applicationDate,
//         "bank_name": bankName,
//         "bank_address": bankAddress,
//         "approved_amount": approvedAmount,
//         "finance_amount": financeAmount,
//         "interest_rate": interestRate,
//         "bank_tenor": bankTenor,
//         "final_date": finalDate,
//     };
// }
import 'dart:convert';

SmeTowPdfModal smeTowPdfModalFromJson(String str) =>
    SmeTowPdfModal.fromJson(json.decode(str));

String smeTowPdfModalToJson(SmeTowPdfModal data) =>
    json.encode(data.toJson());

class SmeTowPdfModal {
  dynamic status;
  dynamic message;
  List<Datum>? data;

  SmeTowPdfModal({
    this.status,
    this.message,
    this.data,
  });

  factory SmeTowPdfModal.fromJson(Map<String, dynamic> json) =>
      SmeTowPdfModal(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  dynamic executionDate;
  dynamic userName;
  dynamic userAddress;
  dynamic userPhone;
  dynamic userEmail;
  dynamic applicationDate;
  dynamic bankName;
  dynamic bankAddress;
  dynamic approvedAmount;
  dynamic financeAmount;
  dynamic interestRate;
  dynamic bankTenor;
  dynamic finalDate;

  Datum({
    this.executionDate,
    this.userName,
    this.userAddress,
    this.userPhone,
    this.userEmail,
    this.applicationDate,
    this.bankName,
    this.bankAddress,
    this.approvedAmount,
    this.financeAmount,
    this.interestRate,
    this.bankTenor,
    this.finalDate,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        executionDate: json["execution_date"],
        userName: json["user_name"],
        userAddress: json["user_address"],
        userPhone: json["user_phone"],
        userEmail: json["user_email"],
        applicationDate: json["application_date"],
        bankName: json["bank_name"],
        bankAddress: json["bank_address"],
        approvedAmount: json["approved_amount"],
        financeAmount: json["finance_amount"],
        interestRate: json["interest_rate"],
        bankTenor: json["bank_tenor"],
        finalDate: json["final_date"],
      );

  Map<String, dynamic> toJson() => {
        "execution_date": executionDate,
        "user_name": userName,
        "user_address": userAddress,
        "user_phone": userPhone,
        "user_email": userEmail,
        "application_date": applicationDate,
        "bank_name": bankName,
        "bank_address": bankAddress,
        "approved_amount": approvedAmount,
        "finance_amount": financeAmount,
        "interest_rate": interestRate,
        "bank_tenor": bankTenor,
        "final_date": finalDate,
      };

  // Helper function to convert dynamic values to string safely
  String getSafeString(dynamic value) {
    return value != null ? value.toString() : 'N/A'; // Convert to string or return 'N/A' if null
  }
}
