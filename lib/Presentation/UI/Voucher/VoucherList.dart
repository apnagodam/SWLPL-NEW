import 'dart:io';

import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:button_animations/button_animations.dart';
import 'package:emp_apnagodam/Domain/Conveyance/ConveyanceService.dart';
import 'package:emp_apnagodam/Presentation/Constants/ColorConstant.dart';
import 'package:emp_apnagodam/Presentation/Widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../Domain/dio/DioProvider.dart';

var currencyFormat =
    NumberFormat.currency(locale: 'HI', symbol: '\u{20B9}', decimalDigits: 2);

class Voucherlist extends ConsumerWidget {
  const Voucherlist({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Platform.isIOS
          ? CupertinoPageScaffold(
              navigationBar: cupertinoAppBar("Voucher List", context),
              child: voucherListLayout(context, ref))
          : Scaffold(
              appBar: AppBar(
                title: const Text('Voucher List'),
              ),
              body: voucherListLayout(context, ref),
            ),
    );
  }

  voucherListLayout(BuildContext context, WidgetRef ref) =>
      RefreshIndicator.adaptive(
          child: ListView(
            children: [
              ref.watch(voucherListProvider).when(
                  data: (data) => (data.data?.data ?? []).isEmpty
                      ? Container(
                          height: MediaQuery.of(context).size.height,
                          alignment: Alignment.center,
                          child: noItems('Vouchers', context),
                        )
                      : ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: data.data?.data?.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: Pad(all: 10),
                              decoration: BoxDecoration(
                                  border: Border.all(color: primaryColor),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const Pad(all: 10),
                                child: ColumnSuper(
                                    alignment: Alignment.center,
                                    children: [
                                      Padding(
                                        padding: Pad(all: 10),
                                        child: Text.rich(TextSpan(
                                            text:
                                                'Terminal: ${data.data?.data?[index].location}',
                                            style: TextStyle(
                                                color: primaryColorDark,
                                                fontSize: Adaptive.sp(15),
                                                fontWeight: FontWeight.bold))),
                                      ),
                                      Padding(
                                        padding: Pad(all: 10),
                                        child: Text.rich(TextSpan(
                                            text:
                                                'Emp: ${data.data?.data?[index].firstName} ${data.data?.data?[index].lastName} (${data.data?.data?[index].datumEmpId})',
                                            style: TextStyle(
                                                color: primaryColorDark,
                                                fontSize: Adaptive.sp(14),
                                                fontWeight: FontWeight.w700))),
                                      ),
                                      Divider(
                                        height: 2,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      RowSuper(
                                          fill: true,
                                          alignment: Alignment.center,
                                          children: [
                                            Text(
                                              'CV-${data.data?.data?[index].uniqueId?.toString().substring(0, 4)}',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: Adaptive.sp(14),
                                                  fontWeight: FontWeight.w800),
                                            ),
                                            Container(
                                              height: 50,
                                              color: Colors.grey,
                                              width: 1,
                                            ),
                                            Padding(
                                              padding: Pad(all: 10),
                                              child: Text(
                                                '${data.data?.data?[index].fromPlace}-${data.data?.data?[index].toPlace}',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: Adaptive.sp(14),
                                                    fontWeight:
                                                        FontWeight.w800),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            Container(
                                              height: 50,
                                              color: Colors.grey,
                                              width: 1,
                                            ),
                                            ColumnSuper(
                                              alignment: Alignment.topCenter,
                                              children: [
                                                Text(
                                                  "${currencyFormat.format(double.parse(data.data?.data?[index].total ?? "0.0"))}",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: primaryColorDark,
                                                      fontSize: Adaptive.sp(14),
                                                      fontWeight:
                                                          FontWeight.w800),
                                                ),
                                              ],
                                            ),
                                            Container(
                                              height: 50,
                                              color: Colors.grey,
                                              width: 1,
                                            ),
                                          ]),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      RowSuper(fill: true, children: [
                                        Text(
                                          'Purpose',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              color: primaryColor,
                                              fontSize: Adaptive.sp(14),
                                              fontWeight: FontWeight.w800),
                                        ),
                                        Text(
                                          '${data.data?.data?[index].purpose}',
                                          textAlign: TextAlign.end,
                                          style: TextStyle(
                                              color: primaryColor,
                                              fontSize: Adaptive.sp(14),
                                              fontWeight: FontWeight.w800),
                                        ),
                                      ]),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      RowSuper(
                                          fill: true,
                                          alignment: Alignment.center,
                                          children: [
                                            Text(
                                              'Date',
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  color: primaryColor,
                                                  fontSize: Adaptive.sp(14),
                                                  fontWeight: FontWeight.w800),
                                            ),
                                            Text(
                                              '${data.data?.data?[index].createdAt}',
                                              textAlign: TextAlign.end,
                                              style: TextStyle(
                                                  color: primaryColor,
                                                  fontSize: Adaptive.sp(14),
                                                  fontWeight: FontWeight.w800),
                                            ),
                                          ]),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      RowSuper(
                                          fill: true,
                                          alignment: Alignment.center,
                                          children: [
                                            Text(
                                              'KMS',
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  color: primaryColor,
                                                  fontSize: Adaptive.sp(14),
                                                  fontWeight: FontWeight.w800),
                                            ),
                                            Text(
                                              '${data.data?.data?[index].kms ?? 0} Kms',
                                              textAlign: TextAlign.end,
                                              style: TextStyle(
                                                  color: primaryColor,
                                                  fontSize: Adaptive.sp(14),
                                                  fontWeight: FontWeight.w800),
                                            ),
                                          ]),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      RowSuper(
                                          fill: true,
                                          alignment: Alignment.center,
                                          children: [
                                            Text(
                                              'Vehicle Type',
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  color: primaryColor,
                                                  fontSize: Adaptive.sp(14),
                                                  fontWeight: FontWeight.w800),
                                            ),
                                            Text(
                                              '${data.data?.data?[index].conveyanceType}',
                                              textAlign: TextAlign.end,
                                              style: TextStyle(
                                                  color: primaryColor,
                                                  fontSize: Adaptive.sp(14),
                                                  fontWeight: FontWeight.w800),
                                            ),
                                          ]),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      RowSuper(
                                          fill: true,
                                          alignment: Alignment.center,
                                          children: [
                                            Text(
                                              'Charges',
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  color: primaryColor,
                                                  fontSize: Adaptive.sp(14),
                                                  fontWeight: FontWeight.w800),
                                            ),
                                            Text(
                                              '${currencyFormat.format(double.parse(data.data?.data?[index].charges ?? "0.0"))}',
                                              textAlign: TextAlign.end,
                                              style: TextStyle(
                                                  color: primaryColor,
                                                  fontSize: Adaptive.sp(14),
                                                  fontWeight: FontWeight.w800),
                                            ),
                                          ]),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      RowSuper(
                                          fill: true,
                                          alignment: Alignment.center,
                                          children: [
                                            Text(
                                              'Other Expenses',
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  color: primaryColor,
                                                  fontSize: Adaptive.sp(14),
                                                  fontWeight: FontWeight.w800),
                                            ),
                                            Text(
                                              '${currencyFormat.format(double.parse(data.data?.data?[index].otherExpense ?? "0.0"))}',
                                              textAlign: TextAlign.end,
                                              style: TextStyle(
                                                  color: primaryColor,
                                                  fontSize: Adaptive.sp(14),
                                                  fontWeight: FontWeight.w800),
                                            ),
                                          ]),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      RowSuper(
                                          fill: true,
                                          alignment: Alignment.center,
                                          children: [
                                            Text(
                                              'Start Meter Image',
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  color: primaryColor,
                                                  fontSize: Adaptive.sp(14),
                                                  fontWeight: FontWeight.w800),
                                            ),
                                            Align(
                                              alignment: Alignment.centerRight,
                                              child: InkWell(
                                                onTap: () {},
                                                child: InstaImageViewer(
                                                  imageUrl:
                                                      "${ref.watch(dioProvider).options.baseUrl}resources/assets/upload/conveyance/${data.data?.data![index].image}",
                                                  child: Icon(
                                                    CupertinoIcons.eye,
                                                    color: primaryColor,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ]),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      RowSuper(
                                          fill: true,
                                          alignment: Alignment.center,
                                          children: [
                                            Text(
                                              'End Meter Image',
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  color: primaryColor,
                                                  fontSize: Adaptive.sp(14),
                                                  fontWeight: FontWeight.w800),
                                            ),
                                            Align(
                                              alignment: Alignment.centerRight,
                                              child: InkWell(
                                                onTap: () {},
                                                child: InstaImageViewer(
                                                  imageUrl:
                                                      "${ref.watch(dioProvider).options.baseUrl}resources/assets/upload/conveyance/${data.data?.data![index].image2}",
                                                  child: Icon(
                                                    CupertinoIcons.eye,
                                                    color: primaryColor,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ]),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      RowSuper(
                                          fill: true,
                                          alignment: Alignment.center,
                                          children: [
                                            Text(
                                              'Other Expense Image',
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  color: primaryColor,
                                                  fontSize: Adaptive.sp(14),
                                                  fontWeight: FontWeight.w800),
                                            ),
                                            Align(
                                              alignment: Alignment.centerRight,
                                              child: InkWell(
                                                onTap: () {},
                                                child: InstaImageViewer(
                                                  imageUrl:
                                                      "${ref.watch(dioProvider).options.baseUrl}resources/assets/upload/conveyance/${data.data?.data![index].otherChargeImg}",
                                                  child: Icon(
                                                    CupertinoIcons.eye,
                                                    color: primaryColor,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ]),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Divider(
                                        height: 2,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      data.data?.data?[index].status
                                                  ?.toInt() !=
                                              1
                                          ? const SizedBox()
                                          : Text(
                                              'Pending',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: data.data?.data?[index]
                                                              .status
                                                              ?.toInt() ==
                                                          0
                                                      ? Colors.red
                                                      : primaryColorDark,
                                                  fontSize: Adaptive.sp(14),
                                                  fontWeight: FontWeight.w800),
                                            ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      data.data?.data?[index].status
                                                      ?.toInt() ==
                                                  0 ||
                                              data.data?.data?[index].status
                                                      ?.toInt() ==
                                                  2
                                          ? Text(
                                              data.data?.data?[index].status
                                                          ?.toInt() ==
                                                      1
                                                  ? 'Pending'
                                                  : data.data?.data?[index]
                                                              .status
                                                              ?.toInt() ==
                                                          2
                                                      ? "Approved"
                                                      : "Rejected",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: data.data?.data?[index]
                                                              .status
                                                              ?.toInt() ==
                                                          0
                                                      ? Colors.red
                                                      : primaryColorDark,
                                                  fontSize: Adaptive.sp(14),
                                                  fontWeight: FontWeight.w800),
                                            )
                                          : AnimatedButton(
                                              height: 35,
                                              color: primaryColorDark,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  1.2,
                                              isOutline: true,
                                              isMultiColor: true,
                                              colors: [
                                                primaryColorDark,
                                                primaryColorDark,
                                              ],
                                              borderWidth: 1,
                                              onTap: () async {
                                                ref
                                                    .watch(cancelVouncherRequestProvider(
                                                            conveyanceId:
                                                                "${data.data?.data?[index].id}")
                                                        .future)
                                                    .then((value) {
                                                  if (value.status.toString() ==
                                                      "1") {
                                                    ref.invalidate(
                                                        voucherListProvider);
                                                  }
                                                });
                                              },
                                              child: Text(
                                                "Reject",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: Adaptive.sp(14),
                                                    fontWeight:
                                                        FontWeight.w800),
                                              ),
                                            ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                    ]),
                              ),
                            );
                          }),
                  error: (e, s) => Container(),
                  loading: () => voucherListShimmer())
            ],
          ),
          onRefresh: () => Future.value({ref.invalidate(voucherListProvider)}));
}
