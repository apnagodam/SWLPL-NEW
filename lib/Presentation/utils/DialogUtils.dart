// ignore_for_file: unused_catch_stack

import 'dart:io';
import 'dart:typed_data';
import 'package:url_launcher/url_launcher.dart';

import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:button_animations/button_animations.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:emp_apnagodam/Domain/CaseId/CaseIdService.dart';
import 'package:emp_apnagodam/Presentation/utils/Styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:zoom_pinch_overlay/zoom_pinch_overlay.dart';

import '../../Domain/Attendance/AttendanceService.dart';
import '../../main.dart';
import '../Constants/ColorConstant.dart';
import '../UI/TruckBook/CreateTruckBook.dart';
import '../Widgets/widgets.dart';

var firstCCTVImageProvider = StateProvider<File?>((ref) => null);
var secondCCTVImageProvider = StateProvider<File?>((ref) => null);
TextEditingController notesController = TextEditingController();
final cctvKey = GlobalKey<FormState>();
var attendanceImageProvider = StateProvider<File?>((ref) => null);

cctvAlertDialog(BuildContext context, WidgetRef widgetRef, String caseId) {
  return AlertDialog(
    title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Update CCTV Report",
          style:
              TextStyle(fontSize: Adaptive.sp(18), fontWeight: FontWeight.bold),
        ),
        Divider(
          endIndent: 150,
          thickness: 4,
          color: primaryColor,
        )
      ],
    ),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    backgroundColor: Colors.white,
    content: Consumer(
        builder: (context, ref, child) => Form(
            key: cctvKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  caseId,
                  maxLines: 2,
                  style: TextStyle(
                      fontSize: Adaptive.sp(16), fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: Adaptive.sh(15),
                        child: InkWell(
                          child: DottedBorder(
                            color: primaryColorDark,
                            borderType: BorderType.RRect,
                            padding: const Pad(all: 10),
                            radius: const Radius.circular(5),
                            child: Center(
                              child: ref.watch(firstCCTVImageProvider) == null
                                  ? ColumnSuper(
                                      children: const [
                                        Icon(
                                          Icons.file_upload_rounded,
                                          color: primaryColorDark,
                                        ),
                                        Text(
                                          'CCTV 1',
                                          style: TextStyle(
                                              color: primaryColorDark,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    )
                                  : InkWell(
                                      onTap: () async {
                                        showLoaderDialog(context);
                                        try {
                                          pickImage(source: ImageSource.gallery)
                                              .then((value) async {
                                            hideLoaderDialog(context);
                                            if (value != null) {
                                              ref
                                                  .watch(firstCCTVImageProvider
                                                      .notifier)
                                                  .state = File(value.path);
                                            }
                                          });
                                        } catch (e, s) {
                                          hideLoaderDialog(context);

                                          debugPrintStack(
                                            stackTrace: s,
                                          );
                                        }
                                        // checkLocationPermission(ref);
                                      },
                                      child: ZoomOverlay(
                                        modalBarrierColor: Colors.black12,
                                        // Optional
                                        minScale: 0.5,
                                        // Optional
                                        maxScale: 3.0,
                                        // Optional
                                        animationCurve: Curves.fastOutSlowIn,
                                        // Defaults to fastOutSlowIn which mimics IOS instagram behavior
                                        animationDuration:
                                            const Duration(milliseconds: 300),
                                        // Defaults to 100 Milliseconds. Recommended duration is 300 milliseconds for Curves.fastOutSlowIn
                                        twoTouchOnly: true,
                                        // Defaults to false
                                        onScaleStart: () {},
                                        // optional VoidCallback
                                        onScaleStop: () {},
                                        // optional VoidCallback
                                        child: Image.memory(
                                          ref
                                                  .watch(firstCCTVImageProvider)
                                                  ?.readAsBytesSync() ??
                                              Uint8List(0),
                                          fit: BoxFit.contain,
                                          height: 250,
                                        ),
                                      ),
                                    ),
                            ),
                          ),
                          onTap: () async {
                            showLoaderDialog(context);
                            try {
                              pickImage(source: ImageSource.gallery)
                                  .then((value) async {
                                hideLoaderDialog(context);
                                if (value != null) {
                                  ref
                                      .watch(firstCCTVImageProvider.notifier)
                                      .state = File(value.path);
                                  ;
                                }
                              });
                            } catch (e, s) {
                              hideLoaderDialog(context);

                              debugPrintStack(
                                stackTrace: s,
                              );
                            }
                            // hideLoaderDialog(context);
                            // checkLocationPermission(ref);
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: SizedBox(
                        height: Adaptive.sh(15),
                        child: InkWell(
                          child: DottedBorder(
                            color: primaryColorDark,
                            borderType: BorderType.RRect,
                            padding: const Pad(all: 10),
                            radius: const Radius.circular(5),
                            child: Center(
                              child: ref.watch(secondCCTVImageProvider) == null
                                  ? ColumnSuper(
                                      children: const [
                                        Icon(
                                          Icons.file_upload_rounded,
                                          color: primaryColorDark,
                                        ),
                                        Text(
                                          'CCTV 2',
                                          style: TextStyle(
                                              color: primaryColorDark,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    )
                                  : InkWell(
                                      onTap: () async {
                                        showLoaderDialog(context);

                                        try {
                                          pickImage(source: ImageSource.gallery)
                                              .then((value) async {
                                            hideLoaderDialog(context);
                                            if (value != null) {
                                              ref
                                                  .watch(secondCCTVImageProvider
                                                      .notifier)
                                                  .state = File(value.path);
                                              ;
                                            }
                                          });
                                        } catch (e, s) {
                                          hideLoaderDialog(context);

                                          debugPrintStack(
                                            stackTrace: s,
                                          );
                                        }
                                        // checkLocationPermission(ref);
                                      },
                                      child: ZoomOverlay(
                                        modalBarrierColor: Colors.black12,
                                        // Optional
                                        minScale: 0.5,
                                        // Optional
                                        maxScale: 3.0,
                                        // Optional
                                        animationCurve: Curves.fastOutSlowIn,
                                        // Defaults to fastOutSlowIn which mimics IOS instagram behavior
                                        animationDuration:
                                            const Duration(milliseconds: 300),
                                        // Defaults to 100 Milliseconds. Recommended duration is 300 milliseconds for Curves.fastOutSlowIn
                                        twoTouchOnly: true,
                                        // Defaults to false
                                        onScaleStart: () {},
                                        // optional VoidCallback
                                        onScaleStop: () {},
                                        // optional VoidCallback
                                        child: Image.memory(
                                          ref
                                                  .watch(
                                                      secondCCTVImageProvider)
                                                  ?.readAsBytesSync() ??
                                              Uint8List(0),
                                          fit: BoxFit.contain,
                                          height: 250,
                                        ),
                                      ),
                                    ),
                            ),
                          ),
                          onTap: () async {
                            showLoaderDialog(context);
                            try {
                              pickImage(source: ImageSource.gallery)
                                  .then((value) async {
                                hideLoaderDialog(context);

                                if (value != null) {
                                  ref
                                      .watch(secondCCTVImageProvider.notifier)
                                      .state = File(value.path);
                                  ;
                                }
                              });
                            } catch (e, s) {
                              hideLoaderDialog(context);

                              debugPrintStack(
                                stackTrace: s,
                              );
                            }
                            // hideLoaderDialog(context);
                            // checkLocationPermission(ref);
                          },
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                titleWidget(text: 'Input Notes'),
                TextFormField(
                  keyboardType: TextInputType.text,
                  controller: notesController,
                  maxLines: 3,
                  validator: (value) => (value == null || value.isEmpty)
                      ? "Please input notes"
                      : null,
                  decoration: InputDecoration(
                      alignLabelWithHint: true,
                      label: const Text('Notes'),
                      contentPadding: const Pad(all: 10),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5))),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ))),
    actions: [
      Padding(
        padding: const Pad(all: 10),
        child: AnimatedButton(
          height: 50,
          color: primaryColorDark,
          isOutline: true,
          isMultiColor: true,
          colors: [primaryColorDark, primaryColorDark],
          borderWidth: 1,
          onTap: () async {
            if (cctvKey.currentState!.validate()) {
              if (widgetRef.watch(firstCCTVImageProvider) == null) {
                Fluttertoast.showToast(msg: "Please select first cctv image");
              } else {
                showLoaderDialog(context);

                widgetRef
                    .watch(updateCCTVReportV1Provider(
                            caseId: caseId,
                            notes: notesController.text,
                            cctvImage1: widgetRef.watch(firstCCTVImageProvider),
                            cctvImage2:
                                widgetRef.watch(secondCCTVImageProvider))
                        .future)
                    .then((value) {
                  widgetRef.invalidate(firstCCTVImageProvider);
                  widgetRef.invalidate(secondCCTVImageProvider);
                  notesController.text = '';
                  hideLoaderDialog(context);
                  Navigator.of(context).pop();
                }).onError((e, s) {
                  hideLoaderDialog(context);
                });
              }
            }
          },
          child: Text(
            'Submit',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white,
                fontSize: Adaptive.sp(14),
                fontWeight: FontWeight.w800),
          ),
        ),
      ),
    ],
  );
}

attendanceAlertDialog(BuildContext context, WidgetRef widgetRef) {
  TextEditingController purposeController = TextEditingController();
  return AlertDialog(
    title: Consumer(
        builder: (context, ref, child) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Please mark your attendance",
                  style: TextStyle(
                      fontSize: Adaptive.sp(18), fontWeight: FontWeight.bold),
                ),
                Divider(
                  endIndent: 150,
                  thickness: 4,
                )
              ],
            )),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    backgroundColor: Colors.white,
    content: SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 220,
            child: InkWell(
              child: DottedBorder(
                color: primaryColorDark,
                borderType: BorderType.RRect,
                padding: const Pad(all: 10),
                radius: const Radius.circular(5),
                child: Center(
                  child: widgetRef.watch(attendanceImageProvider) == null
                      ? ColumnSuper(
                          children: const [
                            Icon(
                              Icons.file_upload_rounded,
                              color: primaryColorDark,
                            ),
                            Text(
                              'Capture Attendance Image',
                              style: TextStyle(
                                  color: primaryColorDark,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        )
                      : InkWell(
                          onTap: () async {
                            try {
                              pickImage().then((value) async {
                                if (value != null) {
                                  createStampedImageFile(value, widgetRef)
                                      .then((value) {
                                    widgetRef
                                        .watch(attendanceImageProvider.notifier)
                                        .state = File(value!);
                                  });
                                }
                              });
                            } catch (e, s) {
                              debugPrintStack(
                                stackTrace: s,
                              );
                            }
                          },
                          child: ZoomOverlay(
                            modalBarrierColor: Colors.black12,
                            minScale: 0.5,
                            maxScale: 3.0,
                            animationCurve: Curves.fastOutSlowIn,
                            animationDuration:
                                const Duration(milliseconds: 300),
                            twoTouchOnly: true,
                            onScaleStart: () {},
                            onScaleStop: () {},
                            child: Image.memory(
                              widgetRef
                                      .watch(attendanceImageProvider)
                                      ?.readAsBytesSync() ??
                                  Uint8List(0),
                              fit: BoxFit.contain,
                              height: 220,
                            ),
                          ),
                        ),
                ),
              ),
              onTap: () async {
                showLoaderDialog(context);
                try {
                  ImagePicker()
                      .pickImage(
                          source: ImageSource.camera,
                          maxWidth: 600,
                          maxHeight: 800,
                          imageQuality: 10)
                      .then((value) async {
                    hideLoaderDialog(context);
                    if (value != null) {
                      createStampedImageFile(value, widgetRef).then((value) {
                        widgetRef
                            .watch(attendanceImageProvider.notifier)
                            .state = File(value!);
                      });
                    }
                  });
                } catch (e, s) {
                  hideLoaderDialog(context);

                  debugPrintStack(
                    stackTrace: s,
                  );
                }
              },
            ),
          ),
          const SizedBox(height: 10),
          Consumer(
            builder: (context, ref, child) {
              final lateCheck = ref.watch(checkForLateProvider).valueOrNull;
              bool isLate =
                  (lateCheck?.askReason == 1 || lateCheck?.status == 1);
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (isLate) ...[
                    Text(
                      lateCheck?.message ??
                          "You are marking late attendance.",
                      style: const TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 12),
                    ),
                    const SizedBox(height: 5),
                  ],
                  TextField(
                    controller: purposeController,
                    maxLines: 2,
                    decoration: InputDecoration(
                      labelText: isLate
                          ? "Reason for Late Attendance *"
                          : "Purpose / Notes (Optional)",
                      border: const OutlineInputBorder(),
                      contentPadding: const EdgeInsets.all(8),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    ),
    actions: [
      Padding(
        padding: const Pad(all: 10),
        child: AnimatedButton(
          height: 50,
          color: primaryColorDark,
          isOutline: true,
          isMultiColor: true,
          colors: [primaryColorDark, primaryColorDark],
          borderWidth: 1,
          onTap: () async {
            try {
              if (widgetRef.watch(attendanceImageProvider) == null) {
                Fluttertoast.showToast(msg: "Please Select Image");
                return;
              }

              final lateCheck =
                  widgetRef.read(checkForLateProvider).valueOrNull;
              bool isLate =
                  (lateCheck?.askReason == 1 || lateCheck?.status == 1);
              if (isLate && purposeController.text.trim().isEmpty) {
                Fluttertoast.showToast(
                    msg: "Please enter late attendance reason");
                return;
              }

              showLoaderDialog(context);
              await widgetRef
                  .watch(postAttendanceV2Provider(
                          userPurpose: purposeController.text.trim(),
                          clockStatus: '1',
                          distance:
                              widgetRef.watch(distanceProvider).toString(),
                          image: widgetRef.watch(attendanceImageProvider),
                          lat:
                              '${widgetRef.watch(locationProvider)?.latitude}',
                          long:
                              '${widgetRef.watch(locationProvider)?.longitude}')
                      .future)
                  .then((value) {
                hideLoaderDialog(context);
                if (value['status'].toString() == "1") {
                  widgetRef.invalidate(attendanceStatusProvider);
                  widgetRef.invalidate(attendanceImageProvider);
                  widgetRef.watch(goRouterProvider).pop();
                }
                Fluttertoast.showToast(msg: '${value['message']}');
              }).onError((e, s) {
                hideLoaderDialog(context);
              });
            } catch (e, s) {
              hideLoaderDialog(context);
              showErrorDialog(context, e.toString());
            }
          },
          child: Text(
            'Clock In',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white,
                fontSize: Adaptive.sp(14),
                fontWeight: FontWeight.w800),
          ),
        ),
      ),
    ],
  );
}

showCustomAlertDialog(BuildContext context, Widget child, String title,
        {VoidCallback? approve, VoidCallback? reject}) =>
    AlertDialog(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                title,
                style: TextStyle(
                    fontSize: Adaptive.sp(18), fontWeight: FontWeight.bold),
              ),
              Spacer(),
              IconButton(
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true).pop();
                  },
                  icon: Icon(Icons.close))
            ],
          ),
          Divider(
            endIndent: 150,
            thickness: 4,
          )
        ],
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      backgroundColor: Colors.white,
      content: child,
      actions: [
        Padding(
          padding: const Pad(all: 10),
          child: ElevatedButton(
            onPressed: approve,
            child: Text(
              'Approve',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: Adaptive.sp(14),
                  fontWeight: FontWeight.w800),
            ),
            style: buttonStyle,
          ),
        ),
        Padding(
          padding: const Pad(all: 10),
          child: ElevatedButton(
            onPressed: reject,
            child: Text(
              'Reject',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: Adaptive.sp(14),
                  fontWeight: FontWeight.w800),
            ),
            style: buttonStyleReject,
          ),
        ),
      ],
    );

