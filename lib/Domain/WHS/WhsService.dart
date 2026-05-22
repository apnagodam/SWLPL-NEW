import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:emp_apnagodam/Data/Models/WhsTerminalModalIn.dart';
import 'package:emp_apnagodam/Data/Models/WhsterminalOutMoal.dart';
import 'package:emp_apnagodam/Domain/dio/DioProvider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'WhsService.g.dart';

@riverpod
Stream<WhsTerminalInModal> whsInTerminalData(
  WhsInTerminalDataRef ref,
) async* {
  var response = await ref.watch(dioProvider).get(
        ApiClient.getWhsInTerminal,
      );
  yield whsTerminalInModalFromJson(jsonEncode(response.data));
}

@riverpod
Future<Map<String, dynamic>> savewhsINData(SavewhsINDataRef ref,
    {String? getNo,
    String? lockMo,
    String? sealNo,
    File? image,
    String? shutterNo,
    String? remark}) async {
  FormData formData = FormData.fromMap({
    "gate_no": getNo,
    "lock_no": lockMo,
    "seal_no": sealNo,
    "remark": remark,
    "shutter_no": shutterNo,
    if (image != null)
      'image': await MultipartFile.fromFile(image.path,
          contentType: DioMediaType("image", "png"),
          filename: 'warehouse_in.png'),
  });
  var response = await ref
      .watch(dioProvider)
      .post(ApiClient.saveWhsInTerminalData, data: formData);
  ref.invalidate(whsInTerminalDataProvider);
  return response.data;
}

@riverpod
Stream<WhsTerminalOutModal> whsOutTerminalData(
  WhsOutTerminalDataRef ref,
) async* {
  var response = await ref.watch(dioProvider).get(
        ApiClient.getWhsOutTerminal,
      );
  yield whsTerminalOutModalFromJson(jsonEncode(response.data));
}

@riverpod
Future<Map<String, dynamic>> savewhsOutData(SavewhsOutDataRef ref,
    {String? getNo,
    String? lockMo,
    String? sealNo,
    File? image,
    String? shutterNo,
    String? remark}) async {
  FormData formData = FormData.fromMap({
    "gate_no": getNo,
    "lock_no": lockMo,
    "seal_no": sealNo,
    "remark": remark,
    "shutter_no": shutterNo,
    if (image != null)
      'image': await MultipartFile.fromFile(image.path,
          contentType: DioMediaType("image", "png"),
          filename: 'warehouse_in_out.png'),
  });
  var response = await ref
      .watch(dioProvider)
      .post(ApiClient.saveWhsOutTerminalData, data: formData);
  ref.invalidate(whsOutTerminalDataProvider);
  return response.data;
}
