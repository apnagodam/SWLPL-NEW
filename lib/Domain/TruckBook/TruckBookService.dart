// ignore_for_file: deprecated_member_use_from_same_package

import 'dart:convert';

import 'package:emp_apnagodam/Data/Models/BaseResponse.dart';
import 'package:emp_apnagodam/Data/Models/TransporterListModel.dart';
import 'package:emp_apnagodam/Data/Models/TruckBookListModel.dart';
import 'package:emp_apnagodam/Domain/dio/DioProvider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'TruckBookService.g.dart';

@riverpod
Stream<TransporterListModel> transporterList(TransporterListRef ref) async* {
  var response = await ref.watch(dioProvider).get(ApiClient.getTransporterList);
  yield transporterListModelFromMap(jsonEncode(response.data));
}

@riverpod
Stream<TruckBookListModel> truckBookList(TruckBookListRef ref,{
  String? inOut
}) async* {
  var response = await ref.watch(dioProvider).get(ApiClient.truckBookList,queryParameters: {
    'limit': 10,
    'page': '1',
    'in_out': inOut,
    'search': ''
  });
  yield truckBookListModelFromMap(jsonEncode(response.data));
}

@riverpod
Future<BaseResponse> uploadTruckBook(UploadTruckBookRef ref,
    {String? caseId = "",
    String? transporterId = "",
    String? vehicleNo = "",
    String? driverName = "",
    String? driverPhone = "",
    String? transportRate = "",
    String? advancePayment = "",
    String? notes = "",
    String? destination = "",
    String? biltyImage = ""}) async {
  var response =
      await ref.watch(dioProvider).post(ApiClient.uploadTruckBook, data: {
    "case_id": caseId,
    "transporter": transporterId,
    "vehicle": vehicleNo,
    "driver_name": driverName,
    "driver_phone": driverPhone,
    "rate_per_km": transportRate,
    "advance_payment": advancePayment,
    "notes": notes,
    "location": destination,
    "transporter_id": transporterId,
    "bilty_image": biltyImage,
  });
  return baseResponseFromMap(jsonEncode(response.data));
}
