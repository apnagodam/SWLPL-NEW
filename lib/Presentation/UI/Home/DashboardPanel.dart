import 'dart:io';

import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:emp_apnagodam/Data/SharedPrefs/SharedUtility.dart';
import 'package:emp_apnagodam/Domain/Attendance/AttendanceService.dart';
import 'package:emp_apnagodam/Domain/CaseId/CaseIdService.dart';
import 'package:emp_apnagodam/Domain/dio/DioProvider.dart';
import 'package:emp_apnagodam/Presentation/Constants/ColorConstant.dart';
import 'package:emp_apnagodam/Presentation/UI/Attendance/InAppCameraModule.dart';
import 'package:emp_apnagodam/Presentation/UI/Audit/New%20Audit/EditAudit/FumigationEditScreen.dart';
import 'package:emp_apnagodam/Presentation/UI/TruckBook/CreateTruckBook.dart';
import 'package:emp_apnagodam/Presentation/Widgets/widgets.dart';
import 'package:emp_apnagodam/Presentation/utils/DialogUtils.dart';
import 'package:emp_apnagodam/Presentation/utils/DynamicShimmerList.dart';
import 'package:emp_apnagodam/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:searchable_listview/widgets/default_loading_widget.dart';

import '../../../Data/Models/CaseIdResponseModel.dart';

