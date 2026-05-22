
import 'dart:convert';

import 'package:emp_apnagodam/Data/Models/IndexDataModel.dart';
import 'package:emp_apnagodam/Domain/dio/DioProvider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
    part 'IndexService.g.dart';
@riverpod
Future<IndexDataModel> indexData(IndexDataRef ref) async {
  var response = await ref.watch(dioProvider).get(ApiClient.getIndexData);
  return IndexDataModelFromMap(jsonEncode(response.data));
}
