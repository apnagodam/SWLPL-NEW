// ignore_for_file: unused_local_variable

import 'dart:io';

import 'package:button_animations/button_animations.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:emp_apnagodam/Data/Models/SprayTerminalListModal.dart';
import 'package:emp_apnagodam/Data/Models/StackNumberListModal.dart';
import 'package:emp_apnagodam/Domain/Maintenance/CHR/ChrService.dart';
import 'package:emp_apnagodam/Presentation/Constants/ColorConstant.dart';
import 'package:emp_apnagodam/Presentation/Widgets/widgets.dart';
import 'package:emp_apnagodam/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AddCHRScreen extends ConsumerStatefulWidget {
  const AddCHRScreen({
    super.key,
  });

  @override
  ConsumerState<AddCHRScreen> createState() => _LockAndKeyScreenState();
}

class _LockAndKeyScreenState extends ConsumerState<AddCHRScreen> {
  Terminal? selectedTerminal;
  String? selectedValue;
  StackNumberList? selectedStackNumber;
  List<TextEditingController> controllers = [];
  TextEditingController _liveController = TextEditingController();
  TextEditingController _remarkController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  XFile? _image;
  Future getImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

  var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: Text('Update CHR'),
          foregroundColor: Colors.white,
        ),
        body: ref.watch(allTerminalListProvider).when(
            data: (TerminalData) => Form(
                  key: _formKey,
                  child: ListView(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    children: [
                      Container(
                        child: DropdownButton(
                          underline: SizedBox.shrink(),
                          isExpanded: true,
                          hint: Text("Select Terminal"),
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
                                if(selectedValue!=null)ref
                                    .watch(stackWiseCommdityProvider(
                                        id: '${selectedTerminal?.id}',
                                        stackNo: '${selectedValue}'))
                                    .when(
                                        data: (StackCommditylist) =>
                                            StackCommditylist.commodity == null
                                                ? Text('')
                                                : Column(
                                                    children: [
                                                      Container(
                                                          width: MediaQuery
                                                                  .of(context)
                                                              .size
                                                              .width,
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  vertical: 15,
                                                                  horizontal:
                                                                      10),
                                                          decoration: BoxDecoration(
                                                              border: Border.all(
                                                                  color: Colors
                                                                      .grey),
                                                              color: Colors.grey
                                                                  .shade300,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5)),
                                                          child: Text(
                                                              '${StackCommditylist.commodity ?? ""}')),
                                                      SizedBox(
                                                        height: 15,
                                                      ),
                                                      ListView.builder(
                                                          itemCount:
                                                              StackCommditylist
                                                                      .parameters
                                                                      ?.length ??
                                                                  0,
                                                          physics:
                                                              NeverScrollableScrollPhysics(),
                                                          shrinkWrap: true,
                                                          itemBuilder:
                                                              (context, index) {
                                                            if (controllers
                                                                    .length <=
                                                                index) {
                                                              controllers.add(
                                                                  TextEditingController());
                                                            }

                                                            return Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                SizedBox(
                                                                  height: 7,
                                                                ),
                                                                Text(
                                                                  '${StackCommditylist.parameters?[index].parameter}',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          16),
                                                                ),
                                                                SizedBox(
                                                                  height: 7,
                                                                ),
                                                                TextFormField(
                                                                  keyboardType:
                                                                      TextInputType
                                                                          .number,
                                                                  controller:
                                                                      controllers[
                                                                          index],
                                                                  decoration:
                                                                      InputDecoration(
                                                                    labelText:
                                                                        'Enter value',
                                                                    border:
                                                                        OutlineInputBorder(),
                                                                  ),
                                                                  validator:
                                                                      (text) {
                                                                    if (text ==
                                                                            null ||
                                                                        text.isEmpty) {
                                                                      return 'Field Empty';
                                                                    }
                                                                    return null;
                                                                  },
                                                                ),
                                                              ],
                                                            );
                                                          }),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      selectedValue == null
                                                          ? Text('')
                                                          : Column(
                                                              children: [
                                                                TextFormField(
                                                                  controller:
                                                                      _liveController,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    labelText:
                                                                        'Total Live*',
                                                                    hintText:
                                                                        'Total Live',
                                                                    border:
                                                                        OutlineInputBorder(),
                                                                  ),
                                                                  validator:
                                                                      (text) {
                                                                    if (text ==
                                                                            null ||
                                                                        text.isEmpty) {
                                                                      return 'Total Live is empty';
                                                                    }
                                                                    return null;
                                                                  },
                                                                ),
                                                                SizedBox(
                                                                  height: 10,
                                                                ),
                                                                DottedBorder(
                                                                    child:
                                                                        InkWell(
                                                                  onTap:
                                                                      getImage,
                                                                  child: Container(
                                                                      padding: EdgeInsets.symmetric(vertical: 15),
                                                                      child: Center(
                                                                        child: _image ==
                                                                                null
                                                                            ? const Text('Selected Image')
                                                                            : Image.file(File(_image!.path)),
                                                                      )),
                                                                )),
                                                                SizedBox(
                                                                  height: 10,
                                                                ),
                                                                TextFormField(
                                                                  controller:
                                                                      _remarkController,
                                                                  decoration: InputDecoration(
                                                                      labelText:
                                                                          'Enter Remark',
                                                                      hintText:
                                                                          'Enter Remark',
                                                                      border:
                                                                          OutlineInputBorder()),
                                                                ),
                                                                SizedBox(
                                                                  height: 20,
                                                                ),
                                                                AnimatedButton(
                                                                  height: 50,
                                                                  color: Colors
                                                                      .red,
                                                                  width:
                                                                      Adaptive.w(
                                                                          90),
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
                                                                  onTap: () {
                                                                    if (_formKey
                                                                        .currentState!
                                                                        .validate()) {
                                                                      if (_image ==
                                                                          null) {
                                                                        Fluttertoast.showToast(
                                                                            msg:
                                                                                "Please select image");
                                                                      } else {
                                                                        showLoaderDialog(
                                                                            context);
                                                                        List<Map<String, String>>
                                                                            parameterDetails =
                                                                            [];
                                                                        for (int i =
                                                                                0;
                                                                            i < (StackCommditylist.parameters?.length ?? 0);
                                                                            i++) {
                                                                          String
                                                                              parameterId =
                                                                              (StackCommditylist.parameters?[i].id ?? 0).toString();
                                                                          String
                                                                              parameterValue =
                                                                              controllers[i].text;

                                                                          parameterDetails
                                                                              .add({
                                                                            'id':
                                                                                parameterId,
                                                                            'value':
                                                                                parameterValue,
                                                                          });
                                                                        }

                                                                        ref
                                                                            .watch(updateChrProvider(
                                                                          image:
                                                                              File('${_image!.path}'),
                                                                          commodity:
                                                                              StackCommditylist.commodity?.toString() ?? "",
                                                                          live:
                                                                              _liveController.text,
                                                                          parameter:
                                                                              parameterDetails,
                                                                          remark:
                                                                              _remarkController.text,
                                                                          stackno:
                                                                              selectedValue,
                                                                          terminalid:
                                                                              '${selectedTerminal?.id}',
                                                                        ).future)
                                                                            .then((value) {
                                                                          hideLoaderDialog(
                                                                              context);
                                                                          if (value['status'].toString() ==
                                                                              "1") {
                                                                            ref.watch(goRouterProvider).pop();
                                                                          }
                                                                          Fluttertoast.showToast(
                                                                              msg: value['message'].toString());
                                                                        }).onError((e, s) {
                                                                          hideLoaderDialog(
                                                                              context);
                                                                        });
                                                                      }
                                                                    } else {}
                                                                  },
                                                                  child: Text(
                                                                    'Update CHR',
                                                                    style: GoogleFonts
                                                                        .aBeeZee(
                                                                      color: Colors
                                                                          .white,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      fontSize:
                                                                          18,
                                                                    ),
                                                                  ),
                                                                )
                                                              ],
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
