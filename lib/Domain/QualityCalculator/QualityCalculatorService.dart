import 'dart:convert';

import 'package:emp_apnagodam/Data/Models/QualityParamsModel.dart';
import 'package:emp_apnagodam/Domain/dio/DioProvider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'QualityCalculatorService.g.dart';

@riverpod
Stream<QualityParamsModel> qualityParameters(QualityParametersRef ref,
    {required String stateCode,
    required String districtId,
    required String commodityId}) async* {
  var response = await ref
      .watch(dioProvider)
      .post(ApiClient.getQualityParamsList, queryParameters: {
    'state_code': stateCode,
    'district_id': districtId,
    'commodity_id': commodityId
  });

  yield qualityParamsModelFromJson(jsonEncode(response.data));
}

@riverpod
Future<Map<String, dynamic>> calculateQualityPrice(CalculateQualityPriceRef ref,
    {required Map<String, dynamic> data}) async {
  var response =
      await ref.watch(dioProvider).post(ApiClient.getQualityPrice, data: data);

  return response.data;
}
