import 'dart:convert';

QuestionsResponseModel questionsResponseModelFromJson(String str) =>
    QuestionsResponseModel.fromJson(json.decode(str));

String questionsResponseModelToJson(QuestionsResponseModel data) =>
    json.encode(data.toJson());

class QuestionsResponseModel {
  dynamic status;
  dynamic message;
  List<QuestionItem> data;

  QuestionsResponseModel({
    this.status,
    this.message,
    required this.data,
  });

  factory QuestionsResponseModel.fromJson(dynamic json) {
    if (json is List) {
      return QuestionsResponseModel(
        status: 1,
        message: "Success",
        data: json.map((x) => QuestionItem.fromJson(x)).toList(),
      );
    } else if (json is Map<String, dynamic>) {
      dynamic rawList = json["data"] ?? json["questions"] ?? json["question_list"] ?? [];
      List<QuestionItem> items = [];
      if (rawList is List) {
        items = rawList.map((x) => QuestionItem.fromJson(x)).toList();
      }
      return QuestionsResponseModel(
        status: json["status"],
        message: json["message"],
        data: items,
      );
    }
    return QuestionsResponseModel(status: 0, message: "Unknown format", data: []);
  }

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.map((x) => x.toJson()).toList(),
      };
}

class QuestionItem {
  dynamic id;
  dynamic userId;
  dynamic name;
  dynamic role;
  dynamic question;
  dynamic answer;
  dynamic answeredBy;
  dynamic answeredAt;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic status;

  QuestionItem({
    this.id,
    this.userId,
    this.name,
    this.role,
    this.question,
    this.answer,
    this.answeredBy,
    this.answeredAt,
    this.createdAt,
    this.updatedAt,
    this.status,
  });

  bool get hasAnswer =>
      answer != null &&
      answer.toString().trim().isNotEmpty &&
      answer.toString().trim().toLowerCase() != "null";

  String get displayName {
    if (name != null && name.toString().trim().isNotEmpty) {
      return name.toString().trim();
    }
    return "Employee";
  }

  String get displayRole {
    if (role != null && role.toString().trim().isNotEmpty && role.toString().trim().toLowerCase() != "null") {
      return role.toString().trim();
    }
    return "";
  }

  factory QuestionItem.fromJson(Map<String, dynamic> json) => QuestionItem(
        id: json["id"] ?? json["question_id"],
        userId: json["user_id"],
        name: json["name"] ??
            json["employee_name"] ??
            json["user_name"] ??
            json["first_name"] ??
            "",
        role: json["role"] ??
            json["department"] ??
            json["designation"] ??
            "",
        question: json["question"] ?? json["title"] ?? json["body"] ?? "",
        answer: json["answer"] ?? json["reply"] ?? json["response"],
        answeredBy: json["answered_by"] ?? json["answeredBy"],
        answeredAt: json["answered_at"] ?? json["answeredAt"],
        createdAt: json["created_at"] ?? json["date"] ?? json["time"] ?? "",
        updatedAt: json["updated_at"] ?? "",
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "name": name,
        "role": role,
        "question": question,
        "answer": answer,
        "answered_by": answeredBy,
        "answered_at": answeredAt,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "status": status,
      };
}
