import 'dart:io';

import 'package:button_animations/button_animations.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:emp_apnagodam/Data/Models/SprayTerminalListModal.dart';
import 'package:emp_apnagodam/Domain/Maintenance/CHR/ChrService.dart';
import 'package:emp_apnagodam/Domain/Maintenance/Fumigation/FumigationService.dart';
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

class AddFumigationScreen extends ConsumerStatefulWidget {
  const AddFumigationScreen({
    super.key,
  });

  @override
  ConsumerState<AddFumigationScreen> createState() => _LockAndKeyScreenState();
}

class _LockAndKeyScreenState extends ConsumerState<AddFumigationScreen> {
  Terminal? selectedTerminal;
  final ImagePicker _picker = ImagePicker();
  XFile? _image;
  String? selectedValue;
  String? selectedAgency;
  TextEditingController _DoseController = TextEditingController();
  TextEditingController _remarkController = TextEditingController();
  TextEditingController _commodityController = TextEditingController();
  Future getImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

  TextEditingController _controller = TextEditingController();

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
          title: Text('Update Fumigation'),
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
                          hint: Text("Select Terminal*"),
                          value: selectedTerminal,
                          items: TerminalData.terminals?.map((terminal) {
                            return DropdownMenuItem<Terminal>(
                              value: terminal,
                              child: Text(
                                  '${terminal.name} (${terminal.warehouseCode})'),
                            );
                          }).toList(),
                          onChanged: (Terminal? newValue) {
                            setState(() {
                              selectedTerminal = newValue;
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
                      selectedTerminal == null
                          ? Text('')
                          : Column(
                              children: [
                                titleWidget(text: 'Select Stack'),
                                ref
                                    .watch(allStackListProvider(
                                        id: '${selectedTerminal?.id}'))
                                    .when(
                                        data: (Stacklist) => Container(
                                              child: DropdownButton<String>(
                                                isExpanded: true,
                                                underline: SizedBox.shrink(),
                                                value: selectedValue,
                                                hint: Text("Select Stack No"),
                                                items: Stacklist.data?.map<
                                                    DropdownMenuItem<
                                                        String>>((item) {
                                                  return DropdownMenuItem<
                                                      String>(
                                                    value: item.stackNo,
                                                    child: Text(item.stackNo ??
                                                        "No Stack No"),
                                                  );
                                                }).toList(),
                                                onChanged: (String? newValue) {
                                                  setState(() {
                                                    selectedValue = newValue;
                                                  });
                                                },
                                              ),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 5),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.grey),
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                            ),
                                        error: (e, s) => Text('Error'),
                                        loading: () => loader(context)),
                                SizedBox(
                                  height: 10,
                                ),
                                if (selectedValue != null)
                                  titleWidget(text: 'Commodity'),
                                selectedValue == null
                                    ? Text('')
                                    : ref
                                        .watch(stackWiseCommdityProvider(
                                            id: '${selectedTerminal?.id}',
                                            stackNo: '${selectedValue}'))
                                        .when(
                                            data:
                                                (StackCommditylist) =>
                                                    StackCommditylist
                                                                .commodity ==
                                                            null
                                                        ? Text('')
                                                        : Column(
                                                            children: [
                                                              Container(
                                                                  height: 50,
                                                                  width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width,
                                                                  padding: EdgeInsets
                                                                      .symmetric(
                                                                          horizontal:
                                                                              10),
                                                                  decoration: BoxDecoration(
                                                                      border: Border.all(
                                                                          color:
                                                                              Colors
                                                                                  .grey),
                                                                      color: Colors
                                                                          .grey
                                                                          .shade300,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5)),
                                                                  child:
                                                                      TextFormField(
                                                                    controller:
                                                                        _commodityController,
                                                                    readOnly:
                                                                        true,
                                                                    decoration: InputDecoration(
                                                                        border: InputBorder
                                                                            .none,
                                                                        hintText:
                                                                            '${StackCommditylist.commodity ?? ""}'),
                                                                  )
                                                                  // Text(
                                                                  //     '${StackCommditylist.commodity ?? ""}')
                                                                  ),
                                                              SizedBox(
                                                                height: 10,
                                                              ),
                                                              titleWidget(
                                                                  text:
                                                                      'Select Agency'),
                                                              selectedValue ==
                                                                      null
                                                                  ? Text('')
                                                                  : ref
                                                                      .watch(
                                                                          fumigationAgencyProvider)
                                                                      .when(
                                                                          data: (fumigationAgency) =>
                                                                              Container(
                                                                                child: DropdownButton<String>(
                                                                                  underline: SizedBox.shrink(),
                                                                                  value: selectedAgency,
                                                                                  hint: Text('Select Agency'),
                                                                                  isExpanded: true,
                                                                                  onChanged: (String? newValue) {
                                                                                    setState(() {
                                                                                      selectedAgency = newValue;
                                                                                    });
                                                                                  },
                                                                                  items: fumigationAgency.data?.map<DropdownMenuItem<String>>((agency) {
                                                                                    return DropdownMenuItem<String>(
                                                                                      value: agency.id.toString(),
                                                                                      child: Text(agency.agencyName),
                                                                                    );
                                                                                  }).toList(),
                                                                                ),
                                                                                padding: EdgeInsets.symmetric(horizontal: 5),
                                                                                decoration: BoxDecoration(border: Border.all(color: Colors.grey), borderRadius: BorderRadius.circular(5)),
                                                                              ),
                                                                          error: (e, s) => Text(
                                                                              'Error'),
                                                                          loading: () =>
                                                                              loader(context)),
                                                              SizedBox(
                                                                height: 10,
                                                              ),
                                                                                                                titleWidget(text: 'Input Dose'),

                                                              selectedValue ==
                                                                      null
                                                                  ? Text('')
                                                                  : TextFormField(
                                                                      keyboardType:
                                                                          TextInputType
                                                                              .number,
                                                                      controller:
                                                                          _DoseController,
                                                                      decoration: InputDecoration(
                                                                          
                                                                          hintText:
                                                                              'Dose',
                                                                          border:
                                                                              OutlineInputBorder()),
                                                                      validator:
                                                                          (text) {
                                                                        if (text ==
                                                                                null ||
                                                                            text.isEmpty) {
                                                                          return 'Dose is empty';
                                                                        }
                                                                        return null;
                                                                      },
                                                                    ),
                                                              SizedBox(
                                                                height: 10,
                                                              ),
                                                                                                                titleWidget(text: 'Input Fumigation Date'),

                                                              selectedValue ==
                                                                      null
                                                                  ? Text('')
                                                                  : TextFormField(
                                                                      controller:
                                                                          _controller,
                                                                      decoration: InputDecoration(
                                                                       
                                                                          hintText:
                                                                              'Fumigation Date*',
                                                                          border:
                                                                              OutlineInputBorder()),
                                                                      validator:
                                                                          (text) {
                                                                        if (text ==
                                                                                null ||
                                                                            text.isEmpty) {
                                                                          return 'Date is empty';
                                                                        }
                                                                        return null;
                                                                      },
                                                                      readOnly:
                                                                          true,
                                                                      onTap:
                                                                          () {
                                                                        _selectDate(
                                                                            context);
                                                                      },
                                                                    ),
                                                              SizedBox(
                                                                height: 10,
                                                              ),
                                                                                                                titleWidget(text: 'Select Image'),

                                                              selectedValue ==
                                                                      null
                                                                  ? Text('')
                                                                  : DottedBorder(
                                                                      child:
                                                                          InkWell(
                                                                      onTap:
                                                                          getImage,
                                                                      child: Container(
                                                                          padding: EdgeInsets.symmetric(vertical: 15),
                                                                          child: Center(
                                                                            child: _image == null
                                                                                ? const Text('Selected Image')
                                                                                : Image.file(File(_image!.path)),
                                                                          )),
                                                                    )),
                                                              SizedBox(
                                                                height: 10,
                                                              ),
                                                                                                                titleWidget(text: 'Input Remark'),

                                                              selectedValue ==
                                                                      null
                                                                  ? Text('')
                                                                  : TextFormField(
                                                                      controller:
                                                                          _remarkController,
                                                                      decoration: InputDecoration(
                                                                        
                                                                          hintText:
                                                                              'Enter Remark',
                                                                          border:
                                                                              OutlineInputBorder()),
                                                                    ),
                                                              SizedBox(
                                                                height: 20,
                                                              ),
                                                              
                                                              selectedValue ==
                                                                      null
                                                                  ? Text('')
                                                                  : AnimatedButton(
                                                                      height:
                                                                          50,
                                                                      color: Colors
                                                                          .red,
                                                                      width: Adaptive
                                                                          .w(90),
                                                                      isOutline:
                                                                          true,
                                                                      isMultiColor:
                                                                          true,
                                                                      colors: const [
                                                                        primaryColorDark,
                                                                        primaryColorDark
                                                                      ],
                                                                      borderWidth:
                                                                          1,
                                                                      onTap:
                                                                          () {
                                                                        if (_formKey
                                                                            .currentState!
                                                                            .validate()) {
                                                                          if (selectedAgency !=
                                                                              null) {
                                                                            if (_image !=
                                                                                null) {
                                                                              showLoaderDialog(context);
                                                                              ref
                                                                                  .watch(fumigationUpdateProvider(
                                                                                terminalid: '${selectedTerminal?.id}',
                                                                                commodity: '${StackCommditylist.commodity}',
                                                                                date: _controller.text,
                                                                                dose: _DoseController.text,
                                                                                fumiagency: selectedAgency,
                                                                                image: File('${_image!.path}'),
                                                                                remark: _remarkController.text,
                                                                                stackno: selectedValue,
                                                                              ).future)
                                                                                  .then((value) {
                                                                                hideLoaderDialog(context);
                                                                                if (value['status'].toString() == "1") {
                                                                                  ref.watch(goRouterProvider).pop();
                                                                                }
                                                                                Fluttertoast.showToast(msg: value['message'].toString());
                                                                              }).onError((e, s) {
                                                                                hideLoaderDialog(context);
                                                                              });
                                                                            } else {
                                                                              Fluttertoast.showToast(msg: "Please select image");
                                                                            }
                                                                          } else {
                                                                            Fluttertoast.showToast(msg: "Please select agency");
                                                                          }
                                                                        } else {}
                                                                      },
                                                                      child:
                                                                          Text(
                                                                        'Update Fumigation',
                                                                        style: GoogleFonts.aBeeZee(
                                                                            color:
                                                                                Colors.white,
                                                                            fontWeight: FontWeight.w600,
                                                                            fontSize: 18),
                                                                      ),
                                                                    )
                                                            ],
                                                          ),
                                            error: (e, s) => Text('Error'),
                                            loading: () => loader(context)),
                              ],
                            )
                    ],
                  ),
                ),
            error: (e, s) => Text(''),
            loading: () => loader(context)));
  }
}
