import 'dart:convert';
import 'dart:io';

import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:button_animations/button_animations.dart';
import 'package:emp_apnagodam/Data/Models/CaseRequestModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../Data/SharedPrefs/SharedUtility.dart';
import '../../../Domain/CaseId/CaseIdService.dart';
import '../../Constants/ColorConstant.dart';
import '../../Widgets/widgets.dart';

class OutwardsStackRequest extends ConsumerWidget {
  const OutwardsStackRequest({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Platform.isIOS
          ? iosLayout(context, ref)
          : androidLayout(context, ref),
    );
  }

  iosLayout(BuildContext context, WidgetRef ref) => CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: primaryColor,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              CupertinoIcons.back,
              color: Colors.white,
            )),
        middle: const Text(
          "Outward Requests",
          style: TextStyle(color: Colors.white),
        ),
      ),
      child: createOutwardsLayout(context, ref));

  createOutwardsLayout(BuildContext context, WidgetRef ref) => Padding(
        padding: Pad(all: 0),
        child: ListView(
          children: [
            ref.watch(caseRequestsProvider).when(
                data: (data) {
                  List<OutwardRequestDatum> outwardsList = [];

                  data.outwardRequestData?.forEach((element) {
                    if (ref.watch(sharedUtilityProvider).getUser()?.terminal ==
                        null) {
                      outwardsList.add(element);
                    } else if (ref
                            .watch(sharedUtilityProvider)
                            .getUser()
                            ?.terminal ==
                        element.terminalId) {
                      outwardsList.add(element);
                    }
                  });

                  return data.status.toString() == "3"
                      ? logoutWidget(
                          'Session Expire please login again!', context)
                      : (data.outwardRequestData ?? []).isEmpty
                          ? Center(
                              child: noItems("Outwards Cases", context),
                            )
                          : ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: outwardsList.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: Pad(all: 10),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: primaryColor),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Padding(
                                    padding: const Pad(all: 0),
                                    child: ColumnSuper(
                                        alignment: Alignment.center,
                                        children: [
                                          Card(
                                            margin: Pad(all: 0),
                                            elevation: 0,
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(8),
                                                    topRight:
                                                        Radius.circular(8))),
                                            color: primaryColor,
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      'Stack No.',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize:
                                                              Adaptive.sp(14),
                                                          fontWeight:
                                                              FontWeight.w800),
                                                    ),
                                                  ),
                                                  Container(
                                                    height: 35,
                                                    color: Colors.grey,
                                                    width: 0,
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding: Pad(all: 10),
                                                      child: Text(
                                                        'Customer',
                                                        style: TextStyle(
                                                            color: Colors.white,
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
                                                    height: 35,
                                                    color: Colors.grey,
                                                    width: 0,
                                                  ),
                                                  Expanded(
                                                    child: ColumnSuper(
                                                      alignment:
                                                          Alignment.topCenter,
                                                      children: [
                                                        Text(
                                                          'Driver',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize:
                                                                  Adaptive.sp(
                                                                      14),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    height: 50,
                                                    color: Colors.grey,
                                                    width: 0,
                                                  ),
                                                ]),
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
                                                    '${outwardsList[index].stackNumber}',
                                                    textAlign: TextAlign.center,
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
                                                      '${outwardsList[index].userName} ',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize:
                                                              Adaptive.sp(14),
                                                          fontWeight:
                                                              FontWeight.w800),
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
                                                        '${outwardsList[index].vehicleNumber}',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize:
                                                                Adaptive.sp(14),
                                                            fontWeight:
                                                                FontWeight
                                                                    .w800),
                                                      ),
                                                      Text(
                                                        '${outwardsList[index].driverNumber}',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize:
                                                                Adaptive.sp(14),
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
                                          AnimatedButton(
                                            height: 50,
                                            color: primaryColorDark,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.2,
                                            child: Text(
                                              'Create Case Id',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: Adaptive.sp(14),
                                                  fontWeight: FontWeight.w800),
                                            ),
                                            isOutline: true,
                                            isMultiColor: true,
                                            colors: [
                                              primaryColorDark,
                                              primaryColorDark
                                            ],
                                            borderWidth: 1,
                                            onTap: () {
                                              context.goNamed('stack_request',
                                                  extra: {
                                                    'inwards': null,
                                                    'outwards': jsonEncode(
                                                        outwardsList[index]
                                                            .toMap()),
                                                  });
                                            },
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
                loading: () => Container()),
            // ref.watch(caseRequestsProvider).when(
            //     data: (data) => ListView.separated(
            //         physics: const NeverScrollableScrollPhysics(),
            //         itemCount: data.outwardRequestData?.length ?? 0,
            //         shrinkWrap: true,
            //         separatorBuilder: (context, index) => Container(
            //               width: MediaQuery.of(context).size.width,
            //               height: 2,
            //               color: Colors.black,
            //             ),
            //         itemBuilder: (context, index) {
            //           return Container(
            //             color: index % 2 == 0
            //                 ? Colors.grey.withOpacity(0.1)
            //                 : Colors.white,
            //             child: Padding(
            //               padding: const Pad(all: 10),
            //               child: ColumnSuper(
            //                   alignment: Alignment.topCenter,
            //                   children: [
            //                     Row(children: [
            //                       Expanded(
            //                         child: Text(
            //                           '${data.outwardRequestData?[index]?.stackId}',
            //                           textAlign: TextAlign.center,
            //                           style: TextStyle(
            //                               color: Colors.black,
            //                               fontSize: Adaptive.sp(14),
            //                               fontWeight: FontWeight.w800),
            //                         ),
            //                       ),
            //                       Container(
            //                         height: 50,
            //                         color: Colors.grey,
            //                         width: 1,
            //                       ),
            //                       Expanded(
            //                         child: ColumnSuper(
            //                           alignment: Alignment.topCenter,
            //                           children: [
            //                             Text(
            //                               '${data.outwardRequestData?[index].userName}',
            //                               maxLines: 2,
            //                               textAlign: TextAlign.center,
            //                               style: TextStyle(
            //                                   color: Colors.black,
            //                                   fontSize: Adaptive.sp(14),
            //                                   fontWeight: FontWeight.w800),
            //                             ),
            //                             Text(
            //                               '${data.outwardRequestData?[index].userNumber}',
            //                               maxLines: 2,
            //                               textAlign: TextAlign.center,
            //                               style: TextStyle(
            //                                   color: Colors.black,
            //                                   fontSize: Adaptive.sp(14),
            //                                   fontWeight: FontWeight.w800),
            //                             )
            //                           ],
            //                         ),
            //                       ),
            //                       Container(
            //                         height: 50,
            //                         color: Colors.grey,
            //                         width: 1,
            //                       ),
            //                       Expanded(
            //                         child: ColumnSuper(
            //                           alignment: Alignment.topCenter,
            //                           children: [
            //                             Text(
            //                               '${data.outwardRequestData?[index]?.vehicleNumber}',
            //                               textAlign: TextAlign.center,
            //                               style: TextStyle(
            //                                   color: Colors.black,
            //                                   fontSize: Adaptive.sp(14),
            //                                   fontWeight: FontWeight.w800),
            //                             ),
            //                             Text(
            //                               '${data.outwardRequestData?[index]?.driverNumber}',
            //                               textAlign: TextAlign.center,
            //                               style: TextStyle(
            //                                   color: Colors.black,
            //                                   fontSize: Adaptive.sp(14),
            //                                   fontWeight: FontWeight.w800),
            //                             )
            //                           ],
            //                         ),
            //                       ),
            //                       Container(
            //                         height: 50,
            //                         color: Colors.grey,
            //                         width: 1,
            //                       ),
            //                       Expanded(
            //                         child: Text(
            //                           '${data.outwardRequestData?[index].stackNumber}',
            //                           textAlign: TextAlign.center,
            //                           style: TextStyle(
            //                               color: Colors.black,
            //                               fontSize: Adaptive.sp(14),
            //                               fontWeight: FontWeight.w800),
            //                         ),
            //                       )
            //                     ]),
            //                     const SizedBox(
            //                       height: 10,
            //                     ),
            //                     SizedBox(
            //                       width: MediaQuery.of(context).size.width,
            //                       child: ElevatedButton(
            //                         onPressed: () {
            //                           context.pushPage(CreateCaseId(
            //                             outwardRequestDatum:
            //                                 data.outwardRequestData?[index],
            //                           ));
            //                         },
            //                         child: Text(
            //                           "Create Case Id",
            //                           style: TextStyle(color: Colors.white),
            //                         ),
            //                         style: ElevatedButton.styleFrom(
            //                             backgroundColor: primaryColor,
            //                             shape: RoundedRectangleBorder(
            //                                 borderRadius: BorderRadius.all(
            //                                     Radius.circular(10)))),
            //                       ),
            //                     )
            //                   ]),
            //             ),
            //           );
            //         }),
            //     error: (e, s) => Container(),
            //     loading: () => Container())
          ],
        ),
      );

  androidLayout(BuildContext context, WidgetRef ref) => Scaffold(
        appBar: AppBar(
          title: Text('Outward Requests'),
        ),
        body: createOutwardsLayout(context, ref),
      );
}
