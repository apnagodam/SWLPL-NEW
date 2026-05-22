import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:emp_apnagodam/Data/Models/SprayCleaningModal.dart';
import 'package:emp_apnagodam/Domain/dio/DioProvider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'SprayService.g.dart';

@riverpod
Future<Map<String, dynamic>> updateSpray(
  Ref ref, {
  String? terminal,
  String? chemical,
  String? dose,
  File? image,
  String? date,
  String? remark,
}) async {
  FormData formData = FormData.fromMap({
    "terminal_id": terminal,
    "chemical": chemical,
    "dose": dose,
    "remark": remark,
    "date": date,
    if (image != null)
      'image': await MultipartFile.fromFile(image.path,
          contentType: DioMediaType("image", "png"),
          filename: 'warehouse_in_out.png'),
  });
  var response =
      await ref.watch(dioProvider).post(ApiClient.addSpray, data: formData);
  ref.invalidate(sprayListProvider);

  return response.data;
}

@riverpod
Stream<SprayCleaningModal> sprayList(Ref ref) async* {
  var response = await ref.watch(dioProvider).get(ApiClient.getSpray);
  yield sprayCleaningModalFromJson(jsonEncode(response.data));
}
