// ignore_for_file: must_be_immutable

import 'dart:io';
import 'dart:typed_data';

import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:button_animations/button_animations.dart';
import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:emp_apnagodam/Data/Models/DharamKantaListingModel.dart';
import 'package:emp_apnagodam/Domain/FirstKantaParchi/KantaParchiService.dart';
import 'package:emp_apnagodam/Presentation/UI/Attendance/InAppCameraModule.dart';
import 'package:emp_apnagodam/Presentation/Widgets/widgets.dart';
import 'package:emp_apnagodam/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:screenshot/screenshot.dart';

import '../../../Domain/CaseId/CaseIdService.dart';
import '../../Constants/ColorConstant.dart';

class FirstKantaParchi extends ConsumerStatefulWidget {
  FirstKantaParchi(
      {super.key,
      required this.caseId,
      required this.customerName,
      required this.inOut,
      required this.warehouseId});

  String? caseId;
  String? customerName;
  String? inOut;
  String? warehouseId;
  ImagePicker imagePicker = ImagePicker();

  @override
  ConsumerState<FirstKantaParchi> createState() => _FirstkantaParchiState();
}

class _FirstkantaParchiState extends ConsumerState<FirstKantaParchi> {
  TextEditingController kantaParchiController = TextEditingController();
  TextEditingController oldKantaParchiNumberController =
      TextEditingController();
  TextEditingController oldKantaParchiLocationController =
      TextEditingController();
  TextEditingController oldKantaParchiNameController = TextEditingController();
  TextEditingController oldKantaParchiNetWeightController =
      TextEditingController();
  TextEditingController oldKantaParchiTareWeightController =
      TextEditingController();
  TextEditingController oldKantaParchiGrossWeightController =
      TextEditingController();
  TextEditingController oldNoOfBagsController = TextEditingController();

  ScreenshotController kantaScreenShotController = ScreenshotController();
  ScreenshotController truckScreenShotController = ScreenshotController();
  ScreenshotController oldKantaParchiScreenshotController =
      ScreenshotController();

  var dharamKantaProvider = StateProvider<DharemKanta?>((ref) => null);
  var kantaParchiImageProvider = StateProvider<File?>((ref) => null);

  var truckImageProvider = StateProvider<File?>((ref) => null);
  var oldKantaParchiImageProvider = StateProvider<File?>((ref) => null);
  TextEditingController searchController = TextEditingController();

