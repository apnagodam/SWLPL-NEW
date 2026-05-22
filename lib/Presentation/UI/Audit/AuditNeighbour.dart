import 'dart:io';

import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:button_animations/button_animations.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:emp_apnagodam/Data/Models/AddNeighbourRequestModel.dart';
import 'package:emp_apnagodam/Domain/Audit/AuditService.dart';
import 'package:emp_apnagodam/Domain/Displeased/DispleasedService.dart';
import 'package:emp_apnagodam/Presentation/Constants/ColorConstant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../Data/Models/TerminalModel.dart' as terminal;

import '../../Widgets/widgets.dart';

class Auditneighbour extends ConsumerStatefulWidget {
  const Auditneighbour({super.key});

  @override
  ConsumerState<Auditneighbour> createState() => _AuditneighbourState();
}

class _AuditneighbourState extends ConsumerState<Auditneighbour> {
  final n1NameController = TextEditingController();
  final n2NameController = TextEditingController();
  final n3NameController = TextEditingController();
  final n1PhoneController = TextEditingController();
  final n2PhoneController = TextEditingController();
  final n3PhoneController = TextEditingController();
  TextEditingController searchController = TextEditingController();
  var terminalProvider = StateProvider<terminal.Terminal?>((ref) => null);

  final notesController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Platform.isIOS
          ? CupertinoPageScaffold(
              navigationBar:
                  cupertinoAppBar("Upload Neighbour Details", context),
              child: neighbourLayout(context, ref))
          : Scaffold(
              appBar: AppBar(
                title: const Text('Upload Neighbour Details'),
              ),
              body: neighbourLayout(context, ref),
            ),
    );
  }

  neighbourLayout(BuildContext context, WidgetRef ref) => Form(
      key: formKey,
      child: ListView(
        padding: Pad(all: 10),
        children: [
          ref.watch(terminalsProvider).when(
              data: (terminalsData) => SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2<terminal.Terminal>(
                        isExpanded: true,
                        hint: Text(
                          'Select Terminal',
                          style: TextStyle(
                            fontSize: 14,
                            color: Theme.of(context).hintColor,
                          ),
                        ),
                        items: terminalsData.terminals!
                            .map((item) => DropdownMenuItem(
                                  value: item,
                                  child: Text(
                                    item.name ?? "",
                                    style: const TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ))
                            .toList(),
                        value: ref.watch(terminalProvider),
                        onChanged: (value) {
                          ref.watch(terminalProvider.notifier).state = value;
                        },
                        buttonStyleData: const ButtonStyleData(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              border: Border(
                                  top: BorderSide(color: primaryColor),
                                  bottom: BorderSide(color: primaryColor),
                                  left: BorderSide(color: primaryColor),
                                  right: BorderSide(color: primaryColor))),
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          height: 40,
                          width: 200,
                        ),
                        dropdownStyleData: const DropdownStyleData(
                          maxHeight: 200,
                        ),
                        menuItemStyleData: const MenuItemStyleData(
                          height: 40,
                        ),
                        dropdownSearchData: DropdownSearchData(
                          searchController: searchController,
                          searchInnerWidgetHeight: 50,
                          searchInnerWidget: Container(
                            height: 50,
                            padding: const EdgeInsets.only(
                              top: 8,
                              bottom: 4,
                              right: 8,
                              left: 8,
                            ),
                            child: TextFormField(
                              expands: true,
                              maxLines: null,
                              controller: searchController,
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 8,
                                ),
                                hintText: 'Search for Terminal...',
                                hintStyle: const TextStyle(fontSize: 12),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ),
                          searchMatchFn: (item, searchValue) {
                            return item.value?.name
                                    ?.toLowerCase()
                                    .contains(searchValue) ??
                                false;
                          },
                        ),
                        //This to clear the search value when you close the menu
                        onMenuStateChange: (isOpen) {
                          if (!isOpen) {
                            searchController.clear();
                          }
                        },
                      ),
                    ),
                  ),
              error: (e, s) => Container(),
              loading: () => loader(context)),
          SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Neighbour 1 Details',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Adaptive.sp(16),
                  color: primaryColor),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            keyboardType: TextInputType.text,
            controller: n1NameController,
            validator: (value) {
              if (value == null || value.isEmpty) return "Please Enter Name";
              return null;
            },
            decoration: InputDecoration(
                hintText: "Enter Name*",
                contentPadding: const Pad(all: 10),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                enabledBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            controller: n1PhoneController,
            maxLength: 10,
            validator: (value) {
              if (value == null || value.isEmpty) return "Please Enter Phone";
              return null;
            },
            decoration: InputDecoration(
                hintText: "Phone*",
                contentPadding: const Pad(all: 10),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                enabledBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Neighbour 2 Details',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Adaptive.sp(16),
                  color: primaryColor),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            keyboardType: TextInputType.text,
            controller: n2NameController,
            validator: (value) {
              if (value == null || value.isEmpty) return "Please Enter Name";
              return null;
            },
            decoration: InputDecoration(
                hintText: "Enter Name*",
                contentPadding: const Pad(all: 10),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                enabledBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            controller: n2PhoneController,
            maxLength: 10,
            validator: (value) {
              if (value == null || value.isEmpty) return "Please Enter Phone";
              return null;
            },
            decoration: InputDecoration(
                hintText: "Phone*",
                contentPadding: const Pad(all: 10),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                enabledBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Neighbour 3 Details',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Adaptive.sp(16),
                  color: primaryColor),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            keyboardType: TextInputType.text,
            controller: n3NameController,
            validator: (value) {
              if (value == null || value.isEmpty) return "Please Enter Name";
              return null;
            },
            decoration: InputDecoration(
                hintText: "Enter Name*",
                contentPadding: const Pad(all: 10),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                enabledBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            controller: n3PhoneController,
            maxLength: 10,
            validator: (value) {
              if (value == null || value.isEmpty) return "Please Enter Phone";
              return null;
            },
            decoration: InputDecoration(
                hintText: "Phone*",
                contentPadding: const Pad(all: 10),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                enabledBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            keyboardType: TextInputType.text,
            controller: notesController,
            maxLines: 5,
            validator: (value) {
              if (value == null || value.isEmpty) return "Please Enter Reason";
              return null;
            },
            decoration: InputDecoration(
                hintText: "Notes*",
                contentPadding: const Pad(all: 10),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                enabledBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
          ),
          SizedBox(
            height: 10,
          ),
          AnimatedButton(
            color: primaryColorDark,
            width: MediaQuery.of(context).size.width / 1.1,
            height: 50,
            isOutline: true,
            isMultiColor: true,
            colors: [primaryColorDark, primaryColorDark],
            borderWidth: 1,
            onTap: () {
              if (formKey.currentState!.validate()) {
                List<NeighbourDetails> neighbourDetailsList = [];

                neighbourDetailsList.add(NeighbourDetails(
                    name: n1NameController.text,
                    phone: n1PhoneController.text));
                neighbourDetailsList.add(NeighbourDetails(
                    name: n2NameController.text,
                    phone: n2PhoneController.text));
                neighbourDetailsList.add(NeighbourDetails(
                    name: n3NameController.text,
                    phone: n3PhoneController.text));
                Addneighbourrequestmodel model = Addneighbourrequestmodel(
                    terminal_id: ref.watch(terminalProvider)?.id.toString(),
                    notes: notesController.text,
                    neighbour_array: neighbourDetailsList);

                ref
                    .watch(addNeighbourProvider(model: model).future)
                    .then((value) {
                  if (value['status'.toString() == "1"]) {
                    context.pop();
                  }

                  Fluttertoast.showToast(msg: value['message']);
                });
              }
            },
            child: const Text(
              "Submit",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ));
}
