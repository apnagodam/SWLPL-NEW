// ignore_for_file: deprecated_member_use_from_same_package

import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:emp_apnagodam/Data/Models/BaseResponse.dart';
import 'package:emp_apnagodam/Data/Models/CaseRequestModel.dart';
import 'package:emp_apnagodam/Data/Models/DefaultListModel.dart';
import 'package:emp_apnagodam/Data/Models/GatepassModel.dart';
import 'package:emp_apnagodam/Data/Models/GenerateCaseIdCommodityModel.dart';
import 'package:emp_apnagodam/Data/Models/GenerateCaseIdContractorModel.dart';
import 'package:emp_apnagodam/Data/Models/GenerateCaseIdContractorRateModel.dart';
import 'package:emp_apnagodam/Data/Models/GenerateCaseIdDriverListModel.dart';
import 'package:emp_apnagodam/Data/Models/GenerateCaseIdFirstQualityModel.dart';
import 'package:emp_apnagodam/Data/Models/GenerateCaseIdStackModel.dart';
import 'package:emp_apnagodam/Data/Models/GenerateCaseIdTripIdModel.dart';
import 'package:emp_apnagodam/Data/Models/GenerateCaseIdUserModel.dart';
import 'package:emp_apnagodam/Domain/dio/DioProvider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../Data/Models/CaseIdResponseModel.dart';
import '../../Data/Models/DriverOtpModel.dart';

part 'CaseIdService.g.dart';

@riverpod
Stream<CaseIdResponseModel> caseId(CaseIdRef ref) async* {
  var response = await ref.watch(dioProvider).get(ApiClient.getCaseIds);
  yield caseIdResponseModelFromMap(jsonEncode(response.data));
}

@riverpod
Stream<CaseRequestModel> caseRequests(CaseRequestsRef ref) async* {
  var response = await ref.watch(dioProvider).post(ApiClient.caseRequests);
  yield caseRequestModelFromMap(jsonEncode(response.data));
}

@riverpod
Stream<DefaultListModel> defaultList(DefaultListRef ref) async* {
  var response = await ref.watch(dioProvider).get(ApiClient.getAllData);
  yield defaultListModelFromMap(jsonEncode(response.data));
}

@riverpod
Future<DriverOtpModel> verifyDriverOtp(VerifyDriverOtpRef ref,
    {String? phone = "",
    String? stackId = "",
    String? type = "",
    String? otp = ""}) async {
  var response = await ref.watch(dioProvider).post(ApiClient.verifyDriverOtp,
      queryParameters: {
        "phone": phone,
        'stack_id': stackId,
        'type': type,
        'otp': otp
      });
  return driverOtpModelFromMap(jsonEncode(response.data));
}

@riverpod
Future<BaseResponse> cancelCaseId(
  CancelCaseIdRef ref, {
  String? caseId,
  String? notes,
}) async {
  var response = await ref.watch(dioProvider).post(ApiClient.cancelCaseId,
      queryParameters: {'case_id': caseId, 'notes': notes});
  return baseResponseFromMap(jsonEncode(response.data));
}

@riverpod
Future<Map<String, dynamic>> createCaseId(CreateCaseIdRef ref,
    {String? terminalId = "",
    String? inOut = "",
    String? userId = "",
    String? commodityId = "",
    String? stackId = "",
    String? weight = "",
    String? quantitiy = "",
    String? vehicleNo = '',
    String? spotToken = "",
    String? driverNumber = "",
    String? contractorId,
    String? contractorName,
    String? contractorPhone,
    String? labourRate}) async {
  var response = await ref
      .watch(dioProvider)
      .post(ApiClient.createCaseIdV1, queryParameters: {
    "terminal_id": terminalId,
    "in_out": inOut,
    "customer_uid": userId,
    "commodity_id": commodityId,
    "stack_id": stackId,
    "weight": weight,
    "quantity": quantitiy,
    "vehicle_no": vehicleNo,
    "spot_token": spotToken,
    "driver_number": driverNumber,
    'contractor_id': contractorId,
    'labour_contractor': contractorName,
    'contractor_no': contractorPhone,
    'labour_rate_per_bags': labourRate,
  });
  return response.data;
}