  TextEditingController notesController = TextEditingController();
  final kpForm = GlobalKey<FormState>();
  final _oldKantaVisibilityProvider = StateProvider((ref) => false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: kpForm,
      child: Platform.isIOS
          ? CupertinoPageScaffold(
              navigationBar: cupertinoAppBar("First Kanta Parchi", context),
              child: kantaParchiLayout(context, ref, widget.inOut ?? "IN"))
          : Scaffold(
              appBar: AppBar(
                title: Text('First Kanta Parchi'),
              ),
              body: kantaParchiLayout(context, ref, widget.inOut ?? "IN"),
            ),
    ));
  }

  kantaParchiLayout(BuildContext context, WidgetRef ref, String inOut) => ref
      .watch(dharamKantaDetailsProvider(warehouseId: widget.warehouseId))
      .when(
          data: (data) => Padding(
                padding: Pad(all: 10),
                child: ListView(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Text(
                        widget.caseId ?? "",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: Adaptive.sp(17)),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(widget.customerName ?? "",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: Adaptive.sp(17))),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Container(
                          child: Column(
                            children: [
                              Text(
                                'Kanta Image*',
                                style: TextStyle(
                                    fontSize: Adaptive.sp(16),
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                height: 100,
                                child: InkWell(
                                  child: DottedBorder(
                                    color: primaryColorDark,
                                    borderType: BorderType.RRect,
                                    padding: Pad(all: 10),
                                    radius: Radius.circular(5),
                                    child: Center(
                                        child: ref.watch(
                                                    kantaParchiImageProvider) ==
                                                null
                                            ? ColumnSuper(
                                                children: const [
                                                  Icon(
                                                    Icons.file_upload_rounded,
                                                    color: primaryColorDark,
                                                  ),
                                                  Text(
                                                    'First Kanta Image',
                                                    style: TextStyle(
                                                        color: primaryColorDark,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )
                                                ],
                                              )
                                            : zoomWidget(
                                                ref
                                                        .watch(
                                                            kantaParchiImageProvider)
                                                        ?.readAsBytesSync() ??
                                                    Uint8List(0),
                                              )),
                                  ),
                                  onTap: () async {
                                    showModalBottomSheet(
                                        context: context,
                                        isScrollControlled: true,
                                        builder: (bottomsheetContext) =>
                                            ElevarmDraggableBottomSheet(
                                                initialChildSize: 1,
                                                title:
                                                    'Capture Kanta Parchi Image',
                                                onPressedClose: () =>
                                                    Navigator.of(
                                                            bottomsheetContext,
                                                            rootNavigator:
                                                                false)
                                                        .pop(),
                                                children: [
                                                  InAppCameraModule(
                                                    captureImage:
                                                        (mediaCapture) {
                                                      if (mediaCapture!
                                                              .status ==
                                                          MediaCaptureStatus
                                                              .success) {
                                                       
                                                        createStampedImageFile(
                                                                XFile(mediaCapture
                                                                    .captureRequest
                                                                    .path!),
                                                                ref)
                                                            .then(
                                                                (image) async {
                                                          if (image != null) {
                                                            ref
                                                                .watch(
                                                                    kantaParchiImageProvider
                                                                        .notifier)
                                                                .state = File(image);
                                                          }
                                                           Navigator.of(
                                                                  bottomsheetContext,
                                                                  rootNavigator:
                                                                      false)
                                                              .pop();
                                                        });
                                                      }
                                                    
                                                    },
                                                  )
                                                ]));
                                  },
                                ),
                              ),
                            ],
                          ),
                        )),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: Container(
                          child: Column(
                            children: [
                              Text(
                                'Truck Image*',
                                style: TextStyle(
                                    fontSize: Adaptive.sp(16),
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                height: 100,
                                child: InkWell(
                                  child: DottedBorder(
                                    color: primaryColorDark,
                                    borderType: BorderType.RRect,
                                    padding: Pad(all: 10),
                                    radius: Radius.circular(5),
                                    child: Center(
                                        child: ref.watch(truckImageProvider) ==
                                                null
                                            ? ColumnSuper(
                                                children: const [
                                                  Icon(
                                                    Icons.file_upload_rounded,
                                                    color: primaryColorDark,
                                                  ),
                                                  Text(
                                                    'Truck Image',
                                                    style: TextStyle(
                                                        color: primaryColorDark,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )
                                                ],
                                              )
                                            : zoomWidget(ref
                                                .watch(truckImageProvider)
                                                ?.readAsBytesSync())),
                                  ),
                                  onTap: () async {
                                    showModalBottomSheet(
                                        context: context,
                                        isScrollControlled: true,
                                        builder: (bottomsheetContext) =>
                                            ElevarmDraggableBottomSheet(
                                                initialChildSize: 1,
                                                title: 'Capture Truck Image',
                                                onPressedClose: () =>
                                                    Navigator.of(
                                                            bottomsheetContext,
                                                            rootNavigator:
                                                                false)
                                                        .pop(),
                                                children: [
                                                  InAppCameraModule(
                                                    captureImage:
                                                        (mediaCapture) async {
                                                      if (mediaCapture!
                                                              .status ==
                                                          MediaCaptureStatus
                                                              .success) {
                                                        createStampedImageFile(
                                                                XFile(mediaCapture
                                                                    .captureRequest
                                                                    .path!),
                                                                ref)
                                                            .then(
                                                                (image) async {
                                                          ref
                                                              .watch(
                                                                  truckImageProvider
                                                                      .notifier)
                                                              .state = File(image!);

                                                          Navigator.of(
                                                                  bottomsheetContext,
                                                                  rootNavigator:
                                                                      false)
                                                              .pop();
                                                        });
                                                      }
                                                    },
                                                  )
                                                ]));
                                  },
                                ),
                              ),
                            ],
                          ),
                        ))
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    titleWidget(text: 'Enter Kanta Parchi Number'),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: kantaParchiController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please input kanta parchi number';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          label: Text('Enter Kanta Parchi Number*'),
                          contentPadding:
                              const Pad(top: 0, bottom: 0, left: 10),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5))),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    titleWidget(text: 'Kanta Name'),
                    Container(
                      alignment: Alignment.center,
                      padding: Pad(all: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: primaryColorDark),
                          borderRadius: BorderRadius.circular(5)),
                      child: Text(
                        '${data.data?.name ?? "No Kanta Available"}',
                        style: TextStyle(
                            color: primaryColorDark,
                            fontWeight: FontWeight.bold,
                            fontSize: Adaptive.sp(16)),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    if (inOut.toLowerCase().toString() != "out")
                      ElevarmSwitchListTile(
                        title: 'Show Old Kanta Details',
                        value: ref.watch(_oldKantaVisibilityProvider),
                        positiveLabel: "yes",
                        negativeLabel: "no",
                        onChanged: (value) {
                          ref
                              .watch(_oldKantaVisibilityProvider.notifier)
                              .state = value ?? false;
                        },
                      ),
                    Visibility(
                        visible: inOut.toLowerCase().toString() != "out" &&
                            ref.watch(_oldKantaVisibilityProvider),
                        child: Column(
                          children: [
                            Text(
                              'Old Kanta Parchi Image',
                              style: TextStyle(
                                  fontSize: Adaptive.sp(16),
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: 100,
                              child: InkWell(
                                child: DottedBorder(
                                  color: primaryColorDark,
                                  borderType: BorderType.RRect,
                                  padding: Pad(all: 10),
                                  radius: Radius.circular(5),
                                  child: Center(
                                      child: ref.watch(
                                                  oldKantaParchiImageProvider) ==
                                              null
                                          ? ColumnSuper(
                                              children: const [
                                                Icon(
                                                  Icons.file_upload_rounded,
                                                  color: primaryColorDark,
                                                ),
                                                Text(
                                                  'Old Kanta Parchi Image',
                                                  style: TextStyle(
                                                      color: primaryColorDark,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )
                                              ],
                                            )
                                          : zoomWidget(ref
                                              .watch(
                                                  oldKantaParchiImageProvider)
                                              ?.readAsBytesSync())),
                                ),
                                onTap: () async {
                                  try {
                                    ImagePicker()
                                        .pickImage(
                                            source: ImageSource.camera,
                                            maxWidth: 1600,
                                            maxHeight: 1800,
                                            imageQuality: 25)
                                        .then((value) async {
                                      if (value != null) {
                                        createStampedImageFile(value, ref)
                                            .then((value) {
                                          ref
                                              .watch(oldKantaParchiImageProvider
                                                  .notifier)
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
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            titleWidget(text: 'Enter Old Kanta Parchi Number'),
                            TextFormField(
                              keyboardType: TextInputType.number,
                              controller: oldKantaParchiNumberController,
                              decoration: InputDecoration(
                                  label: Text('Enter Old Kanta Parchi Number'),
                                  contentPadding:
                                      const Pad(top: 0, bottom: 0, left: 10),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5))),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            titleWidget(text: 'Enter Old Kanta Parchi Name'),
                            TextFormField(
                              keyboardType: TextInputType.text,
                              controller: oldKantaParchiNameController,
                              decoration: InputDecoration(
                                  label: Text('Enter Old Kanta Parchi Name'),
                                  contentPadding:
                                      const Pad(top: 0, bottom: 0, left: 10),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5))),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            titleWidget(
                                text: 'Enter Old Kanta Parchi Location'),
                            TextFormField(
                              keyboardType: TextInputType.text,
                              controller: oldKantaParchiLocationController,
                              decoration: InputDecoration(
                                  label:
                                      Text('Enter Old Kanta Parchi Location'),
                                  contentPadding:
                                      const Pad(top: 0, bottom: 0, left: 10),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5))),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            titleWidget(
                                text: 'Enter Old Kanta Parchi Net weight(kG)'),
                            TextFormField(
                              keyboardType: TextInputType.number,
                              controller: oldKantaParchiNetWeightController,
                              decoration: InputDecoration(
                                  label: Text(
                                      'Enter Old Kanta Parchi Net weight(kG)'),
                                  contentPadding:
                                      const Pad(top: 0, bottom: 0, left: 10),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5))),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        )),
                    titleWidget(text: 'Enter Notes'),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: notesController,
                      maxLines: 5,
                      decoration: InputDecoration(
                          label: Text('Notes'),
                          contentPadding: const Pad(all: 10),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5))),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    AnimatedButton(
                      color: primaryColorDark,
                      width: MediaQuery.of(context).size.width / 1.1,
                      height: 50,
                      isOutline: true,
                      isMultiColor: true,
                      colors: const [primaryColorDark, primaryColorDark],
                      borderWidth: 1,
                      onTap: () {
                        if (kpForm.currentState!.validate()) {
                          if (data.data?.name == null) {
                            Fluttertoast.showToast(
                                msg:
                                    "Kanta not available for current warehouse please contact ivr");
                            return;
                          } else if (ref.watch(kantaParchiImageProvider) ==
                              null) {
                            Fluttertoast.showToast(
                                msg: "Please select kanta parchi image");
                            return;
                          } else if (ref.watch(truckImageProvider) == null) {
                            Fluttertoast.showToast(
                                msg: "Please select truck image");
                            return;
                          } else {
                            showLoaderDialog(context);
                            ref
                                .watch(uploadFirstKantaParchiV1Provider(
                                        caseId: widget.caseId,
                                        notes: notesController.text,
                                        kantaImage:
                                            ref.watch(kantaParchiImageProvider),
                                        truckImage:
                                            ref.watch(truckImageProvider),
                                        kantaId: "${data.data?.id}",
                                        kantaParchiNumber: kantaParchiController
                                            .text
                                            .toString(),
                                        oldKantaFile: ref
                                            .watch(oldKantaParchiImageProvider),
                                        oldKantaNumber:
                                            oldKantaParchiNumberController.text,
                                        oldKantaLocation:
                                            oldKantaParchiLocationController
                                                .text
                                                .toString(),
                                        oldKantaName:
                                            oldKantaParchiNameController.text
                                                .toString(),
                                        oldKantaWeight:
                                            oldKantaParchiNetWeightController
                                                .text
                                                .toString(),
                                        netweight:
                                            oldKantaParchiNetWeightController
                                                .text
                                                .toString(),
                                        inOutType: inOut)
                                    .future)
                                .then((value) {
                              hideLoaderDialog(context);

                              if (value['status'].toString() == "1") {
                                ref.invalidate(caseIdProvider);
                                ref.watch(goRouterProvider).pop();
                              }
                            }).onError((e, s) {
                              hideLoaderDialog(context);
                            });
                          }
                        }
                      },
                      child: const Text(
                        "Submit",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
          error: (e, s) => Container(),
          loading: () => secondKantaShimmer());
}
