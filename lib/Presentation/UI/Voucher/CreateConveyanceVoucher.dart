// ignore_for_file: deprecated_member_use

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:button_animations/button_animations.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:emp_apnagodam/Data/Models/DefaultListModel.dart';
import 'package:emp_apnagodam/Data/Models/LevelWiseModel.dart';
import 'package:emp_apnagodam/Data/SharedPrefs/SharedUtility.dart';
import 'package:emp_apnagodam/Domain/CaseId/CaseIdService.dart';
import 'package:emp_apnagodam/Domain/Conveyance/ConveyanceService.dart';
import 'package:emp_apnagodam/Presentation/Constants/ColorConstant.dart';
import 'package:emp_apnagodam/Presentation/Widgets/widgets.dart';
import 'package:emp_apnagodam/Presentation/utils/debouncer.dart' as mDebounce;
import 'package:emp_apnagodam/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

enum VehicleType {
  defaultType('Select vehicle Type', "Select Vehicle Type"),
  twoWheeler('Two Wheeler', "Two Wheeler"),
  fourWheeler('Four Wheeler', 'Four Wheeler');

  const VehicleType(this.type, this.title);

  final String type;
  final String title;
}

var datumProvider = StateProvider<Datum?>((ref) => null);
var terminalProvider = StateProvider<Terminal?>((ref) => null);
var vehicleTypeProvider =
    StateProvider<VehicleType?>((ref) => VehicleType.defaultType);

class Createconveyancevoucher extends ConsumerStatefulWidget {
  const Createconveyancevoucher({super.key});

  @override
  ConsumerState<Createconveyancevoucher> createState() =>
      _CreateconveyancevoucherState();
}

