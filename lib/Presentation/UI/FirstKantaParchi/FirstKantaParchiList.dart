// ignore_for_file: must_be_immutable, unused_local_variable

import 'dart:io';

import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:button_animations/button_animations.dart';
import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:emp_apnagodam/Domain/FirstKantaParchi/KantaParchiService.dart';
import 'package:emp_apnagodam/Domain/dio/DioProvider.dart';
import 'package:emp_apnagodam/Presentation/utils/DynamicShimmerList.dart';
import 'package:emp_apnagodam/Presentation/utils/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../Data/Models/FKantaParchiListModel.dart';
import '../../../Data/SharedPrefs/SharedUtility.dart';
import '../../Constants/ColorConstant.dart';
import '../../Widgets/widgets.dart';

class Firstkantaparchilist extends ConsumerWidget {
  Firstkantaparchilist({super.key, required this.inOut});

  String? inOut;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Platform.isIOS
          ? CupertinoPageScaffold(
              navigationBar: cupertinoAppBar("First Kanta Parchi", context),
              child: firstKantaParchiListing(context, ref))
          : Scaffold(
              appBar: AppBar(
                title: const Text('First Kanta Parchi'),
              ),
              body: firstKantaParchiListing(context, ref),
            ),
    );
  }

  firstKantaParchiListing(BuildContext context, WidgetRef ref) => ListView(
        children: [
          ref.watch(fKantaParchiListProvider(inOut: inOut)).when(
              data: (data) {
                if (data.status.toString() == "3") {
                  ref.watch(sharedUtilityProvider).sharedPreferences.clear();
                  context.go('/login');
                }
                List<Datum?> distinctList = [];
                distinctList.clear();
                int ind = 0;
                data.data?.data?.forEach((element) {
                  if (ind < data.data!.data!.length - 1) {
                    ind++;
                  }
                  distinctList.add(element);

                  if (data.data?.data?[ind].caseId != element.caseId) {
                    if (ref.watch(sharedUtilityProvider).getUser()?.terminal ==
                        element.terminalId) {
                      distinctList.add(element);
                    } else {}
                  }
                });

                distinctList = distinctList.reversed.toSet().toList();

                return data.status.toString() == "3"
                    ? logoutWidget(
                        'Session Expire please login again!', context)
                    : distinctList.isEmpty
                        ? noItems("Case Ids", context)
                        : ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: distinctList.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              DateTime dateTimeCreatedAt = DateTime.parse(
                                  distinctList[index]?.updatedAt.toString() ??
                                      "");
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
                              var currentInStatus =
                                  distinctList[index]?.lbCaseId != null
                                      ? "Done"
                                      : "Labour Book Pending";

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
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: Adaptive.sp(14),
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
                                                  alignment:
                                                      Alignment.topCenter,
                                                  children: [
                                                    Text(
                                                      '${distinctList[index]?.vehicleNo}',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize:
                                                              Adaptive.sp(14),
                                                          fontWeight:
                                                              FontWeight.w800),
                                                    ),
                                                    Text(
                                                      '${distinctList[index]?.driverPhone}',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize:
                                                              Adaptive.sp(14),
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
                                            ]),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        RowSuper(
                                            fill: true,
                                            alignment: Alignment.center,
                                            children: [
                                              Text(
                                                'TAT : $differenceInDays days, ${diffrenceInHours > 23 ? 0 : diffrenceInHours} hours, and ${differenceInMinutes > 60 ? 0 : differenceInMinutes} minutes',
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
                                            showModalBottomSheet(
                                                isScrollControlled: true,
                                                useSafeArea: true,
                                                context: context,
                                                builder: (bottomsheetContext) =>
                                                    ElevarmDraggableBottomSheet(
                                                        initialChildSize: 1,
                                                        title:
                                                            'First Kanta Details',
                                                        onPressedClose: () =>
                                                            Navigator.of(
                                                                    bottomsheetContext)
                                                                .pop(),
                                                        children: [
                                                          Text(
                                                            'Case ID: ${distinctList[index]?.caseId}',
                                                            textAlign:
                                                                TextAlign.left,
                                                            style:
                                                                ElevarmFontFamilies
                                                                    .inter(
                                                              color:
                                                                  ElevarmColors
                                                                      .neutral,
                                                              fontSize:
                                                                  ElevarmFontSizes
                                                                      .sm,
                                                              fontWeight:
                                                                  ElevarmFontWeights
                                                                      .regular,
                                                            ),
                                                          ),
                                                          ElevarmDivider(),
                                                          Text(
                                                            'GatePass: ${distinctList[index]?.gatePass}',
                                                            textAlign:
                                                                TextAlign.left,
                                                            style:
                                                                ElevarmFontFamilies
                                                                    .inter(
                                                              color:
                                                                  ElevarmColors
                                                                      .neutral,
                                                              fontSize:
                                                                  ElevarmFontSizes
                                                                      .sm,
                                                              fontWeight:
                                                                  ElevarmFontWeights
                                                                      .regular,
                                                            ),
                                                          ),
                                                          ElevarmDivider(),
                                                          Text(
                                                            'Stack No: ${distinctList[index]?.stackNumber}',
                                                            textAlign:
                                                                TextAlign.left,
                                                            style:
                                                                ElevarmFontFamilies
                                                                    .inter(
                                                              color:
                                                                  ElevarmColors
                                                                      .neutral,
                                                              fontSize:
                                                                  ElevarmFontSizes
                                                                      .sm,
                                                              fontWeight:
                                                                  ElevarmFontWeights
                                                                      .regular,
                                                            ),
                                                          ),
                                                          ElevarmDivider(),
                                                          Text(
                                                            'Customer: ${distinctList[index]?.custFname}',
                                                            textAlign:
                                                                TextAlign.left,
                                                            style:
                                                                ElevarmFontFamilies
                                                                    .inter(
                                                              color:
                                                                  ElevarmColors
                                                                      .neutral,
                                                              fontSize:
                                                                  ElevarmFontSizes
                                                                      .sm,
                                                              fontWeight:
                                                                  ElevarmFontWeights
                                                                      .regular,
                                                            ),
                                                          ),
                                                          ElevarmDivider(),

                                                          // ElevarmDivider(),
                                                          // Text(
                                                          //   'Driver Name: ${distinctList[index]?.driverName}',
                                                          //   textAlign:
                                                          //       TextAlign.left,
                                                          //   style:
                                                          //       ElevarmFontFamilies
                                                          //           .inter(
                                                          //     color:
                                                          //         ElevarmColors
                                                          //             .neutral,
                                                          //     fontSize:
                                                          //         ElevarmFontSizes
                                                          //             .sm,
                                                          //     fontWeight:
                                                          //         ElevarmFontWeights
                                                          //             .regular,
                                                          //   ),
                                                          // ),
                                                          // ElevarmDivider(),
                                                          Text(
                                                            'No Of Bags: ${distinctList[index]?.noOfBags}',
                                                            textAlign:
                                                                TextAlign.left,
                                                            style:
                                                                ElevarmFontFamilies
                                                                    .inter(
                                                              color:
                                                                  ElevarmColors
                                                                      .neutral,
                                                              fontSize:
                                                                  ElevarmFontSizes
                                                                      .sm,
                                                              fontWeight:
                                                                  ElevarmFontWeights
                                                                      .regular,
                                                            ),
                                                          ),
                                                          ElevarmDivider(),
                                                          Text(
                                                            'Net Weight: ${distinctList[index]?.netWeight}(Qtl.)',
                                                            textAlign:
                                                                TextAlign.left,
                                                            style:
                                                                ElevarmFontFamilies
                                                                    .inter(
                                                              color:
                                                                  ElevarmColors
                                                                      .neutral,
                                                              fontSize:
                                                                  ElevarmFontSizes
                                                                      .sm,
                                                              fontWeight:
                                                                  ElevarmFontWeights
                                                                      .regular,
                                                            ),
                                                          ),
                                                          ElevarmDivider(),
                                                          Text(
                                                            'Total Weight: ${distinctList[index]?.totalWeight}(Qtl.)',
                                                            textAlign:
                                                                TextAlign.left,
                                                            style:
                                                                ElevarmFontFamilies
                                                                    .inter(
                                                              color:
                                                                  ElevarmColors
                                                                      .neutral,
                                                              fontSize:
                                                                  ElevarmFontSizes
                                                                      .sm,
                                                              fontWeight:
                                                                  ElevarmFontWeights
                                                                      .regular,
                                                            ),
                                                          ),
                                                          ElevarmDivider(),
                                                          Text(
                                                            'Staff ID: ${distinctList[index]?.staffId}',
                                                            textAlign:
                                                                TextAlign.left,
                                                            style:
                                                                ElevarmFontFamilies
                                                                    .inter(
                                                              color:
                                                                  ElevarmColors
                                                                      .neutral,
                                                              fontSize:
                                                                  ElevarmFontSizes
                                                                      .sm,
                                                              fontWeight:
                                                                  ElevarmFontWeights
                                                                      .regular,
                                                            ),
                                                          ),
                                                          ElevarmDivider(),
                                                          Text(
                                                            'Kanta Name : ${distinctList[index]?.kantaName}',
                                                            textAlign:
                                                                TextAlign.left,
                                                            style:
                                                                ElevarmFontFamilies
                                                                    .inter(
                                                              color:
                                                                  ElevarmColors
                                                                      .neutral,
                                                              fontSize:
                                                                  ElevarmFontSizes
                                                                      .sm,
                                                              fontWeight:
                                                                  ElevarmFontWeights
                                                                      .regular,
                                                            ),
                                                          ),
                                                          ElevarmDivider(),
                                                          Text(
                                                            'Kanta Parchi No: ${distinctList[index]?.kantaParchiNumber}',
                                                            textAlign:
                                                                TextAlign.left,
                                                            style:
                                                                ElevarmFontFamilies
                                                                    .inter(
                                                              color:
                                                                  ElevarmColors
                                                                      .neutral,
                                                              fontSize:
                                                                  ElevarmFontSizes
                                                                      .sm,
                                                              fontWeight:
                                                                  ElevarmFontWeights
                                                                      .regular,
                                                            ),
                                                          ),
                                                          ElevarmDivider(),

                                                          Text(
                                                            'Driver Phone: ${distinctList[index]?.driverPhone}',
                                                            textAlign:
                                                                TextAlign.left,
                                                            style:
                                                                ElevarmFontFamilies
                                                                    .inter(
                                                              color:
                                                                  ElevarmColors
                                                                      .neutral,
                                                              fontSize:
                                                                  ElevarmFontSizes
                                                                      .sm,
                                                              fontWeight:
                                                                  ElevarmFontWeights
                                                                      .regular,
                                                            ),
                                                          ),
                                                          ElevarmDivider(),
                                                          Text(
                                                            'Truck No: ${distinctList[index]?.vehicleNo}',
                                                            textAlign:
                                                                TextAlign.left,
                                                            style:
                                                                ElevarmFontFamilies
                                                                    .inter(
                                                              color:
                                                                  ElevarmColors
                                                                      .neutral,
                                                              fontSize:
                                                                  ElevarmFontSizes
                                                                      .sm,
                                                              fontWeight:
                                                                  ElevarmFontWeights
                                                                      .regular,
                                                            ),
                                                          ),
                                                          ElevarmDivider(),
                                                          ElevarmThumbnailList(
                                                            imageUrls: [
                                                              "${ref.watch(dioProvider).options.baseUrl}/resources/assets/upload/kanta_parchi/${distinctList[index]?.file}",
                                                              "${ref.watch(dioProvider).options.baseUrl}/resources/assets/upload/kanta_parchi/${distinctList[index]?.file2}",
                                                              "${ref.watch(dioProvider).options.baseUrl}/resources/assets/upload/kanta_parchi/${distinctList[index]?.file3}"
                                                            ],
                                                            size: 62.0,
                                                            onTap: (context,
                                                                index) {},
                                                          )
                                                        ]));
                                            // context.goNamed('truck_book',
                                            //     extra: {
                                            //       'case_id':
                                            //           distinctList[index]
                                            //               ?.caseId,
                                            //       'customer_name':
                                            //           distinctList[index]
                                            //               ?.custFname,
                                            //     });
                                          },
                                          child: Text(
                                            'View Details',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: Adaptive.sp(14),
                                                fontWeight: FontWeight.w800),
                                          ),
                                        ),
                                        // distinctList[index]?.kPCaseId == null &&
                                        //         distinctList[index]?.lbCaseId !=
                                        //             null
                                        //     ? AnimatedButton(
                                        //         height: 50,
                                        //         color: primaryColorDark,
                                        //         width: MediaQuery.of(context)
                                        //                 .size
                                        //                 .width /
                                        //             1.2,
                                        //         isOutline: true,
                                        //         isMultiColor: true,
                                        //         colors: [
                                        //           primaryColorDark,
                                        //           primaryColorDark
                                        //         ],
                                        //         borderWidth: 1,
                                        //         onTap: () {
                                        //           context.goNamed(
                                        //               'f_kanta_parchi',
                                        //               extra: {
                                        //                 'case_id':
                                        //                     distinctList[index]
                                        //                         ?.caseId,
                                        //                 'customer_name':
                                        //                     distinctList[index]
                                        //                         ?.custFname,
                                        //                 'in_out':
                                        //                     distinctList[index]
                                        //                         ?.inOut,
                                        //                 'terminal_id':
                                        //                     distinctList[index]
                                        //                         ?.terminalId
                                        //                         .toString()
                                        //               });
                                        //         },
                                        //         child: Text(
                                        //           "Add First Kanta Parchi",
                                        //           textAlign: TextAlign.center,
                                        //           style: TextStyle(
                                        //               color: Colors.white,
                                        //               fontSize: Adaptive.sp(14),
                                        //               fontWeight:
                                        //                   FontWeight.w800),
                                        //         ),
                                        //       )
                                        //     : Text(
                                        //         currentInStatus,
                                        //         textAlign: TextAlign.center,
                                        //         style: TextStyle(
                                        //             color: primaryColorDark,
                                        //             fontSize: Adaptive.sp(14),
                                        //             fontWeight:
                                        //                 FontWeight.w800),
                                        //       ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                      ]),
                                ),
                              );
                            });
              },
              error: (e, s) => Container(),
              loading: () => DynamicShimmerList(
                        itemCount: 10,
                        width: context.fullWidth,
                        height: 80,
                      ))
        ],
      );
}
