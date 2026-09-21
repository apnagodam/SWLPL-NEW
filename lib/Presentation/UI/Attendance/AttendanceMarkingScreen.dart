// ignore_for_file: unused_catch_stack

import 'dart:io';
import 'dart:typed_data';

import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:button_animations/button_animations.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:emp_apnagodam/Presentation/Widgets/widgets.dart';
import 'package:emp_apnagodam/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:zoom_pinch_overlay/zoom_pinch_overlay.dart';

import '../../../Data/Models/CheckForLateResponse.dart';
import '../../../Data/SharedPrefs/SharedUtility.dart';
import '../../../Domain/Attendance/AttendanceService.dart';
import '../../../Domain/Authentication/AuthenticationService.dart';
import '../../Constants/ColorConstant.dart';
import '../TruckBook/CreateTruckBook.dart';

class AttendanceMarkingScreen extends ConsumerStatefulWidget {
  const AttendanceMarkingScreen({super.key});

  @override
  ConsumerState<AttendanceMarkingScreen> createState() =>
      _AttendanceMarkingScreenState();
}

class _AttendanceMarkingScreenState
    extends ConsumerState<AttendanceMarkingScreen> {
  var attendanceImageProvider = StateProvider<File?>((ref) => null);
  var purposeController = TextEditingController();
  ImagePicker imagePicker = ImagePicker();

  Future<void> _pickAndStampImage({ImageSource source = ImageSource.camera}) async {
    try {
      final value = await pickImage(source: source);
      if (value != null) {
        showLoaderDialog(context);
        String? stamped;
        try {
          stamped = await createStampedImageFile(value, ref);
        } catch (e) {
          debugPrint("Watermark failed: $e");
        } finally {
          hideLoaderDialog(context);
        }
        final finalPath = stamped ?? value.path;
        ref.read(attendanceImageProvider.notifier).state = File(finalPath);
      }
    } catch (e, s) {
      debugPrintStack(stackTrace: s);
      if (mounted) {
        showErrorDialog(context, "Could not open camera: $e");
      }
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mark Attendance',
        ),
      ),
      body: SafeArea(
          child: ref.watch(attendanceStatusProvider).when(
              data: (data) => data.status.toString() == "3"
                  ? logoutWidget('Session Expire please login again!', context)
                  : ListView(
                      children: [
                        Padding(
                          padding: const Pad(all: 10),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [


                                Text(
                                  "${ref.watch(sharedUtilityProvider).getUser()?.firstName} ${ref.watch(sharedUtilityProvider).getUser()?.lastName}(${ref.watch(sharedUtilityProvider).getUser()?.empId})",
                                  style: TextStyle(
                                      fontSize: Adaptive.sp(18),
                                      fontWeight: FontWeight.bold,
                                      color: primaryColor),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: 250,
                                  child: InkWell(
                                    child: DottedBorder(
                                      color: primaryColorDark,
                                      borderType: BorderType.RRect,
                                      padding: const Pad(all: 10),
                                      radius: const Radius.circular(5),
                                      child: Center(
                                        child: ref.watch(
                                                    attendanceImageProvider) ==
                                                null
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
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )
                                                ],
                                              )
                                            : InkWell(
                                                onTap: () => _pickAndStampImage(source: ImageSource.camera),
                                                child: ZoomOverlay(
                                                  modalBarrierColor:
                                                      Colors.black12,
                                                  // Optional
                                                  minScale: 0.5,
                                                  // Optional
                                                  maxScale: 3.0,
                                                  // Optional
                                                  animationCurve:
                                                      Curves.fastOutSlowIn,
                                                  // Defaults to fastOutSlowIn which mimics IOS instagram behavior
                                                  animationDuration:
                                                      const Duration(
                                                          milliseconds: 300),
                                                  // Defaults to 100 Milliseconds. Recommended duration is 300 milliseconds for Curves.fastOutSlowIn
                                                  twoTouchOnly: true,
                                                  // Defaults to false
                                                  onScaleStart: () {},
                                                  // optional VoidCallback
                                                  onScaleStop: () {},
                                                  // optional VoidCallback
                                                  child: Image.file(
                                                    ref.watch(
                                                        attendanceImageProvider)!,
                                                    key: ValueKey(ref
                                                        .watch(
                                                            attendanceImageProvider)!
                                                        .path),
                                                    fit: BoxFit.contain,
                                                    height: 250,
                                                  ),
                                                ),
                                              ),
                                      ),
                                    ),
                                    onTap: () => _pickAndStampImage(source: ImageSource.camera),
                                  ),
                                ),
                                 const SizedBox(
                                   height: 10,
                                 ),

                                   RowSuper(fitHorizontally: true, children: [
                                    Padding(
                                      padding: const Pad(all: 10),
                                      child: AnimatedButton(
                                        height: 50,
                                        enabled: data.clockStatus?.toString() != "2",
                                        color: data.clockStatus?.toString() != "2"
                                            ? primaryColorDark
                                            : Colors.grey,
                                        isOutline: true,
                                        isMultiColor: true,
                                        colors: [
                                          data.clockStatus?.toString() != "2"
                                              ? primaryColorDark
                                              : Colors.grey,
                                          data.clockStatus?.toString() != "2"
                                              ? primaryColorDark
                                              : Colors.grey
                                        ],
                                        borderWidth: 1,
                                        onTap: () async {
                                            if (ref.read(attendanceImageProvider) == null) {
                                              showDialog(
                                                context: context,
                                                builder: (alertCtx) => AlertDialog(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(12)),
                                                  title: const Row(
                                                    children: [
                                                      Icon(Icons.camera_alt_rounded,
                                                          color: primaryColorDark),
                                                      SizedBox(width: 8),
                                                      Text(
                                                        "Photo Required",
                                                        style: TextStyle(
                                                            fontSize: 16, fontWeight: FontWeight.bold),
                                                      ),
                                                    ],
                                                  ),
                                                  content: const Text(
                                                    "Please capture an attendance photo before clocking in.",
                                                    style: TextStyle(fontSize: 14),
                                                  ),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () => Navigator.pop(alertCtx),
                                                      child: const Text("Cancel"),
                                                    ),
                                                    ElevatedButton.icon(
                                                      style: ElevatedButton.styleFrom(
                                                        backgroundColor: primaryColorDark,
                                                      ),
                                                      onPressed: () {
                                                        Navigator.pop(alertCtx);
                                                        _pickAndStampImage();
                                                      },
                                                      icon: const Icon(Icons.camera_alt_outlined,
                                                          color: Colors.white, size: 18),
                                                      label: const Text(
                                                        "Take Photo",
                                                        style: TextStyle(color: Colors.white),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                              return;
                                            }

                                              showLoaderDialog(context);

                                              // 1. Hit lateReason API before checkin
                                              CheckForLateResponse? lateCheck;
                                              try {
                                                ref.invalidate(checkForLateProvider);
                                                lateCheck = await ref.read(checkForLateProvider.future);
                                              } catch (e) {
                                                debugPrint("Error checking lateReason: $e");
                                              }

                                              hideLoaderDialog(context);

                                              Future<void> submitClockIn(String purpose) async {
                                                showLoaderDialog(context);
                                                try {
                                                  // Ensure location is valid
                                                  var currentLoc = ref.read(locationProvider);
                                                  if (currentLoc == null) {
                                                    try {
                                                      currentLoc = await Geolocator.getCurrentPosition(
                                                          timeLimit: const Duration(seconds: 5));
                                                      ref.read(locationProvider.notifier).state = currentLoc;
                                                    } catch (_) {
                                                      try {
                                                        currentLoc = await Geolocator.getLastKnownPosition();
                                                        if (currentLoc != null) {
                                                          ref.read(locationProvider.notifier).state = currentLoc;
                                                        }
                                                      } catch (_) {}
                                                    }
                                                  }

                                                  var dist = ref.read(distanceProvider);
                                                  if ((dist == null || dist.toString() == "0.0") && currentLoc != null) {
                                                    final user = ref.read(sharedUtilityProvider).getUser();
                                                    final attenLat = double.tryParse(user?.attenLat ?? "0.0") ?? 0.0;
                                                    final attenLong = double.tryParse(user?.attenLong ?? "0.0") ?? 0.0;
                                                    if (attenLat != 0.0 && attenLong != 0.0) {
                                                      dist = Geolocator.distanceBetween(
                                                        currentLoc.latitude,
                                                        currentLoc.longitude,
                                                        attenLat,
                                                        attenLong,
                                                      ).toString();
                                                      ref.read(distanceProvider.notifier).state = dist;
                                                    }
                                                  }

                                                  // Hit attendance API
                                                  var value = await ref.read(postAttendanceV2Provider(
                                                    userPurpose: purpose,
                                                    clockStatus: '1',
                                                    distance: dist?.toString() ?? "0.0",
                                                    image: ref.read(attendanceImageProvider),
                                                    lat: currentLoc != null ? '${currentLoc.latitude}' : '0.0',
                                                    long: currentLoc != null ? '${currentLoc.longitude}' : '0.0',
                                                  ).future);

                                                  hideLoaderDialog(context);
                                                  if (value['status'].toString() == "1") {
                                                    ref.invalidate(attendanceStatusProvider);
                                                    ref.invalidate(attendanceImageProvider);
                                                    ref.read(goRouterProvider).pop();
                                                    Fluttertoast.showToast(msg: '${value['message']}');
                                                  } else {
                                                    showErrorDialog(
                                                        context, '${value['message'] ?? "Unable to Clock In"}');
                                                  }
                                                } catch (e) {
                                                  hideLoaderDialog(context);
                                                  showErrorDialog(context, "Clock In failed: $e");
                                                }
                                              }

                                              // If ask_reason == 1 then show, if 0 then not show
                                              bool shouldAskReason = lateCheck != null &&
                                                  (lateCheck.askReason == 1 || lateCheck.askReason.toString() == "1");

                                              if (!shouldAskReason) {
                                                await submitClockIn("");
                                              } else {
                                                TextEditingController dialogReasonCtrl = TextEditingController();

                                                showDialog(
                                                  context: context,
                                                  barrierDismissible: false,
                                                  builder: (dialogCtx) => AlertDialog(
                                                    title: const Text("Attendance Reason"),
                                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                                    content: Column(
                                                      mainAxisSize: MainAxisSize.min,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        TextField(
                                                          controller: dialogReasonCtrl,
                                                          maxLines: 3,
                                                          decoration: const InputDecoration(
                                                            labelText: "Reason for Late Attendance *",
                                                            hintText: "Enter reason here...",
                                                            border: OutlineInputBorder(),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () => Navigator.pop(dialogCtx),
                                                        child: const Text("Cancel"),
                                                      ),
                                                      ElevatedButton(
                                                        style: ElevatedButton.styleFrom(backgroundColor: primaryColorDark),
                                                        onPressed: () async {
                                                          if (dialogReasonCtrl.text.trim().isEmpty) {
                                                            Fluttertoast.showToast(msg: "Please enter late attendance reason");
                                                            return;
                                                          }
                                                          Navigator.pop(dialogCtx);
                                                          await submitClockIn(dialogReasonCtrl.text.trim());
                                                        },
                                                        child: const Text("Submit", style: TextStyle(color: Colors.white)),
                                                      ),
                                                    ],
                                                  ),
                                                );
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
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Padding(
                                      padding: const Pad(all: 10),
                                      child: AnimatedButton(
                                        height: 50,
                                        enabled: data.clockStatus?.toString() == "2",
                                        color: data.clockStatus?.toString() == "2"
                                            ? primaryColorDark
                                            : Colors.grey,
                                        isOutline: true,
                                        isMultiColor: true,
                                        colors: [
                                          data.clockStatus?.toString() == "2"
                                              ? primaryColorDark
                                              : Colors.grey,
                                          data.clockStatus?.toString() == "2"
                                              ? primaryColorDark
                                              : Colors.grey
                                        ],
                                        borderWidth: 1,
                                        onTap: () async {
                                             if (ref.read(attendanceImageProvider) == null) {
                                               showDialog(
                                                 context: context,
                                                 builder: (alertCtx) => AlertDialog(
                                                   shape: RoundedRectangleBorder(
                                                       borderRadius: BorderRadius.circular(12)),
                                                   title: const Row(
                                                     children: [
                                                       Icon(Icons.camera_alt_rounded,
                                                           color: primaryColorDark),
                                                       SizedBox(width: 8),
                                                       Text(
                                                         "Photo Required",
                                                         style: TextStyle(
                                                             fontSize: 16, fontWeight: FontWeight.bold),
                                                       ),
                                                     ],
                                                   ),
                                                   content: const Text(
                                                     "Please capture an attendance photo before clocking out.",
                                                     style: TextStyle(fontSize: 14),
                                                   ),
                                                   actions: [
                                                     TextButton(
                                                       onPressed: () => Navigator.pop(alertCtx),
                                                       child: const Text("Cancel"),
                                                     ),
                                                     ElevatedButton.icon(
                                                       style: ElevatedButton.styleFrom(
                                                         backgroundColor: primaryColorDark,
                                                       ),
                                                       onPressed: () {
                                                         Navigator.pop(alertCtx);
                                                         _pickAndStampImage();
                                                       },
                                                       icon: const Icon(Icons.camera_alt_outlined,
                                                           color: Colors.white, size: 18),
                                                       label: const Text(
                                                         "Take Photo",
                                                         style: TextStyle(color: Colors.white),
                                                       ),
                                                     ),
                                                   ],
                                                 ),
                                               );
                                               return;
                                             }

                                              showLoaderDialog(context);

                                              // 1. Hit lateReason API before checkout
                                              CheckForLateResponse? lateCheck;
                                              try {
                                                ref.invalidate(checkForLateProvider);
                                                lateCheck = await ref.read(checkForLateProvider.future);
                                              } catch (e) {
                                                debugPrint("Error checking lateReason: $e");
                                              }

                                              hideLoaderDialog(context);

                                             Future<void> submitClockOut(String purpose) async {
                                               showLoaderDialog(context);
                                               try {
                                                 // Ensure location is valid
                                                 var currentLoc = ref.read(locationProvider);
                                                 if (currentLoc == null) {
                                                   try {
                                                     currentLoc = await Geolocator.getCurrentPosition(
                                                         timeLimit: const Duration(seconds: 5));
                                                     ref.read(locationProvider.notifier).state = currentLoc;
                                                   } catch (_) {
                                                     try {
                                                       currentLoc = await Geolocator.getLastKnownPosition();
                                                       if (currentLoc != null) {
                                                         ref.read(locationProvider.notifier).state = currentLoc;
                                                       }
                                                     } catch (_) {}
                                                   }
                                                 }

                                                 var dist = ref.read(distanceProvider);
                                                 if ((dist == null || dist.toString() == "0.0") && currentLoc != null) {
                                                   final user = ref.read(sharedUtilityProvider).getUser();
                                                   final attenLat = double.tryParse(user?.attenLat ?? "0.0") ?? 0.0;
                                                   final attenLong = double.tryParse(user?.attenLong ?? "0.0") ?? 0.0;
                                                   if (attenLat != 0.0 && attenLong != 0.0) {
                                                     dist = Geolocator.distanceBetween(
                                                       currentLoc.latitude,
                                                       currentLoc.longitude,
                                                       attenLat,
                                                       attenLong,
                                                     ).toString();
                                                     ref.read(distanceProvider.notifier).state = dist;
                                                   }
                                                 }

                                                 // Hit attendance API
                                                 var value = await ref.read(postAttendanceV2Provider(
                                                   userPurpose: purpose,
                                                   clockStatus: '2',
                                                   distance: dist?.toString() ?? "0.0",
                                                   image: ref.read(attendanceImageProvider),
                                                   lat: currentLoc != null ? '${currentLoc.latitude}' : '0.0',
                                                   long: currentLoc != null ? '${currentLoc.longitude}' : '0.0',
                                                 ).future);

                                                 hideLoaderDialog(context);
                                                 if (value['status'].toString() == "1") {
                                                   ref.invalidate(attendanceStatusProvider);
                                                   ref.invalidate(attendanceImageProvider);
                                                   ref.read(goRouterProvider).pop();
                                                   Fluttertoast.showToast(msg: '${value['message']}');
                                                 } else {
                                                   showErrorDialog(
                                                       context, '${value['message'] ?? "Unable to Clock Out"}');
                                                 }
                                               } catch (e) {
                                                 hideLoaderDialog(context);
                                                 showErrorDialog(context, "Clock Out failed: $e");
                                               }
                                             }

                                              // If ask_reason == 1 then show, if 0 then not show
                                              bool shouldAskReason = lateCheck != null &&
                                                  (lateCheck.askReason == 1 || lateCheck.askReason.toString() == "1");

                                              if (!shouldAskReason) {
                                                await submitClockOut("");
                                              } else {
                                               TextEditingController dialogReasonCtrl = TextEditingController();

                                               showDialog(
                                                 context: context,
                                                 barrierDismissible: false,
                                                 builder: (dialogCtx) => AlertDialog(
                                                   title: const Text("Attendance Reason"),
                                                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                                   content: Column(
                                                     mainAxisSize: MainAxisSize.min,
                                                     crossAxisAlignment: CrossAxisAlignment.start,
                                                     children: [
                                                       TextField(
                                                         controller: dialogReasonCtrl,
                                                         maxLines: 3,
                                                         decoration: const InputDecoration(
                                                           labelText: "Reason for Checkout *",
                                                           hintText: "Enter reason here...",
                                                           border: OutlineInputBorder(),
                                                         ),
                                                       ),
                                                     ],
                                                   ),
                                                   actions: [
                                                     TextButton(
                                                       onPressed: () => Navigator.pop(dialogCtx),
                                                       child: const Text("Cancel"),
                                                     ),
                                                     ElevatedButton(
                                                       style: ElevatedButton.styleFrom(backgroundColor: primaryColorDark),
                                                       onPressed: () async {
                                                          if (dialogReasonCtrl.text.trim().isEmpty) {
                                                            Fluttertoast.showToast(
                                                                msg: "Please enter checkout reason");
                                                            return;
                                                          }
                                                         Navigator.pop(dialogCtx);
                                                         await submitClockOut(dialogReasonCtrl.text.trim());
                                                       },
                                                       child: const Text("Submit", style: TextStyle(color: Colors.white)),
                                                     ),
                                                   ],
                                                 ),
                                               );
                                             }
                                           },
                                        child: Text(
                                          'Clock Out',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: Adaptive.sp(14),
                                              fontWeight: FontWeight.w800),
                                        ),
                                      ),
                                    ),
                                 ]),
                              ]),
                        ),
                      ],
                    ),
              error: (e, s) => Text(e.toString()),
              loading: () => Container(
                    height: Adaptive.h(100),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ))),
    );
  }
}
