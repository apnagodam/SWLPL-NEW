// ignore_for_file: deprecated_member_use_from_same_package

import 'dart:convert';

import 'package:emp_apnagodam/Data/Models/BaseResponse.dart';
import 'package:emp_apnagodam/Domain/dio/DioProvider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../Data/Models/LeadsListModel.dart';

part 'LeadsService.g.dart';

@riverpod
Future<BaseResponse> generateLead(GenerateLeadRef ref,
    {String? userId,
    String? customerName,
    String? phone,
    String? quantity,
    String? commodityId,
    String? terminalId,
    String? location,
    String? date,
    String? purpose}) async {
  var response = await ref
      .watch(dioProvider)
      .post(ApiClient.generateLead, queryParameters: {
    "user_id": userId,
    'customer_name': customerName,
    'quantity': quantity,
    'location': location,
    'phone': phone,
    'commodity_id': commodityId,
    'terminal_id': terminalId,
    'commodity_date': date,
    'purpose': purpose
  });

  return baseResponseFromMap(jsonEncode(response.data));
}

@riverpod
Stream<LeadsListModel> leadsList(LeadsListRef ref) async* {
  var response = await ref.watch(dioProvider).get(ApiClient.leadsList,
      queryParameters: {'limit': 50, 'page': '1', 'search': ''});
  yield leadsListModelFromMap(jsonEncode(response.data));
}