@riverpod
Future<Map<String, dynamic>> byePassFq(ByePassFqRef ref,
    {String? caseId}) async {
  var response = await ref
      .watch(dioProvider)
      .post(ApiClient.byePassFq, queryParameters: {'case_id': caseId});
  return response.data;
}

@riverpod
Future<Map<String, dynamic>> updateCCTVReport(UpdateCCTVReportRef ref,
    {String? caseId,
    String? notes,
    String? cctvImage1,
    String? cctvImage2}) async {
  var response = await ref.watch(dioProvider).post(ApiClient.updateCCTV, data: {
    "case_id": caseId,
    "notes": notes,
    "cctv_img_1": cctvImage1,
    "cctv_img_2": cctvImage2
  });
  ref.invalidate(caseIdProvider);
  ref.invalidate(caseRequestsProvider);
  return response.extra;
}

@riverpod
Future<Map<String, dynamic>> updateCCTVReportV1(UpdateCCTVReportV1Ref ref,
    {String? caseId, String? notes, File? cctvImage1, File? cctvImage2}) async {
  FormData formData = new FormData.fromMap({
    "case_id": caseId,
    "notes": notes,
    if (cctvImage1 != null)
      'cctv_img_1': await MultipartFile.fromFile(
        cctvImage1.path,
        filename: 'cctvImage1.png',
        contentType: DioMediaType("image", "png"),
      ),
    if (cctvImage2 != null)
      'cctv_img_2': await MultipartFile.fromFile(cctvImage2.path,
          contentType: DioMediaType("image", "png"),
          filename: 'cctvImage2.png'),
  });
  var response =
      await ref.watch(dioProvider).post(ApiClient.updateCCTVV1, data: formData);
  ref.invalidate(caseIdProvider);
  ref.invalidate(caseRequestsProvider);
  return response.extra;
}

@riverpod
Stream<GatepassModel> gatepassData(GatepassDataRef ref,
    {required String caseId}) async* {
  var response = await ref
      .watch(dioProvider)
      .post(ApiClient.getGatepass, queryParameters: {'case_id': caseId});
  yield gatepassModelFromJson(jsonEncode(response.data));
}

@riverpod
Future<Map<String, dynamic>> submitGatepassReport(SubmitGatepassReportRef ref,
    {required Map<String, dynamic> data}) async {
  var response = await ref
      .watch(dioProvider)
      .post(ApiClient.submitGatepass, queryParameters: data);
  return response.data;
}

@riverpod
Future<Map<String, dynamic>> ivrReport(IvrReportRef ref,
    {String? notes,
    String? ivrWeight,
    String? ivrBags,
    String? files,
    String? caseId}) async {
//        ivr_file, notes, s_k_weight, s_k_bags
  ref.invalidate(caseIdProvider);
  ref.invalidate(caseRequestsProvider);
  var response = await ref.watch(dioProvider).post(ApiClient.submitIvr, data: {
    "ivr_file": files,
    'notes': notes,
    "s_k_weight": ivrWeight,
    "s_k_bags": ivrBags,
    "case_id": caseId
  });
  return response.data;
}

@riverpod
Future<Map<String, dynamic>> ivrReportV1(IvrReportV1Ref ref,
    {String? notes,
    String? ivrWeight,
    String? ivrBags,
    File? files,
    String? caseId}) async {
//        ivr_file, notes, s_k_weight, s_k_bags
  ref.invalidate(caseIdProvider);
  ref.invalidate(caseRequestsProvider);
  FormData formData = new FormData.fromMap({
    'notes': notes,
    "s_k_weight": ivrWeight,
    "s_k_bags": ivrBags,
    "case_id": caseId,
    if (files != null)
      'ivr_file': await MultipartFile.fromFile(
        files.path,
        filename: 'ivr_file.png',
        contentType: DioMediaType("image", "png"),
      ),
  });
  var response =
      await ref.watch(dioProvider).post(ApiClient.submitIvrV1, data: formData);
  return response.data;
}

