// ignore_for_file: deprecated_member_use_from_same_package

import 'dart:convert';

import 'package:emp_apnagodam/Data/Models/OtpResponseModel.dart';
import 'package:emp_apnagodam/Data/Models/ProfileDataModel.dart';
import 'package:emp_apnagodam/Domain/dio/DioProvider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../Data/Models/LoginResponse.dart';
part 'AuthenticationService.g.dart';

@riverpod
Future<LoginModel> sendOtp(SendOtpRef ref, {String? empCode}) async {
  var response = await ref.watch(dioProvider).post(ApiClient.sendOtp,
      queryParameters: {'number': empCode, "app_type": 'Emp'});
  return loginModelFromJson(jsonEncode(response.data));
}

@riverpod
Future<LoginModel> sendOtpV1(SendOtpV1Ref ref, {String? empCode}) async {
  var response = await ref.watch(dioProvider).post(ApiClient.sendOtp,
      queryParameters: {'number': empCode, "app_type": 'Emp'});
  return loginModelFromJson(jsonEncode(response.data));
}

@riverpod
Future<OtpResponseModel> verifyOtp(VerifyOtpRef ref,
    {String? otp, String? number}) async {
  var response = await ref.watch(dioProvider).post(ApiClient.verifyOtp,
      queryParameters: {'otp': otp, "number": number, "app_type": 'Emp'});
  return otpResponseModelFromMap(jsonEncode(response.data));
}

@riverpod
Stream<ProfileDataModel> profileData(ProfileDataRef ref) async* {
  var response = await ref.watch(dioProvider).post(ApiClient.getProfile);
  yield profileDataModelFromMap(jsonEncode(response.data));
}
