import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:emp_apnagodam/Data/Models/CleaningModal.dart';
import 'package:emp_apnagodam/Domain/dio/DioProvider.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'CleaningService.g.dart';

@riverpod
Stream<CleaningModal> cleaningList(Ref ref) async* {
  var response = await ref.watch(dioProvider).get(ApiClient.getCleaning);
  yield cleaningModalFromJson(jsonEncode(response.data));
}

@riverpod
Future<Map<String, dynamic>> updateCleaning(
  Ref ref, {
  String? terminal,
  String? date,
  File? image,
  String? remark,
}) async {
  FormData formData = FormData.fromMap({
    "terminal_id": terminal,
    "date": date,
    "remark": remark,
    if (image != null)
      'image': await MultipartFile.fromFile(image.path,
          contentType: DioMediaType("image", "png"),
          filename: 'warehouse_in_out.png'),
  });
  var response =
      await ref.watch(dioProvider).post(ApiClient.addCleaning, data: formData);
  ref.invalidate(cleaningListProvider);

  return response.data;
}
