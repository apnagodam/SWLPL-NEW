import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:emp_apnagodam/Domain/Authentication/AuthenticationService.dart';
import 'package:emp_apnagodam/Presentation/Constants/ColorConstant.dart';
import 'package:emp_apnagodam/Presentation/Widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../Domain/Wallet/WalletService.dart';
import '../Voucher/VoucherList.dart';

class Walletstatementscreen extends ConsumerStatefulWidget {
  const Walletstatementscreen({super.key});

  @override
  ConsumerState<Walletstatementscreen> createState() =>
      _WalletstatementscreenState();
}

class _WalletstatementscreenState extends ConsumerState<Walletstatementscreen> {
  var startDate = StateProvider<DateTime?>((ref) => null);
  var endDate = StateProvider<DateTime?>((ref) => null);
  final format = DateFormat("dd-MM-yyyy");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Wallet Statement',
        ),
      ),
      body: SafeArea(
          child: ListView(
        padding: Pad(all: 10),
        children: [
          const SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              "Wallet Balance",
              style: TextStyle(
                  shadows: const [
                    Shadow(color: Colors.black, blurRadius: 1.0),
                    Shadow(color: Colors.black, blurRadius: 1.0)
                  ],
                  fontWeight: FontWeight.bold,
                  fontSize: Adaptive.sp(18),
                  color: Colors.black),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          ref.watch(profileDataProvider).when(
              data: (data) => Center(
                    child: Text(
                      currencyFormat.format(double.tryParse(
                          "${data.profileData?.power ?? "0.0"}")),
                      style: TextStyle(
                          shadows: const [
                            Shadow(color: Colors.black, blurRadius: 2.0),
                            Shadow(color: Colors.black, blurRadius: 2.0)
                          ],
                          fontWeight: FontWeight.bold,
                          fontSize: Adaptive.sp(22),
                          color: Colors.black),
                    ),
                  ),
              error: (e, s) => Container(),
              loading: () => Center(
                    child: loader(context),
                  )),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              "Select Statement Date",
              style: TextStyle(
                fontSize: Adaptive.sp(18),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          RowSuper(children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () async {
                  final DateTime? picked = await showDatePicker(
                      context: context,
                      firstDate: DateTime(2015, 8),
                      lastDate: DateTime.now());

                  if (ref.watch(endDate) != null) {
                    if (picked!.isAfter(ref.watch(endDate) ?? DateTime.now())) {
                      Fluttertoast.showToast(
                          msg: 'Start Date cant be after end Date');
                    } else {
                      ref.watch(startDate.notifier).state = picked;
                    }
                  } else {
                    ref.watch(startDate.notifier).state = picked;
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColorDark,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                child: Text(
                  ref.watch(startDate) == null
                      ? "Select Start Date"
                      : format
                          .format(ref.watch(startDate) ?? DateTime(2024))
                          .toString(),
                  style: TextStyle(
                      color: Colors.white,
                      shadows: [
                        const Shadow(color: Colors.white, blurRadius: 0.3)
                      ],
                      fontWeight: FontWeight.w700,
                      fontSize: Adaptive.sp(16)),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () async {
                  final DateTime? picked = await showDatePicker(
                      context: context,
                      firstDate: DateTime(2015, 8),
                      lastDate: DateTime.now());

                  if (ref.watch(startDate) != null) {
                    if (picked!
                        .isBefore(ref.watch(startDate) ?? DateTime.now())) {
                      Fluttertoast.showToast(
                          msg: 'Start Date cant be after end Date');
                    } else {
                      ref.watch(endDate.notifier).state = picked;
                    }
                  } else {
                    ref.watch(endDate.notifier).state = picked;
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColorDark,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                child: Text(
                  ref.watch(endDate) == null
                      ? "Select End Date"
                      : format
                          .format(ref.watch(endDate) ?? DateTime(2024))
                          .toString(),
                  style: TextStyle(
                      color: Colors.white,
                      shadows: [
                        const Shadow(color: Colors.white, blurRadius: 0.3)
                      ],
                      fontWeight: FontWeight.w700,
                      fontSize: Adaptive.sp(16)),
                ),
              ),
            ),
          ]),
          const SizedBox(
            width: 10,
          ),
          walletStatementLayout(ref, context)
        ],
      )),
    );
  }

  walletStatementLayout(WidgetRef ref, BuildContext context) => ref
      .watch(walletStatementProvider(
          fromDate: format.format(ref.watch(startDate) ?? DateTime.now()),
          toDate: format.format(ref.watch(endDate) ?? DateTime.now())))
      .when(
          data: (statementData) => (statementData.data ?? []).isEmpty
              ? noItems('statements found!', context)
              : ListView.builder(
                  itemCount: statementData.data?.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    DateTime abc =
                        DateTime.parse(statementData.data?[index].date ?? "");
                    var date = DateFormat('dd-MM-yyyy').format(abc);

                    return Padding(
                        padding: const EdgeInsets.only(
                            left: 10.0, right: 10.0, top: 10.0),
                        child: Column(
                          children: [
                            Row(children: [
                              Text(
                                date.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: Adaptive.sp(15)),
                              ),
                            ]),
                            Row(
                              children: [
                                Expanded(
                                    child: ColumnSuper(
                                  alignment: Alignment.centerLeft,
                                  children: [
                                    Text.rich(
                                      TextSpan(
                                        text: statementData
                                                .data?[index].narration ??
                                            "",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: Adaptive.sp(16),
                                            fontWeight: FontWeight.w600),
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text.rich(TextSpan(
                                        text: statementData.data?[index].label
                                            .toString(),
                                        style: TextStyle(
                                            fontSize: Adaptive.sp(15),
                                            color: const Color(0xff786b74)),
                                        children: [])),
                                    // Container(
                                    //   width: MediaQuery.of(context)
                                    //       .size
                                    //       .width *
                                    //       0.56,
                                    //   child: Text(
                                    //     caseId.toString(),
                                    //     maxLines: 2,
                                    //     style:
                                    //     TextStyle(fontSize: Adaptive.sp(16),color: Color(0xff786b74)),
                                    //   ),
                                    // ),
                                    // Container(
                                    //   width: MediaQuery.of(context)
                                    //       .size
                                    //       .width *
                                    //       0.56,
                                    //   child: Text(
                                    //     grading.toString(),
                                    //     maxLines: 2,
                                    //     style:
                                    //     TextStyle(fontSize: Adaptive.sp(16),color: Color(0xff786b74)),
                                    //   ),
                                    // ),
                                  ],
                                )),
                                Expanded(
                                    child: ColumnSuper(
                                  alignment: Alignment.centerRight,
                                  children: [
                                    Text(
                                      NumberFormat.currency(
                                              locale: 'HI',
                                              symbol: '\u{20B9}',
                                              decimalDigits: 2)
                                          .format(num.parse(statementData
                                                  .data?[index].amount ??
                                              "0.0")),
                                      style: TextStyle(
                                          color:
                                              statementData.data?[index].type ==
                                                      "Credit"
                                                  ? Colors.green
                                                  : Colors.red,
                                          fontSize: Adaptive.sp(16),
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      NumberFormat.currency(
                                              locale: 'HI',
                                              symbol: '\u{20B9}',
                                              decimalDigits: 2)
                                          .format(num.parse(statementData
                                                  .data?[index].balance ??
                                              "0.0")),
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: Adaptive.sp(16)),
                                    ),
                                  ],
                                )),
                              ],
                            ),
                            const Divider(
                              thickness: 2,
                            ),
                          ],
                        ));
                  }),
          error: (e, s) => Container(),
          loading: () => Center(
                child: loader(context),
              ));
}
