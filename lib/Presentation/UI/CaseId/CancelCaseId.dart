import 'dart:io';

import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:button_animations/button_animations.dart';
import 'package:emp_apnagodam/Presentation/utils/DynamicShimmerList.dart';
import 'package:emp_apnagodam/Presentation/utils/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sliding_up_panel2/sliding_up_panel2.dart';

import '../../../Data/Models/CaseIdResponseModel.dart';
import '../../../Data/SharedPrefs/SharedUtility.dart';
import '../../../Domain/CaseId/CaseIdService.dart';
import '../../Constants/ColorConstant.dart';
import '../../Widgets/widgets.dart';

class Cancelcaseid extends ConsumerStatefulWidget {
  const Cancelcaseid({super.key});

  @override
  ConsumerState<Cancelcaseid> createState() => _CancelcaseidState();
}

class _CancelcaseidState extends ConsumerState<Cancelcaseid> {
  PanelController panelController = PanelController();
  TextEditingController notesController = TextEditingController();
  var caseIdNameProvider = StateProvider<String?>((ref) => null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Platform.isIOS
          ? CupertinoPageScaffold(
              navigationBar: cupertinoAppBar("Cancel Case Id", context),
              child: cancelCaseIdLayout(context, ref))
          : Scaffold(
              appBar: AppBar(
                title: const Text('Cancel Case Id'),
              ),
              body: cancelCaseIdLayout(context, ref),
            ),
    );
  }

  cancelCaseIdLayout(BuildContext context, WidgetRef ref) =>
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
                  "Cancel Case Id",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: primaryColorDark,
                      fontSize: Adaptive.sp(18)),
                ),
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
                      label: const Text("Reason"),
                      contentPadding: const Pad(all: 10),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5))),
                ),
                SizedBox(
                  height: 10,
                ),
                RowSuper(fill: true, children: [
                  AnimatedButton(
                    height: 40,
                    width: 100,
                    color: primaryColorDark,
                    isOutline: true,
                    isMultiColor: true,
                    colors: [
                      primaryColorDark,
                      primaryColorDark,
                    ],
                    borderWidth: 1,
                    onTap: () async {
                      if (notesController.text.isEmpty) {
                        Fluttertoast.showToast(
                            msg: "Please state reason for cancellation!");
                      } else {
                        showLoaderDialog(context);
                        ref
                            .watch(cancelCaseIdProvider(
                                    caseId: ref.watch(caseIdNameProvider),
                                    notes: notesController.text.toString())
                                .future)
                            .then((value) {
                          hideLoaderDialog(context);
                          if (value.status.toString() == "1") {
                            ref.invalidate(caseIdProvider);
                            panelController.close();
                          }
                        }).onError((e, s) {
                          hideLoaderDialog(context);
                        });
                      }
                    },
                    child: Text(
                      "Yes",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: Adaptive.sp(14),
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                  AnimatedButton(
                    height: 40,
                    color: primaryColorDark,
                    width: 100,
                    isOutline: true,
                    isMultiColor: true,
                    colors: [
                      primaryColorDark,
                      primaryColorDark,
                    ],
                    borderWidth: 1,
                    onTap: () async {
                      panelController.close();
                    },
                    child: Text(
                      "No",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: Adaptive.sp(14),
                          fontWeight: FontWeight.w800),
                    ),
                  )
                ])
              ]),
            ),
            body: ListView(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Container(
                  child: ref.watch(caseIdProvider).when(
                      data: (data) {
                        List<Datum?> distinctList = [];
                        distinctList.clear();
                        int ind = 0;
                        data.data?.data?.forEach((element) {
                          if (ind < data.data!.data!.length - 1) {
                            ind++;
                          }
                          distinctList.add(element);

                          if (ref
                                  .watch(sharedUtilityProvider)
                                  .getUser()
                                  ?.terminal ==
                              element.terminalId) {
                            if (element.gatepassReport == null) {
                              distinctList.add(element);
                            }
                          } else {
                            if (data.data?.data?[ind].caseId !=
                                element.caseId) {
                              if (element.gatepassReport == null) {
                                distinctList.add(element);
                              }
                            }
                          }
                        });

                        distinctList = distinctList.reversed.toSet().toList();

                        return (data.data?.data ?? []).isEmpty
                            ? noItems("Case Ids", context)
                            : ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: distinctList.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  DateTime dateTimeCreatedAt = DateTime.parse(
                                      distinctList[index]?.updatedAt ?? "");
                                  DateTime dateTimeNow = DateTime.now();

                                  final differenceInDays = dateTimeNow
                                      .difference(dateTimeCreatedAt)
                                      .inDays;

                                  final diffrenceInHours = dateTimeNow
                                          .difference(dateTimeCreatedAt)
                                          .inHours %
                                      24;

                                  final differenceInMinutes = dateTimeNow
                                          .difference(dateTimeCreatedAt)
                                          .inMinutes %
                                      60;

                                  return Container(
                                    margin: Pad(all: 10),
                                    decoration: BoxDecoration(
                                        border: Border.all(color: primaryColor),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Padding(
                                      padding: const Pad(all: 10),
                                      child: ColumnSuper(
                                          alignment: Alignment.center,
                                          children: [
                                            Padding(
                                              padding: Pad(all: 10),
                                              child: Text.rich(TextSpan(
                                                  text:
                                                      'Case Id: ${distinctList[index]?.caseId}',
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
                                            Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      '${distinctList[index]?.stackNumber}',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize:
                                                              Adaptive.sp(14),
                                                          fontWeight:
                                                              FontWeight.w800),
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
                                                        '${distinctList[index]?.custFname}  (${distinctList[index]?.phone})',
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize:
                                                                Adaptive.sp(14),
                                                            fontWeight:
                                                                FontWeight
                                                                    .w800),
                                                        textAlign:
                                                            TextAlign.center,
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
                                                      alignment:
                                                          Alignment.topCenter,
                                                      children: [
                                                        Text(
                                                          '${distinctList[index]?.vehicleNo}',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize:
                                                                  Adaptive.sp(
                                                                      14),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800),
                                                        ),
                                                        Text(
                                                          '${distinctList[index]?.driverPhone}',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize:
                                                                  Adaptive.sp(
                                                                      14),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800),
                                                        )
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
                                            RowSuper(
                                                fill: true,
                                                alignment: Alignment.center,
                                                children: [
                                                  Text(
                                                    'TET : $differenceInDays days, ${diffrenceInHours > 23 ? 0 : diffrenceInHours} hours, and ${differenceInMinutes > 60 ? 0 : differenceInMinutes} minutes',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: primaryColor,
                                                        fontSize:
                                                            Adaptive.sp(14),
                                                        fontWeight:
                                                            FontWeight.w800),
                                                  ),
                                                ]),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            AnimatedButton(
                                              height: 50,
                                              color: primaryColorDark,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  1.2,
                                              isOutline: true,
                                              isMultiColor: true,
                                              colors: [
                                                primaryColorDark,
                                                primaryColorDark
                                              ],
                                              borderWidth: 1,
                                              onTap: () {
                                                ref
                                                    .watch(caseIdNameProvider
                                                        .notifier)
                                                    .state = distinctList[index]
                                                        ?.caseId ??
                                                    "";
                                                if (panelController
                                                    .isPanelClosed) {
                                                  panelController.open();
                                                } else {
                                                  panelController.close();
                                                }
                                              },
                                              child: Text(
                                                'Cancel Case Id',
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
                                });
                      },
                      error: (e, s) => Container(
                            child: Text(e.toString()),
                          ),
                      loading: () => DynamicShimmerList(
                        itemCount: 10,
                        width: context.fullWidth,
                        height: 80,
                      )),
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
          onRefresh: () => Future(() {
                ref.invalidate(caseIdProvider);
              }));
}
