// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:button_animations/button_animations.dart';
import 'package:emp_apnagodam/Domain/Conveyance/ConveyanceService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sliding_up_panel2/sliding_up_panel2.dart';

import '../../../Domain/dio/DioProvider.dart';
import '../../Constants/ColorConstant.dart';
import '../../Widgets/widgets.dart';
import 'VoucherList.dart';

PanelController panelController = PanelController();

class Voucherrequests extends ConsumerWidget {
  Voucherrequests({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Platform.isIOS
          ? CupertinoPageScaffold(
              navigationBar: cupertinoAppBar("Voucher Requests", context),
              child: voucherListLayout(context, ref))
          : Scaffold(
              appBar: AppBar(
                title: const Text('Voucher Requests'),
              ),
              body: voucherListLayout(context, ref),
            ),
    );
  }

  voucherListLayout(BuildContext context, WidgetRef ref) =>
      RefreshIndicator.adaptive(
          child: SlidingUpPanel(
            minHeight: 0,
            controller: panelController,
            parallaxEnabled: true,
            backdropEnabled: true,
            parallaxOffset: 0.5,
            panelBuilder: () => Padding(
              padding: Pad(all: 10),
              child: ColumnSuper(children: [
                Text(
                  ref.watch(requestTypeProvider)
                      ? 'Approve Voucher'
                      : "Reject Voucher",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: primaryColorDark,
                      fontSize: Adaptive.sp(18)),
                ),
                SizedBox(
                  height: 10,
                ),
                Visibility(
                    visible: ref.watch(requestTypeProvider),
                    child: TextFormField(
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      textCapitalization: TextCapitalization.characters,
                      controller: finalAmountController,
                      decoration: InputDecoration(
                          label: const Text('Enter Final amount'),
                          contentPadding:
                              const Pad(top: 0, bottom: 0, left: 10),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5))),
                    )),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  controller: notesController,
                  maxLines: 5,
                  decoration: InputDecoration(
                      label: const Text("Purpose"),
                      contentPadding: const Pad(all: 10),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5))),
                ),
                SizedBox(
                  height: 10,
                ),
                AnimatedButton(
                  height: 50,
                  color: primaryColorDark,
                  isOutline: true,
                  isMultiColor: true,
                  colors: [
                    ref.watch(requestTypeProvider)
                        ? primaryColorDark
                        : Colors.red,
                    ref.watch(requestTypeProvider)
                        ? primaryColorDark
                        : Colors.red,
                  ],
                  borderWidth: 1,
                  onTap: () async {
                    if (ref.watch(requestTypeProvider.notifier).state) {
                      if (finalAmountController.text.isEmpty) {
                        Fluttertoast.showToast(
                            msg: "Please insert final amount");
                      } else if (notesController.text.isEmpty) {
                        Fluttertoast.showToast(msg: "Please insert purpose");
                      } else {
                        ref
                            .watch(verifyVoucherRequestProvider(
                                    purpose: notesController.text.toString(),
                                    conveyanceId: ref.watch(conveyanceId),
                                    finalAmount:
                                        finalAmountController.text.toString())
                                .future)
                            .then((value) {
                          if (value.status.toString() == "1") {
                            ref.invalidate(voucherApprovalListProvider);
                          }
                        });
                      }
                    } else {
                      if (notesController.text.isEmpty) {
                        Fluttertoast.showToast(msg: "Please insert purpose");
                      } else {
                        showLoaderDialog(context);
                        ref
                            .watch(rejectVoucherRequestProvider(
                          purpose: notesController.text.toString(),
                          conveyanceId: ref.watch(conveyanceId),
                        ).future)
                            .then((value) {
                          hideLoaderDialog(context);
                          if (value.status.toString() == "1") {
                            ref.invalidate(voucherApprovalListProvider);
                          }
                        }).onError((e, s) {
                          hideLoaderDialog(context);
                        });
                      }
                    }
                  },
                  child: Text(
                    ref.watch(requestTypeProvider) ? "Approve" : "Reject",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: Adaptive.sp(14),
                        fontWeight: FontWeight.w800),
                  ),
                )
              ]),
            ),
            body: ListView(
              children: [
                ref.watch(voucherApprovalListProvider).when(
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
                                                  fontWeight:
                                                      FontWeight.bold))),
                                        ),
                                        Padding(
                                          padding: Pad(all: 10),
                                          child: Text.rich(TextSpan(
                                              text:
                                                  'Emp: ${data.data?.data?[index].firstName} ${data.data?.data?[index].lastName} (${data.data?.data?[index].datumEmpId})',
                                              style: TextStyle(
                                                  color: primaryColorDark,
                                                  fontSize: Adaptive.sp(14),
                                                  fontWeight:
                                                      FontWeight.w700))),
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
                                                    fontWeight:
                                                        FontWeight.w800),
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
                                                        fontSize:
                                                            Adaptive.sp(14),
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
                                                    fontWeight:
                                                        FontWeight.w800),
                                              ),
                                              Text(
                                                '${data.data?.data?[index].createdAt}',
                                                textAlign: TextAlign.end,
                                                style: TextStyle(
                                                    color: primaryColor,
                                                    fontSize: Adaptive.sp(14),
                                                    fontWeight:
                                                        FontWeight.w800),
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
                                                    fontWeight:
                                                        FontWeight.w800),
                                              ),
                                              Text(
                                                '${data.data?.data?[index].kms} Kms',
                                                textAlign: TextAlign.end,
                                                style: TextStyle(
                                                    color: primaryColor,
                                                    fontSize: Adaptive.sp(14),
                                                    fontWeight:
                                                        FontWeight.w800),
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
                                                    fontWeight:
                                                        FontWeight.w800),
                                              ),
                                              Text(
                                                '${data.data?.data?[index].conveyanceType}',
                                                textAlign: TextAlign.end,
                                                style: TextStyle(
                                                    color: primaryColor,
                                                    fontSize: Adaptive.sp(14),
                                                    fontWeight:
                                                        FontWeight.w800),
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
                                                    fontWeight:
                                                        FontWeight.w800),
                                              ),
                                              Text(
                                                '${currencyFormat.format(double.parse(data.data?.data?[index].charges ?? "0.0"))}',
                                                textAlign: TextAlign.end,
                                                style: TextStyle(
                                                    color: primaryColor,
                                                    fontSize: Adaptive.sp(14),
                                                    fontWeight:
                                                        FontWeight.w800),
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
                                                    fontWeight:
                                                        FontWeight.w800),
                                              ),
                                              Text(
                                                '${currencyFormat.format(double.parse(data.data?.data?[index].otherExpense ?? "0.0"))}',
                                                textAlign: TextAlign.end,
                                                style: TextStyle(
                                                    color: primaryColor,
                                                    fontSize: Adaptive.sp(14),
                                                    fontWeight:
                                                        FontWeight.w800),
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
                                                    fontWeight:
                                                        FontWeight.w800),
                                              ),
                                              Align(
                                                alignment:
                                                    Alignment.centerRight,
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
                                                    fontWeight:
                                                        FontWeight.w800),
                                              ),
                                              Align(
                                                alignment:
                                                    Alignment.centerRight,
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
                                                    fontWeight:
                                                        FontWeight.w800),
                                              ),
                                              Align(
                                                alignment:
                                                    Alignment.centerRight,
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
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Divider(
                                          height: 2,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        RowSuper(
                                          children: [
                                            AnimatedButton(
                                              height: 40,
                                              width: Adaptive.w(40),
                                              color: primaryColorDark,
                                              isOutline: true,
                                              isMultiColor: true,
                                              colors: [
                                                primaryColorDark,
                                                primaryColorDark,
                                              ],
                                              borderWidth: 1,
                                              onTap: () async {
                                                ref
                                                        .watch(conveyanceId
                                                            .notifier)
                                                        .state =
                                                    "${data.data?.data?[index].id}";
                                                ref
                                                    .watch(requestTypeProvider
                                                        .notifier)
                                                    .state = true;
                                                if (panelController
                                                    .isPanelClosed) {
                                                  panelController.open();
                                                } else {
                                                  panelController.close();
                                                }
                                              },
                                              child: Text(
                                                "Approve",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: Adaptive.sp(14),
                                                    fontWeight:
                                                        FontWeight.w800),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            AnimatedButton(
                                              height: 40,
                                              width: Adaptive.w(40),
                                              color: primaryColorDark,
                                              isOutline: true,
                                              isMultiColor: true,
                                              colors: [
                                                Colors.red,
                                                Colors.red,
                                              ],
                                              borderWidth: 1,
                                              onTap: () async {
                                                ref
                                                        .watch(conveyanceId
                                                            .notifier)
                                                        .state =
                                                    "${data.data?.data?[index].id}";
                                                ref
                                                    .watch(requestTypeProvider
                                                        .notifier)
                                                    .state = false;
                                                if (panelController
                                                    .isPanelClosed) {
                                                  panelController.open();
                                                } else {
                                                  panelController.close();
                                                }
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
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                      ]),
                                ),
                              );
                            }),
                    error: (e, s) => Text(e.toString() + s.toString()),
                    loading: () => voucherListShimmer())
              ],
            ),
          ),
          onRefresh: () =>
              Future.value({ref.invalidate(voucherApprovalListProvider)}));
  var conveyanceId = StateProvider((ref) => "");
}

var requestTypeProvider = StateProvider((ref) => false);
TextEditingController notesController = TextEditingController();
TextEditingController finalAmountController = TextEditingController();
