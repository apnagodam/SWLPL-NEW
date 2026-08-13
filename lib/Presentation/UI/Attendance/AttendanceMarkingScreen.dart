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
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:zoom_pinch_overlay/zoom_pinch_overlay.dart';

import '../../../Data/SharedPrefs/SharedUtility.dart';
import '../../../Domain/Attendance/AttendanceService.dart';
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
                                                onTap: () async {
                                                  try {
                                                    pickImage()
                                                        .then((value) async {
                                                      if (value != null) {
                                                        await createStampedImageFile(
                                                                value, ref)
                                                            .then((value) {
                                                          if (value != null) {
                                                            ref
                                                                .watch(
                                                                    attendanceImageProvider
                                                                        .notifier)
                                                                .state = File(value);
                                                          }
                                                        });
                                                      }
                                                    });
                                                  } catch (e, s) {
                                                    debugPrintStack(
                                                      stackTrace: s,
                                                    );
                                                  }
                                                  // checkLocationPermission(ref);
                                                },
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
                                                  child: Image.memory(
                                                    ref
                                                            .watch(
                                                                attendanceImageProvider)
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
                                      // showLoaderDialog(context);
                                      try {
                                        pickImage(
                                          source: ImageSource.camera,
                                        ).then((value) async {
                                          if (value != null) {
                                            await createStampedImageFile(
                                                    value, ref)
                                                .then((value) {
                                              if (value != null) {
                                                ref
                                                    .watch(
                                                        attendanceImageProvider
                                                            .notifier)
                                                    .state = File(value);
                                              }
                                            });
                                          }
                                        });
                                      } catch (e, s) {
                                        debugPrintStack(
                                          stackTrace: s,
                                        );
                                      }
                                      // hideLoaderDialog(context);
                                      // checkLocationPermission(ref);
                                    },
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
                                       enabled: data.clockStatus == 1,
                                       color: data.clockStatus == 1
                                           ? primaryColorDark
                                           : Colors.grey,
                                       isOutline: true,
                                       isMultiColor: true,
                                       colors: [
                                         data.clockStatus == 1
                                             ? primaryColorDark
                                             : Colors.grey,
                                         data.clockStatus == 1
                                             ? primaryColorDark
                                             : Colors.grey
                                       ],
                                       borderWidth: 1,
                                       onTap: () async {
                                         if (ref.watch(attendanceImageProvider) == null) {
                                           Fluttertoast.showToast(msg: "Please Select Image");
                                           return;
                                         }
                                         final lateCheck = ref.read(checkForLateProvider).valueOrNull;
                                         bool isLate = (lateCheck?.askReason == 1 || lateCheck?.status == 1);
                                         TextEditingController dialogReasonCtrl = TextEditingController();

                                         showDialog(
                                           context: context,
                                           barrierDismissible: false,
                                           builder: (dialogCtx) => AlertDialog(
                                             title: const Text("Late Checkin Reason"),
                                             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                             content: Column(
                                               mainAxisSize: MainAxisSize.min,
                                               crossAxisAlignment: CrossAxisAlignment.start,
                                               children: [
                                                 if (isLate) ...[
                                                   Container(
                                                     padding: const EdgeInsets.all(8),
                                                     decoration: BoxDecoration(
                                                       color: Colors.amber.shade100,
                                                       borderRadius: BorderRadius.circular(6),
                                                       border: Border.all(color: Colors.amber.shade800),
                                                     ),
                                                     child: Row(
                                                       children: [
                                                         Icon(Icons.warning_amber_rounded, color: Colors.amber.shade900),
                                                         const SizedBox(width: 6),
                                                         Expanded(
                                                           child: Text(
                                                             lateCheck?.message ?? "You are marking late attendance. Please enter reason below.",
                                                             style: TextStyle(color: Colors.amber.shade900, fontWeight: FontWeight.bold, fontSize: Adaptive.sp(13)),
                                                           ),
                                                         ),
                                                       ],
                                                     ),
                                                   ),
                                                   const SizedBox(height: 10),
                                                 ],
                                                 TextField(
                                                   controller: dialogReasonCtrl,
                                                   maxLines: 3,
                                                   decoration: InputDecoration(
                                                     labelText: isLate ? "Reason for Late Attendance *" : "Purpose / Notes",
                                                     hintText: "Enter reason here...",
                                                     border: const OutlineInputBorder(),
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
                                                   if (isLate && dialogReasonCtrl.text.trim().isEmpty) {
                                                     Fluttertoast.showToast(msg: "Please enter late attendance reason");
                                                     return;
                                                   }
                                                   Navigator.pop(dialogCtx);
                                                   showLoaderDialog(context);
                                                   await ref.watch(postAttendanceV2Provider(
                                                     userPurpose: dialogReasonCtrl.text.trim(),
                                                     clockStatus: '1',
                                                     distance: ref.watch(distanceProvider).toString(),
                                                     image: ref.watch(attendanceImageProvider),
                                                     lat: '${ref.watch(locationProvider)?.latitude}',
                                                     long: '${ref.watch(locationProvider)?.longitude}',
                                                   ).future).then((value) {
                                                     hideLoaderDialog(context);
                                                     if (value['status'].toString() == "1") {
                                                       ref.invalidate(attendanceStatusProvider);
                                                       ref.invalidate(attendanceImageProvider);
                                                       ref.watch(goRouterProvider).pop();
                                                     }
                                                     Fluttertoast.showToast(msg: '${value['message']}');
                                                   }).onError((e, s) {
                                                     hideLoaderDialog(context);
                                                   });
                                                 },
                                                 child: const Text("Submit", style: TextStyle(color: Colors.white)),
                                               ),
                                             ],
                                           ),
                                         );
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
                                       enabled: data.clockStatus == 2,
                                       color: data.clockStatus == 2
                                           ? primaryColorDark
                                           : Colors.grey,
                                       isOutline: true,
                                       isMultiColor: true,
                                       colors: [
                                         data.clockStatus == 2
                                             ? primaryColorDark
                                             : Colors.grey,
                                         data.clockStatus == 2
                                             ? primaryColorDark
                                             : Colors.grey
                                       ],
                                       borderWidth: 1,
                                       onTap: () async {
                                         if (ref.watch(attendanceImageProvider) == null) {
                                           Fluttertoast.showToast(msg: "Please Select Image");
                                           return;
                                         }
                                         final lateCheck = ref.read(checkForLateProvider).valueOrNull;
                                         bool isLate = (lateCheck?.askReason == 1 || lateCheck?.status == 1);
                                         TextEditingController dialogReasonCtrl = TextEditingController();

                                         showDialog(
                                           context: context,
                                           barrierDismissible: false,
                                           builder: (dialogCtx) => AlertDialog(
                                             title: const Text("Late Checkout Reason"),
                                             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                             content: Column(
                                               mainAxisSize: MainAxisSize.min,
                                               crossAxisAlignment: CrossAxisAlignment.start,
                                               children: [
                                                 if (isLate) ...[
                                                   Container(
                                                     padding: const EdgeInsets.all(8),
                                                     decoration: BoxDecoration(
                                                       color: Colors.amber.shade100,
                                                       borderRadius: BorderRadius.circular(6),
                                                       border: Border.all(color: Colors.amber.shade800),
                                                     ),
                                                     child: Row(
                                                       children: [
                                                         Icon(Icons.warning_amber_rounded, color: Colors.amber.shade900),
                                                         const SizedBox(width: 6),
                                                         Expanded(
                                                           child: Text(
                                                             lateCheck?.message ?? "You are marking late attendance. Please enter reason below.",
                                                             style: TextStyle(color: Colors.amber.shade900, fontWeight: FontWeight.bold, fontSize: Adaptive.sp(13)),
                                                           ),
                                                         ),
                                                       ],
                                                     ),
                                                   ),
                                                   const SizedBox(height: 10),
                                                 ],
                                                 TextField(
                                                   controller: dialogReasonCtrl,
                                                   maxLines: 3,
                                                   decoration: InputDecoration(
                                                     labelText: isLate ? "Reason for Late Attendance *" : "Purpose / Notes",
                                                     hintText: "Enter reason here...",
                                                     border: const OutlineInputBorder(),
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
                                                   if (isLate && dialogReasonCtrl.text.trim().isEmpty) {
                                                     Fluttertoast.showToast(msg: "Please enter late attendance reason");
                                                     return;
                                                   }
                                                   Navigator.pop(dialogCtx);
                                                   showLoaderDialog(context);
                                                   await ref.watch(postAttendanceV2Provider(
                                                     userPurpose: dialogReasonCtrl.text.trim(),
                                                     clockStatus: '2',
                                                     distance: ref.watch(distanceProvider).toString(),
                                                     image: ref.watch(attendanceImageProvider),
                                                     lat: '${ref.watch(locationProvider)?.latitude}',
                                                     long: '${ref.watch(locationProvider)?.longitude}',
                                                   ).future).then((value) {
                                                     hideLoaderDialog(context);
                                                     if (value['status'].toString() == "1") {
                                                       ref.invalidate(attendanceStatusProvider);
                                                       ref.invalidate(attendanceImageProvider);
                                                       ref.watch(goRouterProvider).pop();
                                                     }
                                                     Fluttertoast.showToast(msg: '${value['message']}');
                                                   }).onError((e, s) {
                                                     hideLoaderDialog(context);
                                                   });
                                                 },
                                                 child: const Text("Submit", style: TextStyle(color: Colors.white)),
                                               ),
                                             ],
                                           ),
                                         );
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
                                   )
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
