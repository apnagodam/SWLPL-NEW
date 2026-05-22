// ignore_for_file: unused_local_variable

import 'dart:io';

import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:emp_apnagodam/Domain/GenerateLead/LeadsService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../Data/Models/LeadsListModel.dart';
import '../../Constants/ColorConstant.dart';
import '../../Widgets/widgets.dart';

class Leadslistscreen extends ConsumerWidget {
  const Leadslistscreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Platform.isIOS
          ? CupertinoPageScaffold(
              navigationBar: cupertinoAppBar("Leads List", context),
              child: leadsListLayout(context, ref))
          : Scaffold(
              appBar: AppBar(
                title: Text('Leads List'),
              ),
              body: leadsListLayout(context, ref),
            ),
    );
  }

  leadsListLayout(BuildContext context, WidgetRef ref) => ListView(
        children: [
          ref.watch(leadsListProvider).when(
              data: (data) {
                List<Datum?> distinctList = [];
                distinctList.clear();
                int ind = 0;
                distinctList = data.data?.data ?? [];

                return distinctList.isEmpty
                    ? noItems("Case Ids", context)
                    : ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: distinctList.length,
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
                                              'Terminal Name: ${distinctList[index]?.terminalName}',
                                          style: TextStyle(
                                              color: primaryColorDark,
                                              fontSize: Adaptive.sp(14),
                                              fontWeight: FontWeight.bold))),
                                    ),
                                    Divider(
                                      height: 2,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: ColumnSuper(
                                              children: [
                                                Text(
                                                  'Lead Id:${distinctList[index]?.id}',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: Adaptive.sp(14),
                                                      fontWeight:
                                                          FontWeight.w800),
                                                ),
                                                Text(
                                                  'Qty:${distinctList[index]?.quantity} Qtl.',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: Adaptive.sp(14),
                                                      fontWeight:
                                                          FontWeight.w800),
                                                )
                                              ],
                                            ),
                                          ),
                                          Container(
                                            height: 50,
                                            color: Colors.grey,
                                            width: 1,
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: Pad(all: 10),
                                              child: Text(
                                                '${distinctList[index]?.customerName}  (${distinctList[index]?.phone})',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: Adaptive.sp(14),
                                                    fontWeight:
                                                        FontWeight.w800),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: 50,
                                            color: Colors.grey,
                                            width: 1,
                                          ),
                                          Expanded(
                                            child: ColumnSuper(
                                              alignment: Alignment.topCenter,
                                              children: [
                                                Text(
                                                  '${distinctList[index]?.cateName}',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: Adaptive.sp(14),
                                                      fontWeight:
                                                          FontWeight.w800),
                                                ),
                                                Text(
                                                  '${distinctList[index]?.purpose}',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: Adaptive.sp(14),
                                                      fontWeight:
                                                          FontWeight.w800),
                                                ),
                                              ],
                                            ),
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
                                    const SizedBox(
                                      height: 10,
                                    ),
                                  ]),
                            ),
                          );
                        });
              },
              error: (e, s) => Container(),
              loading: () => generateLeadsListShimmer())
        ],
      );
}
