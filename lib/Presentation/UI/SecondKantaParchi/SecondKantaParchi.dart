// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:button_animations/button_animations.dart';
import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:emp_apnagodam/Domain/SecondKantaParchi/SecondKantaParchiService.dart';
import 'package:emp_apnagodam/Presentation/UI/Attendance/InAppCameraModule.dart';
import 'package:emp_apnagodam/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../Domain/CaseId/CaseIdService.dart';
import '../../Constants/ColorConstant.dart';
import '../../Widgets/widgets.dart';

//1. क्या Inward में, ट्रक रस्सा एवं त्रिपाल होकर आया ?
enum TripalType {
  yes('1', "हाँ"),
  no('0', 'नहीं');

  const TripalType(this.type, this.title);

  final String type;
  final String title;
}

enum CaseIdSingular {
  yes('1', "yes"),
  no('0', 'no');

  const CaseIdSingular(this.type, this.title);

  final String type;
  final String title;
}

enum BoriType {
  yes('1', "हाँ"),
  no('0', 'नहीं');

  const BoriType(this.type, this.title);

  final String type;
  final String title;
}

class SecondKantaParchi extends ConsumerStatefulWidget {
  SecondKantaParchi(
      {super.key,
      required this.caseId,
      required this.customerName,
      required this.warehouseId,
      required this.inOut});

  String? caseId;
  String? customerName;
  String? warehouseId;
  String? inOut;

  @override
  ConsumerState<SecondKantaParchi> createState() => _SecondKantaParchiState();
}

class _SecondKantaParchiState extends ConsumerState<SecondKantaParchi> {
  ImagePicker imagePicker = ImagePicker();
  TextEditingController kgWeightController = TextEditingController();
  TextEditingController noOfBagsController = TextEditingController();
  TextEditingController qtlWeightController = TextEditingController();
  TextEditingController avgWeightController = TextEditingController();
  TextEditingController displeasedBagsController = TextEditingController();

  var kantaParchiImageProvider = StateProvider<File?>((ref) => null);

  var truckImageProvider = StateProvider<File?>((ref) => null);

  var weightProvider = StateProvider<double?>((ref) => null);

  var noOfBagsProvider = StateProvider<int?>((ref) => null);
  var qtlWeightProviderProvider = StateProvider<double?>((ref) => null);
  var avgWeightProvider = StateProvider<double?>((ref) => null);

  TextEditingController searchController = TextEditingController();

  TextEditingController notesController = TextEditingController();
  var tripalProvider = StateProvider((ref) => TripalType.no);
  var boriProvider = StateProvider((ref) => BoriType.no);

