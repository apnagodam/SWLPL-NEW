import 'dart:convert';

import 'package:emp_apnagodam/Data/Models/DistrictsResponseModel.dart';
import 'package:emp_apnagodam/Data/StatesResponseModel.dart';
import 'package:emp_apnagodam/Domain/dio/DioProvider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'StatesService.g.dart';

@riverpod
Stream<StatesResponseModel> statesList(StatesListRef ref) async* {
  var response = await ref.watch(dioProvider).get(ApiClient.getStates);
  yield statesResponseModelFromMap(jsonEncode(response.data));
}

@riverpod
Stream<DistrictsResponseModel> districtList(DistrictListRef ref,
    {String? code}) async* {
  var response = await ref
      .watch(dioProvider)
      .get(ApiClient.getDistricts, queryParameters: {"code": code});
  yield districtsResponseModelFromMap(jsonEncode(response.data));
}
