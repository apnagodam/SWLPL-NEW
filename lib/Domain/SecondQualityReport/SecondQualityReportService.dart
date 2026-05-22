// ignore_for_file: deprecated_member_use_from_same_package

import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:emp_apnagodam/Domain/dio/DioProvider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../Data/Models/SQualityListingModel.dart' as sQuality;
import '../../Data/Models/SecondQualityUploadModel.dart';

part 'SecondQualityReportService.g.dart';

@riverpod
Future<Map<String, dynamic>> uploadSecondQualityReport(
    UploadSecondQualityReportRef ref,
    {Secondqualityuploadmodel? data}) async {
  // var formData = FormData.fromMap({
  //   'case_id': caseId,
  //   'report_file': reportFile,
  //   "[commodityList][]": commodityList,
  //   'packaging_type': packagingType,
  //   'infested': infested,
  //   'live_insects': liveInsects,
  //   'notes': notes,
  //   'commodity_img': commodityImage,
  //   'extra_claim': extraClaim,
  //   'send_to_lab': sendToLab,
  //   'send_to_report_file': sendToLabFile,
  //   'in_out': inOut
  // });
  var response = await ref.watch(dioProvider).post(
      ApiClient.uploadSecondQuality,
      data: secondQualityUploadModelToMap(data!));
  return response.data;
}

@riverpod
Future<Map<String, dynamic>> uploadSecondQualityReportV1(
    UploadSecondQualityReportV1Ref ref,
    {String? caseId,
    File? reportFile,
    String? packagingType,
    String? infested,
    String? liveInsects,
    String? notes,
    String? inOut,
    String? extraClaim,

    // ADD THESE
    String? aQuality,
    String? bQuality,
    String? cQuality,
    String? cutBags,

    String? sendToLab,
    File? sendToReportFile,
    List<Map<String, dynamic>>? commodityList}) async {
var formData = FormData.fromMap({
  "case_id": caseId,
  "infested": infested,
  "live_insects": liveInsects,
  "notes": notes,
  "in_out": inOut,
  "extra_claim": extraClaim,

  // ADD THESE
  "a_quality": aQuality,
  "b_quality": bQuality,
  "c_quality": cQuality,
  "cut_bags": cutBags,

  "send_to_lab": sendToLab,
    if (reportFile != null)
      'report_file': await MultipartFile.fromFile(reportFile.path,
          contentType: DioMediaType("image", "png"),
          filename: 'report_file.png'),
    if (sendToReportFile != null)
      'send_to_report_file': await MultipartFile.fromFile(
          sendToReportFile.path,
          contentType: DioMediaType("image", "png"),
          filename: 'send_to_report_file.png'),
    "commodityList": commodityList
  });

  // formData.fields
  //     .forEach((element) => print('${element.key}:${element.value}'));
  // return {};
  var response = await ref
      .watch(dioProvider)
      .post(ApiClient.uploadSecondQualityV1, data: formData);
  return response.data;
}

@riverpod
Stream<sQuality.SQualityListingModel> sQualityList(SQualityListRef ref,
    {String? inOut}) async* {
  var response = await ref.watch(dioProvider).get(ApiClient.secondQualityList,
      queryParameters: {
        'limit': 10,
        'page': '1',
        'in_out': inOut,
        'search': ''
      });
  yield sQuality.sQualityListingModelFromMap(jsonEncode(response.data));
}
