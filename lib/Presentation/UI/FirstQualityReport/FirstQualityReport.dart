// ignore_for_file: must_be_immutable, unused_local_variable

import 'dart:io';
import 'dart:math' as math;

import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:emp_apnagodam/Data/Models/QualityParametersModel.dart';
import 'package:emp_apnagodam/Data/Models/QualityUploadModel.dart';
import 'package:emp_apnagodam/Domain/FirstQualityReport/FirstQualityReportService.dart';
import 'package:emp_apnagodam/Presentation/UI/Attendance/InAppCameraModule.dart';
import 'package:emp_apnagodam/Presentation/utils/Enums.dart';
import 'package:emp_apnagodam/Presentation/utils/extensions.dart';
import 'package:emp_apnagodam/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:screenshot/screenshot.dart';

import '../../../Domain/CaseId/CaseIdService.dart';
import '../../Constants/ColorConstant.dart';
import '../../Widgets/widgets.dart';

class Firstqualityreport extends ConsumerStatefulWidget {
  Firstqualityreport(
      {super.key,
      required this.caseId,
      required this.customerName,
      required this.inOut});

  String? caseId;
  String? customerName;
  String? inOut;

  @override
  ConsumerState<Firstqualityreport> createState() => _FirstQualityReportState();
}

class _FirstQualityReportState extends ConsumerState<Firstqualityreport> {
  ImagePicker imagePicker = ImagePicker();
  TextEditingController liveInsectsController = TextEditingController();

  List<TextFormField> paramsList = [];
  List<TextEditingController> controllerList = [];
  List<FirstQualityDatum> commodityParmsResponseList = [];
  TextEditingController notesController = TextEditingController();

  final fqKey = GlobalKey<FormState>();
  var isLoading = StateProvider((ref) => false);

  @override
  void initState() {
    super.initState();
    liveInsectsController.text = '0';
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      ref.watch(isLoading.notifier).state = true;
      ref
          .read(commodityParamsProvider(caseId: widget.caseId).future)
          .then((value) async {
        ref.watch(isLoading.notifier).state = false;
        commodityParmsResponseList.clear();
        controllerList.clear();
        paramsList.clear();
        value.data?.forEach((element) {
          var controller = TextEditingController();
          var textFormField = TextFormField(
            inputFormatters: [DecimalTextInputFormatter(decimalRange: 2)],
            maxLength: 5,
          );
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
      key: fqKey,
      child: Platform.isIOS
          ? CupertinoPageScaffold(
              navigationBar: cupertinoAppBar("First Quality Report", context),
              child: firstQualityLayout(context, ref))
          : Scaffold(
              appBar: AppBar(
                title: Text('First Quality Report'),
              ),
              body: firstQualityLayout(context, ref),
            ),
    ));
  }

  firstQualityLayout(BuildContext context, WidgetRef ref) => Padding(
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
            Column(
              children:
                  List.generate(commodityParmsResponseList.length, (index) {
                return Padding(
                  padding: Pad(top: 10, bottom: 10),
                  child: TextFormField(
                      controller: controllerList[index],
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select ${commodityParmsResponseList[index].name}';
                        }
                        if (!value.isValidQuality() && !commodityParmsResponseList[index].name.toString().toLowerCase().contains('live')) {
                          return 'Value of ${commodityParmsResponseList[index].name} should not be 0';
                        }

                        return null;
                      },
                      decoration: InputDecoration(
                          labelText:
                              '${commodityParmsResponseList[index].name}',
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
            TextFormField(
                controller: liveInsectsController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select live insects';
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
            SizedBox(
              child: DropdownMenu<PackageType>(
                expandedInsets: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.width),
                label: const Text('Packaging type'),
                onSelected: (PackageType? labour) {
                  ref.watch(packageTypeProvider.notifier).state = labour;
                },
                dropdownMenuEntries: PackageType.values
                    .map<DropdownMenuEntry<PackageType>>((PackageType labour) {
                  return DropdownMenuEntry<PackageType>(
                    value: labour,
                    label: labour.title,
                    enabled: labour.type != 'Grey',
                  );
                }).toList(),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
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
                    height: 250,
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
                            ref.watch(reportImageProvider)?.readAsBytesSync())),
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
                                      rootNavigator: false)
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
                                                rootNavigator: false)
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
                  List<CommodityList> comList = [];
                  List<FirstQualityDatum> commodityParamsList = [];
                  if (fqKey.currentState!.validate()) {
                    if (ref.watch(packageTypeProvider) == null) {
                      Fluttertoast.showToast(
                          msg: "please select packaging type");
                    }
                    if (ref.watch(reportImageProvider) == null) {
                      Fluttertoast.showToast(msg: "please select report image");
                    } else {
                      showLoaderDialog(context);
                      List<Map<String, dynamic>> commList = [];
                      for (int i = 0;
                          i < commodityParmsResponseList.length;
                          i++) {
                        if (controllerList[i].text.toString().isEmpty) {
                        } else {
                          commList.add(CommodityList(
                                  id: commodityParmsResponseList[i].id ?? 0,
                                  name:
                                      commodityParmsResponseList[i].name ?? "",
                                  value: controllerList[i].text.toString(),
                                  min: commodityParmsResponseList[i].min,
                                  max: commodityParmsResponseList[i].max)
                              .toMap());
                        }
                      }

                      ref
                          .watch(uploadFirstQualityReportV1Provider(
                                  caseId: widget.caseId!,
                                  image: ref.watch(reportImageProvider),
                                  commodityList: commList,
                                  packagingType:
                                      ref.watch(packageTypeProvider)?.name ??
                                          "",
                                  infested:
                                      liveInsectsController.text.toString(),
                                  liveInsects:
                                      liveInsectsController.text.toString(),
                                  notes: notesController.text.toString(),
                                  inOut: widget.inOut!)
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

  var packageTypeProvider = StateProvider<PackageType?>((ref) => null);
  ScreenshotController reportScreenShotController = ScreenshotController();

  var reportImageProvider = StateProvider<File?>((ref) => null);
}

class DecimalTextInputFormatter extends TextInputFormatter {
  DecimalTextInputFormatter({this.decimalRange})
      : assert(decimalRange == null || decimalRange > 0);

  final int? decimalRange;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue, // unused.
    TextEditingValue newValue,
  ) {
    TextSelection newSelection = newValue.selection;
    String truncated = newValue.text;

    if (decimalRange != null) {
      String value = newValue.text;

      if (value.contains(".") &&
          value.substring(value.indexOf(".") + 1).length >
              num.parse(decimalRange.toString())) {
        truncated = oldValue.text;
        newSelection = oldValue.selection;
      } else if (value == ".") {
        truncated = "0.";

        newSelection = newValue.selection.copyWith(
          baseOffset: math.min(truncated.length, truncated.length + 1),
          extentOffset: math.min(truncated.length, truncated.length + 1),
        );
      }

      return TextEditingValue(
        text: truncated,
        selection: newSelection,
        composing: TextRange.empty,
      );
    }
    return newValue;
  }
}