showAppUpdateDialog(BuildContext context, String title, String content) =>
    AlertDialog(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                title,
                style: TextStyle(
                    fontSize: Adaptive.sp(18), fontWeight: FontWeight.bold),
              ),
              Spacer(),
              // IconButton(
              //     onPressed: () {
              //       Navigator.of(context, rootNavigator: true).pop();
              //     },
              //     icon: Icon(Icons.close))
            ],
          ),
          Divider(
            endIndent: 150,
            thickness: 4,
          )
        ],
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      backgroundColor: Colors.white,
      content: Text(
        content,
        style:
            TextStyle(fontWeight: FontWeight.bold, fontSize: Adaptive.sp(17)),
      ),
      actions: [
        Padding(
          padding: const Pad(all: 10),
          child: ElevatedButton(
            onPressed: () {
              if (Platform.isAndroid || Platform.isIOS) {
                final appId = Platform.isAndroid
                    ? 'com.apnagodam.staff'
                    : 'com.apnagodam.staff';
                final url = Uri.parse(
                  Platform.isAndroid
                      ? "market://details?id=$appId"
                      : "https://apps.apple.com/app/id$appId",
                );
                launchUrl(
                  url,
                  mode: LaunchMode.externalApplication,
                );
              }
            },
            child: Text(
              'Download',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: Adaptive.sp(14),
                  fontWeight: FontWeight.w800),
            ),
            style: buttonStyle,
          ),
        ),
      ],
    );
