// ignore_for_file: unused_field

import 'dart:io';

import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:elevarm_icons/elevarm_icons.dart';
import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:emp_apnagodam/Data/Models/GuardTerminalListModel.dart';
import 'package:emp_apnagodam/Data/Models/WhsTerminalModalIn.dart';
import 'package:emp_apnagodam/Domain/Guard/GuardService.dart';
import 'package:emp_apnagodam/Domain/WHS/WhsService.dart';
import 'package:emp_apnagodam/Presentation/Constants/ColorConstant.dart';
import 'package:emp_apnagodam/Presentation/Widgets/widgets.dart';
import 'package:emp_apnagodam/Presentation/utils/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class WhsInScreen extends ConsumerStatefulWidget {
  const WhsInScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _GuardinscreenState();
}

class _GuardinscreenState extends ConsumerState<WhsInScreen> {
  var terminalsProvider = StateProvider<GuardTerminalDatum?>((ref) => null);
  List<File?> _imageFiles = [];
  var sealImageProvider = StateProvider<List<File?>>((ref) => []);
  var sealImageLockProvider = StateProvider<List<File?>>((ref) => []);

  var gateRemarkProvider =
      StateProvider<List<TextEditingController?>>((ref) => []);
  var gateSealProvider =
      StateProvider<List<TextEditingController?>>((ref) => []);

  var lockRemarkProvider =
      StateProvider<List<TextEditingController?>>((ref) => []);
  var lockSealProvider =
      StateProvider<List<TextEditingController?>>((ref) => []);

  var lockFormKeys = StateProvider<List<GlobalKey<FormState>>>((ref) => []);
  var gateFormKeys = StateProvider<List<GlobalKey<FormState>>>((ref) => []);

  TextEditingController remarkController = TextEditingController();

