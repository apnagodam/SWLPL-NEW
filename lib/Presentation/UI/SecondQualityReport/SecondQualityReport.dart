// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:emp_apnagodam/Data/Models/GenerateCaseIdFirstQualityModel.dart';
import 'package:emp_apnagodam/Domain/SecondQualityReport/SecondQualityReportService.dart';
import 'package:emp_apnagodam/Presentation/UI/Attendance/InAppCameraModule.dart';
import 'package:emp_apnagodam/Presentation/utils/DynamicShimmerList.dart';
import 'package:emp_apnagodam/Presentation/utils/Enums.dart';
import 'package:emp_apnagodam/Presentation/utils/extensions.dart';
import 'package:emp_apnagodam/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:screenshot/screenshot.dart';

import '../../../Data/Models/QualityParametersModel.dart' as qm;
import '../../../Data/Models/SecondQualityUploadModel.dart';
import '../../../Domain/CaseId/CaseIdService.dart';
import '../../../Domain/FirstQualityReport/FirstQualityReportService.dart';
import '../../Constants/ColorConstant.dart';
import '../../Widgets/widgets.dart';

class Secondqualityreport extends ConsumerStatefulWidget {
  Secondqualityreport(
      {super.key,
      required this.caseId,
      required this.customerName,
      required this.averageWeight,
      required this.inOut,
       required this.commodityQuality
      });

  String? caseId;
  String? customerName;
  String? averageWeight;
  String? inOut;
  dynamic commodityQuality;

  @override
  ConsumerState<Secondqualityreport> createState() =>
      _SecondqualityreportState();
}

class _SecondqualityreportState extends ConsumerState<Secondqualityreport> {
  ImagePicker imagePicker = ImagePicker();
  TextEditingController liveInsectsController = TextEditingController();
  TextEditingController extraClaimController = TextEditingController();
  TextEditingController qualityAPerBagController = TextEditingController();
  TextEditingController qualityBPerBagController = TextEditingController();
  TextEditingController qualityCPerBagController = TextEditingController();
  TextEditingController cutBagPerBagController = TextEditingController();

  List<TextFormField> paramsList = [];
  List<TextEditingController> controllerList = [];
  List<qm.FirstQualityDatum?> commodityParmsResponseList = [];
  TextEditingController notesController = TextEditingController();

  final _fQualityParamsList =
      StateProvider<List<FirstQualityDatum>>((ref) => []);
  var isLoading = StateProvider((ref) => false);
  final formKey = GlobalKey<FormState>();
  bool showCommodityQualityFields = false;
  @override
  void initState() {
    super.initState();
    extraClaimController.text = '0';
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      ref.watch(isLoading.notifier).state = true;
      ref
          .read(commodityParamsProvider(caseId: widget.caseId).future)
          .then((value) async {
        ref.watch(isLoading.notifier).state = false;

        commodityParmsResponseList.clear();
        controllerList.clear();
        paramsList.clear();
   showCommodityQualityFields =
    widget.commodityQuality.toString() == "1";

print("showCommodityQualityFields => $showCommodityQualityFields");
        value.data?.forEach((element) {
          var controller = TextEditingController();
          var textFormField = TextFormField();
          commodityParmsResponseList.add(element);
          paramsList.add(textFormField);
          controllerList.add(controller);
        });
       
        setState(() {});
      }).onError((e, s) {
        ref.watch(isLoading.notifier).state = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: formKey,
      child: Platform.isIOS
          ? CupertinoPageScaffold(
              navigationBar: cupertinoAppBar("Second Quality Report", context),
              child: secondQualityLayout(context, ref))
          : Scaffold(
              appBar: AppBar(
                title: Text('Second Quality Report'),
              ),
              body: secondQualityLayout(context, ref),
            ),
    ));
  }

  var packageTypeProvider = StateProvider<PackageType?>((ref) => null);
  ScreenshotController reportScreenShotController = ScreenshotController();

  var reportImageProvider = StateProvider<File?>((ref) => null);

