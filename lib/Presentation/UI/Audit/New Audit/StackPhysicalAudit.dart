// ignore_for_file: must_be_immutable

import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:button_animations/button_animations.dart';

import 'package:emp_apnagodam/Data/Models/StackModal.dart';
import 'package:emp_apnagodam/Data/Models/StackSaveSummaryModal.dart';
import 'package:emp_apnagodam/Domain/Audit/AuditService.dart';
import 'package:emp_apnagodam/Presentation/Constants/ColorConstant.dart';
import 'package:emp_apnagodam/Presentation/UI/PV/PVScreen.dart';
import 'package:emp_apnagodam/Presentation/Widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class PhysicalAuditScreen extends ConsumerWidget {
  PhysicalAuditScreen({super.key, required this.auditid});

  String? auditid;
  final reasonKey = GlobalKey<FormState>();

  var selectedAuditProvider = StateProvider<AuditDatum?>((ref) => null);

  final formKey = GlobalKey<FormState>();
  List<TextEditingController> bagsControllerList = [];
  List<TextEditingController> controllerList = [];
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return
     Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Stack Physical Audit'),
        ),
        body: ref.watch(stackAuditProvider).when(
            data: (data) => ListView(
                  children: [
                    ref.watch(showStackAuditProvider(Id: auditid)).when(
                        data: (stackData) {
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Text('WareHouse Name'),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 15),
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          border: Border.all()),
                                      child: Text(
                                          "${stackData.warehouse?.warehouseName}"),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Column(
                                      children: [
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Text('Stack No.'),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        ListView.builder(
                                          itemCount:
                                              stackData.data?.length ?? 0,
                                          shrinkWrap: true,
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          itemBuilder: (context, index) {
                                            data.data?.forEach((e) {
                                              bagsControllerList
                                                  .add(TextEditingController());
                                              controllerList
                                                  .add(TextEditingController());
                                            });
                                            return Container(
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 10),
                                              decoration: BoxDecoration(
                                                  border: Border.all(),
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              padding: const Pad(all: 10),
                                              child: IntrinsicHeight(
                                                child: Column(children: [
                                                  Row(
                                                    children: [
                                                      Text(
                                                          'SN.Number ${index + 1},',
                                                          style: GoogleFonts
                                                              .aBeeZee(
                                                                  color:
                                                                      primaryColor)),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text(
                                                          'Category Name:- ${stackData.data?[index].category},')
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                          child: Text(
                                                              '   Stack Number')),
                                                      Expanded(
                                                          child: Text(
                                                              '   Bag Count.')),
                                                      Expanded(
                                                          child: Text(
                                                              '   Remark')),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        child: Container(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      10),
                                                          decoration: BoxDecoration(
                                                              border:
                                                                  Border.all(),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5)),
                                                          child: TextFormField(
                                                            readOnly: true,
                                                            decoration: InputDecoration(
                                                                border:
                                                                    InputBorder
                                                                        .none,
                                                                hintText:
                                                                    '${stackData.data?[index].stackNumber}'),
                                                          ),
                                                          // child: Text(
                                                          //     '${data.data?[index].stackNumber}'),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Expanded(
                                                        child: Container(
                                                          decoration: BoxDecoration(
                                                              border:
                                                                  Border.all(),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5)),
                                                          child: TextFormField(
                                                            keyboardType:
                                                                TextInputType
                                                                    .number,
                                                            controller:
                                                                bagsControllerList[
                                                                    index],
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Expanded(
                                                        child: Container(
                                                          decoration: BoxDecoration(
                                                              border:
                                                                  Border.all(),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5)),
                                                          child: TextFormField(
                                                            keyboardType:
                                                                TextInputType
                                                                    .name,
                                                            controller:
                                                                controllerList[
                                                                    index],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ]),
                                              ),
                                            );
                                          },
                                        ),
                                        AnimatedButton(
                                          color: primaryColorDark,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              1.1,
                                          height: 50,
                                          isOutline: true,
                                          isMultiColor: true,
                                          colors: [
                                            primaryColorDark,
                                            primaryColorDark
                                          ],
                                          borderWidth: 1,
                                          onTap: () {
                                            List<SaveDatum> saveDatumList = [];

                                            print(controllerList);
                                            print(bagsControllerList);
                                            int length = controllerList.length;
                                            for (int i = 0; i < length; i++) {
                                              if (i < stackData.data!.length) {
                                                saveDatumList.add(SaveDatum(
                                                  stackNo: stackData
                                                      .data?[i].stackNumber,
                                                  auditBags:
                                                      bagsControllerList[i]
                                                          .text,
                                                  remark:
                                                      controllerList[i].text,
                                                  commodityId: stackData
                                                      .data?[i].commodityId,
                                                ));
                                              }
                                            }

                                            if (saveDatumList.isNotEmpty) {
                                              StackSaveSummaryModal stackModel =
                                                  StackSaveSummaryModal(
                                                auditId: '${auditid}'.toInt(),
                                                data: saveDatumList,
                                              );

                                              if (stackModel.data?.isNotEmpty ==
                                                  true) {
                                                print(stackModel
                                                    .data?[0].auditBags);
                                                print(
                                                    stackModel.data?[0].remark);

                                                print(saveDatumList);
                                              }

                                              ref.watch(
                                                  postStackQualityAuditProvider(
                                                      model: stackModel));

                                              ref
                                                  .watch(
                                                      postStackQualityAuditProvider(
                                                              model: stackModel)
                                                          .future)
                                                  .then((value) {
                                                hideLoaderDialog(context);

                                                if (value['status'] == "1") {}
                                                Fluttertoast.showToast(
                                                    msg: value['message']);
                                              }).onError((e, s) {
                                                hideLoaderDialog(context);
                                              });
                                            }
                                          },
                                          child: const Text(
                                            "Submit",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                        error: (e, s) => Center(child: Text('')),
                        loading: () => loader(context)),
                  ],
                ),
            error: (e, s) => Center(child: Text('')),
            loading: () => loader(context)));
  }
}
