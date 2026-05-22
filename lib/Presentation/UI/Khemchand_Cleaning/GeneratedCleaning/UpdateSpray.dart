// ignore_for_file: unused_field

import 'dart:io';

import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:button_animations/button_animations.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:emp_apnagodam/Data/Models/SprayTerminalListModal.dart';
import 'package:emp_apnagodam/Domain/Maintenance/CHR/ChrService.dart';
import 'package:emp_apnagodam/Domain/Maintenance/Spray/SprayService.dart';
import 'package:emp_apnagodam/Presentation/Constants/ColorConstant.dart';
import 'package:emp_apnagodam/Presentation/Widgets/widgets.dart';
import 'package:emp_apnagodam/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AddSprayScreen extends ConsumerStatefulWidget {
  const AddSprayScreen({
    super.key,
  });

  @override
  ConsumerState<AddSprayScreen> createState() => _LockAndKeyScreenState();
}

class _LockAndKeyScreenState extends ConsumerState<AddSprayScreen> {
  TextEditingController _controller = TextEditingController();

  var selectedTerminalprovider = StateProvider<Terminal?>((ref) => null);
  var selectedImageprovider = StateProvider<File?>((ref) => null);
  var selectedDateProvider = StateProvider<DateTime?>((ref) => null);

  TextEditingController _chemicalController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _doseController = TextEditingController();
  TextEditingController _remarkController = TextEditingController();

  var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: Text('Add Spray'),
          foregroundColor: Colors.white,
        ),
        body: ref.watch(allTerminalListProvider).when(
            data: (TerminalData) => Form(
                  key: _formKey,
                  child: ListView(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    children: [
                      titleWidget(text: 'Select Terminal'),
                      Container(
                        child: DropdownButton(
                          underline: SizedBox.shrink(),
                          isExpanded: true,
                          hint: Text("Select Terminal"),
                          value: ref.watch(selectedTerminalprovider),
                          items: TerminalData.terminals?.map((terminal) {
                            return DropdownMenuItem<Terminal>(
                              value: terminal,
                              child: Text(
                                  '${terminal.name} (${terminal.warehouseCode})'),
                            );
                          }).toList(),
                          onChanged: (Terminal? newValue) {
                            ref.watch(selectedTerminalprovider.notifier).state =
                                newValue;
                          },
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(5)),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      if (ref.watch(selectedTerminalprovider) != null)
                        Column(
                          children: [

                            ElevarmTextInputField(
                              label: 'Chemical Used',
                              helperText: 'Enter chemical name',
                              controller: _chemicalController,
                              onTapSuffix: null,
                              errorText: null,
                              isRequired: true,
                              enabled: true,
                              validator: (text) {
                                if (text == null || text.isEmpty) {
                                  return 'Chemical Name is empty';
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            ElevarmTextInputField(
                              label: 'Spray Date',
                              helperText: 'Enter Spray date',
                              controller: _dateController,
                              onTapSuffix: null,
                              errorText: null,
                              isRequired: true,
                              enabled: true,
                              readOnly: true,
                              onTap: () {
                                showElevarmDatePickerDialog(
                                  context: context,
                                  mode: ElevarmDatePickerMode.single,
                                  initialDisplayDate: DateTime.now(),
                                  initialSelectedRange: DateTimeRange(
                                    start: DateTime.now(),
                                    end: DateTime(2050, 1, 31),
                                  ),
                                ).then((value) {
                                  var selectedDate = value as DateTime;
                                  final DateFormat formatter =
                                      DateFormat('dd-MM-yyyy');

                                  _dateController.text =
                                      formatter.format(selectedDate);
                                });
                              },
                              validator: (text) {
                                if (text == null || text.isEmpty) {
                                  return 'Date is empty';
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            ElevarmTextInputField(
                              label: 'Enter Dose Used in litres',
                              helperText: 'Enter Dose Used in litres',
                              controller: _doseController,
                              onTapSuffix: null,
                              errorText: null,
                              isRequired: true,
                              enabled: true,
                              validator: (text) {
                                if (text == null || text.isEmpty) {
                                  return 'enter chemical dose';
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            DottedBorder(
                                child: InkWell(
                              onTap: () {
                                ImagePicker()
                                    .pickImage(source: ImageSource.gallery)
                                    .then((value) {
                                  if (value != null) {
                                    ref
                                        .watch(selectedImageprovider.notifier)
                                        .state = File(value.path);
                                  }
                                });
                              },
                              child: Container(
                                  padding: Pad(all: 10),
                                  child: Center(
                                    child:
                                        ref.watch(selectedImageprovider) == null
                                            ? const Text('Selected Image')
                                            : Image.file(File(ref
                                                .watch(selectedImageprovider)!
                                                .path)),
                                  )),
                            )),
                            SizedBox(
                              height: 10,
                            ),
                            ElevarmTextInputField(
                              label: 'Enter Remark',
                              helperText: 'Enter remark',
                              controller: _remarkController,
                              onTapSuffix: null,
                              errorText: null,
                              isRequired: true,
                              enabled: true,
                              validator: (text) {
                                if (text == null || text.isEmpty) {
                                  return 'Remark is empty';
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            AnimatedButton(
                              height: 50,
                              color: Colors.red,
                              width: Adaptive.w(90),
                              isOutline: true,
                              isMultiColor: true,
                              colors: const [
                                primaryColorDark,
                                primaryColorDark
                              ],
                              borderWidth: 1,
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  if (ref.watch(selectedImageprovider) !=
                                      null) {
                                    showLoaderDialog(context);
                                    ref
                                        .watch(updateSprayProvider(
                                                date: _dateController.text,
                                                chemical:
                                                    _chemicalController.text,
                                                dose: _doseController.text,
                                                image: File(
                                                    '${ref.watch(selectedImageprovider)?.path}'),
                                                remark: _remarkController.text,
                                                terminal:
                                                    '${ref.watch(selectedTerminalprovider)?.id}')
                                            .future)
                                        .then((value) {
                                      hideLoaderDialog(context);
                                      print(ref
                                          .watch(selectedTerminalprovider)
                                          ?.name);
                                      if (value['status'].toString() == "1") {


                                        ref.watch(goRouterProvider).pop();
                                      }
                                      Fluttertoast.showToast(
                                          msg: value['message'].toString());
                                    }).onError((e, s) {
                                      hideLoaderDialog(context);
                                    });
                                  }
                                  else{
                                    Fluttertoast.showToast(msg: 'Please select image');
                                  }
                                } else {}
                              },
                              child: Text(
                                'Add Spray',
                                style: GoogleFonts.aBeeZee(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18),
                              ),
                            )
                          ],
                        )
                    ],
                  ),
                ),
            error: (e, s) => Container(),
            loading: () => loader(context)));
  }
}
