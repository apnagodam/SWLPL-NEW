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

import '../../Data/SharedPrefs/SharedUtility.dart';
import '../../Domain/Attendance/AttendanceService.dart';
import '../../Domain/Authentication/AuthenticationService.dart';
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

attendanceAlertDialog(BuildContext context, WidgetRef widgetRef,
    {VoidCallback? onDismiss}) {
  return AttendanceAlertDialog(onDismiss: onDismiss);
}

class AttendanceAlertDialog extends ConsumerStatefulWidget {
  final VoidCallback? onDismiss;

  const AttendanceAlertDialog({super.key, this.onDismiss});

  @override
  ConsumerState<AttendanceAlertDialog> createState() =>
      _AttendanceAlertDialogState();
}

class _AttendanceAlertDialogState extends ConsumerState<AttendanceAlertDialog> {
  late final TextEditingController _purposeController;

  @override
  void initState() {
    super.initState();
    _purposeController = TextEditingController();
  }

  @override
  void dispose() {
    _purposeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final attendanceImage = ref.watch(attendanceImageProvider);
    final profile = ref.watch(profileDataProvider).valueOrNull?.profileData;
    final shiftStart = profile?.shiftStart;
    final bool isLate = isAttendanceTimeLate(shiftStart, isCheckIn: true);

    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      titlePadding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
      actionsPadding: const EdgeInsets.fromLTRB(20, 15, 20, 20),
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: primaryColorDark.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.fingerprint_rounded,
              color: primaryColorDark,
              size: 24,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Mark Attendance",
                  style: TextStyle(
                    fontSize: Adaptive.sp(14),
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  "Capture photo to Clock In",
                  style: TextStyle(
                    fontSize: Adaptive.sp(11),
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 2),
          InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () async {
              if (widget.onDismiss != null) {
                widget.onDismiss!();
              } else if (Navigator.of(context, rootNavigator: true).canPop()) {
                Navigator.of(context, rootNavigator: true).pop();
              }
              await ref
                  .read(sharedUtilityProvider)
                  .sharedPreferences
                  .clear();
              ref.invalidate(attendanceStatusProvider);
              ref.invalidate(attendanceImageProvider);
              ref.read(goRouterProvider).go('/login');
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.red.shade50,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.red.shade200),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.logout_rounded, size: 16, color: Colors.red.shade700),
                  const SizedBox(width: 4),
                  Text(
                    "Logout",
                    style: TextStyle(
                      fontSize: Adaptive.sp(11),
                      fontWeight: FontWeight.w600,
                      color: Colors.red.shade700,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 10),
            SizedBox(
              height: 200,
              width: double.infinity,
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                child: DottedBorder(
                  color: primaryColorDark.withOpacity(0.6),
                  borderType: BorderType.RRect,
                  dashPattern: const [6, 4],
                  padding: const Pad(all: 6),
                  radius: const Radius.circular(12),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: primaryColorDark.withOpacity(0.04),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: attendanceImage == null
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: primaryColorDark.withOpacity(0.1),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.camera_alt_rounded,
                                  color: primaryColorDark,
                                  size: 30,
                                ),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                'Capture Attendance Image',
                                style: TextStyle(
                                  color: primaryColorDark,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Tap here to take photo',
                                style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontSize: 11,
                                ),
                              ),
                            ],
                          )
                        : Stack(
                            fit: StackFit.expand,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.file(
                                  attendanceImage,
                                  key: ValueKey(attendanceImage.path),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                bottom: 8,
                                right: 8,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.6),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: const Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(Icons.refresh_rounded,
                                          size: 14, color: Colors.white),
                                      SizedBox(width: 4),
                                      Text(
                                        "Retake",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 11),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                  ),
                ),
                onTap: () async {
                  showLoaderDialog(context);
                  try {
                    final value = await ImagePicker().pickImage(
                      source: ImageSource.camera,
                      maxWidth: 600,
                      maxHeight: 800,
                      imageQuality: 10,
                    );
                    if (value != null) {
                      String? stamped;
                      try {
                        stamped = await createStampedImageFile(value, ref);
                      } catch (e) {
                        debugPrint("Watermark failed: $e");
                      }
                      final finalPath = stamped ?? value.path;
                      ref
                          .read(attendanceImageProvider.notifier)
                          .state = File(finalPath);
                    }
                  } catch (e, s) {
                    debugPrintStack(stackTrace: s);
                  } finally {
                    hideLoaderDialog(context);
                  }
                },
              ),
            ),
            if (isLate) ...[
              const SizedBox(height: 14),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                margin: const EdgeInsets.only(bottom: 8),
                decoration: BoxDecoration(
                  color: Colors.amber.shade50,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.amber.shade300),
                ),
                child: Row(
                  children: [
                    Icon(Icons.access_time_filled_rounded, size: 16, color: Colors.amber.shade800),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        "Shift Start: ${shiftStart ?? 'Scheduled'} (Late Check-in)",
                        style: TextStyle(
                          fontSize: Adaptive.sp(11),
                          color: Colors.amber.shade900,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              TextField(
                controller: _purposeController,
                maxLines: 2,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.edit_note_rounded, color: primaryColorDark),
                  labelText: "Reason for Late Attendance *",
                  hintText: "Enter reason...",
                  labelStyle: const TextStyle(fontSize: 13),
                  hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: primaryColorDark, width: 1.5),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                ),
              ),
            ],
          ],
        ),
      ),
      actions: [
        SizedBox(
          width: double.infinity,
          height: 48,
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryColorDark,
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () async {
              try {
                if (ref.read(attendanceImageProvider) == null) {
                  Fluttertoast.showToast(msg: "Please Select Image");
                  return;
                }

                final profile = ref.read(profileDataProvider).valueOrNull?.profileData;
                final shiftStart = profile?.shiftStart;
                final bool isLate = isAttendanceTimeLate(shiftStart, isCheckIn: true);

                if (isLate && _purposeController.text.trim().isEmpty) {
                  Fluttertoast.showToast(
                      msg: "Please enter late attendance reason");
                  return;
                }

                showLoaderDialog(context);

                // 1. Hit late reason API
                try {
                  await ref.read(checkForLateProvider.future);
                } catch (_) {}

                // 2. Hit attendance API
                await ref
                    .read(postAttendanceV2Provider(
                            userPurpose: _purposeController.text.trim(),
                            clockStatus: '1',
                            distance:
                                ref.read(distanceProvider).toString(),
                            image: ref.read(attendanceImageProvider),
                            lat:
                                '${ref.read(locationProvider)?.latitude}',
                            long:
                                '${ref.read(locationProvider)?.longitude}')
                        .future)
                    .then((value) {
                  hideLoaderDialog(context);
                  if (value['status'].toString() == "1") {
                    ref.invalidate(attendanceStatusProvider);
                    ref.invalidate(attendanceImageProvider);
                    if (widget.onDismiss != null) {
                      widget.onDismiss!();
                    } else {
                      Navigator.of(context, rootNavigator: true).pop();
                    }
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
            icon: const Icon(Icons.login_rounded, color: Colors.white, size: 20),
            label: const Text(
              'Clock In',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
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
