// ignore_for_file: deprecated_member_use_from_same_package

import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:emp_apnagodam/Data/Models/AttendanceStatusModel.dart';
import 'package:emp_apnagodam/Data/Models/CheckForLateResponse.dart';
import 'package:emp_apnagodam/Data/Models/HolidaysModel.dart';
import 'package:emp_apnagodam/Domain/dio/DioProvider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../Data/Models/AttendenceRequestsInModel.dart';
import '../../Data/Models/AttendenceRequestsOutModel.dart';

part 'AttendanceService.g.dart';

@riverpod
Future<AttendanceStatusModel> attendanceStatus(AttendanceStatusRef ref) async {
  
  var response = await ref.watch(dioProvider).post(ApiClient.attendanceStatus);
  print(response);
  return attendanceStatusModelFromMap(jsonEncode(response.data));
}

@riverpod
Stream<HolidaysModel> listOfHolidays(ListOfHolidaysRef ref) async* {
  var response = await ref.watch(dioProvider).get(ApiClient.getListOfHolidays);
  yield holidaysModelFromJson(jsonEncode(response.data));
}

@riverpod
Stream<HolidaysModel> listOfCleaning(ListOfHolidaysRef ref) async* {
  var response = await ref.watch(dioProvider).get(ApiClient.getListOfHolidays);
  yield holidaysModelFromJson(jsonEncode(response.data));
}

@riverpod
Stream<AttendenceRequestsInModel> attendanceRequestsIn(
    AttendanceRequestsInRef ref) async* {
  var response =
      await ref.watch(dioProvider).get(ApiClient.getAttendenceInRequests);
  yield attendenceRequestsInModelFromJson(jsonEncode(response.data));
}

@riverpod
Stream<AttendenceRequestsOutModel> attendanceRequestsOut(
    AttendanceRequestsOutRef ref) async* {
  var response =
      await ref.watch(dioProvider).get(ApiClient.getAttendenceOutRequests);
  yield attendenceRequestsOutModelFromJson(jsonEncode(response.data));
}

@riverpod
Future<Map<String, dynamic>> approveRejectRequests(ApproveRejectRequestsRef ref,
    {String? id, String? notes, String? type, String? status}) async {
  var response = await ref
      .watch(dioProvider)
      .post(ApiClient.approveRejectRequest, queryParameters: {
    "id": id,
    "notes": notes,
    "type": type,
    "status": status
  });
  return response.data;
}

@riverpod
Future<Map<String, dynamic>> postAttendance(PostAttendanceRef ref,
    {String? clockStatus,
    String? image,
    String? long,
    String? lat,
    String? distance,
    String? userPurpose}) async {
  var response =
      await ref.watch(dioProvider).post(ApiClient.postAttendance, data: {
    "clock_status": clockStatus,
    'distance': distance,
    'image': image,
    'long': long,
    'lat': lat,
  });
  return response.data;
}

@riverpod
Future<Map<String, dynamic>> postAttendanceV2(
  Ref ref, {
  String? clockStatus,
  String? long,
  String? lat,
  String? distance,
  String? userPurpose,
  File? image,
}) async {
FormData formData = new FormData.fromMap({
  "clock_status": clockStatus,
  'distance': distance,
  'long': long,
  'lat': lat,
  'user_purpose': userPurpose,
    if (image != null)
      'image': await MultipartFile.fromFile(
        image.path,
        filename: 'image',
        contentType: DioMediaType("image", "jpeg"),
      ),
  });
  var response = await ref
      .watch(dioProvider)
      .post(ApiClient.postAttendanceV2, data: formData);
  return response.data;
}

@riverpod
Future<CheckForLateResponse> checkForLate(CheckForLateRef ref) async {
  var response = await ref.watch(dioProvider).get(ApiClient.lateReason);
  return checkForLateResponseFromMap(jsonEncode(response.data));
}

class ShiftAttendanceStatus {
  final bool requiresReason;
  final bool isCheckIn;
  final bool isEarly;
  final bool isLate;
  final String label;

  ShiftAttendanceStatus({
    required this.requiresReason,
    required this.isCheckIn,
    required this.isEarly,
    required this.isLate,
    required this.label,
  });
}

