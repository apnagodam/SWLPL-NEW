// ignore_for_file: unused_field

import 'dart:io';

import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:button_animations/button_animations.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:emp_apnagodam/Data/Models/GuardTerminalListModel.dart';
import 'package:emp_apnagodam/Domain/Guard/GuardService.dart';
import 'package:emp_apnagodam/Presentation/Constants/ColorConstant.dart';
import 'package:emp_apnagodam/Presentation/Widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Guardoutscreen extends ConsumerStatefulWidget {
  const Guardoutscreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _GuardoutscreenState();
}

class _GuardoutscreenState extends ConsumerState<Guardoutscreen> {
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Guard OUT"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: Pad(all: 10),
              child: ref.watch(guardTerminalsProvider).when(
                  data: (data) => SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: DropdownSearch<GuardTerminalDatum?>(
                          popupProps: PopupProps.menu(
                              searchFieldProps: const TextFieldProps(
                                  autofocus: true,
                                  cursorColor: primaryColor,
                                  padding: Pad(left: 10, right: 10),
                                  decoration: InputDecoration(
                                    contentPadding: Pad(left: 10, right: 10),
                                    focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            style: BorderStyle.solid,
                                            color: primaryColor)),
                                    disabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            style: BorderStyle.solid,
                                            color: primaryColor)),
                                    errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            style: BorderStyle.solid,
                                            color: primaryColor)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            style: BorderStyle.solid,
                                            color: primaryColor)),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            style: BorderStyle.solid,
                                            color: primaryColor)),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            style: BorderStyle.solid,
                                            color: primaryColor)),
                                  )),
                              menuProps: MenuProps(
                                  shape: RoundedRectangleBorder(
                                      side:
                                          const BorderSide(color: primaryColor),
                                      borderRadius: BorderRadius.circular(8))),
                              itemBuilder: (context, terminal, isVisible) =>
                                  ColumnSuper(
                                      alignment: Alignment.centerLeft,
                                      children: [
                                        Padding(
                                          padding: const Pad(all: 10),
                                          child: Text(
                                            "${terminal?.name}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: Adaptive.sp(16)),
                                          ),
                                        ),
                                        Container(
                                          height: 1,
                                          color: Colors.grey.withOpacity(0.3),
                                        ),
                                      ]),
                              isFilterOnline: true,
                              title: Padding(
                                padding: const Pad(all: 10),
                                child: Text(
                                  'Select Terminal',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: Adaptive.sp(16),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              showSearchBox: true,
                              searchDelay: const Duration(microseconds: 500)),
                          filterFn: (user, filter) =>
                              user?.districtFilterByName(filter) ?? false,
                          // asyncItems: (String filter) => getData(filter),

                          items: data.data ?? [],
                          itemAsString: (GuardTerminalDatum? u) =>
                              u?.name ?? "",
                          onChanged: (GuardTerminalDatum? data) => ref
                              .watch(terminalsProvider.notifier)
                              .state = data,
                          dropdownDecoratorProps: const DropDownDecoratorProps(
                            dropdownSearchDecoration: InputDecoration(
                                contentPadding:
                                    Pad(left: 10, bottom: 5, top: 5),
                                hintText: "Select Terminal",
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                    borderSide: BorderSide(
                                        color: secondColorSuperDark))),
                          ),
                        ),
                      ),
                  error: (e, s) => Container(),
                  loading: () => loader(context)),
            ),
            if (ref.watch(terminalsProvider) != null)
              ref
                  .watch(shutterAndLockOutProvider(
                      terminalId: "${ref.watch(terminalsProvider)?.id}"))
                  .when(
                      data: (data) => Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              if ((data.gateData ?? []).isNotEmpty)
                                CupertinoButton(
                                    child: Text('Main Gate'), onPressed: () {}),
                              if ((data.gateData ?? []).isNotEmpty)
                                Container(
                                  color: primaryColorDark,
                                  padding: const Pad(all: 10),
                                  child: IntrinsicHeight(
                                    child: Row(children: [
                                      Expanded(
                                          child: Text(
                                        "Gate No.",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: Adaptive.sp(14)),
                                      )),
                                      const VerticalDivider(),
                                      Expanded(
                                          child: Text(
                                        "Seal No.",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: Adaptive.sp(14)),
                                      )),
                                      const VerticalDivider(),
                                      Expanded(
                                          child: Text(
                                        "Remark",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: Adaptive.sp(14)),
                                      )),
                                      const VerticalDivider(),
                                      Expanded(
                                          child: Text(
                                        "Seal Image",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: Adaptive.sp(14)),
                                      )),
                                      const VerticalDivider(),
                                      Expanded(
                                          child: Text(
                                        "Action",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: Adaptive.sp(14)),
                                      )),
                                    ]),
                                  ),
                                ),
                              Column(
                                children: List.generate(
                                    (data.gateData ?? []).length, (index) {
                                  ref.watch(sealImageProvider).add(null);
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
                                      key: ref.watch(gateFormKeys)[index],
                                      child: Container(
                                        padding: const Pad(all: 10),
                                        child: IntrinsicHeight(
                                          child: Row(children: [
                                            Expanded(
                                                child: Text(
                                              "${data.gateData?[index].gateNo}",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: Adaptive.sp(14)),
                                            )),
                                            const VerticalDivider(),
                                            Expanded(
                                              child: TextFormField(
                                                keyboardType:
                                                    TextInputType.number,
                                                controller: ref.watch(
                                                    gateSealProvider)[index],
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return 'Please input seal no ';
                                                  }

                                                  return null;
                                                },
                                                decoration: InputDecoration(
                                                    label:
                                                        const Text('Seal No.*'),
                                                    contentPadding:
                                                        const Pad(all: 10),
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5)),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5))),
                                              ),
                                            ),
                                            const VerticalDivider(),
                                            Expanded(
                                              child: TextFormField(
                                                keyboardType:
                                                    TextInputType.text,
                                                controller: ref.watch(
                                                    gateRemarkProvider)[index],
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return 'Please input remark ';
                                                  }

                                                  return null;
                                                },
                                                decoration: InputDecoration(
                                                    label:
                                                        const Text('Remark*'),
                                                    contentPadding:
                                                        const Pad(all: 10),
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5)),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5))),
                                              ),
                                            ),
                                            const VerticalDivider(),
                                            Expanded(
                                                child: ref.watch(
                                                                sealImageProvider)[
                                                            index] !=
                                                        null
                                                    ? Image.file(ref.watch(
                                                                sealImageProvider)[
                                                            index] ??
                                                        File(""))
                                                    : Text.rich(
                                                        TextSpan(
                                                            text: ref.watch(sealImageProvider)[
                                                                        index] !=
                                                                    null
                                                                ? "${ref.watch(sealImageProvider)[index]?.path}"
                                                                : "Seal Image",
                                                            recognizer:
                                                                TapGestureRecognizer()
                                                                  ..onTap = () {
                                                                    showLoaderDialog(
                                                                        context);
                                                                    ImagePicker()
                                                                        .pickImage(
                                                                            source: ImageSource
                                                                                .camera,
                                                                            maxWidth:
                                                                                1800,
                                                                            maxHeight:
                                                                                2000,
                                                                            imageQuality:
                                                                                40)
                                                                        .then(
                                                                            (file) {
                                                                      if (file !=
                                                                          null) {
                                                                        createStampedImage(File(file.path).readAsBytesSync(),
                                                                                ref)
                                                                            .then((value) async {
                                                                          if (value !=
                                                                              null) {
                                                                            var imageFile =
                                                                                await File(file.path).create();

                                                                            imageFile.writeAsBytes(value);

                                                                            ref.watch(sealImageProvider.notifier).state[index] =
                                                                                imageFile;
                                                                          }
                                                                        });
                                                                      }
                                                                      hideLoaderDialog(
                                                                          context);
                                                                    });
                                                                  }),
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            decoration:
                                                                TextDecoration
                                                                    .underline,
                                                            color:
                                                                primaryColorDark,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize:
                                                                Adaptive.sp(
                                                                    14)),
                                                      )),
                                            const VerticalDivider(),
                                            AnimatedButton(
                                              color: primaryColorDark,
                                              width: 60,
                                              height: 50,
                                              isOutline: true,
                                              isMultiColor: true,
                                              colors: [
                                                primaryColorDark,
                                                primaryColorDark
                                              ],
                                              borderWidth: 1,
                                              onTap: () async {
                                                if (ref.watch(sealImageProvider)[
                                                            index] !=
                                                        null &&
                                                    ref
                                                        .watch(
                                                            gateFormKeys)[index]
                                                        .currentState!
                                                        .validate()) {
                                                  showLoaderDialog(context);
                                                  ref
                                                      .watch(saveOUTDataProvider(
                                                              terminalId:
                                                                  "${ref.watch(terminalsProvider)?.id}",
                                                              gateNo:
                                                                  "${data.gateData?[index].gateNo}",
                                                              sealNo: ref
                                                                  .watch(gateSealProvider)[
                                                                      index]
                                                                  ?.text,
                                                              remark: ref
                                                                  .watch(gateRemarkProvider)[
                                                                      index]
                                                                  ?.text,
                                                              image: ref.watch(
                                                                      sealImageProvider)[
                                                                  index])
                                                          .future)
                                                      .then((value) {
                                                    hideLoaderDialog(context);

                                                    if (value['status']
                                                            .toString() ==
                                                        "1") {
                                                      ref.invalidate(
                                                          shutterAndLockOutProvider);

                                                      ref.invalidate(
                                                          sealImageProvider);
                                                      ref.invalidate(
                                                          gateRemarkProvider);
                                                      ref.invalidate(
                                                          gateSealProvider);
                                                    }
                                                    Fluttertoast.showToast(
                                                        msg: value['message']
                                                            .toString());
                                                  }).onError((e, s) {
                                                    hideLoaderDialog(context);
                                                  });
                                                }
                                              },
                                              child: const Text(
                                                "Submit",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ]),
                                        ),
                                      ));
                                }).toList(),
                              ),
                              if ((data.lockData ?? []).isNotEmpty)
                                CupertinoButton(
                                    child: Text('Shutter Locks'),
                                    onPressed: () {}),
                              if ((data.lockData ?? []).isNotEmpty)
                                Container(
                                  color: primaryColorDark,
                                  padding: const Pad(all: 10),
                                  child: IntrinsicHeight(
                                    child: Row(children: [
                                      Expanded(
                                          child: Text(
                                        "Shutter No.",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: Adaptive.sp(14)),
                                      )),
                                      const VerticalDivider(),
                                      Expanded(
                                          child: Text(
                                        "Seal No.",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: Adaptive.sp(14)),
                                      )),
                                      const VerticalDivider(),
                                      Expanded(
                                          child: Text(
                                        "Remark",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: Adaptive.sp(14)),
                                      )),
                                      const VerticalDivider(),
                                      Expanded(
                                          child: Text(
                                        "Seal Image",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: Adaptive.sp(14)),
                                      )),
                                      const VerticalDivider(),
                                      Expanded(
                                          child: Text(
                                        "Action",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: Adaptive.sp(14)),
                                      )),
                                    ]),
                                  ),
                                ),
                              if ((data.lockData ?? []).isNotEmpty)
                                Column(
                                  children: List.generate(
                                      (data.lockData ?? []).length, (index) {
                                    ref.watch(sealImageLockProvider).add(null);
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
                                        key: ref.watch(lockFormKeys)[index],
                                        child: Container(
                                          padding: const Pad(all: 10),
                                          child: IntrinsicHeight(
                                            child: Row(children: [
                                              Expanded(
                                                  child: Text(
                                                "${data.lockData?[index].shutterNo}",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: Adaptive.sp(14)),
                                              )),
                                              const VerticalDivider(),
                                              Expanded(
                                                child: TextFormField(
                                                  keyboardType:
                                                      TextInputType.number,
                                                  controller: ref.watch(
                                                      lockSealProvider)[index],
                                                  validator: (value) {
                                                    if (value == null ||
                                                        value.isEmpty) {
                                                      return 'Please input seal no ';
                                                    }

                                                    return null;
                                                  },
                                                  decoration: InputDecoration(
                                                      label: const Text(
                                                          'Seal No.*'),
                                                      contentPadding:
                                                          const Pad(all: 10),
                                                      border:
                                                          OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5)),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5))),
                                                ),
                                              ),
                                              const VerticalDivider(),
                                              Expanded(
                                                child: TextFormField(
                                                  keyboardType:
                                                      TextInputType.text,
                                                  controller: ref.watch(
                                                          lockRemarkProvider)[
                                                      index],
                                                  validator: (value) {
                                                    if (value == null ||
                                                        value.isEmpty) {
                                                      return 'Please input remark ';
                                                    }

                                                    return null;
                                                  },
                                                  decoration: InputDecoration(
                                                      label:
                                                          const Text('Remark*'),
                                                      contentPadding:
                                                          const Pad(all: 10),
                                                      border:
                                                          OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5)),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5))),
                                                ),
                                              ),
                                              const VerticalDivider(),
                                              Expanded(
                                                  child: ref.watch(
                                                                  sealImageLockProvider)[
                                                              index] !=
                                                          null
                                                      ? Image.file(ref.watch(
                                                                  sealImageLockProvider)[
                                                              index] ??
                                                          File(""))
                                                      : Text.rich(
                                                          TextSpan(
                                                              text: ref.watch(sealImageLockProvider)[
                                                                          index] !=
                                                                      null
                                                                  ? "${ref.watch(sealImageLockProvider)[index]?.path}"
                                                                  : "Seal Image",
                                                              recognizer:
                                                                  TapGestureRecognizer()
                                                                    ..onTap =
                                                                        () {
                                                                      showLoaderDialog(
                                                                          context);
                                                                      ImagePicker()
                                                                          .pickImage(
                                                                              source: ImageSource.camera,
                                                                              maxWidth: 1800,
                                                                              maxHeight: 2000,
                                                                              imageQuality: 40)
                                                                          .then((file) {
                                                                        if (file !=
                                                                            null) {
                                                                          createStampedImage(File(file.path).readAsBytesSync(), ref)
                                                                              .then((value) async {
                                                                            if (value !=
                                                                                null) {
                                                                              var imageFile = await File(file.path).create();

                                                                              imageFile.writeAsBytes(value);

                                                                              ref.watch(sealImageLockProvider.notifier).state[index] = imageFile;
                                                                              ;
                                                                            }
                                                                          });
                                                                        }
                                                                        hideLoaderDialog(
                                                                            context);
                                                                      });
                                                                    }),
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                              decoration:
                                                                  TextDecoration
                                                                      .underline,
                                                              color:
                                                                  primaryColorDark,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize:
                                                                  Adaptive.sp(
                                                                      14)),
                                                        )),
                                              const VerticalDivider(),
                                              AnimatedButton(
                                                color: primaryColorDark,
                                                width: 60,
                                                height: 50,
                                                isOutline: true,
                                                isMultiColor: true,
                                                colors: [
                                                  primaryColorDark,
                                                  primaryColorDark
                                                ],
                                                borderWidth: 1,
                                                onTap: () async {
                                                  if (ref.watch(sealImageLockProvider)[
                                                              index] !=
                                                          null &&
                                                      ref
                                                          .watch(lockFormKeys)[
                                                              index]
                                                          .currentState!
                                                          .validate()) {
                                                    showLoaderDialog(context);
                                                    ref
                                                        .watch(saveOUTDataProvider(
                                                                terminalId:
                                                                    "${ref.watch(terminalsProvider)?.id}",
                                                                shutterNo:
                                                                    "${data.lockData?[index].shutterNo}",
                                                                sealNo: ref
                                                                    .watch(lockSealProvider)[
                                                                        index]
                                                                    ?.text,
                                                                remark: ref
                                                                    .watch(lockRemarkProvider)[
                                                                        index]
                                                                    ?.text,
                                                                image: ref.watch(
                                                                        sealImageLockProvider)[
                                                                    index])
                                                            .future)
                                                        .then((value) {
                                                      hideLoaderDialog(context);

                                                      if (value['status']
                                                              .toString() ==
                                                          "1") {
                                                        ref.invalidate(
                                                            shutterAndLockOutProvider);

                                                        ref.invalidate(
                                                            sealImageLockProvider);
                                                        ref.invalidate(
                                                            lockRemarkProvider);
                                                        ref.invalidate(
                                                            lockSealProvider);
                                                      }
                                                      Fluttertoast.showToast(
                                                          msg: value['message']
                                                              .toString());
                                                    }).onError((e, s) {
                                                      hideLoaderDialog(context);
                                                    });
                                                  }
                                                },
                                                child: const Text(
                                                  "Submit",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ]),
                                          ),
                                        ));
                                  }).toList(),
                                )
                            ],
                          ),
                      error: (e, s) => Container(),
                      loading: () => loader(context))
          ],
        ),
      ),
    );
  }
}