  final form = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    displeasedBagsController.text = '0';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: form,
      child: Platform.isIOS
          ? CupertinoPageScaffold(
              navigationBar: cupertinoAppBar("Second Kanta Parchi", context),
              child: secondKantaParchiLayout(context, ref))
          : Scaffold(
              appBar: AppBar(
                title: Text('Second Kanta Parchi'),
              ),
              body: secondKantaParchiLayout(context, ref),
            ),
    ));
  }

  secondKantaParchiLayout(BuildContext context, WidgetRef ref) => Padding(
        padding: Pad(all: 10),
        child: ref
            .watch(dharamKantaDetailsProvider(
                caseId: widget.caseId, warehouseId: widget.warehouseId))
            .when(
                data: (data) => ListView(
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
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Container(
                              child: Column(
                                children: [
                                  Text(
                                    'Second Kanta Image*',
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
                                                      'Second Kanta Image',
                                                      style: TextStyle(
                                                          color:
                                                              primaryColorDark,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )
                                                  ],
                                                )
                                              : zoomWidget(ref
                                                  .watch(
                                                      kantaParchiImageProvider)
                                                  ?.readAsBytesSync()),
                                        ),
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
                                                                    true)
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
                                                              if (image !=
                                                                  null) {
                                                                ref
                                                                        .watch(kantaParchiImageProvider
                                                                            .notifier)
                                                                        .state =
                                                                    File(image);
                                                                Navigator.of(
                                                                        bottomsheetContext,
                                                                        rootNavigator:
                                                                            true)
                                                                    .pop();
                                                              }
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
                                        radius: Radius.circular(5),
                                        child: Center(
                                          child: ref.watch(
                                                      truckImageProvider) ==
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
                                                          color:
                                                              primaryColorDark,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )
                                                  ],
                                                )
                                              : zoomWidget(ref
                                                  .watch(truckImageProvider)
                                                  ?.readAsBytesSync()),
                                        ),
                                      ),
                                      onTap: () async {
                                        showModalBottomSheet(
                                            context: context,
                                            isScrollControlled: true,
                                            builder: (bottomsheetContext) =>
                                                ElevarmDraggableBottomSheet(
                                                    initialChildSize: 1,
                                                    title:
                                                        'Capture truck Image',
                                                    onPressedClose: () =>
                                                        Navigator.of(
                                                                bottomsheetContext,
                                                                rootNavigator:
                                                                    true)
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
                                                              if (image !=
                                                                  null) {
                                                                ref
                                                                        .watch(truckImageProvider
                                                                            .notifier)
                                                                        .state =
                                                                    File(image);
                                                              }
                                                              Navigator.of(
                                                                      bottomsheetContext,
                                                                      rootNavigator:
                                                                          true)
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
                        Text(
                          'Kanta Parchi Number',
                          style: TextStyle(
                              fontSize: Adaptive.sp(16),
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          initialValue: data.data?.kantaParchiNumber ?? "",
                          decoration: InputDecoration(
                              label: Text("Kanta Parchi Number"),
                              enabled: false,
                              hintText: "Kanta Parchi Number",
                              contentPadding:
                                  const Pad(top: 0, bottom: 0, left: 10),
                              disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide:
                                      BorderSide(color: primaryColorDark)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5))),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        titleWidget(text: 'Dharam Kanta Name'),
                        Container(
                          child: Text(
                            '${data.data?.kantaName}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: Adaptive.sp(16)),
                          ),
                          alignment: Alignment.center,
                          padding: Pad(all: 10),
                          decoration: BoxDecoration(
                              border: Border.all(color: primaryColorDark),
                              borderRadius: BorderRadius.circular(5)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        titleWidget(text: 'Weight In KGs*'),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          controller: kgWeightController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter weight in KG';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            if (value.isNotEmpty && double.parse(value) != 0) {
                              qtlWeightController.text =
                                  (double.parse(value) / 100)
                                      .toStringAsFixed(2);
                            } else {
                              qtlWeightController.text = "0";
                            }
                          },
                          decoration: InputDecoration(
                              hintText: "Weight(KG)*",
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
                        titleWidget(text: 'No of Bags*'),
                        TextFormField(
                          controller: noOfBagsController,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter no of bags';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            if (kgWeightController.text.isNotEmpty &&
                                value.isNotEmpty &&
                                kgWeightController.text != "0" &&
                                value != "0") {
                              avgWeightController.text =
                                  (double.parse(kgWeightController.text) /
                                          double.parse(value))
                                      .toStringAsFixed(2);
                            }
                          },
                          decoration: InputDecoration(
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
                        titleWidget(text: 'Weight in Quintals*'),
                        TextFormField(
                          controller: qtlWeightController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              enabled: false,
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
                        titleWidget(text: 'Avg Weight(KGs)*'),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          controller: avgWeightController,
                          decoration: InputDecoration(
                              enabled: false,
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
                        titleWidget(text: 'No of De-Spillage Bags*'),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          controller: displeasedBagsController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter no of De-Spillage Bags';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
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
                        titleWidget(text: 'Notes'),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          controller: notesController,
                          maxLines: 5,
                          decoration: InputDecoration(
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
                          child: const Text(
                            "Submit",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          isOutline: true,
                          isMultiColor: true,
                          colors: [primaryColorDark, primaryColorDark],
                          borderWidth: 1,
                          onTap: () {
                            if (form.currentState!.validate()) {
                              if (ref.watch(kantaParchiImageProvider) == null) {
                                Fluttertoast.showToast(
                                    msg: 'Please Select kanta image');
                              } else if (ref.watch(truckImageProvider) ==
                                      null &&
                                  data.data?.truckPhoto
                                          .toString()
                                          .toLowerCase() ==
                                      "required") {
                                Fluttertoast.showToast(
                                    msg: 'Please Select truck image');
                              } else {
                                showLoaderDialog(context);
                                ref
                                    .watch(uploadSecondKantaParchiV1Provider(
                                            caseId: widget.caseId,
                                            notes:
                                                notesController.text.toString(),
                                            kantaParchiFile: ref.watch(
                                                kantaParchiImageProvider),
                                            truckFile:
                                                ref.watch(truckImageProvider),
                                            noOfBags: noOfBagsController.text
                                                .toString(),
                                            weight: qtlWeightController.text
                                                .toString(),
                                            avgWeight: avgWeightController.text
                                                .toString(),
                                            oldWeight: "0",
                                            displeasedBages:
                                                displeasedBagsController.text
                                                    .toString(),
                                            kantaId: '${data.data?.kantaId}',
                                            kantaName: data.data?.kantaName,
                                            kantaParchiNumber:
                                                data.data?.kantaParchiNumber,
                                            truckFacility:
                                                ref.watch(tripalProvider).type,
                                            bagsFacility:
                                                ref.watch(boriProvider).type,
                                            inOut: widget.inOut)
                                        .future)
                                    .then((value) {
                                  hideLoaderDialog(context);
                                  if (value.status.toString() == "1") {
                                    ref.invalidate(caseIdProvider);
                                    ref.watch(goRouterProvider).pop();
                                  }
                                }).onError((e, s) {
                                  hideLoaderDialog(context);
                                });
                              }
                            }
                          },
                        )
                      ],
                    ),
                error: (e, s) => errorWidget(e.toString()),
                loading: () => secondKantaShimmer()),
      );
}