class Dashboardpanel extends ConsumerWidget {
  const Dashboardpanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        if ((ref.watch(sharedUtilityProvider).getUser()?.designation ?? "")
            .toString()
            .toLowerCase()
            .contains('info'))
          Padding(
            padding: const Pad(all: 10),
            child: Text(
              "Attendance Management",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: Adaptive.sp(18)),
            ),
          ),
        if ((ref.watch(sharedUtilityProvider).getUser()?.designation ?? "")
            .toString()
            .toLowerCase()
            .contains('info'))
          ref.watch(attendanceStatusProvider).when(
              data: (attendanceData) => InkWell(
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      color: attendanceData.clockStatus.toString() != "1"
                          ? Colors.red
                          : primaryColor,
                      margin: const Pad(all: 10),
                      child: Padding(
                        padding: const Pad(all: 10),
                        child: RowSuper(fill: true, children: [
                          const Card.outlined(
                            child: Padding(
                              padding: Pad(all: 10),
                              child: Icon(CupertinoIcons.person),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${attendanceData.clockStatus.toString() != "1" ? "Tap to Clock OUT" : "Tap to Clock IN"}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: Adaptive.sp(14),
                                    color: Colors.white),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ]),
                      ),
                    ),
                    onTap: () {
                      showBottomSheet(
                          context: context,
                          builder: (sheetContext) =>
                              ElevarmDraggableBottomSheet(
                                  title: 'Mark Attendance',
                                  initialChildSize: 1,
                                  onPressedClose: () => Navigator.of(
                                          sheetContext,
                                          rootNavigator: false)
                                      .pop(),
                                  children: [
                                    InAppCameraModule(
                                      captureImage: (mediaCapture) {
                                        if (mediaCapture!.status ==
                                            MediaCaptureStatus.success) {
                                          showLoaderDialog(context);
                                          createStampedImageFile(
                                                  XFile(mediaCapture
                                                      .captureRequest.path!),
                                                  ref)
                                              .then((image) async {
                                            print(image);
                                            showLoaderDialog(context);
                                            await ref
                                                .watch(postAttendanceV2Provider(
                                                        userPurpose: '',
                                                        clockStatus: attendanceData
                                                                    .clockStatus
                                                                    .toString() ==
                                                                "1"
                                                            ? "1"
                                                            : "2",
                                                        distance: ref
                                                            .watch(
                                                                distanceProvider)
                                                            .toString(),
                                                        image: File(image!),
                                                        lat:
                                                            '${ref.watch(locationProvider)?.latitude}',
                                                        long:
                                                            '${ref.watch(locationProvider)?.longitude}')
                                                    .future)
                                                .then((value) {
                                              hideLoaderDialog(context);
                                              if (value['status'].toString() ==
                                                  "1") {
                                                ref.invalidate(
                                                    attendanceStatusProvider);
                                              }
                                              Fluttertoast.showToast(
                                                  msg: '${value['message']}');
                                            }).onError((e, s) {
                                              hideLoaderDialog(context);
                                            });
                                          });
                                          Navigator.of(context,
                                                  rootNavigator: false)
                                              .pop();
                                        }
                                      },
                                    )
                                  ]));
                    },
                  ),
              error: (e, s) => Container(),
              loading: () => DynamicShimmerList()),
        if ((ref.watch(sharedUtilityProvider).getUser()?.designation ?? "")
            .toString()
            .toLowerCase()
            .contains('info'))
          Row(
            children: [
              Expanded(
                child: InkWell(
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: primaryColor,
                    margin: const Pad(all: 10),
                    child: Padding(
                      padding: const Pad(all: 10),
                      child: RowSuper(children: [
                        const Card.outlined(
                          child: Padding(
                            padding: Pad(all: 10),
                            child: Icon(CupertinoIcons.person),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Attendance IN List',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: Adaptive.sp(14),
                                  color: Colors.white),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ]),
                    ),
                  ),
                  onTap: () {
                    showBottomSheet(
                        context: context,
                        builder: (bottomsheetcontext) =>
                            ElevarmDraggableBottomSheet(
                                title: "Attendance IN requests",
                                onPressedClose: () => Navigator.of(
                                        bottomsheetcontext,
                                        rootNavigator: false)
                                    .pop(),
                                children: [
                                  Consumer(
                                      builder: (context, ref, child) =>
                                          attendanceRequestsInLayout(ref))
                                ]));
                  },
                ),
              ),
              Expanded(
                child: InkWell(
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: primaryColor,
                    margin: const Pad(all: 10),
                    child: Padding(
                      padding: const Pad(all: 10),
                      child: RowSuper(children: [
                        const Card.outlined(
                          child: Padding(
                            padding: Pad(all: 10),
                            child: Icon(CupertinoIcons.person),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Attendance OUT List',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: Adaptive.sp(14),
                                  color: Colors.white),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ]),
                    ),
                  ),
                  onTap: () {
                    showBottomSheet(
                        context: context,
                        builder: (bottomsheetcontext) =>
                            ElevarmDraggableBottomSheet(
                                title: "Attendance OUT requests",
                                onPressedClose: () => Navigator.of(
                                        bottomsheetcontext,
                                        rootNavigator: false)
                                    .pop(),
                                children: [
                                  Consumer(
                                      builder: (context, ref, child) =>
                                          attendanceRequestsOutLayout(ref))
                                ]));
                  },
                ),
              )
            ],
          ),
        if ((ref.watch(sharedUtilityProvider).getUser()?.designation ?? "")
            .toString()
            .toLowerCase()
            .contains('info'))
          Padding(
            padding: const Pad(all: 10),
            child: Text(
              "Currently Active Terminals",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: Adaptive.sp(18)),
            ),
          ),
        if ((ref.watch(sharedUtilityProvider).getUser()?.designation ?? "")
            .toString()
            .toLowerCase()
            .contains('info'))
          ref.watch(caseIdProvider).when(
              data: (data) {
                List<Datum> duplicateList = [];
                final seen = <String>{}; // or Map<String, Person> if needed

                if (data.data?.data != null) {
                  for (var i = 0; i < (data.data?.data?.length ?? 0); i++) {
                    if (!duplicateList.contains(data.data?.data?[i])) {
                      duplicateList.add(data.data!.data![i]);
                    }
                  }
                }
                duplicateList = duplicateList.where((e) {
                  final key = '${e.terminalName}';
                  if (seen.contains(key)) return false;
                  seen.add(key);
                  return true;
                }).toList();

                return GridView.builder(
                    itemCount: duplicateList.length,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, childAspectRatio: 16 / 9),
                    itemBuilder: (context, index) {
                      List<Datum> distinctList = data.data!.data!
                          .where((e) =>
                              e.terminalName ==
                              duplicateList[index].terminalName)
                          .toList();

                      var inTotal = distinctList
                          .where((e) =>
                              e.caseId!.toString().toLowerCase().contains('in'))
                          .length;
                      var outTotal = distinctList
                          .where((e) => e.caseId!
                              .toString()
                              .toLowerCase()
                              .contains('out'))
                          .length;

                      return InkWell(
                        child: Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          color: primaryColor,
                          margin: const Pad(all: 10),
                          child: Padding(
                            padding: const Pad(all: 10),
                            child: RowSuper(children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${duplicateList[index].terminalName}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: Adaptive.sp(14),
                                        color: Colors.white),
                                  ),
                                  Spacer(),
                                  Text(
                                    '${inTotal} IN ${outTotal} OUT ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: Adaptive.sp(18),
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ]),
                          ),
                        ),
                        onTap: () {
                          var currentInStatus =
                              extractCurrentInStatus(duplicateList[index], ref);
                          var currentOutStatus = extractCurrentOutStatus(
                              duplicateList[index], ref);
                          showBottomSheet(
                              context: context,
                              builder: (bottomsheetcontext) =>
                                  ElevarmDraggableBottomSheet(
                                      title: "Active Terminals",
                                      onPressedClose: () => Navigator.of(
                                              bottomsheetcontext,
                                              rootNavigator: false)
                                          .pop(),
                                      children: [
                                        Consumer(
                                          builder: (context, ref, child) =>
                                              ListView.builder(
                                            itemCount:
                                                distinctList.length,
                                            shrinkWrap: true,
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            itemBuilder: (context, index) =>
                                                Container(
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
                                                          "${distinctList[index].custFname}",
                                                      recognizer:
                                                          TapGestureRecognizer()
                                                            ..onTap = () {

                                                              showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (dialogContext) =>
                                                                          showcaseIdCustomAlertDialog(
                                                                            dialogContext,
                                                                            ColumnSuper(children: [
                                                                              Row(
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: Text('case Id:', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: Adaptive.sp(14))),
                                                                                  ),
                                                                                  Expanded(
                                                                                      child: Text(
                                                                                    "${distinctList[index].caseId}",
                                                                                    textAlign: TextAlign.start,
                                                                                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: Adaptive.sp(14)),
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
                                                                                    child: Text('Customer Name', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: Adaptive.sp(14))),
                                                                                  ),
                                                                                  Expanded(
                                                                                    child: Text(
                                                                                      "${distinctList[index].custFname}",
                                                                                      textAlign: TextAlign.start,
                                                                                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: Adaptive.sp(14)),
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
                                                                                    child: Text('Employee Id', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: Adaptive.sp(14))),
                                                                                  ),
                                                                                  Expanded(
                                                                                    child: Text(
                                                                                      "${distinctList[index].staffId}",
                                                                                      textAlign: TextAlign.start,
                                                                                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: Adaptive.sp(14)),
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
                                                                                    child: Text('Driver phone', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: Adaptive.sp(14))),
                                                                                  ),
                                                                                  Expanded(
                                                                                    child: Text(
                                                                                      "${distinctList[index].driverPhone}",
                                                                                      textAlign: TextAlign.start,
                                                                                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: Adaptive.sp(14)),
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
                                                                                    child: Text('Vehicle No.', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: Adaptive.sp(14))),
                                                                                  ),
                                                                                  Expanded(
                                                                                    child: Text(
                                                                                      "${distinctList[index].vehicleNo}",
                                                                                      textAlign: TextAlign.start,
                                                                                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: Adaptive.sp(14)),
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
                                                                                    child: Text('Weight', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: Adaptive.sp(14))),
                                                                                  ),
                                                                                  Expanded(
                                                                                    child: Text(
                                                                                      "${distinctList[index].totalWeight}(Qtl.)",
                                                                                      textAlign: TextAlign.start,
                                                                                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: Adaptive.sp(14)),
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
                                                                                    child: Text('Case Status', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: Adaptive.sp(14))),
                                                                                  ),
                                                                                  Expanded(
                                                                                    child: Text(
                                                                                      "${distinctList[index].caseId.toString().toLowerCase().contains('out') ? currentOutStatus : currentInStatus}",
                                                                                      textAlign: TextAlign.start,
                                                                                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: Adaptive.sp(14)),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              SizedBox(
                                                                                height: 10,
                                                                              ),
                                                                            ]),
                                                                            "Case ID Details",
                                                                            ok: () {
                                                                              Navigator.of(context, rootNavigator: false).pop();
                                                                            },
                                                                          ));
                                                            },
                                                    ),
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        decoration:
                                                            TextDecoration
                                                                .underline,
                                                        color: primaryColorDark,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize:
                                                            Adaptive.sp(16)),
                                                  )),
                                                  const VerticalDivider(),
                                                  Expanded(
                                                      child: Text(
                                                    "${distinctList[index].cateName}",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black,
                                                        fontSize:
                                                            Adaptive.sp(14)),
                                                  )),
                                                  const VerticalDivider(),
                                                  Expanded(
                                                      child: Text.rich(
                                                    TextSpan(
                                                      text:
                                                          "${distinctList[index].caseId.toString().toLowerCase().contains('out') ? "OUT" : 'IN'}",
                                                    ),
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize:
                                                            Adaptive.sp(14)),
                                                  )),
                                                  const VerticalDivider(),
                                                  Expanded(
                                                      child: Text.rich(
                                                    TextSpan(
                                                      text:
                                                          "${distinctList[index].caseId.toString().toLowerCase().contains('out') ? currentOutStatus.toString().replaceAll('Add', '') : currentInStatus.toString().replaceAll('Add', '')}",
                                                    ),
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize:
                                                            Adaptive.sp(14)),
                                                  )),
                                                ]),
                                              ),
                                            ),
                                          ),
                                        )
                                      ]));
                        },
                      );
                    });
              },
              error: (e, s) => Container(),
              loading: () => DefaultLoadingWidget())
      ],
    );
  }

  Widget attendanceRequestsInLayout(WidgetRef ref) =>
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
                                                                      "${data.inAttenData?[index].id}",
                                                                  notes: reasonController
                                                                      .text
                                                                      .toString(),
                                                                  status: "2",
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

  Widget attendanceRequestsOutLayout(WidgetRef ref) =>
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

  extractCurrentInStatus(Datum? data, WidgetRef ref) {
    var currentInStatus = 'Done';
    if (data?.truckbook == null) {
      currentInStatus = "Add Truck Book";
    } else if (data?.labourbook == null)
      currentInStatus = "Add Labour";
    else if (data?.firstKantaParchi == null) {
      currentInStatus = "Add First Kanta Parchi";
    } else if (data?.firstQuality == null) {
      currentInStatus = "Add First Quality";
    } else if (data?.fQTagging == null) {
      currentInStatus = "Quality Approval Pending from user side";
    } else if (data?.sKParchi == null) {
      currentInStatus = "Add Second Kanta Parchi";
    } else if (data?.sQualityReport == null) {
      currentInStatus = "Add Second Quality Report";
    }

    //  else if (distinctList[index]
    //         ?.cctvReport ==
    //     null) {
    //   a = DateTime.parse(
    //       distinctList[index]
    //               ?.sQualityDate ??
    //           "");
    //   currentInStatus =
    //       "Update CCTV Report";
    // }

    else if (data?.ivrReport == null) {
      if (ref.watch(sharedUtilityProvider).getUser()?.terminal != null) {
        currentInStatus = "Gatepass Recommeded Approval Pending";
      } else {
        currentInStatus = "Gatepass recommended";
      }
    } else if (data?.gatepassReport == null) {
      currentInStatus = "Gatepass Approval Pending";
    } else {
      currentInStatus = "Done";
    }
    ;

    return currentInStatus;
  }

  extractCurrentOutStatus(Datum? data, WidgetRef ref) {
    var currentOutStatus = 'Done';
    if (data?.truckbook == null) {
      currentOutStatus = "Add Truck Book";
    } else if (data?.labourbook == null) {
      currentOutStatus = "Add Labour";
    } else if (data?.firstKantaParchi == null) {
      currentOutStatus = "Add First Kanta Parchi";
    } else if (data?.sQualityReport == null || data?.sQualityReport == null) {
      currentOutStatus = "Add Second Quality Report";
    } else if (data?.sKParchi == null) {
      currentOutStatus = "Add Second Kanta Parchi";
    }

    // else if (distinctList[index]
    //             ?.sKParchi !=
    //         null &&
    //     distinctList[index]?.cctvReport ==
    //         null) {
    //   currentOutStatus =
    //       "Update CCTV Report";
    // }

    else if (data?.ivrReport == null) {
      if (ref.watch(sharedUtilityProvider).getUser()?.terminal != null) {
        currentOutStatus = "Gatepass Recommeded Approval Pending";
      } else {
        currentOutStatus = "Gatepass recommended";
      }
    } else if (data?.gatepassReport == null) {
      currentOutStatus = "Gatepass Approval Pending";
    } else
      "Done";

    return currentOutStatus;
  }
}
