// ignore_for_file: deprecated_member_use_from_same_package

import 'dart:convert';

import 'package:emp_apnagodam/Domain/dio/DioProvider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../Data/Models/BaseResponse.dart';
import '../../Data/Models/PVModel.dart';
import '../../Data/Models/PvResponseModel.dart';

part 'PvService.g.dart';

@riverpod
Future<BaseResponse> postPv(PostPvRef ref, {Pvmodel? pvModel}) async {
  var response = await ref
      .watch(dioProvider)
      .post(ApiClient.postPv, data: pvModel?.toMap());
  return baseResponseFromMap(jsonEncode(response.data));
}

@riverpod
Stream<PvResponseModel> pvTerminals(PvTerminalsRef ref) async* {
  var response = await ref
      .watch(dioProvider)
      .post(ApiClient.getPv, queryParameters: {'type': "Terminal"});
  yield pvResponseModelFromMap(jsonEncode(response.data));
}

@riverpod
Stream<PvResponseModel> pvStacks(PvStacksRef ref, {String? terminalId}) async* {
  var response = await ref.watch(dioProvider).post(ApiClient.getPv,
      queryParameters: {'type': "Terminal", 'terminal_id': terminalId});
  yield pvResponseModelFromMap(jsonEncode(response.data));
}
