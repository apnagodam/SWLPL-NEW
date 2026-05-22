// ignore_for_file: deprecated_member_use_from_same_package

import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:emp_apnagodam/Data/Models/BaseResponse.dart';
import 'package:emp_apnagodam/Data/Models/LevelWiseModel.dart';
import 'package:emp_apnagodam/Data/Models/VenderVoucherApproveModal.dart';
import 'package:emp_apnagodam/Data/Models/VenderVoucherListModal.dart';
import 'package:emp_apnagodam/Data/Models/VendorApproveListModal.dart';
import 'package:emp_apnagodam/Data/Models/VendorExpensesModal.dart';
import 'package:emp_apnagodam/Data/Models/VendorExpensesTerminalModal.dart';
import 'package:emp_apnagodam/Data/Models/VendorGroupFirmListModal.dart';
import 'package:emp_apnagodam/Data/Models/VendorListModal.dart';
import 'package:emp_apnagodam/Data/Models/VoucherApprovalModel.dart';
import 'package:emp_apnagodam/Data/Models/VoucherListModel.dart';
import 'package:emp_apnagodam/Domain/dio/DioProvider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ConveyanceService.g.dart';

@riverpod
Stream<LevelWiseModel> approvedBy(ApprovedByRef ref) async* {
  var response = await ref.watch(dioProvider).get(ApiClient.getLevelWiseList);
  yield levelWiseModelFromMap(jsonEncode(response.data));
}

@riverpod
Stream<VoucherListModel> voucherList(VoucherListRef ref) async* {
  var response = await ref.watch(dioProvider).get(ApiClient.getVoucherList,
      queryParameters: {"limit": 10, 'page': 0, 'search': ''});
  yield voucherListModelFromMap(jsonEncode(response.data));
}

@riverpod
Future<BaseResponse> postConveyance(PostConveyanceRef ref,
    {String? date,
    String? startImage,
    String? endImage,
    String? vehicleNumber,
    String? fromPlace,
    String? toPlace,
    String? startReading,
    String? endReading,
    String? kms,
    String? charges,
    String? location,
    String? otherExpense,
    String? total,
    String? purpose,
    String? approvedBy,
    String? conveyance,
    String? terminalId,
    String? otherChargeImage}) async {
  var response =
      await ref.watch(dioProvider).post(ApiClient.postConveyance, data: {
    "date": date,
    "start_image": startImage,
    "end_image": endImage,
    "vehicle_no": vehicleNumber,
    "from_place": fromPlace,
    "to_place": toPlace,
    "start_reading": startReading,
    "end_reading": endReading,
    "kms": kms,
    "charges": charges,
    "location": location,
    "other_expense": otherExpense,
    "total": total,
    "purpose": purpose,
    "approved_by": approvedBy,
    "conv_type": conveyance,
    "terminal_id": terminalId,
    "other_charge_img": otherChargeImage
  });
  return baseResponseFromMap(jsonEncode(response.data));
}

@riverpod
Future<BaseResponse> cancelVouncherRequest(CancelVouncherRequestRef ref,
    {String? conveyanceId}) async {
  var response = await ref.watch(dioProvider).post(
      ApiClient.cancelVoucherRequest,
      queryParameters: {"conveyance_id": conveyanceId});
  return baseResponseFromMap(jsonEncode(response.data));
}

@riverpod
Stream<VoucherApprovalModel> voucherApprovalList(
    VoucherApprovalListRef ref) async* {
  var response = await ref.watch(dioProvider).get(ApiClient.approveVoucherList,
      queryParameters: {"limit": 10, 'page': 0, 'search': ''});
  yield voucherApprovalModelFromMap(jsonEncode(response.data));
}

@riverpod
Future<BaseResponse> verifyVoucherRequest(VerifyVoucherRequestRef ref,
    {String? conveyanceId, String? purpose, String? finalAmount}) async {
  var response = await ref
      .watch(dioProvider)
      .post(ApiClient.verifyRequest, queryParameters: {
    "conveyance_id": conveyanceId,
    'final_prize': finalAmount,
    'approve_notes': purpose
  });
  return baseResponseFromMap(jsonEncode(response.data));
}

@riverpod
Future<BaseResponse> rejectVoucherRequest(RejectVoucherRequestRef ref,
    {String? conveyanceId, String? purpose}) async {
  var response = await ref.watch(dioProvider).post(ApiClient.rejectRequest,
      queryParameters: {
        "conveyance_id": conveyanceId,
        'approve_notes': purpose
      });
  return baseResponseFromMap(jsonEncode(response.data));
}

//<-------------------------------------------------VenderVoucher-------------------------------------------------->

@riverpod
Stream<VendorVoucherListModal> venderVoucherList(
    VenderVoucherListRef ref) async* {
  var response =
      await ref.watch(dioProvider).get(ApiClient.getVenderVoucherList);
  yield vendorVoucherListModalFromJson(jsonEncode(response.data));
}

