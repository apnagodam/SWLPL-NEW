// ignore_for_file: deprecated_member_use_from_same_package

import 'dart:convert';

import 'package:emp_apnagodam/Data/Models/ApproverModel.dart';
import 'package:emp_apnagodam/Data/Models/BaseResponse.dart';
import 'package:emp_apnagodam/Data/Models/DispleadgeApprovalRequestModal.dart';
import 'package:emp_apnagodam/Data/Models/DispleasedCommodityModel.dart';
import 'package:emp_apnagodam/Data/Models/DispleasedStackModel.dart';
import 'package:emp_apnagodam/Data/Models/DispleasedTerminalModel.dart';
import 'package:emp_apnagodam/Data/Models/DispledgeRequestListModal.dart';
import 'package:emp_apnagodam/Data/Models/TerminalModel.dart';
import 'package:emp_apnagodam/Domain/dio/DioProvider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'DispleasedService.g.dart';

@riverpod
Stream<DispleasedTerminalModel> displeasedUsers(DispleasedUsersRef ref,
    {String? terminalId}) async* {
  var response = await ref.watch(dioProvider).get(ApiClient.getDispleasedUsers,
      queryParameters: {'terminal_id': terminalId});
  yield displeasedTerminalModelFromMap(jsonEncode(response.data));
}

@riverpod
Stream<DispleasedCommodityModel> displeasedCommodities(
    DispleasedCommoditiesRef ref,
    {String? terminalId,
    String? userId}) async* {
  var response = await ref.watch(dioProvider).get(
      ApiClient.getDispleasedCommodities,
      queryParameters: {'terminal_id': terminalId, 'user_id': userId});
  yield displeasedCommodityModelFromMap(jsonEncode(response.data));
}

@riverpod
Stream<DispleasedStackModel> displeasedStacks(DispleasedStacksRef ref,
    {String? terminalId, String? userId, String? commodityId}) async* {
  var response = await ref.watch(dioProvider).get(ApiClient.getDispleasedStacks,
      queryParameters: {
        'terminal_id': terminalId,
        'user_id': userId,
        'commodity_id': commodityId
      });
  yield displeasedStackModelFromMap(jsonEncode(response.data));
}

@riverpod
Stream<TerminalsModel> terminals(
  TerminalsRef ref,
) async* {
  var response = await ref.watch(dioProvider).get(ApiClient.getTerminals);
  yield terminalsModelFromMap(jsonEncode(response.data));
}

@riverpod
Stream<ApproverModel> approverList(ApproverListRef ref) async* {
  var response = await ref.watch(dioProvider).get(ApiClient.getApprover);
  yield approverModelFromMap(jsonEncode(response.data));
}

@riverpod
Future<BaseResponse> displeasedRequest(
  DispleasedRequestRef ref, {
  String? userId,
  String? terminalId,
  String? commodityId,
  String? stackid,
  String? quantity,
  String? bags,
  String? image,
  String? approvedBy,
  String? notes,
}) async {
  var response =
      await ref.watch(dioProvider).post(ApiClient.postDispleasedRequest, data: {
    'user': userId,
    'terminal_id': terminalId,
    'commodity_id': commodityId,
    'stack_id': stackid,
    'quantity': quantity,
    'Bags': bags,
    'displedge_image': image,
    'approved_by': approvedBy,
    'emp_displege_notes': notes,
  });
  return baseResponseFromMap(jsonEncode(response.data));
}

@riverpod
Stream<DispledgeRequestList> displedgeRequestList(
  DispledgeRequestListRef ref,
) async* {
  var response = await ref.watch(dioProvider).get(
        ApiClient.getDispledgeRequestlist,
      );
  yield displedgeRequestListFromJson(jsonEncode(response.data));
}

@riverpod
Future<Map<String, dynamic>> displeaseRejectRequest(
  DispleaseRejectRequestRef ref, {
  String? id,
  String? notes,
}) async {
  var response = await ref
      .watch(dioProvider)
      .get(ApiClient.getDispledgeReject, queryParameters: {
    'id': id,
    'notes': notes,
  });

  return response.data;
}

///Displedge Approval Requests
@riverpod
Stream<DispledgeApprovalRequestModal> displedgeApprovalRequest(
  DispledgeApprovalRequestRef ref,
) async* {
  var response = await ref.watch(dioProvider).get(
        ApiClient.getDispledgeApprovalRequestList,
      );
  yield displedgeApprovalRequestModalFromJson(jsonEncode(response.data));
}

@riverpod
Future<Map<String, dynamic>> displeaseRejected(
  DispleaseRejectedRef ref, {
  String? id,
  String? notes,
}) async {
  var response = await ref
      .watch(dioProvider)
      .get(ApiClient.getDispledgeReject, queryParameters: {
    'id': id,
    'notes': notes,
  });

  return response.data;
}

@riverpod
Future<Map<String, dynamic>> displeaseApprove(
  DispleaseApproveRef ref, {
  String? id,
  String? notes,
}) async {
  var response = await ref
      .watch(dioProvider)
      .get(ApiClient.getDispledgeApprove, queryParameters: {
    'id': id,
    'notes': notes,
  });

  return response.data;
}
