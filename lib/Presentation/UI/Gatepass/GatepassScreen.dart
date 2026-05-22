// ignore_for_file: unused_local_variable

import 'dart:io';

import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:button_animations/button_animations.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:emp_apnagodam/Domain/CaseId/CaseIdService.dart';
import 'package:emp_apnagodam/Presentation/Constants/ColorConstant.dart';
import 'package:emp_apnagodam/Presentation/Widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart' as html
    hide ImageSource;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Gatepassscreen extends ConsumerStatefulWidget {
  const Gatepassscreen({super.key, required this.caseId, required this.inOut});
  final String caseId;
  final String inOut;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _GatepassscreenState();
}

class _GatepassscreenState extends ConsumerState<Gatepassscreen> {
  final gatepassForm = GlobalKey<FormState>();
  final notesController = TextEditingController();
  final weightController = TextEditingController();
  final qtlWeightController = TextEditingController();
  final avgWeightController = TextEditingController();
  final bagsController = TextEditingController();
  var optionImage = StateProvider<File?>((ref) => null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gatepass recommend'),
      ),
      body: SingleChildScrollView(
        child: Form(key: gatepassForm, child: gatepassLayout()),
      ),
    );
  }

  gatepassLayout() =>
      ref.watch(gatepassDataProvider(caseId: widget.caseId)).when(
          data: (gatePassData) {
            debugPrint("INOUT => ${widget.inOut}");
            debugPrint("SPECIAL_QV => ${gatePassData.data?.specialQv}");
            Future.delayed(Duration.zero).then((value) {
              if (gatePassData.data != null) {
                weightController.text = "${gatePassData.data?.weightKg}";
                qtlWeightController.text = "${gatePassData.data?.weight}";
                bagsController.text = "${gatePassData.data?.noOfBags}";
                avgWeightController.text =
                    "${(double.parse(weightController.text) / double.parse(bagsController.text)).toStringAsFixed(2)}";
              }
            });
            return Padding(
              padding: const Pad(all: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  titleWidget(text: 'Case ID'),
                  SizedBox(
                    width: Adaptive.w(100),
                    child: ElevarmNeutralCard(
                      child: Text.rich(
                          textAlign: TextAlign.left,
                          softWrap: true,
                          style: ElevarmFontFamilies.inter(
                            color: ElevarmColors.neutral500,
                            fontSize: ElevarmFontSizes.sm,
                            fontWeight: ElevarmFontWeights.semibold,
                          ),
                          TextSpan(text: "", children: [
                            TextSpan(
                              text: '${gatePassData.data?.caseId}',
                            )
                          ])),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  titleWidget(text: 'Customer Name'),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ElevarmNeutralCard(
                      child: Text.rich(TextSpan(
                        text: '',
                        children: [
                          TextSpan(text: '${gatePassData.data?.custName}')
                        ],
                        style: ElevarmFontFamilies.inter(
                          color: ElevarmColors.neutral500,
                          fontSize: ElevarmFontSizes.sm,
                          fontWeight: ElevarmFontWeights.semibold,
                        ),
                      )),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  titleWidget(text: 'Terminal Name'),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ElevarmNeutralCard(
                      child: Text.rich(TextSpan(
                        text: '',
                        children: [
                          TextSpan(text: '${gatePassData.data?.terminalName}')
                        ],
                        style: ElevarmFontFamilies.inter(
                          color: ElevarmColors.neutral500,
                          fontSize: ElevarmFontSizes.sm,
                          fontWeight: ElevarmFontWeights.semibold,
                        ),
                      )),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  titleWidget(text: 'Supervisor Name'),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    readOnly: true,
                    initialValue: "${gatePassData.data?.whsName}",
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
                  titleWidget(text: 'Vehicle No.'),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    readOnly: true,
                    initialValue: "${gatePassData.data?.vehicleNo}",
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
                  titleWidget(text: 'Dharma Kanta Name'),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    readOnly: true,
                    initialValue: "${gatePassData.data?.dharamKanta}",
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
                  titleWidget(text: 'Kanta Parchi No.'),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    readOnly: true,
                    initialValue: "${gatePassData.data?.kantaParchiNo}",
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
                  Row(
                    children: [
                      Expanded(
                        child: Text("First Kanta Parchi",
                            style: TextStyle(
                                color: primaryColorDark,
                                fontSize: Adaptive.sp(16),
                                fontWeight: FontWeight.w700)),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text("Second Kanta Parchi",
                            style: TextStyle(
                                color: primaryColorDark,
                                fontSize: Adaptive.sp(16),
                                fontWeight: FontWeight.w700)),
                      )
                    ],
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
                                child: InstaImageViewer(
                                  child: Image.network(
                                    "${gatePassData.data?.firstKantaParchi}",
                                    fit: BoxFit.contain,
                                    errorBuilder: (context, obj, str) => Icon(
                                      Icons.error,
                                      color: primaryColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            onTap: () async {},
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
                                child: InstaImageViewer(
                                  // optional VoidCallback
                                  child: Image.network(
                                    "${gatePassData.data?.secondKantaParchi}",
                                    fit: BoxFit.contain,
                                    errorBuilder: (context, obj, str) => Icon(
                                      Icons.error,
                                      color: primaryColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            onTap: () async {},
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text("First Kanta Truck",
                            style: TextStyle(
                                color: primaryColorDark,
                                fontSize: Adaptive.sp(16),
                                fontWeight: FontWeight.w700)),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text("Second Kanta Truck",
                            style: TextStyle(
                                color: primaryColorDark,
                                fontSize: Adaptive.sp(16),
                                fontWeight: FontWeight.w700)),
                      )
                    ],
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
                                child: InstaImageViewer(
                                  child: Image.network(
                                    "${gatePassData.data?.firstKantaTruckImage}",
                                    fit: BoxFit.contain,
                                    errorBuilder: (context, obj, str) => Icon(
                                      Icons.error,
                                      color: primaryColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            onTap: () async {},
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
                                child: InstaImageViewer(
                                  // optional VoidCallback
                                  child: Image.network(
                                    "${gatePassData.data?.secondKantaTruckImage}",
                                    fit: BoxFit.contain,
                                    errorBuilder: (context, obj, str) => Icon(
                                      Icons.error,
                                      color: primaryColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            onTap: () async {},
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  titleWidget(text: "Second Quality Report Image"),
                  SizedBox(
                    height: Adaptive.sh(20),
                    width: double.infinity,
                    child: InkWell(
                      child: DottedBorder(
                        color: primaryColorDark,
                        borderType: BorderType.RRect,
                        padding: const Pad(all: 10),
                        radius: const Radius.circular(5),
                        child: Center(
                          child: InstaImageViewer(
                            child: Image.network(
                              "${gatePassData.data?.secondQualityImage}",
                              fit: BoxFit.contain,
                              errorBuilder: (context, obj, str) => Icon(
                                Icons.error,
                                color: primaryColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                      onTap: () async {},
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  titleWidget(text: 'Transport Type'),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    readOnly: true,
                    initialValue: "${gatePassData.data?.transporterType}",
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
                  titleWidget(text: 'Labour Type'),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    readOnly: true,
                    initialValue: "${gatePassData.data?.labourType}",
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
                  const SizedBox(
                    height: 10,
                  ),
                  ElevarmTextInputField(
                    label: 'Weight(in KG)',
                    hintText: '',
                    controller: weightController,
                    helperText: 'Insert weight in KG',
                    suffixIconAssetName: Icons.edit_document,
                    keyboardType: TextInputType.number,
                    onTapSuffix: null,
                    isRequired: true,
                    validator: (value) => (value == null || value.isEmpty)
                        ? "Please input valid weight"
                        : null,
                    enabled: true,
                    onChanged: (value) {
                      if (num.parse("${value}") > 0) {
                        qtlWeightController.text =
                            "${(num.parse("${value}") / 100).toStringAsFixed(2)}";
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevarmTextInputField(
                    label: 'Weight(in Qtl)',
                    hintText: '',
                    controller: qtlWeightController,
                    helperText: 'Insert weight in KG',
                    suffixIconAssetName: Icons.edit_document,
                    keyboardType: TextInputType.number,
                    onTapSuffix: null,
                    readOnly: true,
                    isRequired: true,
                    enabled: true,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevarmTextInputField(
                    label: 'Total Bags',
                    hintText: '',
                    controller: bagsController,
                    helperText: 'Insert Number of Bags',
                    suffixIconAssetName: Icons.edit_document,
                    keyboardType: TextInputType.number,
                    onTapSuffix: null,
                    isRequired: true,
                    onChanged: (value) {
                      if (weightController.text.isNotEmpty &&
                          value.isNotEmpty &&
                          weightController.text != "0" &&
                          value != "0") {
                        avgWeightController.text =
                            (double.parse(weightController.text) /
                                    double.parse(value))
                                .toStringAsFixed(2);
                      }
                    },
                    validator: (value) => (value == null || value.isEmpty)
                        ? "Please input valid value"
                        : null,
                    enabled: true,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevarmTextInputField(
                    label: 'Displedge Bags',
                    hintText: '',
                    initialValue: "${gatePassData.data?.displedgeBags ?? 0}",
                    helperText: 'Displedge Bags',
                    suffixIconAssetName: Icons.edit_document,
                    keyboardType: TextInputType.number,
                    onTapSuffix: null,
                    isRequired: false,
                    enabled: false,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevarmTextInputField(
                    label: 'Average weight',
                    hintText: '',
                    controller: avgWeightController,
                    helperText: 'Average Weight',
                    suffixIconAssetName: Icons.edit_document,
                    keyboardType: TextInputType.number,
                    onTapSuffix: null,
                    isRequired: true,
                    enabled: false,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  if (gatePassData.data?.secondKantaParchiNote != null &&
                      gatePassData.data!.secondKantaParchiNote
                          .toString()
                          .isNotEmpty)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        titleWidget(text: "Second Quality Report Notes"),
                        Container(
                          width: double.infinity,
                          padding: const Pad(all: 10),
                          decoration: BoxDecoration(
                            border: Border.all(color: primaryColor),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            "${gatePassData.data?.secondKantaParchiNote}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  if (gatePassData.data?.secondQualityReportsNotes != null &&
                      gatePassData.data!.secondQualityReportsNotes
                          .toString()
                          .isNotEmpty)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        titleWidget(text: "Second kanta parchi Notes"),
                        Container(
                          width: double.infinity,
                          padding: const Pad(all: 10),
                          decoration: BoxDecoration(
                            border: Border.all(color: primaryColor),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            "${gatePassData.data?.secondQualityReportsNotes}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  const SizedBox(
                    height: 10,
                  ),
                  titleWidget(text: "Second Quality Report"),
                  Container(
                    padding: Pad(all: 10),
                    decoration: BoxDecoration(
                        border: Border.all(color: primaryColor),
                        borderRadius: BorderRadius.circular(8)),
                    child: html.HtmlWidget(
                      "${gatePassData.data?.secondQv ?? "Quality Not Available"}",
                      textStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          textBaseline: TextBaseline.ideographic),
                    ),
                  ),
                  if (widget.inOut.trim().toUpperCase() == "IN" &&
                      gatePassData.data?.specialQv != null &&
                      gatePassData.data!.specialQv.toString().trim().isNotEmpty)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        titleWidget(text: "Special Quality Report"),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border.all(color: primaryColor),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: html.HtmlWidget(
                            gatePassData.data!.specialQv.toString(),
                            textStyle: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  const SizedBox(
                    height: 10,
                  ),
                  titleWidget(text: "Notes"),
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
                  ElevarmInputFileCard(
                    textColor: primaryColor,
                    onTap: () {
                      ImagePicker()
                          .pickImage(source: ImageSource.gallery)
                          .then((value) {
                        if (value != null) {
                          ref.watch(optionImage.notifier).state =
                              File(value.path);
                        }
                      });
                    },
                    clickToUploadLabel: ref.watch(optionImage) == null
                        ? "Select image "
                        : ref.watch(optionImage)?.path ?? "",
                    orDragAndDropLabel:
                        ref.watch(optionImage) == null ? "to upload" : "",
                    subtitle: 'PNG, JPG, JPEG (maks. 800x400px)',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  AnimatedButton(
                    height: 50,
                    color: primaryColorDark,
                    isOutline: true,
                    isMultiColor: true,
                    colors: [primaryColorDark, primaryColorDark],
                    borderWidth: 1,
                    onTap: () async {
                      var allTermsSelected = true;

                      if (gatepassForm.currentState!.validate()) {
                        ElevarmConfirmAlertDialog(
                                title:
                                    'Total Weight(Qtl.): ${qtlWeightController.text} \nTotal Bags: ${bagsController.text} \nAvg Weight: ${avgWeightController.text}',
                                subtitle: '',
                                onPositiveButton: () async {
                                  showLoaderDialog(context);
                                  ref
                                      .watch(ivrReportV1Provider(
                                              ivrBags: bagsController.text,
                                              ivrWeight:
                                                  qtlWeightController.text,
                                              notes: notesController.text,
                                              caseId: widget.caseId,
                                              files: ref.watch(optionImage))
                                          .future)
                                      .then((value) {
                                    hideLoaderDialog(context);
                                    if (value['status'].toString() == "1") {
                                      context.go('/');
                                    }
                                    Fluttertoast.showToast(
                                        msg: value['message']);
                                  }).onError((e, s) {
                                    hideLoaderDialog(context);
                                  });
                                },
                                onNegativeButton: () {
                                  Navigator.of(context, rootNavigator: true)
                                      .pop();
                                },
                                positiveText: 'Submit',
                                negativeText: 'No',
                                variant: ElevarmDialogVariant.warning)
                            .show(context);
                      } else {
                        Fluttertoast.showToast(
                            msg: "please input valid details!");
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
                ],
              ),
            );
          },
          error: (e, s) => Container(),
          loading: () => loader(context));
}