DateTime? parseShiftTimeToToday(dynamic shiftTimeString, DateTime now) {
  if (shiftTimeString == null || shiftTimeString.toString().trim().isEmpty) {
    return null;
  }
  try {
    String raw = shiftTimeString.toString().trim();
    if (raw.contains('-') && raw.contains(':')) {
      final parsedDate = DateTime.tryParse(raw);
      if (parsedDate != null) {
        return DateTime(
          now.year,
          now.month,
          now.day,
          parsedDate.hour,
          parsedDate.minute,
          parsedDate.second,
        );
      }
    }

    String timeStr = raw.toUpperCase();
    int hour = 0;
    int minute = 0;
    int second = 0;

    bool hasPM = timeStr.contains('PM');
    bool hasAM = timeStr.contains('AM');

    String cleaned = timeStr.replaceAll('AM', '').replaceAll('PM', '').trim();
    List<String> parts = cleaned.split(':');

    if (parts.isNotEmpty) {
      hour = int.parse(parts[0].trim());
    }
    if (parts.length > 1) {
      minute = int.parse(parts[1].trim());
    }
    if (parts.length > 2) {
      second = int.tryParse(parts[2].trim()) ?? 0;
    }

    if (hasPM && hour < 12) {
      hour += 12;
    } else if (hasAM && hour == 12) {
      hour = 0;
    }

    return DateTime(now.year, now.month, now.day, hour, minute, second);
  } catch (e) {
    return null;
  }
}

ShiftAttendanceStatus getShiftAttendanceStatus(
  dynamic shiftTimeString, {
  bool isCheckIn = true,
}) {
  if (shiftTimeString == null || shiftTimeString.toString().trim().isEmpty) {
    return ShiftAttendanceStatus(
      requiresReason: false,
      isCheckIn: isCheckIn,
      isEarly: false,
      isLate: false,
      label: "",
    );
  }

  try {
    final now = DateTime.now();
    String raw = shiftTimeString.toString().trim();
    DateTime? shiftDateTime = parseShiftTimeToToday(raw, now);

    if (shiftDateTime == null) {
      return ShiftAttendanceStatus(
        requiresReason: false,
        isCheckIn: isCheckIn,
        isEarly: false,
        isLate: false,
        label: "",
      );
    }

    if (isCheckIn) {
      // Check-in (Clock In):
      // If now is after shift_start -> Late Check-in (Reason required)
      if (now.isAfter(shiftDateTime)) {
        return ShiftAttendanceStatus(
          requiresReason: true,
          isCheckIn: true,
          isEarly: false,
          isLate: true,
          label: "Shift Start: $raw (Late Check-in)",
        );
      }
      return ShiftAttendanceStatus(
        requiresReason: false,
        isCheckIn: true,
        isEarly: false,
        isLate: false,
        label: "On Time",
      );
    } else {
      // Check-out (Clock Out):
      // If now is before shift_end -> Early Checkout (Reason required)
      if (now.isBefore(shiftDateTime)) {
        return ShiftAttendanceStatus(
          requiresReason: true,
          isCheckIn: false,
          isEarly: true,
          isLate: false,
          label: "Shift End: $raw (Early Checkout)",
        );
      }
      // If now is after shift_end (over 15 min buffer) -> Late Checkout (Reason required)
      if (now.isAfter(shiftDateTime.add(const Duration(minutes: 15)))) {
        return ShiftAttendanceStatus(
          requiresReason: true,
          isCheckIn: false,
          isEarly: false,
          isLate: true,
          label: "Shift End: $raw (Late Checkout)",
        );
      }
      return ShiftAttendanceStatus(
        requiresReason: false,
        isCheckIn: false,
        isEarly: false,
        isLate: false,
        label: "On Time",
      );
    }
  } catch (e) {
    return ShiftAttendanceStatus(
      requiresReason: false,
      isCheckIn: isCheckIn,
      isEarly: false,
      isLate: false,
      label: "",
    );
  }
}

/// Checks whether the current time requires a reason (late check-in or early/late check-out)
bool isAttendanceTimeLate(dynamic shiftTimeString, {bool isCheckIn = true}) {
  return getShiftAttendanceStatus(shiftTimeString, isCheckIn: isCheckIn).requiresReason;
}
