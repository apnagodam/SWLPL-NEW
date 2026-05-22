// ignore_for_file: deprecated_member_use_from_same_package

import 'dart:convert';

import 'package:emp_apnagodam/Data/Models/AdvanceApproverData.dart';
import 'package:emp_apnagodam/Data/Models/AdvanceListingModel.dart';
import 'package:emp_apnagodam/Data/Models/BaseResponse.dart';
import 'package:emp_apnagodam/Data/Models/WithdrawRequestsModel.dart';
import 'package:emp_apnagodam/Domain/dio/DioProvider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'AdvanceService.g.dart';

@riverpod
Future<BaseResponse> requestAdvance(RequestAdvanceRef ref,
    {String? requestedAmount, String? notes, String? approverId}) async {
  var response = await ref.watch(dioProvider).post(ApiClient.postAdvanceRequest,
      queryParameters: {
        'requested_amount': requestedAmount,
        'notes': notes,
        "approve_by": approverId
      });

  return baseResponseFromMap(jsonEncode(response.data));
}

@riverpod
Stream<AdvanceListingModel> advancesList(AdvancesListRef ref) async* {
  var response = await ref.watch(dioProvider).get(ApiClient.getAdvanceList);
  yield advanceListingModelFromMap(jsonEncode(response.data));
}

@riverpod
Stream<AdvanceApproverData> advanceApprover(AdvanceApproverRef ref) async* {
  var response = await ref.watch(dioProvider).get(ApiClient.getApproverDetails);
  yield advanceApproverDataFromMap(jsonEncode(response.data));
}

@riverpod
Stream<WithdrawRequestsModel> withdrawRequests(WithdrawRequestsRef ref) async* {
  var response =
      await ref.watch(dioProvider).post(ApiClient.getWithdrawRequests);
  yield withdrawRequestsModelFromJson(jsonEncode(response.data));
}

@riverpod
Future<Map<String, dynamic>> approveWithdrawRequest(
    ApproveWithdrawRequestRef ref,
    {String? id,
    String? notes,
    String? amount}) async {
  var response = await ref.watch(dioProvider).post(
      ApiClient.approveWithdrawRequest,
      queryParameters: {'id': id, 'notes': notes, "amount": amount});
  ref.invalidate(withdrawRequestsProvider);
  return response.data;
}

@riverpod
Future<Map<String, dynamic>> rejectWithdrawRequest(RejectWithdrawRequestRef ref,
    {String? id, String? notes, String? amount}) async {
  var response = await ref
      .watch(dioProvider)
      .post(ApiClient.rejectWithdrawRequest, queryParameters: {
    'id': id,
    'notes': notes,
  });
  ref.invalidate(withdrawRequestsProvider);
  return response.data;
}

//// Cleaning




