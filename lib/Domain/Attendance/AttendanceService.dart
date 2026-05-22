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
