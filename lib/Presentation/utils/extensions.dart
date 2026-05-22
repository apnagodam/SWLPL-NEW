import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension PushPage on BuildContext {}

extension isValidId on String {
  bool isValidEmpId() {
    return RegExp(r'^[a-zA-Z]{2}[0-9]{4}$').hasMatch(this);
  }
}

extension ValidQuality on String {
  bool isValidQuality() {
    return RegExp(r'^(?!0+(\.0+)?$)\d+(\.\d+)?$').hasMatch(this);
  }
}

extension AadharNumberValidator on String {
  bool isValidAadharNumber() {
    return RegExp(r'^[2-9]{1}[0-9]{3}\\s[0-9]{4}\\s[0-9]{4}$').hasMatch(this);
  }
}

extension PanCardValidator on String {
  bool isValidPanCardNo() {
    return RegExp(r'^[a-zA-Z]{5}[0-9]{4}[a-zA-Z]{1}$').hasMatch(this);
  }
}

extension BankAccountValidator on String {
  bool isValidBankAccount() {
    return RegExp(r'^\d{10,16}$').hasMatch(this);
  }
}

extension DrivingLicenseValidator on String {
  bool isValidLicenseNo() {
    return RegExp(
            r'^(([a-zA-Z]{2}[0-9]{2})( )|([a-zA-Z]{2}-[0-9]{2}))((19|20)[0-9][0-9])[0-9]{7}$')
        .hasMatch(this);
  }
}

extension FullHeight on BuildContext {
  double get fullHeight =>
      MediaQuery.of(this).size.height -
      MediaQuery.of(this).padding.top -
      kToolbarHeight;
}

extension FullWidth on BuildContext {
  double get fullWidth =>
      MediaQuery.of(this).size.width -
      MediaQuery.of(this).padding.left -
      kToolbarHeight;
}

extension Filter on dynamic {
  bool findBy(String filter) {
    return this.toString().toLowerCase().trim().contains(filter);
  }
}

extension FormatDate on DateTime {
  String formatDate() {
    String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(this);
    return formattedDate;
  }
}
extension FileExtention on FileSystemEntity {
  String? get name {
    return path.split(Platform.pathSeparator).last;
  }
}
