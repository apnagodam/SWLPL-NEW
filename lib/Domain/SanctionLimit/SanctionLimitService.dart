import 'dart:convert';
import 'package:emp_apnagodam/Data/Models/SancationLetterPDFModal.dart';
import 'package:emp_apnagodam/Data/Models/SanctionLimitModal.dart';
import 'package:emp_apnagodam/Data/Models/SmeTowPdfModal.dart';
import 'package:emp_apnagodam/Domain/dio/DioProvider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'SanctionLimitService.g.dart';

@riverpod
Stream<SanctionlimitModal> sanctionLimitList(SanctionLimitListRef ref) async* {
  var response =
      await ref.watch(dioProvider).get(ApiClient.getSanctionLimitList);
  yield sanctionlimitModalFromJson(jsonEncode(response.data));
}

@riverpod
Future<Map<String, dynamic>> sanctionLimitApprove(
  SanctionLimitApproveRef ref, {
  String? id,
  String? notes,
  String? amount,
}) async {
  var response = await ref.watch(dioProvider).get(
      ApiClient.getSanctionLimitApprove,
      queryParameters: {'id': id, 'remark': notes, 'amount': amount});

  return response.data;
}

@riverpod
Future<Map<String, dynamic>> sanctionLimitReject(
  SanctionLimitRejectRef ref, {
  String? id,
  String? notes,
  String? amount,
}) async {
  var response = await ref
      .watch(dioProvider)
      .get(ApiClient.getSanctionLimitReject, queryParameters: {
    'id': id,
    'remark': notes,
  });

  return response.data;
}

@riverpod
Future<SancationLetterPdfModal> sancationLetterPdf(SancationLetterPdfRef ref,
    {required String id}) async {
  var response = await ref
      .watch(dioProvider)
      .get(ApiClient.getSanctionLetterPdf, queryParameters: {"id": id});

  return sancationLetterPdfModalFromJson(jsonEncode(response.data));
}

@riverpod
Future<SmeTowPdfModal> smetowPdf(SmetowPdfRef ref, {required String id}) async {
  var response = await ref
      .watch(dioProvider)
      .get(ApiClient.getSmeTowPdf, queryParameters: {"id": id});

  return smeTowPdfModalFromJson(jsonEncode(response.data));
}

@riverpod
Future<Map<String, dynamic>> sanctionLimitDocumentUpdate(
    SanctionLimitDocumentUpdateRef ref,
    {String? id,
    String? sabctionLetter,
    String? pda,
    String? pdc,
    String? agreement}) async {
  var response = await ref
      .watch(dioProvider)
      .post(ApiClient.sanctionLimitDocumentUpdate, queryParameters: {
    "sanction_latter": "1",
    "pda": "1",
    "pdc": "1",
    "agreement": "1",
    "id": id,
  });

  return response.data;
}
