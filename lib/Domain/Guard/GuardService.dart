import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:emp_apnagodam/Data/Models/GuardShutterAndLockListModel.dart';
import 'package:emp_apnagodam/Data/Models/GuardTerminalListModel.dart';
import 'package:emp_apnagodam/Domain/dio/DioProvider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'GuardService.g.dart';

@riverpod
Stream<GuardTerminalListModel> guardTerminals(Ref ref) async* {
  var response =
      await ref.watch(dioProvider).get(ApiClient.getGuardTerminalList);
  yield guardTerminalListModelFromJson(jsonEncode(response.data));
}

@riverpod
Stream<GuardShutterAndLockListModel> shutterAndLock(Ref ref,
    {required String terminalId}) async* {
  var response = await ref.watch(dioProvider).get(
      ApiClient.getShutterAndLockList,
      queryParameters: {'terminal_id': terminalId});

  yield guardShutterAndLockListModelFromJson(jsonEncode(response.data));
}

@riverpod
Stream<GuardShutterAndLockListModel> shutterAndLockOut(Ref ref,
    {required String terminalId}) async* {
  var response = await ref.watch(dioProvider).get(
      ApiClient.getShutterAndLockOutList,
      queryParameters: {'terminal_id': terminalId});

  yield guardShutterAndLockListModelFromJson(jsonEncode(response.data));
}

@riverpod
Future<Map<String, dynamic>> saveINData(Ref ref,
    {String? terminalId,
    String? gateNo,
    String? shutterNo,
    String? sealNo,
    File? image,
    String? remark}) async {
  FormData formData = FormData.fromMap({
    "terminal_id": terminalId,
    "gate_no": gateNo,
    "shutter_no": shutterNo,
    "seal_no": sealNo,
    if (image != null)
      'image': await MultipartFile.fromFile(image.path,
          contentType: DioMediaType("image", "png"),
          filename: 'seal_image.png'),
    "remark": remark
  });
  var response = await ref
      .watch(dioProvider)
      .post(ApiClient.saveGuardInData, data: formData);

  return response.data;
}

@riverpod
Future<Map<String, dynamic>> saveOUTData(Ref ref,
    {String? terminalId,
    String? gateNo,
    String? shutterNo,
    String? sealNo,
    File? image,
    String? remark}) async {
  FormData formData = FormData.fromMap({
    "terminal_id": terminalId,
    "gate_no": gateNo,
    "shutter_no": shutterNo,
    "seal_no": sealNo,
    if (image != null)
      'image': await MultipartFile.fromFile(image.path,
          contentType: DioMediaType("image", "png"),
          filename: 'seal_image.png'),
    "remark": remark
  });
  var response = await ref
      .watch(dioProvider)
      .post(ApiClient.saveGuardOutData, data: formData);

  return response.data;
}
