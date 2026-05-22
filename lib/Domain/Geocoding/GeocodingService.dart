// ignore_for_file: deprecated_member_use_from_same_package

import 'dart:convert';

import 'package:emp_apnagodam/Data/Models/GeocodingModel.dart';
import 'package:emp_apnagodam/Domain/dio/DioProvider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'GeocodingService.g.dart';

@riverpod
Future<GeocodingModel> getAddress(GetAddressRef ref, {String? latLng}) async {
  var response = await ref
      .watch(locationDioProvider)
      .get(ApiClient.getAddress, queryParameters: {'latlng': latLng,    "key": 'AIzaSyCBSE9f-8MEb5om7pzPBJo1yt-9ObNYhA4',
  });
  return geocodingModelFromMap(jsonEncode(response.data));
}