  secondQualityLayout(BuildContext context, WidgetRef ref) => Padding(
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
                    fontSize: Adaptive.sp(16)),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(widget.customerName ?? "",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: Adaptive.sp(16))),
            const SizedBox(
              height: 10,
            ),
            if (widget.caseId.toString().toLowerCase().contains('in'))
              ElevarmPrimaryButton.text(
                text: 'Tap to Fetch Parameters',
                onPressed: () {
                  if (widget.caseId.toString().toLowerCase().contains('in')) {
                    ref.watch(isLoading.notifier).state = true;
                    ref
                        .watch(FetchFirstQualityDataProvider(
                                caseId: '${widget.caseId}')
                            .future)
                        .then((value) {
                      ref.watch(isLoading.notifier).state = false;

                      if (value.status.toString() == "1") {
                        ref.watch(_fQualityParamsList.notifier).state =
                            value.data ?? [];
                      }
                    }).onError((e, s) {
                      ref.watch(isLoading.notifier).state = false;
                    });
                  }
                },
                buttonThemeData: ElevarmPrimaryButtonThemeData(
                  primaryColor: primaryColor,
                ),
              ),
            ref.watch(isLoading) == true
                ? DynamicShimmerList()
                : Column(
                    children: List.generate(commodityParmsResponseList.length,
                        (index) {
                      if (widget.caseId!
                              .toLowerCase()
                              .toString()
                              .contains('in') &&
                          ref.watch(_fQualityParamsList).isNotEmpty) {
                        controllerList[index].text =
                            "${ref.watch(_fQualityParamsList)[index].value}";
                      }
                      return Padding(
                        padding: Pad(top: 10, bottom: 10),
                        child: TextFormField(
                            controller: controllerList[index],
                            keyboardType:
                                TextInputType.numberWithOptions(decimal: true),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please select ${commodityParmsResponseList[index]?.name ?? ""}';
                              }
                              if (!value.isValidQuality()) {
                                return 'Value of ${commodityParmsResponseList[index]?.name} should not be 0';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                labelText:
                                    '${commodityParmsResponseList[index]?.name}',
                                contentPadding:
                                    const Pad(top: 0, bottom: 0, left: 10),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)))),
                      );
                    }),
                  ),
            const SizedBox(
              height: 10,
            ),
            titleWidget(text: 'Input Live insects'),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
                controller: liveInsectsController,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter live insects';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    labelText: 'Live Insects',
                    contentPadding: const Pad(top: 0, bottom: 0, left: 10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)))),

            const SizedBox(
              height: 10,
            ),