@riverpod
Future<Map<String, dynamic>> venderVoucherReject(
  VenderVoucherRejectRef ref, {
  String? id,
}) async {
  var response = await ref
      .watch(dioProvider)
      .post(ApiClient.postVenderVoucherReject, queryParameters: {
    'id': id,
  });
  ref.invalidate(venderVoucherListProvider);
  return response.data;
}

@riverpod
Stream<VendorVoucherApproveListModal> venderVoucherApproveList(
    VenderVoucherApproveListRef ref) async* {
  var response =
      await ref.watch(dioProvider).get(ApiClient.getVenderVoucherApproveList);
  yield vendorVoucherApproveListModalFromJson(jsonEncode(response.data));
}

@riverpod
Future<Map<String, dynamic>> venderVoucherApprove(
  VenderVoucherApproveRef ref, {
  String? id,
  String? amount,
  String? notes,
  String? groupfirm,
}) async {
  var response = await ref
      .watch(dioProvider)
      .post(ApiClient.postVenderVoucherApprove, queryParameters: {
    'id': id,
    'amount': amount,
    'notes': notes,
    'group_firm': groupfirm
  });
  ref.invalidate(venderVoucherListProvider);
  return response.data;
}

@riverpod
Stream<VendorGroupFirmListModal> venderGroupFirmList(
    VenderGroupFirmListRef ref) async* {
  var response =
      await ref.watch(dioProvider).get(ApiClient.postvendorGropfirmList);
  yield vendorGroupFirmListModalFromJson(jsonEncode(response.data));
}

// Vendor Voucher Approve Screen
@riverpod
Future<Map<String, dynamic>> venderVoucherRejected(
  VenderVoucherRejectedRef ref, {
  String? id,
  String? notes,
}) async {
  var response = await ref
      .watch(dioProvider)
      .post(ApiClient.postVenderVoucherRejected, queryParameters: {
    'id': id,
    'notes': notes,
  });
  ref.invalidate(venderVoucherListProvider);
  return response.data;
}

@riverpod
Stream<VendorListModal> vendorList(VendorListRef ref) async* {
  var response = await ref.watch(dioProvider).get(ApiClient.getVendorList);
  yield vendorListModalFromJson(jsonEncode(response.data));
}

@riverpod
Stream<VendorExpensesModal> vendorExpensesList(VendorExpensesListRef ref,
    {required String? id}) async* {
  var response = await ref
      .watch(dioProvider)
      .get(ApiClient.getVendorExpenses, queryParameters: {"id": id});
  yield vendorExpensesModalFromJson(jsonEncode(response.data));
}

@riverpod
Stream<VendorExpensesTerminalModal> vendorExpensesTerminalList(
    VendorExpensesTerminalListRef ref,
    {required String? id}) async* {
  var response = await ref
      .watch(dioProvider)
      .get(ApiClient.getVendorExpensesTerminal, queryParameters: {"id": id});
  yield vendorExpensesTerminalModalFromJson(jsonEncode(response.data));
}

@riverpod
Stream<VendorApproveNameListModal> vendorApproverName(
  VendorApproverNameRef ref, {
  required String? id,
  required String? expensesid,
  required String? amount,
}) async* {
  var response = await ref.watch(dioProvider).get(
      ApiClient.getVendorApproveName,
      queryParameters: {"id": id, "exp_id": expensesid, "amount": amount});
  yield vendorApproveNameListModalFromJson(jsonEncode(response.data));
}

@riverpod
Future<Map<String, dynamic>> createVendorVoucher(
  CreateVendorVoucherRef ref, {
  String? expenseDate,
  String? vendorId,
  String? terminalId,
  String? expid,
  String? amount,
  String? approveBy,
  String? purpose,
  String? groupFirm,
  String? fromDate,
  String? toDate,
  File? image,
  File? imageSecond,
}) async {
  FormData formData = FormData.fromMap({
    "expense_date": expenseDate,
    "vendor_id": vendorId,
    "terminal_id": terminalId,
    "exp_id": expid,
    "amount": amount,
    "approve_by": approveBy,
    "purpose": purpose,
    "group_firm": groupFirm,
    "from_date": fromDate,
    "to_date": toDate,
    if (image != null)
      'image': await MultipartFile.fromFile(image.path,
          contentType: DioMediaType("image", "png"),
          filename: 'expense_image_first.png'),
    if (imageSecond != null)
      'image2': await MultipartFile.fromFile(imageSecond.path,
          contentType: DioMediaType("image", "png"),
          filename: 'expense_image_second.png'),
  });
  var response = await ref
      .watch(dioProvider)
      .post(ApiClient.postCreateVendorVoucher, data: formData);

  return response.data;
}
