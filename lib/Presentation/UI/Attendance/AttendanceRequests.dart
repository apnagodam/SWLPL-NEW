// ignore_for_file: deprecated_member_use

import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:emp_apnagodam/Domain/Attendance/AttendanceService.dart';
import 'package:emp_apnagodam/Domain/dio/DioProvider.dart';
import 'package:emp_apnagodam/Presentation/Widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Constants/ColorConstant.dart';
import '../../utils/DialogUtils.dart';

class Attendancerequests extends ConsumerStatefulWidget {
  const Attendancerequests({super.key});

  @override
  ConsumerState<Attendancerequests> createState() => _AttendancerequestsState();
}

class _AttendancerequestsState extends ConsumerState<Attendancerequests> {
  final reasonKey = GlobalKey<FormState>();
  var selectedTabIndex = StateProvider((ref) => 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Attendance Request',
          ),
          bottom: PreferredSize(
              preferredSize: Size.fromHeight(70),
              child: Padding(
                padding: Pad(all: 10),
                child: CustomSlidingSegmentedControl<int>(
                  initialValue: 0,
                  children: {
                    0: Text(
                      'Clock in Requests',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: Adaptive.sp(16)),
                    ),
                    1: Text(
                      'Clock out Requests',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: Adaptive.sp(16)),
                    ),
                  },
                  decoration: BoxDecoration(
                    color: CupertinoColors.lightBackgroundGray,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  thumbDecoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.3),
                        blurRadius: 4.0,
                        spreadRadius: 1.0,
                        offset: Offset(
                          0.0,
                          2.0,
                        ),
                      ),
                    ],
                  ),
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInToLinear,
                  onValueChanged: (v) {
                    ref.watch(selectedTabIndex.notifier).state = v;
                  },
                ),
              )),
        ),
        body: ListView(
          children: [
            ref.watch(selectedTabIndex) == 0
                ? attendanceRequestsInLayout()
                : attendanceRequestsOutLayout()
          ],
        ));
  }

  Widget attendanceRequestsInLayout() =>
      ref.watch(attendanceRequestsInProvider).when(
          data: (data) {
            return ColumnSuper(
              children: [
                Container(
                  color: primaryColorDark,
                  padding: const Pad(all: 10),
                  child: IntrinsicHeight(
                    child: Row(children: [
                      Expanded(
                          child: Text(
                        "Date",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: Adaptive.sp(14)),
                      )),
                      const VerticalDivider(),
                      Expanded(
                          child: Text(
                        "Employee",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: Adaptive.sp(14)),
                      )),
                      const VerticalDivider(),
                      Expanded(
                          child: Text(
                        "Time",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: Adaptive.sp(14)),
                      )),
                    ]),
                  ),
                ),
                ListView.builder(
                  itemCount: data.inAttenData?.length ?? 0,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => Container(
                    color: index % 2 == 0
                        ? Colors.grey.withOpacity(0.2)
                        : Colors.white,
                    padding: const Pad(all: 10),
                    child: IntrinsicHeight(
                      child: Row(children: [
                        Expanded(
                            child: Text.rich(
                          TextSpan(
                            text:
                                "${DateTime.parse((data.inAttenData?[index].date).toString()).day}/${DateTime.parse((data.inAttenData?[index].date).toString()).month}/${DateTime.parse((data.inAttenData?[index].date).toString()).year}",
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                TextEditingController reasonController =
                                    TextEditingController();

                                showDialog(
                                    context: context,
                                    builder: (context) => showCustomAlertDialog(
                                            context,
                                            ColumnSuper(children: [
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: Text('Location IN:',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.black,
                                                            fontSize:
                                                                Adaptive.sp(
                                                                    14))),
                                                  ),
                                                  Expanded(
                                                      child: Text(
                                                    "${data.inAttenData?[index].location ?? "Missed IN"}",
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black,
                                                        fontSize:
                                                            Adaptive.sp(14)),
                                                  )),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                        'Distance (in meters):',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.black,
                                                            fontSize:
                                                                Adaptive.sp(
                                                                    14))),
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      "${double.parse("${data.inAttenData?[index].distance ?? 0.0}") > 999 ? "${(double.parse("${data.inAttenData?[index].distance ?? 0.0}") / 1000).toStringAsFixed(2)} Kms." : "${double.parse("${data.inAttenData?[index].distance ?? 0.0}").toStringAsFixed(2)} Mtrs."}",
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.black,
                                                          fontSize:
                                                              Adaptive.sp(14)),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: Text('Image',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.black,
                                                            fontSize:
                                                                Adaptive.sp(
                                                                    14))),
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: Colors.grey),
                                                        shape: BoxShape.circle),
                                                    height: 25,
                                                    width: 25,
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      child: InstaImageViewer(
                                                        child: Image.network(
                                                          "${ref.watch(dioProvider).options.baseUrl}resources/assets/upload/attendance/${data.inAttenData?[index].image}",
                                                          errorBuilder: (context,
                                                                  s, o) =>
                                                              Icon(
                                                                  CupertinoIcons
                                                                      .person),
                                                          fit: BoxFit.contain,
                                                          height:
                                                              Adaptive.sh(50),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                            ]),
                                            "Request Details", approve: () {
                                           showLoaderDialog(context);
                                           ref
                                               .watch(approveRejectRequestsProvider(
                                                       id:
                                                           "${data.inAttenData?[index].id}",
                                                       notes: "",
                                                       status: "2",
                                                       type: "in_status")
                                                   .future)
                                               .then((value) {
                                             hideLoaderDialog(context);
                                             Navigator.of(context).pop();
                                             ref.invalidate(
                                                 attendanceRequestsInProvider);
                                           }).onError((e, s) {
                                             hideLoaderDialog(context);
                                             Navigator.of(context).pop();
                                           });
                                         }, reject: () {
                                          showDialog(
                                              context: context,
                                              builder: (dialogContext) =>
                                                  showConfirmAlertDialog(
                                                      context,
                                                      Form(
                                                          key: reasonKey,
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: [
                                                              TextFormField(
                                                                maxLines: 5,
                                                                controller:
                                                                    reasonController,
                                                                validator:
                                                                    (value) {
                                                                  if (value ==
                                                                          null ||
                                                                      value
                                                                          .isEmpty) {
                                                                    return 'Please input reason';
                                                                  }
                                                                  return null;
                                                                },
                                                                decoration: InputDecoration(
                                                                    label: Text(
                                                                        'Please input reason*'),
                                                                    contentPadding: const Pad(
                                                                        top: 0,
                                                                        bottom:
                                                                            0,
                                                                        left:
                                                                            10),
                                                                    border: OutlineInputBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                5)),
                                                                    enabledBorder:
                                                                        OutlineInputBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(5))),
                                                              ),
                                                            ],
                                                          )),
                                                      "Reject", approve: () {
                                                    if (reasonKey.currentState!
                                                        .validate()) {
                                                      showLoaderDialog(context);
                                                      ref
                                                          .watch(approveRejectRequestsProvider(
                                                                  id:
                                                                      "${data.inAttenData?[index].id}",
                                                                  notes: reasonController
                                                                      .text
                                                                      .toString(),
                                                                  status: "0",
                                                                  type:
                                                                      "in_status")
                                                              .future)
                                                          .then((value) {
                                                        hideLoaderDialog(
                                                            context);
                                                        Navigator.of(context)
                                                            .pop();
                                                        Navigator.of(
                                                                dialogContext)
                                                            .pop();
                                                        ref.invalidate(
                                                            attendanceRequestsInProvider);
                                                      }).onError((e, s) {
                                                        hideLoaderDialog(
                                                            context);
                                                        Navigator.of(context)
                                                            .pop();
                                                      });
                                                    }
                                                  }, reject: () {
                                                    Navigator.of(context).pop();
                                                  }));
                                        }));
                              },
                          ),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: primaryColorDark,
                              fontWeight: FontWeight.bold,
                              fontSize: Adaptive.sp(14)),
                        )),
                        const VerticalDivider(),
                        Expanded(
                            child: Text(
                          "${data.inAttenData?[index].firstName}(${data.inAttenData?[index].empId})",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: Adaptive.sp(14)),
                        )),
                        const VerticalDivider(),
                        Expanded(
                            child: Text.rich(
                          TextSpan(
                            text:
                                "${data.inAttenData?[index].time ?? "Missed Out"}",
                          ),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: Adaptive.sp(14)),
                        )),
                      ]),
                    ),
                  ),
                ),
              ],
            );
          },
          error: (e, s) => Container(),
          loading: () => Container(
                height: Adaptive.h(100),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ));

  Widget attendanceRequestsOutLayout() =>
      ref.watch(attendanceRequestsOutProvider).when(
          data: (data) {
            return ColumnSuper(
              children: [
                Container(
                  color: primaryColorDark,
                  padding: const Pad(all: 10),
                  child: IntrinsicHeight(
                    child: Row(children: [
                      Expanded(
                          child: Text(
                        "Date",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: Adaptive.sp(14)),
                      )),
                      const VerticalDivider(),
                      Expanded(
                          child: Text(
                        "Employee",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: Adaptive.sp(14)),
                      )),
                      const VerticalDivider(),
                      Expanded(
                          child: Text(
                        "Time",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: Adaptive.sp(14)),
                      )),
                    ]),
                  ),
                ),
                ListView.builder(
                  itemCount: data.outAttenData?.length ?? 0,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => Container(
                    color: index % 2 == 0
                        ? Colors.grey.withOpacity(0.2)
                        : Colors.white,
                    padding: const Pad(all: 10),
                    child: IntrinsicHeight(
                      child: Row(children: [
                        Expanded(
                            child: Text.rich(
                          TextSpan(
                            text:
                                "${DateTime.parse((data.outAttenData?[index].date).toString()).day}/${DateTime.parse((data.outAttenData?[index].date).toString()).month}/${DateTime.parse((data.outAttenData?[index].date).toString()).year}",
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                TextEditingController reasonController =
                                    TextEditingController();

                                showDialog(
                                    context: context,
                                    builder: (dialogContext) =>
                                        showCustomAlertDialog(
                                            dialogContext,
                                            ColumnSuper(children: [
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: Text('Location IN:',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.black,
                                                            fontSize:
                                                                Adaptive.sp(
                                                                    14))),
                                                  ),
                                                  Expanded(
                                                      child: Text(
                                                    "${data.outAttenData?[index].location ?? "Missed IN"}",
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black,
                                                        fontSize:
                                                            Adaptive.sp(14)),
                                                  )),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                        'Distance (in meters):',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.black,
                                                            fontSize:
                                                                Adaptive.sp(
                                                                    14))),
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      "${double.parse("${data.outAttenData?[index].distance ?? 0.0}") > 999 ? "${(double.parse("${data.outAttenData?[index].distance ?? 0.0}") / 1000).toStringAsFixed(2)} Kms." : "${double.parse("${data.outAttenData?[index].distance ?? 0.0}").toStringAsFixed(2)} Mtrs."}",
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.black,
                                                          fontSize:
                                                              Adaptive.sp(14)),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: Text('Image',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.black,
                                                            fontSize:
                                                                Adaptive.sp(
                                                                    14))),
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: Colors.grey),
                                                        shape: BoxShape.circle),
                                                    height: 25,
                                                    width: 25,
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      child: InstaImageViewer(
                                                        child: Image.network(
                                                          "${ref.watch(dioProvider).options.baseUrl}resources/assets/upload/attendance/${data.outAttenData?[index].image}",
                                                          errorBuilder: (context,
                                                                  s, o) =>
                                                              Icon(
                                                                  CupertinoIcons
                                                                      .person),
                                                          fit: BoxFit.contain,
                                                          height:
                                                              Adaptive.sh(50),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                            ]),
                                            "Request Details", approve: () {
                                          showDialog(
                                              context: context,
                                              builder: (dialogContext) =>
                                                  showConfirmAlertDialog(
                                                      context,
                                                      Form(
                                                          key: reasonKey,
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: [
                                                              TextFormField(
                                                                maxLines: 5,
                                                                controller:
                                                                    reasonController,
                                                                validator:
                                                                    (value) {
                                                                  if (value ==
                                                                          null ||
                                                                      value
                                                                          .isEmpty) {
                                                                    return 'Please input reason';
                                                                  }
                                                                  return null;
                                                                },
                                                                decoration: InputDecoration(
                                                                    label: Text(
                                                                        'Please input reason*'),
                                                                    contentPadding: const Pad(
                                                                        top: 0,
                                                                        bottom:
                                                                            0,
                                                                        left:
                                                                            10),
                                                                    border: OutlineInputBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                5)),
                                                                    enabledBorder:
                                                                        OutlineInputBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(5))),
                                                              ),
                                                            ],
                                                          )),
                                                      "Approve", approve: () {
                                                    if (reasonKey.currentState!
                                                        .validate()) {
                                                      showLoaderDialog(context);
                                                      ref
                                                          .watch(approveRejectRequestsProvider(
                                                                  id:
                                                                      "${data.outAttenData?[index].id}",
                                                                  notes: reasonController
                                                                      .text
                                                                      .toString(),
                                                                  status: "2",
                                                                  type:
                                                                      "out_status")
                                                              .future)
                                                          .then((value) {
                                                        hideLoaderDialog(
                                                            context);
                                                        Navigator.of(context)
                                                            .pop();
                                                        Navigator.of(
                                                                dialogContext)
                                                            .pop();
                                                        ref.invalidate(
                                                            attendanceRequestsOutProvider);
                                                      }).onError((e, s) {
                                                        hideLoaderDialog(
                                                            context);
                                                        Navigator.of(context)
                                                            .pop();
                                                      });
                                                    }
                                                  }, reject: () {
                                                    Navigator.of(context).pop();
                                                  }));
                                        }, reject: () {
                                          showDialog(
                                              context: context,
                                              builder: (context) =>
                                                  showConfirmAlertDialog(
                                                      context,
                                                      Form(
                                                          key: reasonKey,
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: [
                                                              TextFormField(
                                                                maxLines: 5,
                                                                controller:
                                                                    reasonController,
                                                                validator:
                                                                    (value) {
                                                                  if (value ==
                                                                          null ||
                                                                      value
                                                                          .isEmpty) {
                                                                    return 'Please input reason';
                                                                  }
                                                                  return null;
                                                                },
                                                                decoration: InputDecoration(
                                                                    label: Text(
                                                                        'Please input reason*'),
                                                                    contentPadding: const Pad(
                                                                        top: 0,
                                                                        bottom:
                                                                            0,
                                                                        left:
                                                                            10),
                                                                    border: OutlineInputBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                5)),
                                                                    enabledBorder:
                                                                        OutlineInputBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(5))),
                                                              ),
                                                            ],
                                                          )),
                                                      "Reject", approve: () {
                                                    if (reasonKey.currentState!
                                                        .validate()) {
                                                      showLoaderDialog(context);
                                                      ref
                                                          .watch(approveRejectRequestsProvider(
                                                                  id:
                                                                      "${data.outAttenData?[index].id}",
                                                                  notes: reasonController
                                                                      .text
                                                                      .toString(),
                                                                  status: "0",
                                                                  type:
                                                                      "out_status")
                                                              .future)
                                                          .then((value) {
                                                        hideLoaderDialog(
                                                            context);
                                                        Navigator.of(context)
                                                            .pop();
                                                        Navigator.of(
                                                                dialogContext)
                                                            .pop();
                                                        ref.invalidate(
                                                            attendanceRequestsOutProvider);
                                                      }).onError((e, s) {
                                                        hideLoaderDialog(
                                                            context);
                                                        Navigator.of(context)
                                                            .pop();
                                                      });
                                                    }
                                                  }, reject: () {
                                                    Navigator.of(context).pop();
                                                  }));
                                        }));
                              },
                          ),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: primaryColorDark,
                              fontWeight: FontWeight.bold,
                              fontSize: Adaptive.sp(14)),
                        )),
                        const VerticalDivider(),
                        Expanded(
                            child: Text(
                          "${data.outAttenData?[index].firstName}(${data.outAttenData?[index].empId})",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: Adaptive.sp(14)),
                        )),
                        const VerticalDivider(),
                        Expanded(
                            child: Text.rich(
                          TextSpan(
                            text:
                                "${data.outAttenData?[index].time ?? "Missed Out"}",
                          ),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: Adaptive.sp(14)),
                        )),
                      ]),
                    ),
                  ),
                ),
              ],
            );
          },
          error: (e, s) => Container(),
          loading: () => Container(
                height: Adaptive.h(100),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ));
}
