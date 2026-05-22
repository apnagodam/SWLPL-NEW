import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';

import 'ColorConstant.dart';

class StyleConstants {
  static var textFormStyle = InputDecoration(
      hintText: "Input Number",
      contentPadding: Pad(top: 0, bottom: 0, left: 10),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      enabledBorder:
          OutlineInputBorder(borderRadius: BorderRadius.circular(8)));

  static var buttonStyle = ElevatedButton.styleFrom(
      backgroundColor: primaryColor,
      textStyle: const TextStyle(color: Colors.white,fontWeight: FontWeight.w700),
      shape: const RoundedRectangleBorder(
        side: BorderSide(color: secondColorSuperDark),
          borderRadius: BorderRadius.all(Radius.circular(10))));
}
