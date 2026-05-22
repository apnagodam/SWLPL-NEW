import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:emp_apnagodam/Data/Models/CHRCleaningModal.dart';
import 'package:emp_apnagodam/Data/Models/CHRQualityPerametarModal.dart';
import 'package:emp_apnagodam/Data/Models/SprayTerminalListModal.dart';
import 'package:emp_apnagodam/Data/Models/StackNumberListModal.dart';
import 'package:emp_apnagodam/Data/Models/StackWiseCommdityModal.dart';
import 'package:emp_apnagodam/Domain/dio/DioProvider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ChrService.g.dart';

@riverpod
Future<Map<String, dynamic>> updateChr(
  Ref ref, {
  String? terminalid,
  String? commodity,
  String? stackno,
  String? remark,
  List<Map<String,dynamic>>? parameter,
  String? live,
  File? image,
}) async {
  FormData formData = FormData.fromMap({
    "terminal_id": terminalid,
    "stack_no": stackno,
    "commodity": commodity,
    "live": live,
    "remark": remark,
    "parameter": parameter,
    if (image != null)
      'image': await MultipartFile.fromFile(image.path,
          contentType: DioMediaType("image", "png"),
          filename: 'warehouse_in_out.png'),
  });
  var response =
      await ref.watch(dioProvider).post(ApiClient.addChr, data: formData);
  ref.invalidate(chrListProvider);

  return response.data;
}

@riverpod
Stream<ChrCleaningModal> chrList(Ref ref) async* {
  var response = await ref.watch(dioProvider).get(ApiClient.getCHR);
  yield chrCleaningModalFromJson(jsonEncode(response.data));
}

@riverpod
Future<ChrQualityPerameterModal> chrQualityPerameter(Ref ref,
    {required String chrid}) async {
  var response = await ref.watch(dioProvider).get(
      ApiClient.getChrQualityPerameter,
      queryParameters: {"chr_id": chrid});

  return chrQualityPerameterModalFromJson(jsonEncode(response.data));
}

@riverpod
Stream<AllterminalList> allTerminalList(AllTerminalListRef ref) async* {
  var response = await ref.watch(dioProvider).get(ApiClient.getAllTerminalList);
  yield allterminalListFromJson(jsonEncode(response.data));
}

@riverpod
Stream<StackNumberListModal> allStackList(AllStackListRef ref,
    {required String id}) async* {
  var response = await ref
      .watch(dioProvider)
      .get(ApiClient.getStackList, queryParameters: {"terminal_id": id});
  yield stackNumberListModalFromJson(jsonEncode(response.data));
}

@riverpod
Stream<StackWiseCommdityModal> stackWiseCommdity(StackWiseCommdityRef ref,
    {required String id, required String stackNo}) async* {
  var response = await ref.watch(dioProvider).get(
      ApiClient.getStackWiseCommdity,
      queryParameters: {"terminal_id": id, "stack_no": stackNo});
  yield stackWiseCommdityModalFromJson(jsonEncode(response.data));
}
