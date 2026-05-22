// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:button_animations/button_animations.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:emp_apnagodam/Domain/CaseId/CaseIdService.dart';
import 'package:emp_apnagodam/Domain/GenerateLead/LeadsService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../Data/Models/DefaultListModel.dart';
import '../../../main.dart';
import '../../Constants/ColorConstant.dart';
import '../../Widgets/widgets.dart';

class Leadgeneratescreen extends ConsumerStatefulWidget {
  const Leadgeneratescreen({super.key});

  @override
  ConsumerState<Leadgeneratescreen> createState() => _LeadGenerateScreenState();
}

class _LeadGenerateScreenState extends ConsumerState<Leadgeneratescreen> {
  TextEditingController customerNameController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  TextEditingController mobileController = TextEditingController();
  TextEditingController qtlController = TextEditingController();
  var terminalProvider = StateProvider<Terminal?>((ref) => null);
  var commodityProvider = StateProvider<Commodite?>((ref) => null);
  TextEditingController searchController = TextEditingController();
  var dateProvider = StateProvider<String?>((ref) => null);
  TextEditingController notesController = TextEditingController();
  final leadsKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: leadsKey,
      child: Platform.isIOS
          ? CupertinoPageScaffold(
              navigationBar: cupertinoAppBar("Generate Lead", context),
              child: generateLeadsLayout(context, ref))
          : Scaffold(
              appBar: AppBar(
                title: const Text('Generate Lead'),
              ),
              body: generateLeadsLayout(context, ref),
            ),
    ));
  }

  // leadsKey.currentState!.validate()
  generateLeadsLayout(BuildContext context, WidgetRef ref) =>
      ref.watch(defaultListProvider).when(
          data: (data) => Padding(
                padding: const Pad(all: 10),
                child: ListView(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: customerNameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please input customer name';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          label: const Text('Enter Customer Name*'),
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
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: mobileController,
                      maxLength: 10,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please input mobile number';
                        }
                        if (value.length != 10) {
                          return 'Please input valid mobile number';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          label: const Text('Enter Mobile Number*'),
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
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: qtlController,
                      maxLength: 10,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please input quantity';
                        }

                        return null;
                      },
                      decoration: InputDecoration(
                          label: const Text('Enter Approx Quantity (Qtl)*'),
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
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: locationController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please input location';
                        }

                        return null;
                      },
                      decoration: InputDecoration(
                          label: const Text('Enter Location*'),
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
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: DropdownSearch<Terminal?>(
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

                        items: data.terminals ?? [],
                        itemAsString: (Terminal? u) => u?.name ?? "",
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
                                      BorderSide(color: secondColorSuperDark))),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: DropdownSearch<Commodite?>(
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
                                          "${terminal?.category}",
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
                                'Select Commodity',
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

                        items: data.commodites ?? [],
                        itemAsString: (Commodite? u) => u?.category ?? "",
                        onChanged: (Commodite? data) =>
                            ref.watch(commodityProvider.notifier).state = data,
                        dropdownDecoratorProps: const DropDownDecoratorProps(
                          dropdownSearchDecoration: InputDecoration(
                              contentPadding: Pad(left: 10, bottom: 5, top: 5),
                              hintText: "Select Commodity",
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                  borderSide:
                                      BorderSide(color: secondColorSuperDark))),
                        ),
                      ),
                    ),
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
                                firstDate: DateTime.now(),
                                lastDate: DateTime(2999))
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
                      controller: notesController,
                      maxLines: 5,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please input purpose ';
                        }

                        return null;
                      },
                      decoration: InputDecoration(
                          label: const Text('Purpose*'),
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
                      onTap: () async {
                        if (leadsKey.currentState!.validate()) {
                          if (ref.watch(terminalProvider) == null) {
                            Fluttertoast.showToast(
                                msg: "Please select terminal");
                          } else if (ref.watch(commodityProvider) == null) {
                            Fluttertoast.showToast(
                                msg: "Please select commodity");
                          } else if (ref.watch(dateProvider) == null) {
                            Fluttertoast.showToast(msg: "Please select date");
                          } else {
                            showLoaderDialog(context);
                            ref
                                .watch(generateLeadProvider(
                                        customerName: customerNameController
                                            .text
                                            .toString(),
                                        phone: mobileController.text.toString(),
                                        quantity: qtlController.text.toString(),
                                        location:
                                            locationController.text.toString(),
                                        terminalId: ref
                                            .watch(terminalProvider)
                                            ?.id
                                            .toString(),
                                        commodityId: ref
                                            .watch(commodityProvider)
                                            ?.id
                                            .toString(),
                                        date:
                                            ref.watch(dateProvider).toString(),
                                        purpose:
                                            notesController.text.toString())
                                    .future)
                                .then((value) {
                              hideLoaderDialog(context);
                              if (value.status.toString() == "1") {
                                ref.watch(goRouterProvider).pop();
                              }
                            }).onError((e, s) {
                              hideLoaderDialog(context);
                            });
                          }
                        }
                      },
                      child: const Text(
                        'Generate Lead',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
          error: (e, s) => Container(),
          loading: () => generateLeadsShimmer());
}
