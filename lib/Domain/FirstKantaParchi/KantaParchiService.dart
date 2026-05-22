// ignore_for_file: deprecated_member_use_from_same_package

import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:emp_apnagodam/Data/Models/DharamKantaDetailsModel.dart';
import 'package:emp_apnagodam/Data/Models/DharamKantaListingModel.dart';
import 'package:emp_apnagodam/Data/Models/FKantaParchiListModel.dart';
import 'package:emp_apnagodam/Domain/dio/DioProvider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'KantaParchiService.g.dart';

@riverpod
Stream<DharamKantaListingModel> dharamKantasList(
    DharamKantasListRef ref) async* {
  var response = await ref.watch(dioProvider).get(ApiClient.getDharamKantas);
  yield dharamKantaListingModelFromMap(jsonEncode(response.data));
}

@riverpod
Future<DharamKantaDetailsModel> dharamKantaDetails(DharamKantaDetailsRef ref,
    {String? warehouseId}) async {
  var response = await ref.watch(dioProvider).get(
      ApiClient.getDharamKantaDetails,
      queryParameters: {'warehouse_id': warehouseId});
  return dharamKantaDetailsModelFromMap(jsonEncode(response.data));
}

@riverpod
Future<Map<String, dynamic>> uploadFirstKantaParchi(
    UploadFirstKantaParchiRef ref,
    {String? caseId,
    String? notes,
    String? kantaImage,
    String? truckImage,
    String? kantaId,
    String? kantaParchiNumber,
    String? oldKantaFile,
    String? oldKantaNumber,
    String? oldKantaLocation,
    String? oldKantaName,
    String? oldKantaWeight,
    String? noOfBags,
    String? netweight,
    String? tareWeight,
    String? grossWeight,
    String? inOutType}) async {
  var response =
      await ref.watch(dioProvider).post(ApiClient.uploadFirstKanta, data: {
    'case_id': caseId,
    'notes': notes,
    'frist_kanta_parchi': kantaImage,
    'truck_file': truckImage,
    'truck_file2': truckImage,
    'dharam_kanta': kantaId,
    'kanta_parchi_number': kantaParchiNumber,
    'old_file': oldKantaFile,
    'old_kanta_wgt': oldKantaWeight,
    'old_kp_number': oldKantaNumber,
    'old_kanta_name': oldKantaName,
    'net_weight': netweight,
    'kanta_place': oldKantaLocation
  });
  return response.data;
}

@riverpod
Future<Map<String, dynamic>> uploadFirstKantaParchiV1(
  UploadFirstKantaParchiV1Ref ref, {
  String? caseId,
  String? notes,
  String? kantaId,
  String? kantaParchiNumber,
  String? oldKantaNumber,
  String? oldKantaLocation,
  String? oldKantaName,
  String? oldKantaWeight,
  String? noOfBags,
  String? netweight,
  String? tareWeight,
  String? grossWeight,
  String? inOutType,
  List<Map<String, dynamic>>? commodityList,
  String? packagingType,
  String? liveInsects,
  File? qualityFile,
  File? oldKantaFile,
  File? kantaImage,
  File? truckImage,
}) async {
  FormData formData = new FormData.fromMap({
    'case_id': caseId,
    'notes': notes,
    'dharam_kanta': kantaId,
    'kanta_parchi_number': kantaParchiNumber,
    'old_kanta_wgt': oldKantaWeight,
    'old_kp_number': oldKantaNumber,
    'old_kanta_name': oldKantaName,
    'net_weight': netweight,
    'kanta_place': oldKantaLocation,
    if (oldKantaFile != null)
      'old_file': await MultipartFile.fromFile(
        oldKantaFile.path,
        filename: 'old_kanta_parchi_image.png',
        contentType: DioMediaType("image", "png"),
      ),
    if (kantaImage != null)
      'frist_kanta_parchi': await MultipartFile.fromFile(kantaImage.path,
          contentType: DioMediaType("image", "png"),
          filename: 'kanta_parchi_image.png'),
    if (truckImage != null)
      'truck_file': await MultipartFile.fromFile(truckImage.path,
          contentType: DioMediaType("image", "png"),
          filename: 'truck_image.png'),
  });
  print(formData);
  var response = await ref
      .watch(dioProvider)
      .post(ApiClient.uploadFirstKantaV1, data: formData);
  return response.data;
}

@riverpod
Stream<FKantaParchiListModel> fKantaParchiList(FKantaParchiListRef ref,
    {String? inOut}) async* {
  var response = await ref.watch(dioProvider).get(ApiClient.fKantaList,
      queryParameters: {
        'limit': 10,
        'page': '1',
        'in_out': inOut,
        'search': ''
      });
  yield fKantaParchiListModelFromMap(jsonEncode(response.data));
}
