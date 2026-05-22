// ignore_for_file: must_be_immutable
import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:button_animations/button_animations.dart';
import 'package:emp_apnagodam/Data/Models/AssetsUpdateModal.dart';
import 'package:emp_apnagodam/Domain/Audit/AuditService.dart';
import 'package:emp_apnagodam/Presentation/Constants/ColorConstant.dart';
import 'package:emp_apnagodam/Presentation/UI/PV/PVScreen.dart';
import 'package:emp_apnagodam/Presentation/Widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AssestStackAudit extends ConsumerWidget {
  AssestStackAudit(
      {super.key, required this.auditid, required this.warehousename});

  String? auditid;
  String? warehousename;
  final reasonKey = GlobalKey<FormState>();

  List<TextEditingController> NumberControllerList = [];
  List<TextEditingController> remarkcontrollerList = [];

  @override
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Assets Audit'),
          foregroundColor: Colors.white,
        ),
        body: ref.watch(stackAuditProvider).when(
            data: (data) => ListView(children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 10, left: 10, bottom: 0, right: 10),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text('Audit ID'),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              hintText: '${auditid}',
                              border: OutlineInputBorder()),
                          readOnly: true,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text('WareHouse Name'),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              hintText: '${warehousename}',
                              border: OutlineInputBorder()),
                          readOnly: true,
                        ),
                        ref.watch(getAssetsAuditProvider(id: auditid)).when(
                            data: (AssetsAudit) => (AssetsAudit.data ?? [])
                                    .isEmpty
                                ? noItems('No Items', context)
                                : Column(
                                    children: [
                                      ListView.builder(
                                        itemCount:
                                            AssetsAudit.data?.length ?? 0,
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemBuilder: (context, index) {
                                          AssetsAudit.data?.forEach((e) {
                                            NumberControllerList.add(
                                                TextEditingController());
                                            remarkcontrollerList
                                                .add(TextEditingController());
                                          });
                                          return Card(
                                            elevation: 2,
                                            child: Container(
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 10),
                                              decoration: BoxDecoration(
                                                  // border: Border.all(
                                                  //     color: Colors.grey),
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              padding: const Pad(all: 10),
                                              child: IntrinsicHeight(
                                                child: Column(children: [
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                          child: Text(
                                                              '  Assets Name')),
                                                      Expanded(
                                                          child: Text(
                                                              '   Number Of Items*.')),
                                                      Expanded(
                                                          child: Text(
                                                              '   Remark*')),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        child: TextFormField(
                                                          readOnly: true,
                                                          decoration:
                                                              InputDecoration(
                                                            border:
                                                                OutlineInputBorder(),
                                                            hintText:
                                                                '${AssetsAudit.data?[index].name}',
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Expanded(
                                                        child: Container(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      10),
                                                          decoration: BoxDecoration(
                                                              border: Border.all(
                                                                  color: Colors
                                                                      .grey),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5)),
                                                          child: TextFormField(
                                                            controller:
                                                                NumberControllerList[
                                                                    index],
                                                            keyboardType:
                                                                TextInputType
                                                                    .number,
                                                            decoration:
                                                                InputDecoration(
                                                              border:
                                                                  InputBorder
                                                                      .none,
                                                              hintText:
                                                                  'Number Item',
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Expanded(
                                                        child: Container(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      10),
                                                          decoration: BoxDecoration(
                                                              border: Border.all(
                                                                  color: Colors
                                                                      .grey),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5)),
                                                          child: TextFormField(
                                                            controller:
                                                                remarkcontrollerList[
                                                                    index],
                                                            decoration:
                                                                InputDecoration(
                                                              hintText:
                                                                  'Enter Remark',
                                                              border:
                                                                  InputBorder
                                                                      .none,
                                                            ),
                                                            keyboardType:
                                                                TextInputType
                                                                    .name,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ]),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      AnimatedButton(
                                        color: primaryColorDark,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.1,
                                        height: 50,
                                        isOutline: true,
                                        isMultiColor: true,
                                        colors: [
                                          primaryColorDark,
                                          primaryColorDark
                                        ],
                                        borderWidth: 1,
                                        onTap: () async {
                                          List<UpdateDatum> saveDatumList = [];

                                          for (int i = 0;
                                              i < NumberControllerList.length;
                                              i++) {
                                            if (i < AssetsAudit.data!.length) {
                                              var assetId =
                                                  AssetsAudit.data?[i].id;
                                              saveDatumList.add(UpdateDatum(
                                                remark: remarkcontrollerList[i]
                                                    .text,
                                                assetId: '${assetId}',
                                                value: NumberControllerList[i]
                                                    .text,
                                              ));
                                            }
                                          }

                                          if (saveDatumList.isNotEmpty) {
                                            AssetsUpdateModal stackModel =
                                                AssetsUpdateModal(
                                              auditId: '${auditid}'.toInt(),
                                              data: saveDatumList,
                                            );

                                            try {
                                              var value = await ref.watch(
                                                  PostAssetsUpdateProvider(
                                                          model: stackModel)
                                                      .future);

                                              hideLoaderDialog(context);

                                              if (value['status'] == "1") {
                                                Fluttertoast.showToast(
                                                    msg: value['message']);
                                              } else {
                                                Fluttertoast.showToast(
                                                    msg:
                                                        'Error: ${value['message']}');
                                              }
                                            } catch (e) {
                                              hideLoaderDialog(context);

                                              Fluttertoast.showToast(
                                                  msg:
                                                      'Error: ${e.toString()}');
                                              print('Error: ${e.toString()}');
                                            } finally {}
                                          } else {
                                            Fluttertoast.showToast(
                                                msg:
                                                    'Please fill all required fields.');
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
                            error: (e, s) => Center(child: Text('')),
                            loading: () => loader(context))
                      ],
                    ),
                  ),
                ]),
            error: (e, s) => Center(child: Text('')),
            loading: () => loader(context)));
  }
}
