// ignore_for_file: deprecated_member_use_from_same_package

import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:emp_apnagodam/Data/Models/QualityUploadModel.dart';
import 'package:emp_apnagodam/Domain/dio/DioProvider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../Data/Models/FQualityListModel.dart';
import '../../Data/Models/QualityParametersModel.dart';

part 'FirstQualityReportService.g.dart';

@riverpod
Future<QualityParametersModel> commodityParams(CommodityParamsRef ref,
    {String? caseId}) async {
  var response = await ref
      .watch(dioProvider)
      .post(ApiClient.getCommodityParams, queryParameters: {'case_id': caseId});
  return qualityParametersModelFromMap(jsonEncode(response.data));
}

@riverpod
Future<Map<String, dynamic>> uploadFirstQualityReport(
    UploadFirstQualityReportRef ref,
    {required QualityUploadModel data}) async {
  var response = await ref.watch(dioProvider).post(
      ApiClient.uploadFirstQualityReport,
      data: qualityUploadModelToMap(data));
  return response.data;
}

@riverpod
Future<Map<String, dynamic>> uploadFirstQualityReportV1(
    UploadFirstQualityReportV1Ref ref,
    {required String caseId,
    required String packagingType,
    required String infested,
    required String liveInsects,
    required String notes,
    required String inOut,
    required List<Map<String, dynamic>> commodityList,
    File? image}) async {
  FormData formData = FormData.fromMap({
    "case_id": caseId,
    "packaging_type": packagingType,
    "infested": infested,
    "live_insects": liveInsects,
    "notes": notes,
    "in_out": inOut,
    "commodityList": commodityList,
    if (image != null)
      'report_file': await MultipartFile.fromFile(image.path,
          contentType: DioMediaType("image", "png"),
          filename: 'warehouse_in.png'),
  });
  var response = await ref
      .watch(dioProvider)
      .post(ApiClient.uploadFirstQualityReportV1, data: formData);
  return response.data;
}

@riverpod
Stream<FQualityListModel> firstQualityList(FirstQualityListRef ref) async* {
  var response = await ref.watch(dioProvider).get(ApiClient.fQualityList);
  yield fQualityListModelFromMap(jsonEncode(response.data));
}