class _CreateconveyancevoucherState
    extends ConsumerState<Createconveyancevoucher> {
  var startImageProvider = StateProvider<Uint8List?>((ref) => null);
  var endImageProvider = StateProvider<Uint8List?>((ref) => null);
  var otherExpenseProvider = StateProvider<Uint8List?>((ref) => null);

  var dateProvider = StateProvider<String?>((ref) => null);
  TextEditingController searchController = TextEditingController();

  TextEditingController vehicleNoController = TextEditingController();
  TextEditingController fromPlaceController = TextEditingController();
  TextEditingController toPlaceController = TextEditingController();
  TextEditingController startReadingController = TextEditingController();
  TextEditingController endReadingController = TextEditingController();
  TextEditingController kmsController = TextEditingController();
  TextEditingController chargesController = TextEditingController();

  TextEditingController otherExpensesController = TextEditingController();
  TextEditingController totalAmountController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController notesController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  var charges = 0;
  var kms = 0;
  var total = 0;
  String? terminal = null;
  List<Terminal?> terminalList = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
          key: formKey,
          child: Platform.isIOS
              ? CupertinoPageScaffold(
                  navigationBar: cupertinoAppBar("Create Voucher", context),
                  child: conveyanceVoucherLayout(context, ref))
              : Scaffold(
                  appBar: AppBar(
                    title: const Text('Create Voucher'),
                  ),
                  body: conveyanceVoucherLayout(context, ref),
                )),
    );
  }

  conveyanceVoucherLayout(BuildContext context, WidgetRef ref) => Padding(
        padding: const Pad(all: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ref.watch(defaultListProvider).when(
                  data: (data) {
                    terminalList.clear();
                    terminalList.insert(
                        0,
                        Terminal(
                            id: 16,
                            name: "Head Office(Jaipur)",
                            nameHi: "Head Office(Jaipur)"));
                    terminalList.addAll(data.terminals ?? []);
                    return DropdownSearch<Terminal?>(
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
                                    side: const BorderSide(color: primaryColor),
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

                        items: terminalList,
                        itemAsString: (Terminal? u) => "${u?.name}",
                        onChanged: (Terminal? data) =>
                            ref.watch(terminalProvider.notifier).state = data,
                        dropdownDecoratorProps: const DropDownDecoratorProps(
                          dropdownSearchDecoration: InputDecoration(
                              contentPadding: Pad(left: 10, bottom: 5, top: 5),
                              hintText: "Select Terminal",
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                  borderSide:
                                      BorderSide(color: primaryColorDark))),
                        ));
                  },
                  error: (e, s) => Container(),
                  loading: () => createVoucherShimmer()),
              const SizedBox(
                height: 10,
              ),
              AnimatedButton(
                color: primaryColorDark,
                width: MediaQuery.of(context).size.width / 1.1,
                height: 40,
                isOutline: true,
                isMultiColor: true,
                colors: const [primaryColorDark, primaryColorDark],
                borderWidth: 1,
                onTap: () async {
                  showDatePicker(
                          context: context,
                          firstDate:
                              DateTime.now().subtract(const Duration(days: 1)),
                          lastDate: DateTime.now())
                      .then((value) {
                    ref.watch(dateProvider.notifier).state =
                        DateFormat.yMMMMEEEEd()
                            .format(value ?? DateTime.now())
                            .toString();
                  });
                },
                child: Text(
                  ref.watch(dateProvider) ?? "Select a Date",
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                textCapitalization: TextCapitalization.characters,
                controller: vehicleNoController,
                // validator: (value) {
                //   if (value == null || value.isEmpty) {
                //     return 'Please input vehicle number';
                //   }
                //   return null;
                // },
                decoration: InputDecoration(
                    label: const Text('Enter Vehicle No.'),
                    contentPadding: const Pad(top: 0, bottom: 0, left: 10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                textCapitalization: TextCapitalization.characters,
                controller: fromPlaceController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please input from place';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    label: const Text('Enter From Place'),
                    contentPadding: const Pad(top: 0, bottom: 0, left: 10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                textCapitalization: TextCapitalization.characters,
                controller: toPlaceController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please input to place';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    label: const Text('Enter To Place'),
                    contentPadding: const Pad(top: 0, bottom: 0, left: 10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                child: DropdownMenu<VehicleType>(
                  expandedInsets: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.width),
                  initialSelection: VehicleType.defaultType,
                  label: const Text('Vehicle Type'),
                  onSelected: (VehicleType? labour) {
                    ref.watch(vehicleTypeProvider.notifier).state = labour;

                    if (labour == VehicleType.twoWheeler) {
                      chargesController.text = (ref
                              .watch(sharedUtilityProvider)
                              .getUser()
                              ?.twoWheelerRate) ??
                          "0.0";
                    } else if (labour == VehicleType.fourWheeler) {
                      chargesController.text = (ref
                              .watch(sharedUtilityProvider)
                              .getUser()
                              ?.fourWheelerRate) ??
                          "0.0";
                    }
                  },
                  dropdownMenuEntries: VehicleType.values
                      .map<DropdownMenuEntry<VehicleType>>(
                          (VehicleType labour) {
                    return DropdownMenuEntry<VehicleType>(
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
              TextFormField(
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                textCapitalization: TextCapitalization.characters,
                controller: startReadingController,
                onChanged: (value) {
                  mDebounce.Debouncer(delay: const Duration(milliseconds: 100))
                      .call(() {
                    if (int.parse(value) <=
                            int.parse(endReadingController.text) &&
                        endReadingController.text.isEmpty) {
                      Fluttertoast.showToast(
                          msg:
                              "End Duration should be greater than start Duration");

                      kmsController.text = '0';
                    } else {
                      kmsController.text = (int.parse(value) -
                              int.parse(endReadingController.text))
                          .toString();

                      if (chargesController.text.toString() != "0") {
                        charges = int.parse(chargesController.text);
                      }
                      kms = int.parse(kmsController.text.toString());
                      total = charges * kms;
                      totalAmountController.text = total.toString();
                    }
                  });
                },
                // validator: (value) {
                //   if (value == null || value.isEmpty) {
                //     return 'Please input start reading';
                //   }
                //   return null;
                // },
                decoration: InputDecoration(
                    label: const Text('Start Reading'),
                    contentPadding: const Pad(top: 0, bottom: 0, left: 10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                textCapitalization: TextCapitalization.characters,
                controller: endReadingController,
                validator: (value) {
                  // if (value == null || value.isEmpty) {
                  //   return 'Please input end reading';
                  // }
                  return null;
                },
                onChanged: (value) {
                  mDebounce.Debouncer(delay: const Duration(milliseconds: 100))
                      .call(() {
                    if (int.parse(value) <=
                            int.parse(startReadingController.text) &&
                        startReadingController.text.isNotEmpty) {
                      Fluttertoast.showToast(
                          msg:
                              "End Duration should be greater than start Duration");

                      kmsController.text = '0';
                    } else {
                      kmsController.text = (int.parse(value) -
                              int.parse(startReadingController.text))
                          .toString();

                      if (chargesController.text.toString() != "0") {
                        charges = int.parse(chargesController.text);
                      }
                      kms = int.parse(kmsController.text.toString());
                      total = charges * kms;
                      totalAmountController.text = total.toString();
                    }
                  });
                },
                decoration: InputDecoration(
                    label: const Text('End Reading'),
                    contentPadding: const Pad(top: 0, bottom: 0, left: 10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                textCapitalization: TextCapitalization.characters,
                controller: kmsController,
                validator: (value) {
                  // if (value == null || value.isEmpty) {
                  //   return 'Please input kms';
                  // }
                  return null;
                },
                enabled: false,
                onChanged: (value) {
                  mDebounce.Debouncer(delay: const Duration(milliseconds: 500))
                      .call(() {
                    if (int.parse(value) <=
                            int.parse(startReadingController.text) &&
                        startReadingController.text.isNotEmpty) {}
                  });
                },
                decoration: InputDecoration(
                    label: const Text(
                      'KMS',
                      style: TextStyle(color: Colors.grey),
                    ),
                    contentPadding: const Pad(top: 0, bottom: 0, left: 10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                textCapitalization: TextCapitalization.characters,
                controller: chargesController,
                enabled: false,
                validator: (value) {
                  // if (value == null || value.isEmpty) {
                  //   return 'Please input charges';
                  // }
                  return null;
                },
                onChanged: (value) {
                  mDebounce.Debouncer(delay: const Duration(milliseconds: 500))
                      .call(() {
                    if (int.parse(value) <=
                            int.parse(startReadingController.text) &&
                        startReadingController.text.isNotEmpty) {}
                  });
                },
                decoration: InputDecoration(
                    label: const Text(
                      'charges',
                      style: TextStyle(color: Colors.grey),
                    ),
                    contentPadding: const Pad(top: 0, bottom: 0, left: 10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                textCapitalization: TextCapitalization.characters,
                controller: otherExpensesController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please input other expenses';
                  }
                  return null;
                },
                onChanged: (value) {
                  mDebounce.Debouncer(delay: const Duration(milliseconds: 500))
                      .call(() {
                    if (chargesController.text.toString() != "0.0" &&
                        chargesController.text.isNotEmpty) {
                      if (value.toString() != "0" && value.isNotEmpty) {
                        total = (charges * kms) + int.parse(value);
                        totalAmountController.text = total.toString();
                      } else {
                        total = charges * kms;
                        totalAmountController.text = total.toString();
                      }
                    } else {
                      if (value != "0" && value.isNotEmpty) {
                        total = kms + int.parse(value);
                        totalAmountController.text = total.toString();
                      }
                    }
                  });
                },
                decoration: InputDecoration(
                    label: const Text('Enter Other Expenses'),
                    contentPadding: const Pad(top: 0, bottom: 0, left: 10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                textCapitalization: TextCapitalization.characters,
                controller: totalAmountController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please input total amount';
                  }
                  return null;
                },
                enabled: false,
                decoration: InputDecoration(
                    label: const Text(
                      'Total Amount',
                      style: TextStyle(color: Colors.grey),
                    ),
                    contentPadding: const Pad(top: 0, bottom: 0, left: 10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: locationController,
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please input location';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    label: const Text('Enter Location'),
                    contentPadding: const Pad(top: 0, bottom: 0, left: 10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Start Meter Image',
                style: TextStyle(
                    fontSize: Adaptive.sp(16), fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: InkWell(
                  onTap: () async {
                    showLoaderDialog(context);
                    try {
                      ImagePicker()
                          .pickImage(
                              source: ImageSource.gallery, imageQuality: 50)
                          .then((value) async {
                        if (value != null) {
                          value.readAsBytes().then((u8int) {
                            ref.watch(startImageProvider.notifier).state =
                                u8int;
                          });
                        }
                      });
                    } catch (e, s) {
                      debugPrintStack(
                        stackTrace: s,
                      );
                    }
                    hideLoaderDialog(context);
                  },
                  child: DottedBorder(
                      borderType: BorderType.RRect,
                      dashPattern: const [5, 5, 5, 5],
                      color: primaryColorDark,
                      child: Padding(
                        padding: const Pad(all: 20),
                        child: Center(
                          child: ref.watch(startImageProvider) != null
                              ? Stack(
                                  children: [
                                    zoomWidget(ref.watch(startImageProvider) ??
                                        Uint8List(0)),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.black.withOpacity(0.6),
                                          shape: BoxShape.circle),
                                      child: IconButton(
                                          onPressed: () {
                                            ref.invalidate(startImageProvider);
                                          },
                                          icon: const Icon(
                                            Icons.close,
                                            color: Colors.white,
                                          )),
                                    )
                                  ],
                                )
                              : ColumnSuper(children: [
                                  Icon(
                                    Icons.cloud_upload,
                                    color: primaryColor,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Select starting meter image",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: primaryColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: Adaptive.sp(16)),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Upload Document Image,\n  Supports JPG, JPEG, PNG",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: primaryColor,
                                        fontWeight: FontWeight.w700,
                                        fontSize: Adaptive.sp(13)),
                                  )
                                ]),
                        ),
                      )),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'End Meter Image',
                style: TextStyle(
                    fontSize: Adaptive.sp(16), fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: InkWell(
                  onTap: () async {
                    showLoaderDialog(context);
                    try {
                      ImagePicker()
                          .pickImage(
                              source: ImageSource.gallery, imageQuality: 50)
                          .then((value) async {
                        if (value != null) {
                          value.readAsBytes().then((u8int) {
                            ref.watch(endImageProvider.notifier).state = u8int;
                          });
                        }
                      });
                    } catch (e, s) {
                      debugPrintStack(
                        stackTrace: s,
                      );
                    }
                    hideLoaderDialog(context);
                  },
                  child: DottedBorder(
                      borderType: BorderType.RRect,
                      dashPattern: const [5, 5, 5, 5],
                      color: primaryColorDark,
                      child: Padding(
                        padding: const Pad(all: 20),
                        child: Center(
                          child: ref.watch(endImageProvider) != null
                              ? Stack(
                                  children: [
                                    zoomWidget(ref.watch(endImageProvider) ??
                                        Uint8List(0)),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.black.withOpacity(0.6),
                                          shape: BoxShape.circle),
                                      child: IconButton(
                                          onPressed: () {
                                            ref.invalidate(endImageProvider);
                                          },
                                          icon: const Icon(
                                            Icons.close,
                                            color: Colors.white,
                                          )),
                                    )
                                  ],
                                )
                              : ColumnSuper(children: [
                                  Icon(
                                    Icons.cloud_upload,
                                    color: primaryColor,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Select ending meter image",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: primaryColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: Adaptive.sp(16)),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Upload Document Image,\n  Supports JPG, JPEG, PNG",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: primaryColor,
                                        fontWeight: FontWeight.w700,
                                        fontSize: Adaptive.sp(13)),
                                  )
                                ]),
                        ),
                      )),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Other Expense Image',
                style: TextStyle(
                    fontSize: Adaptive.sp(16), fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: InkWell(
                  onTap: () async {
                    showLoaderDialog(context);
                    try {
                      ImagePicker()
                          .pickImage(
                              source: ImageSource.gallery, imageQuality: 50)
                          .then((value) async {
                        if (value != null) {
                          value.readAsBytes().then((u8int) {
                            ref.watch(otherExpenseProvider.notifier).state =
                                u8int;
                          });
                        }
                      });
                    } catch (e, s) {
                      debugPrintStack(
                        stackTrace: s,
                      );
                    }
                    hideLoaderDialog(context);
                  },
                  child: DottedBorder(
                      borderType: BorderType.RRect,
                      dashPattern: const [5, 5, 5, 5],
                      color: primaryColorDark,
                      child: Padding(
                        padding: const Pad(all: 20),
                        child: Center(
                          child: ref.watch(otherExpenseProvider) != null
                              ? Stack(
                                  children: [
                                    zoomWidget(
                                        ref.watch(otherExpenseProvider) ??
                                            Uint8List(0)),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.black.withOpacity(0.6),
                                          shape: BoxShape.circle),
                                      child: IconButton(
                                          onPressed: () {
                                            ref.invalidate(
                                                otherExpenseProvider);
                                          },
                                          icon: const Icon(
                                            Icons.close,
                                            color: Colors.white,
                                          )),
                                    )
                                  ],
                                )
                              : ColumnSuper(children: [
                                  Icon(
                                    Icons.cloud_upload,
                                    color: primaryColor,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Select Other Expenses Image",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: primaryColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: Adaptive.sp(16)),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Upload Document Image,\n  Supports JPG, JPEG, PNG",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: primaryColor,
                                        fontWeight: FontWeight.w700,
                                        fontSize: Adaptive.sp(13)),
                                  )
                                ]),
                        ),
                      )),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Select Approver',
                style: TextStyle(
                    fontSize: Adaptive.sp(16), fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              ref.watch(approvedByProvider).when(
                  data: (data) {
                    return DropdownSearch<Datum?>(
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
                                    side: const BorderSide(color: primaryColor),
                                    borderRadius: BorderRadius.circular(8))),
                            itemBuilder: (context, terminal, isVisible) =>
                                ColumnSuper(
                                    alignment: Alignment.centerLeft,
                                    children: [
                                      Padding(
                                        padding: const Pad(all: 10),
                                        child: Text(
                                          "${terminal?.firstName} ${terminal?.lastName}",
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
                                'Select Approver',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: Adaptive.sp(16),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            showSearchBox: true,
                            searchDelay: const Duration(microseconds: 500)),
                        filterFn: (user, filter) =>
                            user?.stateFilterByName(filter) ?? false,
                        // asyncItems: (String filter) => getData(filter),

                        items: data.data ?? [],
                        itemAsString: (Datum? u) =>
                            "${u?.firstName} ${u?.lastName}",
                        onChanged: (Datum? data) =>
                            ref.watch(datumProvider.notifier).state = data,
                        dropdownDecoratorProps: const DropDownDecoratorProps(
                          dropdownSearchDecoration: InputDecoration(
                              contentPadding: Pad(left: 10, bottom: 5, top: 5),
                              hintText: "Select Approver",
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                  borderSide:
                                      BorderSide(color: primaryColorDark))),
                        ));
                  },
                  error: (e, s) => Container(),
                  loading: () => loader(context)),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                controller: notesController,
                maxLines: 5,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please input purpose';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    label: const Text('Purpose'),
                    contentPadding: const Pad(all: 10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
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
                onTap: () async {
                  if (formKey.currentState!.validate()) {
                    if (ref.watch(terminalProvider) == null) {
                      Fluttertoast.showToast(msg: "Please select terminal");
                      return;
                    } else if (ref.watch(vehicleTypeProvider) == null) {
                      Fluttertoast.showToast(msg: "Please select terminal");
                      return;
                    } else if (ref.watch(dateProvider) == null) {
                      Fluttertoast.showToast(msg: "Please select date");
                      return;
                    }
                    // else if (ref.watch(startImageProvider) == null) {
                    //   Fluttertoast.showToast(
                    //       msg: "Please select start meter image");
                    //   return;
                    // }
                    // else if (ref.watch(endImageProvider) == null) {
                    //   Fluttertoast.showToast(
                    //       msg: "Please select end meter image");
                    //   return;
                    // }
                    else if (ref.watch(datumProvider) == null) {
                      Fluttertoast.showToast(msg: "Please select approver");
                      return;
                    } else {
                      showLoaderDialog(context);
                      ref
                          .watch(postConveyanceProvider(
                                  date: ref.watch(dateProvider),
                                  startImage: base64Encode(
                                      ref.watch(startImageProvider) ??
                                          Uint8List(0)),
                                  endImage: base64Encode(
                                      ref.watch(endImageProvider) ??
                                          Uint8List(0)),
                                  vehicleNumber:
                                      vehicleNoController.text.toString(),
                                  fromPlace:
                                      fromPlaceController.text.toString(),
                                  toPlace: toPlaceController.text.toString(),
                                  startReading:
                                      startReadingController.text.toString(),
                                  endReading:
                                      endReadingController.text.toString(),
                                  kms: kmsController.text.toString(),
                                  charges: chargesController.text.toString(),
                                  location: locationController.text.toString(),
                                  otherExpense:
                                      otherExpensesController.text.toString(),
                                  otherChargeImage: base64Encode(
                                      ref.watch(otherExpenseProvider) ??
                                          Uint8List(0)),
                                  total: totalAmountController.text.toString(),
                                  purpose: notesController.text.toString(),
                                  approvedBy:
                                      "${ref.watch(datumProvider)?.userId}",
                                  conveyance:
                                      ref.watch(vehicleTypeProvider)?.name,
                                  terminalId: ref
                                      .watch(terminalProvider)
                                      ?.id
                                      .toString())
                              .future)
                          .then((value) {
                        hideLoaderDialog(context);
                        if (value.status.toString() == "1") {
                          ref.invalidate(vehicleTypeProvider);
                          ref.invalidate(datumProvider);
                          ref.watch(goRouterProvider).pop();
                        }
                      }).onError((e, s) {
                        hideLoaderDialog(context);
                      });
                    }
                  } else {}
                },
                child: const Text(
                  'Submit',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      );
}
