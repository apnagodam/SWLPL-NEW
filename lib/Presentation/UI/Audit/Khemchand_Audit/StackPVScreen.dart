// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:emp_apnagodam/Data/Models/ActiveAuditModsal.dart';
import 'package:emp_apnagodam/Data/Models/CommdityStackModal.dart';
import 'package:emp_apnagodam/Data/Models/PVModel.dart';
import 'package:emp_apnagodam/Data/Models/ShowStackAuditModal.dart';
import 'package:emp_apnagodam/Data/Models/StackModal.dart';
import 'package:emp_apnagodam/Domain/Audit/AuditService.dart';
import 'package:emp_apnagodam/Presentation/UI/PV/PVScreen.dart';
import 'package:emp_apnagodam/Presentation/Widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';

import '../../../../Data/Models/TerminalModel.dart' as terminal;

class StackPVAuditScreen extends ConsumerStatefulWidget {
  String? auditid;
  String? warehousename;
  StackPVAuditScreen({
    super.key,
    required this.auditid,
    required this.warehousename,
  });

  @override
  ConsumerState<StackPVAuditScreen> createState() => _AuditneighbourState();
}

class _AuditneighbourState extends ConsumerState<StackPVAuditScreen> {
  final reasonKey = GlobalKey<FormState>();
  TextEditingController searchController = TextEditingController();
  TextEditingController remarksController = TextEditingController();

  var selectedAuditProvider = StateProvider<AuditDatum?>((ref) => null);
  var selectedStackProvider = StateProvider<StackDatum?>((ref) => null);
  var commdityStackProvider = StateProvider<CommdityDatum?>((ref) => null);
  var stackNoProvider = StateProvider<String?>((ref) => null);
  final formKey = GlobalKey<FormState>();

