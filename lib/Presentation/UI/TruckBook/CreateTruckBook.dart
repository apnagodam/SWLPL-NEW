// ignore_for_file: deprecated_member_use, unused_catch_stack, must_be_immutable

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:button_animations/button_animations.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:emp_apnagodam/Data/Models/TransporterListModel.dart';
import 'package:emp_apnagodam/Domain/CaseId/CaseIdService.dart';
import 'package:emp_apnagodam/Domain/TruckBook/TruckBookService.dart';
import 'package:emp_apnagodam/Presentation/Widgets/widgets.dart';
import 'package:emp_apnagodam/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:screenshot/screenshot.dart';

import '../../Constants/ColorConstant.dart';

class CreateTruckBook extends ConsumerStatefulWidget {
  CreateTruckBook(
      {super.key, required this.caseId, required this.customerName});

  String? caseId;
  String? customerName;

  @override
  ConsumerState<CreateTruckBook> createState() => _CreateTruckBookState();
}

class _CreateTruckBookState extends ConsumerState<CreateTruckBook> {
  var datumProvider = StateProvider<Datum?>((ref) => null);
  var screenShotImage = StateProvider<Uint8List?>((ref) => null);

  final imagePicker = ImagePicker();
  var locationStream = StreamProvider<Position?>((ref) {
    return Geolocator.getPositionStream(
        locationSettings: const LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 100,
    ));
  });
  TextEditingController searchController = TextEditingController();
  TextEditingController transportRateController = TextEditingController();
  TextEditingController advancePaymentController = TextEditingController();
  TextEditingController sourceController = TextEditingController();

  TextEditingController notesController = TextEditingController();
  ScreenshotController screenshotController = ScreenshotController();
  var transportTypeProvider =
      StateProvider<TransportType?>((ref) => TransportType.defaultType);

  final form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: form,
      child: Platform.isIOS
          ? iosLayout(context, ref)
          : androidLayout(context, ref),
    ));
  }

  iosLayout(BuildContext context, WidgetRef ref) => CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: primaryColor,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              CupertinoIcons.back,
              color: Colors.white,
            )),
        middle: const Text(
          "Create Truck Book",
          style: TextStyle(color: Colors.white),
        ),
      ),
      child: truckLayout(context, ref));

  truckLayout(BuildContext context, WidgetRef ref) => Padding(
        padding: const Pad(all: 10),
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
                    fontWeight: FontWeight.bold, fontSize: Adaptive.sp(17))),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              child: DropdownMenu<TransportType>(
                expandedInsets: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.width),
                initialSelection: ref.watch(transportTypeProvider),
                label: const Text('Transport type'),
                onSelected: (TransportType? labour) {
                  ref.watch(transportTypeProvider.notifier).state = labour;
                },
                dropdownMenuEntries: TransportType.values
                    .map<DropdownMenuEntry<TransportType>>(
                        (TransportType labour) {
                  return DropdownMenuEntry<TransportType>(
                    value: labour,
                    label: labour.title,
                  );
                }).toList(),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ref.watch(transporterListProvider).when(
                data: (data) => data.status.toString() == "3"
                    ? logoutWidget(
                        'Session Expire please login again!', context)
                    : Column(
                        children: [
                          Visibility(
                              visible: ref.watch(transportTypeProvider) ==
                                  TransportType.companyLabour,
                              child: Column(
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    child: DropdownSearch<Datum?>(
                                      popupProps: PopupProps.menu(
                                          searchFieldProps:
                                              const TextFieldProps(
                                                  autofocus: true,
                                                  cursorColor: primaryColor,
                                                  padding:
                                                      Pad(left: 10, right: 10),
                                                  decoration: InputDecoration(
                                                    contentPadding: Pad(
                                                        left: 10, right: 10),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                            borderSide: BorderSide(
                                                                style:
                                                                    BorderStyle
                                                                        .solid,
                                                                color:
                                                                    primaryColor)),
                                                    disabledBorder:
                                                        OutlineInputBorder(
                                                            borderSide: BorderSide(
                                                                style:
                                                                    BorderStyle
                                                                        .solid,
                                                                color:
                                                                    primaryColor)),
                                                    errorBorder: OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            style: BorderStyle
                                                                .solid,
                                                            color:
                                                                primaryColor)),
                                                    focusedBorder: OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            style: BorderStyle
                                                                .solid,
                                                            color:
                                                                primaryColor)),
                                                    border: OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            style: BorderStyle
                                                                .solid,
                                                            color:
                                                                primaryColor)),
                                                    enabledBorder: OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            style: BorderStyle
                                                                .solid,
                                                            color:
                                                                primaryColor)),
                                                  )),
                                          menuProps: MenuProps(
                                              shape: RoundedRectangleBorder(
                                                  side: const BorderSide(
                                                      color: primaryColor),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8))),
                                          itemBuilder: (context, terminal,
                                                  isVisible) =>
                                              ColumnSuper(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const Pad(all: 10),
                                                      child: Text(
                                                        "${terminal?.transporterName}",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize:
                                                                Adaptive.sp(
                                                                    16)),
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 1,
                                                      color: Colors.grey
                                                          .withOpacity(0.3),
                                                    ),
                                                  ]),
                                          isFilterOnline: true,
                                          title: Padding(
                                            padding: const Pad(all: 10),
                                            child: Text(
                                              'Select Transporter',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: Adaptive.sp(16),
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          showSearchBox: true,
                                          searchDelay: const Duration(
                                              microseconds: 500)),
                                      filterFn: (user, filter) =>
                                          user?.districtFilterByName(filter) ??
                                          false,
                                      // asyncItems: (String filter) => getData(filter),

                                      items: data.data ?? [],
                                      itemAsString: (Datum? u) =>
                                          u?.transporterName ?? "",
                                      onChanged: (Datum? data) => ref
                                          .watch(datumProvider.notifier)
                                          .state = data,
                                      dropdownDecoratorProps:
                                          const DropDownDecoratorProps(
                                        dropdownSearchDecoration: InputDecoration(
                                            contentPadding: Pad(
                                                left: 10, bottom: 5, top: 5),
                                            hintText: "Select Transporter",
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(8)),
                                                borderSide: BorderSide(
                                                    color:
                                                        secondColorSuperDark))),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Visibility(
                                      visible: ref.watch(datumProvider) != null,
                                      child: Column(
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            padding: const Pad(all: 10),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: primaryColor),
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: Text(ref
                                                    .watch(datumProvider)
                                                    ?.vehicleNo ??
                                                "N/A"),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            padding: const Pad(all: 10),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: primaryColor),
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: Text(ref
                                                    .watch(datumProvider)
                                                    ?.transporterName ??
                                                ""),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            padding: const Pad(all: 10),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: primaryColor),
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: Text(ref
                                                    .watch(datumProvider)
                                                    ?.transporterPhoneNo ??
                                                ""),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          TextFormField(
                                            keyboardType: TextInputType.number,
                                            controller: transportRateController,
                                            decoration: InputDecoration(
                                                labelText:
                                                    "Enter Transport Rate(Qtl)*",
                                                contentPadding: const Pad(
                                                    top: 0,
                                                    bottom: 0,
                                                    left: 10),
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5))),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          TextFormField(
                                            keyboardType: TextInputType.number,
                                            controller:
                                                advancePaymentController,
                                            decoration: InputDecoration(
                                                labelText:
                                                    "Enter Advance Payment(INR)*",
                                                contentPadding: const Pad(
                                                    top: 0,
                                                    bottom: 0,
                                                    left: 10),
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5))),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          TextFormField(
                                            keyboardType: TextInputType.text,
                                            controller: sourceController,
                                            decoration: InputDecoration(
                                                labelText:
                                                    "Enter Source / Destination*",
                                                contentPadding: const Pad(
                                                    top: 0,
                                                    bottom: 0,
                                                    left: 10),
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5))),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "Bilty Image",
                                            style: TextStyle(
                                                fontSize: Adaptive.sp(16),
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 250,
                                            child: InkWell(
                                              child: DottedBorder(
                                                color: primaryColorDark,
                                                borderType: BorderType.RRect,
                                                padding: Pad(all: 20),
                                                radius: Radius.circular(5),
                                                child: Center(
                                                    child: ref.watch(
                                                                screenShotImage) ==
                                                            null
                                                        ? ColumnSuper(
                                                            children: const [
                                                              Icon(
                                                                Icons
                                                                    .file_upload_rounded,
                                                                color:
                                                                    primaryColorDark,
                                                              ),
                                                              Text(
                                                                'Bilty Image',
                                                                style: TextStyle(
                                                                    color:
                                                                        primaryColorDark,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              )
                                                            ],
                                                          )
                                                        : zoomWidget(ref.watch(
                                                            screenShotImage))),
                                              ),
                                              onTap: () async {
                                                showLoaderDialog(context);
                                                try {
                                                  imagePicker
                                                      .pickImage(
                                                          source: ImageSource
                                                              .camera,
                                                          maxWidth: 800,
                                                          maxHeight: 600,
                                                          imageQuality: 25)
                                                      .then((value) async {
                                                    if (value != null) {
                                                      value
                                                          .readAsBytes()
                                                          .then((value) {
                                                        createStampedImage(
                                                                value, ref)
                                                            .then((value) {
                                                          ref
                                                              .watch(
                                                                  screenShotImage
                                                                      .notifier)
                                                              .state = value;
                                                        });
                                                      });
                                                    }
                                                  });
                                                } catch (e, s) {
                                                  hideLoaderDialog(context);
                                                }
                                                hideLoaderDialog(context);
                                              },
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          TextFormField(
                                            keyboardType: TextInputType.text,
                                            controller: notesController,
                                            maxLines: 5,
                                            decoration: InputDecoration(
                                                hintText: "Notes",
                                                contentPadding:
                                                    const Pad(all: 10),
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5))),
                                          ),
                                        ],
                                      )),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              )),
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
                            colors: const [primaryColorDark, primaryColorDark],
                            borderWidth: 1,
                            onTap: () async {
                              if (ref.watch(transportTypeProvider) ==
                                  TransportType.defaultType) {
                                Fluttertoast.showToast(
                                    msg: 'Please Select Transport type');
                              }
                              if (ref.watch(transportTypeProvider) ==
                                  TransportType.clientLabour) {
                                showLoaderDialog(context);
                                ref
                                    .watch(uploadTruckBookProvider(
                                            caseId: widget.caseId,
                                            transporterId: "1")
                                        .future)
                                    .then((value) {
                                  if (value.status.toString() == "1") {
                                    ref.invalidate(caseIdProvider);
                                    ref.watch(goRouterProvider).pop();
                                  }
                                }).onError((e, s) {
                                  hideLoaderDialog(context);
                                });
                                hideLoaderDialog(context);
                              } else {
                                if (transportRateController.text.isEmpty) {
                                  Fluttertoast.showToast(
                                      msg: "Please input transport rate");
                                }
                                if (advancePaymentController.text.isEmpty) {
                                  Fluttertoast.showToast(
                                      msg: "Please input advance payment rate");
                                }
                                if (sourceController.text.isEmpty) {
                                  Fluttertoast.showToast(
                                      msg:
                                          "Please input source and destination");
                                }
                                if (ref.watch(screenShotImage) == null) {
                                  Fluttertoast.showToast(
                                      msg: "Please select Image");
                                } else {
                                  showLoaderDialog(context);
                                  ref
                                      .watch(uploadTruckBookProvider(
                                              caseId: widget.caseId,
                                              transporterId: ref
                                                  .watch(datumProvider)
                                                  ?.id
                                                  .toString(),
                                              vehicleNo: ref
                                                  .watch(datumProvider)
                                                  ?.vehicleNo,
                                              driverName: ref
                                                  .watch(datumProvider)
                                                  ?.transporterName,
                                              driverPhone: ref
                                                  .watch(datumProvider)
                                                  ?.transporterPhoneNo,
                                              transportRate:
                                                  transportRateController.text
                                                      .toString(),
                                              advancePayment:
                                                  advancePaymentController.text
                                                      .toString(),
                                              notes: notesController.text
                                                  .toString(),
                                              destination: sourceController.text
                                                  .toString(),
                                              biltyImage: base64Encode(
                                                  ref.watch(screenShotImage) ??
                                                      Uint8List(0)))
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
                error: (e, s) => Container(),
                loading: () => loader(context)),
          ],
        ),
      );

  androidLayout(BuildContext context, WidgetRef ref) => Scaffold(
        appBar: AppBar(
          title: const Text("Create Truck Book"),
        ),
        body: truckLayout(context, ref),
      );
}

var locationProvider = StateProvider<Position?>((ref) => null);
var addressProvider = StateProvider((ref) => '');

enum TransportType {
  defaultType('Select Transport Type', "Select Transport Type"),
  clientLabour('Client Transport', "Client Transport"),
  companyLabour('Company Transport', 'Company Transport');

  const TransportType(this.type, this.title);

  final String type;
  final String title;
}