showcaseIdCustomAlertDialog(BuildContext context, Widget child, String title,
        {VoidCallback? ok}) =>
    AlertDialog(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                title,
                style: TextStyle(
                    fontSize: Adaptive.sp(18), fontWeight: FontWeight.bold),
              ),
              Spacer(),
              IconButton(
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true).pop();
                  },
                  icon: Icon(Icons.close))
            ],
          ),
          Divider(
            endIndent: 150,
            thickness: 4,
          )
        ],
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      backgroundColor: Colors.white,
      content: child,
      actions: [
        Padding(
          padding: const Pad(all: 10),
          child: ElevatedButton(
            onPressed: ok,
            child: Text(
              'Done',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: Adaptive.sp(14),
                  fontWeight: FontWeight.w800),
            ),
            style: buttonStyle,
          ),
        ),
      ],
    );

showConfirmAlertDialog(BuildContext context, Widget child, String title,
        {VoidCallback? approve, VoidCallback? reject}) =>
    AlertDialog(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: Adaptive.sp(18), fontWeight: FontWeight.bold),
          ),
          Divider(
            endIndent: 150,
            thickness: 4,
          )
        ],
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      backgroundColor: Colors.white,
      content: child,
      actions: [
        Padding(
          padding: const Pad(all: 10),
          child: ElevatedButton(
            onPressed: approve,
            child: Text(
              'Confirm',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: Adaptive.sp(14),
                  fontWeight: FontWeight.w800),
            ),
            style: buttonStyle,
          ),
        ),
        Padding(
          padding: const Pad(all: 10),
          child: ElevatedButton(
            onPressed: reject,
            child: Text(
              'Cancel',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: Adaptive.sp(14),
                  fontWeight: FontWeight.w800),
            ),
            style: buttonStyleReject,
          ),
        ),
      ],
    );
