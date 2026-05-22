// ignore_for_file: deprecated_member_use_from_same_package

import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:emp_apnagodam/Data/Models/BaseResponse.dart';
import 'package:emp_apnagodam/Data/Models/DharamKantaModel.dart';
import 'package:emp_apnagodam/Data/Models/SecondKantaparchiListModel.dart';
import 'package:emp_apnagodam/Domain/dio/DioProvider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'SecondKantaParchiService.g.dart';

@riverpod
Future<DharamKantaModel> dharamKantaDetails(DharamKantaDetailsRef ref,
    {String? caseId, String? warehouseId}) async {
  var response = await ref.watch(dioProvider).post(
      ApiClient.getDharamKantaByCaseId,
      queryParameters: {"case_id": caseId, "warehouse_id": warehouseId});
  return dharamKantaModelFromMap(jsonEncode(response.data));
}

@riverpod
Stream<SecondKantaparchiListModel> secondKantaparchiList(
    SecondKantaparchiListRef ref,
    {String? inOut}) async* {
  var response = await ref
      .watch(dioProvider)
      .get(ApiClient.secondKantaparchiList, queryParameters: {
    'limit': 10,
    'page': '1',
    'in_out': inOut,
    'search': ''
  });
  yield secondKantaparchiListModelFromMap(jsonEncode(response.data));
}

@riverpod
Future<BaseResponse> uploadSecondKantaParchiV1(UploadSecondKantaParchiV1Ref ref,
    {String? caseId,
    String? notes,
    File? kantaParchiFile,
    File? truckFile,
    String? noOfBags,
    String? weight,
    String? avgWeight,
    String? oldWeight,
    String? displeasedBages,
    String? kantaId,
    String? kantaName,
    String? kantaParchiNumber,
    String? truckFacility,
    String? bagsFacility,
    String? inOut}) async {
  FormData formData = FormData.fromMap({
    'case_id': caseId,
    'notes': notes,
    'no_of_bags': noOfBags,
    'weight': weight,
    'average_weight': avgWeight,
    'old_weight': oldWeight,
    'displedge_bags': displeasedBages,
    'kanta_id': kantaId,
    'kanta_name': kantaName,
    'kanta_parchi_number': kantaParchiNumber,
    'truck_facility': truckFacility,
    'bags_facility': bagsFacility,
    'in_out': inOut,
    if (kantaParchiFile != null)
      'kanta_parchi': await MultipartFile.fromFile(kantaParchiFile.path,
          contentType: DioMediaType("image", "png"),
          filename: 'kanta_parchi.png'),
    if (truckFile != null)
      'truck_file': await MultipartFile.fromFile(truckFile.path,
          contentType: DioMediaType("image", "png"),
          filename: 'truck_file.png'),
    if (truckFile != null)
      'truck_file2': await MultipartFile.fromFile(truckFile.path,
          contentType: DioMediaType("image", "png"),
          filename: 'truck_file_2.png'),
  });
  var response = await ref
      .watch(dioProvider)
      .post(ApiClient.uploadSecondKantaV1, data: formData);
  return baseResponseFromMap(jsonEncode(response.data));
}

@riverpod
Future<BaseResponse> uploadSecondKantaParchi(UploadSecondKantaParchiRef ref,
    {String? caseId,
    String? notes,
    String? kantaParchiFile,
    String? truckFile,
    String? noOfBags,
    String? weight,
    String? avgWeight,
    String? oldWeight,
    String? displeasedBages,
    String? kantaId,
    String? kantaName,
    String? kantaParchiNumber,
    String? truckFacility,
    String? bagsFacility,
    String? inOut}) async {
  var response =
      await ref.watch(dioProvider).post(ApiClient.uploadFirstKanta, data: {
    'case_id': caseId,
    'notes': notes,
    'kanta_parchi': kantaParchiFile,
    'truck_file': truckFile,
    'truck_file2': truckFile,
    'no_of_bags': noOfBags,
    'weight': weight,
    'average_weight': avgWeight,
    'old_weight': oldWeight,
    'displedge_bags': displeasedBages,
    'kanta_id': kantaId,
    'kanta_name': kantaName,
    'kanta_parchi_number': kantaParchiNumber,
    'truck_facility': truckFacility,
    'bags_facility': bagsFacility,
    'in_out': inOut
  });
  return baseResponseFromMap(jsonEncode(response.data));
}