@riverpod
Stream<GenerateCaseIdUserModel> getGeneratedCaseIdUserList(Ref ref) async* {
  var response =
      await ref.watch(dioProvider).post(ApiClient.getCaseGenerationUserList);
  yield generateCaseIdUserModelFromJson(jsonEncode(response.data));
}

@riverpod
Stream<GenerateCaseIdCommodityModel> getGeneratedCaseIdCommodityList(Ref ref,
    {String? userId}) async* {
  var response = await ref.watch(dioProvider).post(
      ApiClient.getCaseGenerationCommodityList,
      queryParameters: {"user_id": userId});
  yield generateCaseIdCommodityModelFromJson(jsonEncode(response.data));
}

@riverpod
Stream<GenerateCaseIdStackModel> getGeneratedCaseIdStackList(Ref ref,
    {String? userId, String? commodityId}) async* {
  var response = await ref.watch(dioProvider).post(
      ApiClient.getCaseGenerationStackList,
      queryParameters: {"user_id": userId, "commodity_id": commodityId});
  yield generateCaseIdStackModelFromJson(jsonEncode(response.data));
}

@riverpod
Stream<GenerateCaseIdContractorModel> getGeneratedCaseIdContractorList(
  Ref ref,
) async* {
  var response = await ref.watch(dioProvider).post(
        ApiClient.getCaseGenerationContractorList,
      );
  yield generateCaseIdContractorModelFromJson(jsonEncode(response.data));
}

@riverpod
Stream<GenerateCaseIdContractorRateModel> getGeneratedCaseIdContractorRateList(
    Ref ref,
    {String? commodityId,
    String? contractorId}) async* {
  var response = await ref
      .watch(dioProvider)
      .post(ApiClient.getCaseGenerationContractorRateList, queryParameters: {
    'commodity_id': commodityId,
    'contractor_id': contractorId
  });
  yield generateCaseIdContractorRateModelFromJson(jsonEncode(response.data));
}

@riverpod
Stream<GenerateCaseIdTripIdModel> tripId(Ref ref,
    {required String userId, required String commodityId}) async* {
  var response = await ref.watch(dioProvider).post(
      ApiClient.getCaseGenerationTripId,
      queryParameters: {'user_id': userId, "commodity_id": commodityId});
  yield generateCaseIdTripIdModelFromJson(jsonEncode(response.data));
}

@riverpod
Stream<GenerateCaseIdDriverListModel> tripIdDriverDetails(Ref ref,
    {required String tripId}) async* {
  var response = await ref.watch(dioProvider).post(
      ApiClient.getCaseGenerationDriverList,
      queryParameters: {'trip_id': tripId});
  yield generateCaseIdDriverListModelFromJson(jsonEncode(response.data));
}

@riverpod
Future<Map<String, dynamic>> generateCaseId(Ref ref,
    {required Map<String, dynamic> params}) async {
  var response = await ref
      .watch(dioProvider)
      .post(ApiClient.generateCaseId, queryParameters: params);
  ref.invalidate(caseIdProvider);
  return response.data;
}

@riverpod
Stream<GenerateCaseIdFirstQualityModel> fetchFirstQualityData(Ref ref,
    {required String caseId}) async* {
  var response = await ref.watch(dioProvider).post(
      ApiClient.fetchFirstQualityData,
      queryParameters: {'case_id': caseId});
  yield generateCaseIdFirstQualityModelFromJson(jsonEncode(response.data));
}

@riverpod
Future<Map<String, dynamic>> postCancelCaseIdRequest(Ref ref,
    {String? caseId}) async {
  var response = await ref.watch(dioProvider).post(
      ApiClient.approveCancelCaseId,
      queryParameters: {'case_id': caseId});
  return response.data;
}
