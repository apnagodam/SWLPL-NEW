// ignore_for_file: unused_local_variable

import 'dart:io';

import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:emp_apnagodam/Data/SharedPrefs/SharedUtility.dart';
import 'package:emp_apnagodam/Domain/Advance/AdvanceService.dart';
import 'package:emp_apnagodam/Presentation/utils/DynamicShimmerList.dart';
import 'package:emp_apnagodam/Presentation/utils/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Constants/ColorConstant.dart';
import '../../Widgets/widgets.dart';
import '../Voucher/VoucherList.dart';

class Advanceslist extends ConsumerWidget {
  const Advanceslist({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Platform.isIOS
          ? CupertinoPageScaffold(
              navigationBar: cupertinoAppBar("Withdraw History", context),
              child: advanceRequestLayout(context, ref))
          : Scaffold(
              appBar: AppBar(
                title: Text('Withdraw History'),
              ),
              body: advanceRequestLayout(context, ref),
            ),
    );
  }

  advanceRequestLayout(BuildContext context, WidgetRef ref) =>
      RefreshIndicator.adaptive(
          child: ListView(
            children: [
              ref.watch(advancesListProvider).when(
                  data: (data) {
                    return (data.data?.data ?? []).isEmpty
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
                              DateTime dateTimeCreatedAt = DateTime.parse(
                                  data.data?.data?[index].updatedAt ?? "");

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
                                                  'Emp Id: ${ref.watch(sharedUtilityProvider).getUser()?.firstName} ${ref.watch(sharedUtilityProvider).getUser()?.lastName} (${ref.watch(sharedUtilityProvider).getUser()?.empId})',
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
                                        RowSuper(fill: true, children: [
                                          Text(
                                            'CV-${data.data?.data?[index].uniqueId ?? data.data?.data?[index].id}',
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
                                              '${data.data?.data?[index].notes}',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: Adaptive.sp(14),
                                                  fontWeight: FontWeight.w800),
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
                                                "${currencyFormat.format(double.tryParse(data.data?.data?[index].requestedAmount ?? "0.0"))}",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: primaryColorDark,
                                                    fontSize: Adaptive.sp(14),
                                                    fontWeight:
                                                        FontWeight.w800),
                                              ),
                                            ],
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
                                                '${data.data?.data?[index].notes}',
                                                textAlign: TextAlign.center,
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
                                                '${data.data?.data?[index].createdAt}',
                                                textAlign: TextAlign.center,
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
                                        Divider(
                                          height: 2,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          data.data?.data?[index].status
                                                      ?.toInt() ==
                                                  2
                                              ? 'Approved - Waiting to be verified'
                                              : data.data?.data?[index].status
                                                          ?.toInt() ==
                                                      1
                                                  ? "In Progress"
                                                  : data.data?.data?[index]
                                                              .status
                                                              ?.toInt() ==
                                                          0
                                                      ? "Rejected"
                                                      : "Verified",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: data.data?.data?[index]
                                                          .status
                                                          ?.toInt() ==
                                                      2
                                                  ? Colors.yellow.shade900
                                                  : data.data?.data?[index]
                                                              .status
                                                              ?.toInt() ==
                                                          0
                                                      ? Colors.red
                                                      : data.data?.data?[index]
                                                                  .status
                                                                  ?.toInt() ==
                                                              1
                                                          ? primaryColorDark
                                                          : Colors.green,
                                              fontSize: Adaptive.sp(14),
                                              fontWeight: FontWeight.w800),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                      ]),
                                ),
                              );
                            });
                  },
                  error: (e, s) => Text(e.toString() + s.toString()),
                  loading: () => DynamicShimmerList(
                        itemCount: 10,
                        width: context.fullWidth,
                        height: 80,
                      ))
            ],
          ),
          onRefresh: () => Future(() {
                ref.invalidate(advancesListProvider);
              }));
}