  TextEditingController sealController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("WHS IN"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: Pad(all: 10),
                child: ref.watch(whsInTerminalDataProvider).when(
                    data: (terminalData) => Column(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  padding: EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 10),
                                  child: Text(
                                      '${terminalData.warehouseName ?? ""}'),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(5))),
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                CupertinoButton(
                                    child: Text('Main Gate'), onPressed: () {}),
                                (terminalData.gateData ?? []).isEmpty
                                    ? Text("No Data Found")
                                    : Column(
                                        children: List.generate(
                                            (terminalData.gateData ?? [])
                                                .length, (index) {
                                          ref
                                              .watch(sealImageProvider)
                                              .add(null);
                                          ref
                                              .watch(gateRemarkProvider)
                                              .add(TextEditingController());
                                          ref
                                              .watch(gateSealProvider)
                                              .add(TextEditingController());

                                          ref
                                              .watch(gateFormKeys)
                                              .add(GlobalKey<FormState>());
                                          return Form(
                                              key: ref
                                                  .watch(gateFormKeys)[index],
                                              child: _mainGateLayout(
                                                  terminalData.gateData![index],
                                                  index));
                                        }).toList(),
                                      ),
                              ],
                            ),
                            Column(
                              children: [
                                CupertinoButton(
                                    child: Text('Shutter Locks'),
                                    onPressed: () {}),
                                (terminalData.lockData ?? []).isEmpty
                                    ? Text("No Data Found")
                                    : Column(
                                        children: List.generate(
                                            (terminalData.lockData ?? [])
                                                .length, (index) {
                                          ref
                                              .watch(sealImageLockProvider)
                                              .add(null);
                                          ref
                                              .watch(lockRemarkProvider)
                                              .add(TextEditingController());
                                          ref
                                              .watch(lockSealProvider)
                                              .add(TextEditingController());

                                          ref
                                              .watch(lockFormKeys)
                                              .add(GlobalKey<FormState>());
                                          return Form(
                                              key: ref
                                                  .watch(lockFormKeys)[index],
                                              child: _shutterLocksLayout(
                                                  terminalData.lockData![index],
                                                  index));
                                        }).toList(),
                                      )
                              ],
                            )
                          ],
                        ),
                    error: (e, s) => Container(),
                    loading: () => loader(context)),
              ),
              // if (ref.watch(terminalsProvider) != null)
              //   ref
              //       .watch(shutterAndLockProvider(
              //           terminalId: "${ref.watch(terminalsProvider)?.id}"))
              //       .when(
              //           data: (data) =>
              //           error: (e, s) => Container(),
              //           loading: () => loader(context))
            ],
          ),
        ));
  }

  _mainGateLayout(GateDatum data, int index) => Container(
        margin: Pad(bottom: 10),
        decoration: BoxDecoration(
            border: Border.all(color: primaryColor),
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const Pad(all: 10),
          child: ColumnSuper(alignment: Alignment.center, children: [
            Container(
              padding: Pad(all: 10),
              child: Text.rich(TextSpan(
                  text: 'Gate Entries',
                  style: TextStyle(
                      color: primaryColorDark,
                      fontSize: Adaptive.sp(16),
                      fontWeight: FontWeight.bold))),
            ),
            Divider(
              height: 2,
            ),
            SizedBox(
              height: 10,
            ),
            RowSuper(fill: true, children: [
              Text(
                'Gate No.',
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: primaryColor,
                    fontSize: Adaptive.sp(14),
                    fontWeight: FontWeight.w800),
              ),
              Text(
                '${data.gateNo}',
                textAlign: TextAlign.end,
                style: TextStyle(
                    color: primaryColor,
                    fontSize: Adaptive.sp(14),
                    fontWeight: FontWeight.w800),
              ),
            ]),
            const SizedBox(
              height: 10,
            ),
            RowSuper(fill: true, alignment: Alignment.center, children: [
              Text(
                'Lock No.',
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: primaryColor,
                    fontSize: Adaptive.sp(14),
                    fontWeight: FontWeight.w800),
              ),
              Text(
                '${data.lockNo}',
                textAlign: TextAlign.end,
                style: TextStyle(
                    color: primaryColor,
                    fontSize: Adaptive.sp(14),
                    fontWeight: FontWeight.w800),
              ),
            ]),
            const SizedBox(
              height: 10,
            ),
            ElevarmTextInputField(
              label: "Seal no.",
              helperText: 'Input Seal No.',
              controller: ref.watch(gateSealProvider)[index],
              isRequired: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please input seal no ';
                }

                return null;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            ElevarmTextInputField(
              label: "Remark",
              helperText: 'Input remark',
              controller: ref.watch(gateRemarkProvider)[index],
              isRequired: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please input remark ';
                }

                return null;
              },
            ),
            SizedBox(
              height: 10,
            ),
            ref.watch(sealImageProvider)[index] != null
                ? Image.file(
                    ref.watch(sealImageProvider)[index] ?? File(""),
                    height: context.fullHeight / 5,
                  )
                : ElevarmFileUploadCard(
                    title: 'Seal Image',
                    subtitle: 'Tap to select Seal Image',
                    actionIconAssetName: ElevarmIconsOutline.eye,
                    onTap: () {
                      showLoaderDialog(context);
                      ImagePicker()
                          .pickImage(
                              source: ImageSource.camera,
                              maxWidth: 1800,
                              maxHeight: 2000,
                              imageQuality: 40)
                          .then((file) {
                        if (file != null) {
                          createStampedImageFile(file, ref).then((value) async {
                            var imageFile = await File(value ?? "");
                            ref.watch(sealImageProvider.notifier).state[index] =
                                imageFile;
                            ;
                          });
                        }
                        hideLoaderDialog(context);
                      });
                    },
                    onTapAction: () {
                      showLoaderDialog(context);
                      ImagePicker()
                          .pickImage(
                              source: ImageSource.camera,
                              maxWidth: 1800,
                              maxHeight: 2000,
                              imageQuality: 40)
                          .then((file) {
                        if (file != null) {
                          createStampedImageFile(file, ref).then((value) async {
                            var imageFile = await File(value ?? "");
                            ref.watch(sealImageProvider.notifier).state[index] =
                                imageFile;
                          });
                        }
                        hideLoaderDialog(context);
                      });
                    },
                  ),
            const VerticalDivider(),
            SizedBox(
              height: 10,
            ),
            IntrinsicWidth(
              child: simpleButton(
                  text: 'Submit',
                  callback: () {
                    if (ref
                        .watch(gateFormKeys)[index]
                        .currentState!
                        .validate()) {
                      if (ref.watch(sealImageProvider)[index] == null) {
                        Fluttertoast.showToast(
                            msg: 'Please select image of gate ${data.gateNo}');
                      } else {
                        showLoaderDialog(context);
                        ref
                            .watch(savewhsINDataProvider(
                                    getNo: "${data.gateNo}",
                                    lockMo: "${data.lockNo}",
                                    sealNo: ref
                                        .watch(gateSealProvider)[index]
                                        ?.text,
                                    remark: ref
                                        .watch(gateRemarkProvider)[index]
                                        ?.text,
                                    image: ref.watch(sealImageProvider)[index])
                                .future)
                            .then((value) {
                          hideLoaderDialog(context);

                          if (value['status'].toString() == "1") {
                            ref.invalidate(shutterAndLockProvider);

                            ref.invalidate(sealImageProvider);
                            ref.invalidate(gateRemarkProvider);
                            ref.invalidate(gateSealProvider);
                          }
                          Fluttertoast.showToast(
                              msg: value['message'].toString());
                        }).onError((e, s) {
                          hideLoaderDialog(context);
                        });
                      }
                    }
                  }),
            ),
            const SizedBox(
              height: 10,
            ),
          ]),
        ),
      );

  _shutterLocksLayout(LockDatum data, int index) => Container(
        margin: Pad(bottom: 10),
        decoration: BoxDecoration(
            border: Border.all(color: primaryColor),
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const Pad(all: 10),
          child: ColumnSuper(alignment: Alignment.center, children: [
            Container(
              padding: Pad(all: 10),
              child: Text.rich(TextSpan(
                  text: 'Shutter Entries',
                  style: TextStyle(
                      color: primaryColorDark,
                      fontSize: Adaptive.sp(16),
                      fontWeight: FontWeight.bold))),
            ),
            Divider(
              height: 2,
            ),
            SizedBox(
              height: 10,
            ),
            RowSuper(fill: true, children: [
              Text(
                'Shutter No.',
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: primaryColor,
                    fontSize: Adaptive.sp(14),
                    fontWeight: FontWeight.w800),
              ),
              Text(
                '${data.lockNo}',
                textAlign: TextAlign.end,
                style: TextStyle(
                    color: primaryColor,
                    fontSize: Adaptive.sp(14),
                    fontWeight: FontWeight.w800),
              ),
            ]),
            const SizedBox(
              height: 10,
            ),
            RowSuper(fill: true, alignment: Alignment.center, children: [
              Text(
                'Lock No.',
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: primaryColor,
                    fontSize: Adaptive.sp(14),
                    fontWeight: FontWeight.w800),
              ),
              Text(
                '${data.lockNo}',
                textAlign: TextAlign.end,
                style: TextStyle(
                    color: primaryColor,
                    fontSize: Adaptive.sp(14),
                    fontWeight: FontWeight.w800),
              ),
            ]),
            const SizedBox(
              height: 10,
            ),
            ElevarmTextInputField(
              label: "Seal no.",
              helperText: 'Input Seal No.',
              controller: ref.watch(lockSealProvider)[index],
              isRequired: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please input seal no ';
                }

                return null;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            ElevarmTextInputField(
              label: "Remark",
              helperText: 'Input remark',
              controller: ref.watch(lockRemarkProvider)[index],
              isRequired: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please input remark ';
                }

                return null;
              },
            ),
            SizedBox(
              height: 10,
            ),
            ref.watch(sealImageLockProvider)[index] != null
                ? Image.file(
                    ref.watch(sealImageLockProvider)[index] ?? File(""),
                    height: context.fullHeight / 5,
                  )
                : ElevarmFileUploadCard(
                    title: 'Seal Image',
                    subtitle: 'Tap to select Seal Image',
                    actionIconAssetName: ElevarmIconsOutline.eye,
                    onTap: () {
                      showLoaderDialog(context);
                      ImagePicker()
                          .pickImage(
                              source: ImageSource.camera,
                              maxWidth: 1800,
                              maxHeight: 2000,
                              imageQuality: 40)
                          .then((file) {
                        if (file != null) {
                          createStampedImageFile(file, ref).then((value) async {
                            var imageFile = await File(value ?? "");

                            ref
                                .watch(sealImageLockProvider.notifier)
                                .state[index] = imageFile;
                          });
                        }
                        hideLoaderDialog(context);
                      });
                    },
                  ),
            const VerticalDivider(),
            SizedBox(
              height: 10,
            ),
            IntrinsicWidth(
              child: simpleButton(
                  text: 'Submit',
                  callback: () {
                    if (ref
                        .watch(lockFormKeys)[index]
                        .currentState!
                        .validate()) {
                      showLoaderDialog(context);
                      ref
                          .watch(savewhsINDataProvider(
                                  lockMo: "${data.lockNo}",
                                  shutterNo: "${data.shutterNo}",
                                  sealNo:
                                      ref.watch(lockSealProvider)[index]?.text,
                                  remark: ref
                                      .watch(lockRemarkProvider)[index]
                                      ?.text,
                                  image:
                                      ref.watch(sealImageLockProvider)[index])
                              .future)
                          .then((value) {
                        hideLoaderDialog(context);

                        if (value['status'].toString() == "1") {
                          ref.invalidate(whsInTerminalDataProvider);

                          ref.invalidate(sealImageLockProvider);
                          ref.invalidate(lockRemarkProvider);
                          ref.invalidate(lockSealProvider);
                        }
                        Fluttertoast.showToast(
                            msg: value['message'].toString());
                      }).onError((e, s) {
                        hideLoaderDialog(context);
                      });
                    }
                  }),
            ),
            const SizedBox(
              height: 10,
            ),
          ]),
        ),
      );
}
