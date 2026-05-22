// ignore_for_file: deprecated_member_use_from_same_package

import 'dart:convert';

import 'package:emp_apnagodam/Data/Models/EmployeeWalletStatementModel.dart';
import 'package:emp_apnagodam/Domain/dio/DioProvider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'WalletService.g.dart';

@riverpod
Stream<EmployeeWalletStatementModel> walletStatement(WalletStatementRef ref,
    {String? fromDate, String? toDate}) async* {
  var response = await ref.watch(dioProvider).post(ApiClient.getWalletStatement,
      queryParameters: {'from_date': fromDate, "to_date": toDate});
  yield employeeWalletStatementModelFromJson(jsonEncode(response.data));
}
