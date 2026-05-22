import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:emp_apnagodam/Data/Models/FumigationAgenceyModal.dart';
import 'package:emp_apnagodam/Data/Models/FumigationCleaningModal.dart';
import 'package:emp_apnagodam/Domain/dio/DioProvider.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
    part 'FumigationService.g.dart';

@riverpod
Future<Map<String, dynamic>> fumigationUpdate(
  FumigationUpdateRef ref, {
  String? terminalid,
  String? commodity,
  String? stackno,
  File? image,
  String? remark,
  String? fumiagency,
  String? dose,
  String? date,
}) async {
  FormData formData = FormData.fromMap({
    "terminal_id": terminalid,
    "commodity": commodity,
    "stack_no": stackno,
    "remark": remark,
    "fumi_agency": fumiagency,
    "dose": dose,
    "from_date": date,
    if (image != null)
      'image': await MultipartFile.fromFile(image.path,
          contentType: DioMediaType("image", "png"),
          filename: 'warehouse_in_out.png'),
  });
  var response = await ref
      .watch(dioProvider)
      .post(ApiClient.addFumigation, data: formData);
  ref.invalidate(fumigationListProvider);

  return response.data;
}

@riverpod
Future<Map<String, dynamic>> updateDegas(Ref ref, {String? id}) async {
  FormData formData = FormData.fromMap({
    "id": id,
  });
  var response =
      await ref.watch(dioProvider).post(ApiClient.updateDegas, data: formData);
  ref.invalidate(fumigationListProvider);
  return response.data;
}
@riverpod
Stream<FumigationListModel> fumigationList(
    Ref ref) async* {
  var response = await ref.watch(dioProvider).get(ApiClient.getfumigationList);
  yield fumigationListModelFromJson(jsonEncode(response.data));
}

@riverpod
Stream<FumigationAgencyModal> fumigationAgency(
  FumigationAgencyRef ref,
) async* {
  var response = await ref.watch(dioProvider).get(
        ApiClient.getFumigatiomAgency,
      );
  yield fumigationAgencyModalFromJson(jsonEncode(response.data));
}