  final _pdfFile = StateProvider<File?>((ref) => null);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Stack Audit PV'),
      ),
      body: Form(
          key: formKey,
          child: ListView(
            padding: Pad(all: 10),
            children: [
              ElevarmTextInputField(
                label: 'Remarks',
                controller: remarksController,
                helperText: 'Enter remarks for the audit',
                hintText: 'Enter remarks',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter remarks';
                  }
                  return null;
                },
                maxLines: 8,
                minLines: 1,
              ),
              SizedBox(
                height: 10,
              ),
              FilePickerWidget(onImageSelection: (value) {
                ref.watch(_pdfFile.notifier).state =value;
              }, title: 'Pdf'),
              SizedBox(
                height: 10,
              ),
              simpleButton(
                  text: 'Submit',
                  callback: () {
                    if (formKey.currentState!.validate()) {
                      if (ref.watch(_pdfFile) == null) {
                        Fluttertoast.showToast(msg: 'Please select a PDF file');
                      } else {
                        showLoaderDialog(context);
                        ref
                            .watch(postAuditPdfProvider(
                                    auditId: widget.auditid,
                                    remark: remarksController.text,
                                    file: ref.watch(_pdfFile))
                                .future)
                            .then((value) {
                          hideLoaderDialog(context);
                          if (value['status'].toString() == "1") {
                            context.pop();
                          } else {}
                        }).onError((e, s) {
                          hideLoaderDialog(context);
                        });
                      }
                    }
                  })
              // Padding(
              //   padding: const EdgeInsets.all(10),
              //   child: Column(
              //     children: [
              //       Align(
              //         alignment: Alignment.topLeft,
              //         child: Text('WareHouse Name'),
              //       ),
              //       SizedBox(
              //         height: 10,
              //       ),
              //       TextFormField(
              //         decoration: InputDecoration(
              //             hintText: '${widget.warehousename}',
              //             border: OutlineInputBorder()),
              //       ),
              //       SizedBox(
              //         height: 5,
              //       ),
              //       Column(
              //         children: [
              //           SizedBox(
              //             height: 10,
              //           ),
              //           Align(
              //             alignment: Alignment.topLeft,
              //             child: Text('Stack No.'),
              //           ),
              //           SizedBox(
              //             height: 10,
              //           ),
              //           SizedBox(
              //             child: DropdownMenu<StackDatum?>(
              //               expandedInsets: EdgeInsets.symmetric(
              //                   vertical:
              //                       MediaQuery.of(context).size.width),
              //               initialSelection:
              //                   ref.watch(selectedStackProvider),
              //               label: Text("Select Stack No."),
              //               onSelected: (StackDatum? audit) {
              //                 ref
              //                     .watch(selectedStackProvider.notifier)
              //                     .state = audit;
              //                 ref.watch(stackNoProvider.notifier).state =
              //                     audit?.stackNumber;
              //               },
              //               dropdownMenuEntries: data.data!
              //                   .map<DropdownMenuEntry<StackDatum?>>(
              //                       (StackDatum? stack) {
              //                 return DropdownMenuEntry<StackDatum?>(
              //                   value: stack,
              //                   label:
              //                       "${stack?.stackNumber ?? "Select Stack Number"}",
              //                 );
              //               }).toList(),
              //             ),
              //           ),
              //           SizedBox(
              //             height: 10,
              //           ),
              //           Align(
              //             alignment: Alignment.topLeft,
              //             child: Text('Commdity'),
              //           ),
              //           SizedBox(
              //             height: 10,
              //           ),
              //           ref
              //               .watch(commdityAuditQualityProvider(
              //                   id: "${data.warehouse?.id}",
              //                   stackNo:
              //                       "${ref.watch(selectedStackProvider)?.stackNumber}"))
              //               .when(
              //                   data: (data) => Column(
              //                         children: [
              //                           SizedBox(
              //                             child:
              //                                 DropdownMenu<CommdityDatum?>(
              //                               expandedInsets:
              //                                   EdgeInsets.symmetric(
              //                                       vertical: MediaQuery.of(
              //                                               context)
              //                                           .size
              //                                           .width),
              //                               initialSelection: ref.watch(
              //                                   commdityStackProvider),
              //                               label:
              //                                   Text("Select Commodity "),
              //                               onSelected:
              //                                   (CommdityDatum? audit) {
              //                                 ref
              //                                     .watch(
              //                                         commdityStackProvider
              //                                             .notifier)
              //                                     .state = audit;
              //                               },
              //                               dropdownMenuEntries: data.data!
              //                                   .map<
              //                                           DropdownMenuEntry<
              //                                               CommdityDatum?>>(
              //                                       (CommdityDatum?
              //                                           catgory) {
              //                                 return DropdownMenuEntry<
              //                                     CommdityDatum?>(
              //                                   value: catgory,
              //                                   label:
              //                                       "${catgory?.category ?? "Selecte Commodity"}",
              //                                 );
              //                               }).toList(),
              //                             ),
              //                           ),
              //                           SizedBox(
              //                             height: 10,
              //                           ),
              //                           Align(
              //                             alignment: Alignment.topLeft,
              //                             child: Text('Quality Parameters'),
              //                           ),
              //                           SizedBox(
              //                             height: 10,
              //                           ),
              //                         ],
              //                       ),
              //                   error: (e, s) => Center(child: Text('')),
              //                   loading: () => loader(context)),
              //         ],
              //       ),
              //       SizedBox(
              //         height: 10,
              //       ),
              //       InkWell(
              //         child: Container(
              //           width: double.infinity,
              //           padding: Pad(all: 10),
              //           child: Text(
              //             'Add PV Block',
              //             textAlign: TextAlign.center,
              //             style: TextStyle(
              //                 color: primaryColorDark,
              //                 fontSize: Adaptive.sp(14),
              //                 fontWeight: FontWeight.w800),
              //           ),
              //           decoration: BoxDecoration(
              //               border: Border.all(color: primaryColorDark),
              //               borderRadius: BorderRadius.circular(10)),
              //         ),
              //         onTap: () async {
              //           ref.watch(listOfBlocks.notifier).state = [
              //             ...ref.watch(listOfBlocks),
              //             BlockNo(height: '0')
              //           ];
              //         },
              //       ),
              //       ListView.builder(
              //           shrinkWrap: true,
              //           itemCount: ref.watch(listOfBlocks).length,
              //           physics: const NeverScrollableScrollPhysics(),
              //           itemBuilder: (context, index) {
              //             ref.watch(listOfBlocks)[index].block_no =
              //                 (index + 1).toString();
              //             return Stack(
              //               children: [
              //                 Card(
              //                   child: Padding(
              //                     padding: const Pad(all: 10),
              //                     child: ColumnSuper(children: [
              //                       Text(
              //                         'Block ${index + 1}',
              //                         style: TextStyle(
              //                             fontWeight: FontWeight.w900,
              //                             color: primaryColorDark,
              //                             fontSize: Adaptive.sp(16),
              //                             decoration:
              //                                 TextDecoration.underline),
              //                       ),
              //                       const SizedBox(
              //                         height: 10,
              //                       ),
              //                       Row(children: [
              //                         Expanded(
              //                             child: TextFormField(
              //                           decoration: InputDecoration(
              //                               labelText: "Dhang",
              //                               contentPadding: const Pad(
              //                                   top: 0,
              //                                   bottom: 0,
              //                                   left: 10),
              //                               disabledBorder: OutlineInputBorder(
              //                                   borderRadius:
              //                                       BorderRadius.circular(
              //                                           5),
              //                                   borderSide: const BorderSide(
              //                                       color:
              //                                           primaryColorDark)),
              //                               border: OutlineInputBorder(
              //                                   borderRadius:
              //                                       BorderRadius.circular(
              //                                           5)),
              //                               enabledBorder:
              //                                   OutlineInputBorder(
              //                                       borderRadius:
              //                                           BorderRadius
              //                                               .circular(5))),
              //                           initialValue:
              //                               '${ref.watch(listOfBlocks)[index].dhang ?? 0}',
              //                           onChanged: (value) {
              //                             mDebounce.Debouncer(
              //                                     delay: const Duration(
              //                                         milliseconds: 500))
              //                                 .call(() {
              //                               ref
              //                                   .watch(listOfBlocks)[index]
              //                                   .dhang = value;
              //                               if (ref
              //                                       .watch(
              //                                           listOfBlocks)[index]
              //                                       .plusMinusType ==
              //                                   PlusMinusType.minusType) {
              //                                 ref
              //                                         .watch(listOfBlocks)[
              //                                             index]
              //                                         .total =
              //                                     '${(((int.tryParse(ref.watch(listOfBlocks)[index].dhang ?? "0"))! + (int.parse(ref.watch(listOfBlocks)[index].danda ?? "0")) * int.parse(ref.watch(listOfBlocks)[index].height ?? "0")) - int.parse(ref.watch(listOfBlocks)[index].plusMinus ?? "0"))}';
              //                               } else {
              //                                 ref
              //                                         .watch(listOfBlocks)[
              //                                             index]
              //                                         .total =
              //                                     '${(((int.parse(ref.watch(listOfBlocks)[index].dhang ?? "0")) + (int.parse(ref.watch(listOfBlocks)[index].danda ?? "0")) * int.parse(ref.watch(listOfBlocks)[index].height ?? "0")) + int.parse(ref.watch(listOfBlocks)[index].plusMinus ?? "0"))}';
              //                               }
              //                               ref
              //                                   .watch(listOfBlocks)[index]
              //                                   .no_of_blocks = (ref
              //                                       .watch(listOfBlocks)
              //                                       .length)
              //                                   .toString();
              //                               setState(() {});
              //                             });
              //                           },
              //                         )),
              //                         const SizedBox(
              //                           width: 5,
              //                         ),
              //                         //dhanda
              //                         Expanded(
              //                             child: TextFormField(
              //                           decoration: InputDecoration(
              //                               labelText: "Danda",
              //                               contentPadding: const Pad(
              //                                   top: 0,
              //                                   bottom: 0,
              //                                   left: 10),
              //                               disabledBorder: OutlineInputBorder(
              //                                   borderRadius:
              //                                       BorderRadius.circular(
              //                                           5),
              //                                   borderSide: const BorderSide(
              //                                       color:
              //                                           primaryColorDark)),
              //                               border: OutlineInputBorder(
              //                                   borderRadius:
              //                                       BorderRadius.circular(
              //                                           5)),
              //                               enabledBorder:
              //                                   OutlineInputBorder(
              //                                       borderRadius:
              //                                           BorderRadius
              //                                               .circular(5))),
              //                           initialValue:
              //                               '${ref.watch(listOfBlocks)[index].danda ?? 0}',
              //                           onChanged: (value) {
              //                             mDebounce.Debouncer(
              //                                     delay: const Duration(
              //                                         milliseconds: 500))
              //                                 .call(() {
              //                               ref
              //                                   .watch(listOfBlocks)[index]
              //                                   .danda = value;
              //                               if (ref
              //                                       .watch(
              //                                           listOfBlocks)[index]
              //                                       .plusMinusType ==
              //                                   PlusMinusType.minusType) {
              //                                 ref
              //                                         .watch(listOfBlocks)[
              //                                             index]
              //                                         .total =
              //                                     '${((int.parse(ref.watch(listOfBlocks)[index].dhang ?? "0") + (int.parse(ref.watch(listOfBlocks)[index].danda ?? "0"))) * int.parse(ref.watch(listOfBlocks)[index].height ?? '0')) - int.parse(ref.watch(listOfBlocks)[index].plusMinus ?? "0")}';
              //                               } else {
              //                                 ref
              //                                         .watch(listOfBlocks)[
              //                                             index]
              //                                         .total =
              //                                     '${(((int.parse(ref.watch(listOfBlocks)[index].dhang ?? "0")) + (int.parse(ref.watch(listOfBlocks)[index].danda ?? "0"))) * int.parse(ref.watch(listOfBlocks)[index].height ?? "0")) + int.parse(ref.watch(listOfBlocks)[index].plusMinus ?? "0")}';
              //                               }
              //                               ref
              //                                   .watch(listOfBlocks)[index]
              //                                   .no_of_blocks = (ref
              //                                       .watch(listOfBlocks)
              //                                       .length)
              //                                   .toString();

              //                               setState(() {});
              //                             });
              //                           },
              //                         )),
              //                         const SizedBox(
              //                           width: 5,
              //                         ),
              //                         //height
              //                         Expanded(
              //                             child: TextFormField(
              //                           decoration: InputDecoration(
              //                               labelText: "Height",
              //                               contentPadding: const Pad(
              //                                   top: 0,
              //                                   bottom: 0,
              //                                   left: 10),
              //                               disabledBorder: OutlineInputBorder(
              //                                   borderRadius:
              //                                       BorderRadius.circular(
              //                                           5),
              //                                   borderSide: const BorderSide(
              //                                       color:
              //                                           primaryColorDark)),
              //                               border: OutlineInputBorder(
              //                                   borderRadius:
              //                                       BorderRadius.circular(
              //                                           5)),
              //                               enabledBorder:
              //                                   OutlineInputBorder(
              //                                       borderRadius:
              //                                           BorderRadius
              //                                               .circular(5))),
              //                           initialValue:
              //                               '${ref.watch(listOfBlocks)[index].height ?? 1}',
              //                           onChanged: (value) {
              //                             mDebounce.Debouncer(
              //                                     delay: const Duration(
              //                                         milliseconds: 500))
              //                                 .call(() {
              //                               ref
              //                                   .watch(listOfBlocks)[index]
              //                                   .height = value;
              //                               if (ref
              //                                       .watch(
              //                                           listOfBlocks)[index]
              //                                       .plusMinusType ==
              //                                   PlusMinusType.minusType) {
              //                                 ref
              //                                         .watch(listOfBlocks)[
              //                                             index]
              //                                         .total =
              //                                     '${(((int.parse(ref.watch(listOfBlocks)[index].dhang ?? "0")) + (int.parse(ref.watch(listOfBlocks)[index].danda ?? "0")) * int.parse(ref.watch(listOfBlocks)[index].height ?? "0")) - int.parse(ref.watch(listOfBlocks)[index].plusMinus ?? "0"))}';
              //                               } else {
              //                                 ref
              //                                         .watch(listOfBlocks)[
              //                                             index]
              //                                         .total =
              //                                     '${(((int.parse(ref.watch(listOfBlocks)[index].dhang ?? "0")) + (int.parse(ref.watch(listOfBlocks)[index].danda ?? "0"))) * int.parse(ref.watch(listOfBlocks)[index].height ?? "0")) + int.parse(ref.watch(listOfBlocks)[index].plusMinus ?? "0")}';
              //                               }
              //                               ref
              //                                   .watch(listOfBlocks)[index]
              //                                   .no_of_blocks = (ref
              //                                       .watch(listOfBlocks)
              //                                       .length)
              //                                   .toString();

              //                               setState(() {});
              //                             });
              //                           },
              //                         )),
              //                       ]),
              //                       const SizedBox(
              //                         height: 10,
              //                       ),
              //                       const SizedBox(
              //                         height: 10,
              //                       ),
              //                       Row(children: [
              //                         Expanded(
              //                             child: TextFormField(
              //                           decoration: InputDecoration(
              //                               labelText: "Plus Minus",
              //                               contentPadding: const Pad(
              //                                   top: 0,
              //                                   bottom: 0,
              //                                   left: 10),
              //                               disabledBorder: OutlineInputBorder(
              //                                   borderRadius:
              //                                       BorderRadius.circular(
              //                                           5),
              //                                   borderSide: const BorderSide(
              //                                       color:
              //                                           primaryColorDark)),
              //                               border: OutlineInputBorder(
              //                                   borderRadius:
              //                                       BorderRadius.circular(
              //                                           5)),
              //                               enabledBorder:
              //                                   OutlineInputBorder(
              //                                       borderRadius:
              //                                           BorderRadius
              //                                               .circular(5))),
              //                           onChanged: (value) {
              //                             mDebounce.Debouncer(
              //                                     delay: const Duration(
              //                                         milliseconds: 500))
              //                                 .call(() {
              //                               ref
              //                                   .watch(listOfBlocks)[index]
              //                                   .plusMinus = value;
              //                               if (ref
              //                                       .watch(
              //                                           listOfBlocks)[index]
              //                                       .plusMinusType ==
              //                                   PlusMinusType.minusType) {
              //                                 ref
              //                                         .watch(listOfBlocks)[
              //                                             index]
              //                                         .total =
              //                                     '${(((int.parse(ref.watch(listOfBlocks)[index].dhang ?? "0")) + (int.parse(ref.watch(listOfBlocks)[index].danda ?? "0"))) * ref.watch(listOfBlocks)[index].height.toInt(defaultValue: 1)) - ref.watch(listOfBlocks)[index].plusMinus.toInt(defaultValue: 0)}';
              //                               } else {
              //                                 ref
              //                                         .watch(listOfBlocks)[
              //                                             index]
              //                                         .total =
              //                                     '${(((int.parse(ref.watch(listOfBlocks)[index].dhang ?? "0")) + (ref.watch(listOfBlocks)[index].danda?.toInt() ?? 0)) * ref.watch(listOfBlocks)[index].height.toInt(defaultValue: 1)) + ref.watch(listOfBlocks)[index].plusMinus.toInt(defaultValue: 0)}';
              //                               }
              //                               ref
              //                                   .watch(listOfBlocks)[index]
              //                                   .no_of_blocks = (ref
              //                                       .watch(listOfBlocks)
              //                                       .length)
              //                                   .toString();

              //                               setState(() {});
              //                             });
              //                           },
              //                           initialValue: '0',
              //                         )),
              //                         SizedBox(
              //                           width: 10,
              //                         ),
              //                         Expanded(
              //                             child: SizedBox(
              //                           child: DropdownMenu<PlusMinusType>(
              //                             initialSelection: ref
              //                                 .watch(listOfBlocks)[index]
              //                                 .plusMinusType,
              //                             label: const Text('+/-'),
              //                             onSelected:
              //                                 (PlusMinusType? labour) {
              //                               mDebounce.Debouncer(
              //                                       delay: const Duration(
              //                                           milliseconds: 500))
              //                                   .call(() {
              //                                 ref
              //                                         .watch(listOfBlocks)[
              //                                             index]
              //                                         .plusMinusType =
              //                                     labour ??
              //                                         PlusMinusType
              //                                             .defaultType;
              //                                 if (ref
              //                                         .watch(listOfBlocks)[
              //                                             index]
              //                                         .plusMinusType ==
              //                                     PlusMinusType.minusType) {
              //                                   ref
              //                                           .watch(listOfBlocks)[
              //                                               index]
              //                                           .total =
              //                                       '${(((ref.watch(listOfBlocks)[index].dhang.toInt(defaultValue: 0)) + (ref.watch(listOfBlocks)[index].danda.toInt(defaultValue: 0) ?? 0)) * ref.watch(listOfBlocks)[index].height.toInt(defaultValue: 1)) - ref.watch(listOfBlocks)[index].plusMinus.toInt(defaultValue: 0)}';
              //                                 } else {
              //                                   ref
              //                                           .watch(listOfBlocks)[
              //                                               index]
              //                                           .total =
              //                                       '${(((ref.watch(listOfBlocks)[index].dhang.toInt(defaultValue: 0)) + (ref.watch(listOfBlocks)[index].danda.toInt(defaultValue: 0) ?? 0)) * ref.watch(listOfBlocks)[index].height.toInt(defaultValue: 1)) + ref.watch(listOfBlocks)[index].plusMinus.toInt(defaultValue: 0)}';
              //                                 }
              //                                 ref
              //                                     .watch(
              //                                         listOfBlocks)[index]
              //                                     .no_of_blocks = (ref
              //                                         .watch(listOfBlocks)
              //                                         .length)
              //                                     .toString();

              //                                 setState(() {});
              //                               });
              //                             },
              //                             dropdownMenuEntries:
              //                                 PlusMinusType.values.map<
              //                                         DropdownMenuEntry<
              //                                             PlusMinusType>>(
              //                                     (PlusMinusType labour) {
              //                               return DropdownMenuEntry<
              //                                   PlusMinusType>(
              //                                 value: labour,
              //                                 label: labour.title,
              //                               );
              //                             }).toList(),
              //                             width: 100,
              //                           ),
              //                         )),
              //                         SizedBox(
              //                           width: 10,
              //                         ),
              //                         Expanded(
              //                             child: Text(ref
              //                                         .watch(listOfBlocks)[
              //                                             index]
              //                                         .plusMinusType ==
              //                                     PlusMinusType.minusType
              //                                 ? '${(((ref.watch(listOfBlocks)[index].dhang.toInt(defaultValue: 0)) + (ref.watch(listOfBlocks)[index].danda.toInt(defaultValue: 0) ?? 0)) * ref.watch(listOfBlocks)[index].height.toInt(defaultValue: 1)) - ref.watch(listOfBlocks)[index].plusMinus.toInt(defaultValue: 0)}'
              //                                 : '${(((ref.watch(listOfBlocks)[index].dhang.toInt(defaultValue: 0)) + (ref.watch(listOfBlocks)[index].danda.toInt(defaultValue: 0) ?? 0)) * ref.watch(listOfBlocks)[index].height.toInt(defaultValue: 1)) + ref.watch(listOfBlocks)[index].plusMinus.toInt(defaultValue: 0)}')),
              //                       ])
              //                     ]),
              //                   ),
              //                 ),
              //                 Align(
              //                   alignment: Alignment.topRight,
              //                   child: FloatingActionButton.small(
              //                     onPressed: () {
              //                       ref.watch(listOfBlocks).removeAt(index);
              //                       setState(() {});
              //                     },
              //                     child: Icon(
              //                       Icons.close,
              //                       size: Adaptive.sp(20),
              //                       color: Colors.white,
              //                     ),
              //                     shape: CircleBorder(),
              //                     backgroundColor: Colors.red.shade700,
              //                   ),
              //                 )
              //               ],
              //             );
              //           }),
              //       SizedBox(
              //         height: 10,
              //       ),

              //       TextField(
              //         decoration: InputDecoration(
              //           labelText: 'Enter Text',
              //           border: OutlineInputBorder(
              //             borderRadius:
              //                 BorderRadius.all(Radius.circular(12.0)),
              //           ),
              //           focusedBorder: OutlineInputBorder(
              //             borderSide:
              //                 BorderSide(color: Colors.blue, width: 2.0),
              //             borderRadius:
              //                 BorderRadius.all(Radius.circular(12.0)),
              //           ),
              //           enabledBorder: OutlineInputBorder(
              //             borderSide:
              //                 BorderSide(color: Colors.grey, width: 1.0),
              //             borderRadius:
              //                 BorderRadius.all(Radius.circular(12.0)),
              //           ),
              //         ),
              //       ),
              //       SizedBox(
              //         height: 10,
              //       ),
              //       Visibility(
              //         visible: ref.watch(listOfBlocks).isNotEmpty,
              //         child: AnimatedButton(
              //           width: Adaptive.w(90),
              //           height: 50,
              //           color: primaryColorDark,
              //           isOutline: true,
              //           isMultiColor: true,
              //           colors: [primaryColorDark, primaryColorDark],
              //           borderWidth: 1,
              //           onTap: () async {
              //             var isComplete = true;
              //             ref.watch(listOfBlocks).forEach((element) {
              //               if (element.total == "0") {
              //                 isComplete = true;
              //               }
              //             });

              //             if (isComplete) {
              //               ref
              //                   .watch(PostPVStackAuditProvider(
              //                           model: Pvmodel(
              //                               terminalId: ref
              //                                   .watch(terminalProvider)
              //                                   ?.id
              //                                   .toString(),
              //                               stackNo: double.parse(
              //                                   "${ref.watch(selectedStackProvider)?.stackNumber}"),
              //                               commodityId:
              //                                   "${ref.watch(commdityStackProvider)?.commodityId}",
              //                               blockNo:
              //                                   ref.watch(listOfBlocks)))
              //                       .future)
              //                   .then((value) {
              //                 if (value['status'].toString() == "1") {
              //                   // ref.watch(goRouterProvider).pop();
              //                 }
              //                 Fluttertoast.showToast(
              //                     msg: value['message'].toString());
              //               }).onError((e, s) =>
              //                       showErrorDialog(context, e.toString()));
              //             } else {
              //               Fluttertoast.showToast(
              //                   msg:
              //                       'Please complete previous block first!');
              //             }
              //           },
              //           child: Text(
              //             'Submit PV',
              //             textAlign: TextAlign.center,
              //             style: TextStyle(
              //                 color: Colors.white,
              //                 fontSize: Adaptive.sp(14),
              //                 fontWeight: FontWeight.w800),
              //           ),
              //         ),
              //       )
              //     ],
              //   ),
              // ),
            ],
          )),
    );
  }

  var pvItemCount = StateProvider((ref) => 0);
  var plusMinusProvider =
      StateProvider<PlusMinusType?>((ref) => PlusMinusType.defaultType);
  var listOfBlocks = StateProvider<List<BlockNo>>((ref) => []);

  var terminalProvider = StateProvider<terminal.Terminal?>((ref) => null);
  var stackProvider = StateProvider<Datum?>((ref) => null);
}
