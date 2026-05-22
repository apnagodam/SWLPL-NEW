import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Models/OtpResponseModel.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

final sharedUtilityProvider = Provider<SharedUtility>((ref) {
  final sharedPrefs = ref.watch(sharedPreferencesProvider);
  return SharedUtility(sharedPreferences: sharedPrefs);
});

class SharedUtility {
  SharedUtility({
    required this.sharedPreferences,
  });

  final SharedPreferences sharedPreferences;

  String getToken() {
    return sharedPreferences.getString('token') ?? "";
  }

  bool isDialogShown() {
    return sharedPreferences.getBool('isDialogOpen') ?? false;
  }

  void setDialogShown(bool isShown) {
    sharedPreferences.setBool('isDialogOpen', isShown);
  }

  void setToken(String token) {
    sharedPreferences.setString('token', token);
  }

  UserDetails? getUser() {
    return sharedPreferences.get('user') != null
        ? UserDetails.fromJson(
            jsonDecode(sharedPreferences.getString('user') ?? ""))
        : null;
  }

  String? getVersionType() {
    return sharedPreferences.getString('version_type');
  }

  void setVersionType(String versionType) {
    sharedPreferences.setString('version_type', versionType);
  }

  void setUser(UserDetails userMap) {
    sharedPreferences.setString('user', jsonEncode(userMap));
  }
}
