import 'package:emp_apnagodam/Presentation/Constants/ColorConstant.dart';
import 'package:emp_apnagodam/Presentation/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class DynamicShimmerList extends StatelessWidget {
  final int itemCount;
  final double height;
  final double width;

  const DynamicShimmerList({
    Key? key,
    this.itemCount = 5,
    this.height = 100,
    this.width = double.infinity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: primaryColor,
        child: Container(
          height: context.fullHeight,
          width: context.fullWidth,
          alignment: Alignment.center,
          child: Image.asset('assets/logo.png',fit: BoxFit.fill,height: context.fullHeight/8,),
        ),
      );
  }
}
