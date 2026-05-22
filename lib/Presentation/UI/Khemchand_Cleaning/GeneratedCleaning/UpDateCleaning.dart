import 'dart:io';

import 'package:button_animations/button_animations.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:emp_apnagodam/Data/Models/SprayTerminalListModal.dart';
import 'package:emp_apnagodam/Domain/Maintenance/CHR/ChrService.dart';
import 'package:emp_apnagodam/Domain/Maintenance/Cleaning/CleaningService.dart';
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

class AddCleaningScreen extends ConsumerStatefulWidget {
  const AddCleaningScreen({
    super.key,
  });

  @override
  ConsumerState<AddCleaningScreen> createState() => _LockAndKeyScreenState();
}

class _LockAndKeyScreenState extends ConsumerState<AddCleaningScreen> {
  var selectedTerminalProvider = StateProvider<Terminal?>((ref) => null);
  var selectedImageProvider = StateProvider<File?>((ref) => null);
  TextEditingController _controller = TextEditingController();
  TextEditingController _remarkController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime currentDate = DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != currentDate) {
      setState(() {
        String formattedDate = DateFormat('dd-MM-yyyy').format(picked);
        _controller.text = formattedDate;
      });
    }
  }

  var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: Text('Update Cleaning'),
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
                          value: ref.watch(selectedTerminalProvider),
                          items: TerminalData.terminals?.map((terminal) {
                            return DropdownMenuItem<Terminal>(
                              value: terminal,
                              child: Text(
                                  '${terminal.name} (${terminal.warehouseCode})'),
                            );
                          }).toList(),
                          onChanged: (Terminal? newValue) {
                            setState(() {
                              ref
                                  .watch(selectedTerminalProvider.notifier)
                                  .state = newValue;
                            });
                          },
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(5)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      if (ref.watch(selectedTerminalProvider) != null)
                        Column(
                          children: [
                            DottedBorder(
                                child: InkWell(
                              onTap: () {
                                ImagePicker()
                                    .pickImage(source: ImageSource.gallery)
                                    .then((value) {
                                  if (value != null) {
                                    ref
                                        .watch(selectedImageProvider.notifier)
                                        .state = File(value.path);
                                  }
                                });
                              },
                              child: Container(
                                  padding: EdgeInsets.all(10),
                                  child: Center(
                                    child: ref.watch(selectedImageProvider) ==
                                            null
                                        ? const Text('Selected Image')
                                        : Image.file(File(ref
                                                .watch(selectedImageProvider)
                                                ?.path ??
                                            "")),
                                  )),
                            )),
                            SizedBox(
                              height: 10,
                            ),
                            ElevarmTextInputField(
                              label: 'Cleaning Date',
                              helperText: 'Enter Cleaning date',
                              controller: _controller,
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

                                  _controller.text =
                                      formatter.format(selectedDate);
                                });
                              },
                              validator: (text) {
                                if (text == null || text.isEmpty) {
                                  return 'date is empty';
                                }
                                return null;
                              },
                            ),
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
                              height: 20,
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
                                  if (ref.watch(selectedImageProvider) ==
                                      null) {
                                    Fluttertoast.showToast(
                                        msg: 'Please select image');
                                  } else {
                                    showLoaderDialog(context);
                                    ref
                                        .watch(updateCleaningProvider(
                                                date: _controller.text,
                                                image: File(
                                                    '${ref.watch(selectedImageProvider)?.path}'),
                                                remark: _remarkController.text,
                                                terminal:
                                                    '${ref.watch(selectedTerminalProvider)?.id}')
                                            .future)
                                        .then((value) {
                                      hideLoaderDialog(context);

                                      if (value['status'].toString() == "1") {
                                        ref.watch(goRouterProvider).pop();
                                      }
                                      Fluttertoast.showToast(
                                          msg: value['message'].toString());
                                    }).onError((e, s) {
                                      hideLoaderDialog(context);
                                    });
                                  }
                                }
                              },
                              child: Text(
                                'Update Cleaning',
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
            error: (e, s) => Text(''),
            loading: () => loader(context)));
  }
}
