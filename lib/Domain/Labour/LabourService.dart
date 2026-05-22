// ignore_for_file: deprecated_member_use_from_same_package

import 'dart:convert';

import 'package:emp_apnagodam/Data/Models/LabourBookListModel.dart';
import 'package:emp_apnagodam/Data/Models/LabourContractorRateModel.dart';
import 'package:emp_apnagodam/Data/Models/LabourContractorV1Model.dart';
import 'package:emp_apnagodam/Domain/dio/DioProvider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../Data/Models/LabourContractorModel.dart';

part 'LabourService.g.dart';

@riverpod
Future<LabourContractorModel> labourContractor(LabourContractorRef ref,
    {String? terminalId, String? commodityId}) async {
  var response = await ref.watch(dioProvider).get(ApiClient.getLabourContractor,
      queryParameters: {
        "warehouse_id": terminalId,
        'commodity_id': commodityId
      });
  return labourContractorModelFromMap(jsonEncode(response.data));
}

@riverpod
Future<LabourContractorV1Model> labourContractorV1(LabourContractorV1Ref ref,
    {String? terminalId, String? commodityId}) async {
  var response = await ref
      .watch(dioProvider)
      .get(ApiClient.getLabourContractorV1, queryParameters: {
    "warehouse_id": terminalId,
    'commodity_id': commodityId
  });
  return labourContractorV1ModelFromJson(jsonEncode(response.data));
}

@riverpod
Future<LabourContractorRateModel> labourContractorRate(
    LabourContractorRateRef ref,
    {String? contractorId,
    String? commodityId}) async {
  var response = await ref
      .watch(dioProvider)
      .get(ApiClient.getLabourContractorRate, queryParameters: {
    "contractor_id": contractorId,
    "commodity_id": commodityId
  });
  return labourContractorRateModelFromJson(jsonEncode(response.data));
}

@riverpod
Stream<LabourBookListModel> labourList(LabourListRef ref,
    {String? inOut}) async* {
  var response = await ref.watch(dioProvider).get(ApiClient.labourList,
      queryParameters: {
        'limit': 10,
        'page': '1',
        'in_out': inOut,
        'search': ''
      });
  yield labourBookListModelFromMap(jsonEncode(response.data));
}

@riverpod
Future<Map<String, dynamic>> uploadLabour(UploadLabourRef ref,
    {String? caseId = '',
    String? contractorId = '',
    String? contractorName = '',
    String? contractorPhone = '',
    String? labourRate = '',
    String? notes = ''}) async {
  var response = await ref
      .watch(dioProvider)
      .post(ApiClient.uploadLabour, queryParameters: {
    "case_id": caseId,
    'contractor_id': contractorId,
    'labour_contractor': contractorName,
    'contractor_no': contractorPhone,
    'labour_rate_per_bags': labourRate,
    'notes': notes
  });
  return response.data;
}
