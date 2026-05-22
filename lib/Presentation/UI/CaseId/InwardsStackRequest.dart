// ignore_for_file: unused_local_variable

import 'dart:convert';
import 'dart:io';

import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:button_animations/button_animations.dart';
import 'package:emp_apnagodam/Domain/Authentication/AuthenticationService.dart';
import 'package:emp_apnagodam/Domain/CaseId/CaseIdService.dart';
import 'package:emp_apnagodam/Presentation/Constants/ColorConstant.dart';
import 'package:emp_apnagodam/Presentation/Widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../Data/Models/CaseRequestModel.dart';
import '../../../Data/SharedPrefs/SharedUtility.dart';

class InwardsStackRequest extends ConsumerWidget {
  const InwardsStackRequest({super.key});

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
          "Inwards Requests",
          style: TextStyle(color: Colors.white),
        ),
      ),
      child: createCaseIdLayout(context, ref));

  createCaseIdLayout(BuildContext context, WidgetRef ref) => Padding(
        padding: Pad(all: 0),
        child: ListView(
          children: [
            ref.watch(caseRequestsProvider).when(
                data: (data) {
                  List<InwardRequestDatum> inwardsList = [];
                  var outwardsList = [];

                  data.inwardRequestData?.forEach((element) {
                    if (ref.watch(sharedUtilityProvider).getUser()?.terminal ==
                        null) {
                      inwardsList.add(element);
                    } else if (ref
                            .watch(sharedUtilityProvider)
                            .getUser()
                            ?.terminal ==
                        element.terminalId) {
                      inwardsList.add(element);
                    }
                  });
                  return data.status.toString() == "3"
                      ? logoutWidget(
                          'Session Expire please login again!', context)
                      : inwardsList.isEmpty
                          ? noItems("Inwards Cases", context)
                          : ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: inwardsList.length,
                              shrinkWrap: true,
                             itemBuilder: (context, index) {

  final profileData = ref.watch(profileDataProvider).value;
  final isQualityAssayer =
      profileData?.profileData?.isQualityAssayer ?? 0;

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
                                                    '${inwardsList[index].stackNumber}',
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
                                                      '${inwardsList[index].userName} ',
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
                                                        '${inwardsList[index].vehicleNumber}',
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
                                                        '${inwardsList[index].driverNumber}',
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

if (isQualityAssayer.toString() == "0")
  AnimatedButton(
    height: 50,
    color: primaryColorDark,
    width: MediaQuery.of(context).size.width / 1.2,
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
            'inwards': jsonEncode(
                inwardsList[index].toMap()),
            'outwards': null,
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
          ],
        ),
      );

  androidLayout(BuildContext context, WidgetRef ref) => Scaffold(
        appBar: AppBar(
          title: Text('Inward Requests'),
        ),
        body: createCaseIdLayout(context, ref),
      );
}