if (showCommodityQualityFields) ...[
  const SizedBox(
    height: 10,
  ),

  titleWidget(text: ' Good Quality Bags'),
  const SizedBox(
    height: 10,
  ),
  TextFormField(
      controller: qualityAPerBagController,
      keyboardType: TextInputType.number,
      validator: (value) {
        if (showCommodityQualityFields &&
            (value == null || value.isEmpty)) {
          return 'Please enter Good Quality Bags';
        }
        return null;
      },
      decoration: InputDecoration(
          labelText: 'Good Quality Bags',
          contentPadding: const Pad(top: 0, bottom: 0, left: 10),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10)))),

  const SizedBox(
    height: 10,
  ),

  titleWidget(text: ' Medium Quality Bags'),
  const SizedBox(
    height: 10,
  ),

  TextFormField(
      controller: qualityBPerBagController,
      keyboardType: TextInputType.number,
      validator: (value) {
        if (showCommodityQualityFields &&
            (value == null || value.isEmpty)) {
          return 'Please enter Medium Quality Bags';
        }
        return null;
      },
      decoration: InputDecoration(
          labelText: 'Medium Quality Bags',
          contentPadding: const Pad(top: 0, bottom: 0, left: 10),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10)))),

  const SizedBox(
    height: 10,
  ),

  titleWidget(text: 'Low Quality Bags'),
  const SizedBox(
    height: 10,
  ),

  TextFormField(
      controller: qualityCPerBagController,
      keyboardType: TextInputType.number,
      validator: (value) {
        if (showCommodityQualityFields &&
            (value == null || value.isEmpty)) {
          return 'Please enter Low Quality Bags';
        }
        return null;
      },
      decoration: InputDecoration(
          labelText: 'Low Quality Bags',
          contentPadding: const Pad(top: 0, bottom: 0, left: 10),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10)))),

  const SizedBox(
    height: 10,
  ),

  titleWidget(text: 'Cut Bag (Per Bag)'),
  const SizedBox(
    height: 10,
  ),

  TextFormField(
      controller: cutBagPerBagController,
      keyboardType: TextInputType.number,
      validator: (value) {
        if (showCommodityQualityFields &&
            (value == null || value.isEmpty)) {
          return 'Please enter Cut Bag Per Bag';
        }
        return null;
      },
      decoration: InputDecoration(
          labelText: 'Cut Bags',
          contentPadding: const Pad(top: 0, bottom: 0, left: 10),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10)))),
],

            const SizedBox(
              height: 10,
            ),
            titleWidget(text: 'Input Extra Claim'),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
                controller: extraClaimController,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter extra claim';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    labelText: 'Extra Claim',
                    contentPadding: const Pad(top: 0, bottom: 0, left: 10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)))),
            const SizedBox(
              height: 10,
            ),
            // TextFormField(
            //     initialValue: widget.averageWeight,
            //     decoration: InputDecoration(
            //         enabled: false,
            //         labelText: 'Average weight',
            //         contentPadding: const Pad(top: 0, bottom: 0, left: 10),
            //         border: OutlineInputBorder(
            //             borderRadius: BorderRadius.circular(10)),
            //         enabledBorder: OutlineInputBorder(
            //             borderRadius: BorderRadius.circular(10)))),
            // const SizedBox(
            //   height: 10,
            // ),
            // titleWidget(text: 'Select Packaging Type'),

            // SizedBox(
            //   child: DropdownMenu<PackageType>(
            //     expandedInsets: EdgeInsets.symmetric(
            //         vertical: MediaQuery.of(context).size.width),
            //     label: const Text('Packaging type'),
            //     onSelected: (PackageType? labour) {
            //       ref.watch(packageTypeProvider.notifier).state = labour;
            //     },
            //     dropdownMenuEntries: PackageType.values
            //         .map<DropdownMenuEntry<PackageType>>((PackageType labour) {
            //       return DropdownMenuEntry<PackageType>(
            //         value: labour,
            //         label: labour.title,
            //         enabled: labour.type != 'Grey',
            //       );
            //     }).toList(),
            //   ),
            // ),
            // const SizedBox(
            //   height: 10,
            // ),
            Text(
              'Quality Report Image*',
              style: TextStyle(
                  fontSize: Adaptive.sp(18), fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 100,
              child: InkWell(
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10)),
                  height: 100,
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  child: ref.watch(reportImageProvider) == null
                      ? ColumnSuper(
                          children: const [
                            Icon(Icons.upload),
                            Text('Quality Report Image')
                          ],
                        )
                      : zoomWidget(
                          ref.watch(reportImageProvider)?.readAsBytesSync()),
                ),
                onTap: () async {
                  showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (bottomsheetContext) =>
                          ElevarmDraggableBottomSheet(
                              initialChildSize: 1,
                              title: 'Capture Quality Report Image',
                              onPressedClose: () => Navigator.of(
                                      bottomsheetContext,
                                      rootNavigator: true)
                                  .pop(),
                              children: [
                                InAppCameraModule(
                                  captureImage: (mediaCapture) {
                                    if (mediaCapture!.status ==
                                        MediaCaptureStatus.success) {
                                      createStampedImageFile(
                                              XFile(mediaCapture
                                                  .captureRequest.path!),
                                              ref)
                                          .then((image) async {
                                        if (image != null) {
                                          ref
                                              .watch(
                                                  reportImageProvider.notifier)
                                              .state = File(image);
                                        }
                                        Navigator.of(bottomsheetContext,
                                                rootNavigator: true)
                                            .pop();
                                      });
                                    }
                                  },
                                )
                              ]));
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),

            titleWidget(text: 'Input Notes'),

            TextFormField(
              keyboardType: TextInputType.text,
              controller: notesController,
              maxLines: 5,
              decoration: InputDecoration(
                  hintText: "Notes",
                  contentPadding: const Pad(all: 10),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    if (ref.watch(reportImageProvider) == null) {
                      Fluttertoast.showToast(msg: "please select report image");
                    } else {
                      ElevarmConfirmAlertDialog(
                              title: 'Confirmation Dialog',
                              subtitle: 'submit second quality?',
                              onPositiveButton: () {
                                showLoaderDialog(context);
                                List<Map<String, dynamic>> paramsList = [];
                                for (int i = 0;
                                    i < commodityParmsResponseList.length;
                                    i++) {
                                  if (controllerList[i]
                                      .text
                                      .toString()
                                      .isEmpty) {
                                  } else {
                                    paramsList.add(CommodityList(
                                            id: commodityParmsResponseList[i]
                                                    ?.id ??
                                                0,
                                            value: controllerList[i].text)
                                        .toMap());
                                    // var datum = ;
                                    // commodityParamsList.add(datum);
                                  }
                                }

                                ref
                                    .watch(uploadSecondQualityReportV1Provider(
                                            caseId: widget.caseId,
                                            reportFile: ref.watch(
                                                reportImageProvider),
                                            commodityList: paramsList,
                                            // packagingType:
                                            //     ref.watch(packageTypeProvider)?.name,
                                            infested: liveInsectsController.text
                                                .toString(),
                                            liveInsects: liveInsectsController
                                                .text
                                                .toString(),
                                            notes: notesController.text
                                                .toString(),
                                            extraClaim:
                                                extraClaimController
                                                    .text
                                                    .toString(),
                                            aQuality:
                                                qualityAPerBagController
                                                    .text
                                                    .toString(),
                                            bQuality:
                                                qualityBPerBagController
                                                    .text
                                                    .toString(),
                                            cQuality:
                                                qualityCPerBagController
                                                    .text
                                                    .toString(),
                                            cutBags: cutBagPerBagController.text
                                                .toString(),
                                            sendToLab: "2",
                                            sendToReportFile: null,
                                            inOut: widget.inOut)
                                        .future)
                                    .then((value) {
                                  hideLoaderDialog(context);
                                  if (value['status'].toString() == "1") {
                                    Navigator.of(context, rootNavigator: false)
                                        .pop();

                                    ref.invalidate(caseIdProvider);
                                    ref.watch(goRouterProvider).pop();
                                  }
                                }).onError((error, s) {
                                  hideLoaderDialog(context);
                                });
                              },
                              onNegativeButton: () {
                                Navigator.of(context, rootNavigator: false)
                                    .pop();
                              },
                              positiveText: 'Submit',
                              negativeText: 'no',
                              variant: ElevarmDialogVariant.danger)
                          .show(context);
                    }
                  }

                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
                child: const Text(
                  "Submit",
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
      );
}
