// ignore_for_file: must_be_immutable

import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:button_animations/button_animations.dart';
import 'package:emp_apnagodam/Data/Models/AuditQualityRequestModel.dart';
import 'package:emp_apnagodam/Data/Models/CommdityStackModal.dart';
import 'package:emp_apnagodam/Data/Models/ShowStackAuditModal.dart';
import 'package:emp_apnagodam/Data/Models/StackModal.dart';
import 'package:emp_apnagodam/Domain/Audit/AuditService.dart';
import 'package:emp_apnagodam/Presentation/Constants/ColorConstant.dart';
import 'package:emp_apnagodam/Presentation/Widgets/widgets.dart';
import 'package:emp_apnagodam/Presentation/utils/debouncer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';

class StackQualityAudit extends ConsumerWidget {
  StackQualityAudit({super.key, required this.auditid});

  String? auditid;
  final reasonKey = GlobalKey<FormState>();

  var selectedAuditProvider = StateProvider<AuditDatum?>((ref) => null);

  var selectedStackProvider = StateProvider<StackDatum?>((ref) => null);
  var commdityStackProvider = StateProvider<CommdityDatum?>((ref) => null);
  var commodityIdProvider = StateProvider<String?>((ref) => null);
  var stackNoProvider = StateProvider<String?>((ref) => null);
  final formKey = GlobalKey<FormState>();
  List<TextFormField> paramsList = [];
  List<TextEditingController> controllerList = [];
  List<TextEditingController> bagsControllerList = [];
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Stack Quality Audit'),
          foregroundColor: Colors.white,
        ),
        body: ref.watch(stackAuditProvider).when(
            data: (data) => ListView(
                  children: [
                    ref.watch(showQualityStacksProvider(auditId: auditid)).when(
                        data: (data) => Column(
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
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all()),
                                        child: Text(
                                            "${data.warehouse?.warehouseName}"),
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
                                          SizedBox(
                                            child: DropdownMenu<StackDatum?>(
                                              expandedInsets:
                                                  EdgeInsets.symmetric(
                                                      vertical:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width),
                                              initialSelection: ref
                                                  .watch(selectedStackProvider),
                                              label: Text("Select Stack No."),
                                              onSelected: (StackDatum? audit) {
                                                Debouncer(
                                                        delay: Duration(
                                                            milliseconds: 500))
                                                    .call(() {
                                                  ref
                                                      .watch(
                                                          selectedStackProvider
                                                              .notifier)
                                                      .state = audit;
                                                  ref
                                                          .watch(stackNoProvider
                                                              .notifier)
                                                          .state =
                                                      audit?.stackNumber;
                                                });
                                              },
                                              dropdownMenuEntries: data.data!
                                                  .map<
                                                          DropdownMenuEntry<
                                                              StackDatum?>>(
                                                      (StackDatum? stack) {
                                                return DropdownMenuEntry<
                                                    StackDatum?>(
                                                  value: stack,
                                                  label:
                                                      "${stack?.stackNumber ?? "Select Stack Number"}",
                                                );
                                              }).toList(),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: Text('Commdity'),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          ref
                                              .watch(commdityAuditQualityProvider(
                                                  id: "${data.warehouse?.id}",
                                                  stackNo:
                                                      "${ref.watch(selectedStackProvider)?.stackNumber}"))
                                              .when(
                                                data: (commodityData) {
                                                  if ((commodityData.data ?? [])
                                                      .isEmpty) {
                                                    return noItems('', context);
                                                  } else {
                                                    Future.microtask(() {
                                                      ref
                                                              .watch(
                                                                  commodityIdProvider
                                                                      .notifier)
                                                              .state =
                                                          "${commodityData.data?[0].commodityId}";
                                                    });

                                                    return Column(
                                                      children: [
                                                        SizedBox(
                                                            child:
                                                                TextFormField(
                                                          decoration: InputDecoration(
                                                              border:
                                                                  OutlineInputBorder(),
                                                              hintText:
                                                                  "${commodityData.data?.first.category ?? ""}"),
                                                        )),
                                                        SizedBox(height: 10),
                                                        Align(
                                                          alignment:
                                                              Alignment.topLeft,
                                                          child: Text(
                                                              'Quality Parameters'),
                                                        ),
                                                        SizedBox(height: 10),
                                                        ref
                                                            .watch(commdityParametersProvider(
                                                                id: '${ref.watch(commodityIdProvider)}'))
                                                            .when(
                                                              data:
                                                                  (parametersData) {
                                                                print(
                                                                    "Parameters Data: ${parametersData.data}");

                                                                // controllerList
                                                                //     .clear();
                                                                // paramsList
                                                                //     .clear();

                                                                if (parametersData
                                                                        .data !=
                                                                    null) {
                                                                  parametersData
                                                                      .data
                                                                      ?.forEach(
                                                                          (element) {
                                                                    var controller =
                                                                        TextEditingController();
                                                                    var textFormField =
                                                                        TextFormField();
                                                                    paramsList.add(
                                                                        textFormField);
                                                                    controllerList
                                                                        .add(
                                                                            controller);
                                                                  });
                                                                }

                                                                return Form(
                                                                  key: formKey,
                                                                  child: Column(
                                                                    children: [
                                                                      Column(
                                                                        children: List.generate(
                                                                            parametersData.data?.length ??
                                                                                0,
                                                                            (index) {
                                                                          return Padding(
                                                                            padding:
                                                                                Pad(top: 10, bottom: 10),
                                                                            child:
                                                                                TextFormField(
                                                                              controller: controllerList[index],
                                                                              keyboardType: TextInputType.numberWithOptions(decimal: true),
                                                                              validator: (value) {
                                                                                if (value == null || value.isEmpty) {
                                                                                  return 'Please enter a value for ${parametersData.data?[index].id ?? ""}';
                                                                                }
                                                                                return null;
                                                                              },
                                                                              decoration: InputDecoration(
                                                                                labelText: '${parametersData.data?[index].name}',
                                                                                contentPadding: Pad(top: 0, bottom: 0, left: 10),
                                                                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                                                                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }),
                                                                      ),
                                                                      AnimatedButton(
                                                                        color:
                                                                            primaryColorDark,
                                                                        width: MediaQuery.of(context).size.width /
                                                                            1.1,
                                                                        height:
                                                                            50,
                                                                        isOutline:
                                                                            true,
                                                                        isMultiColor:
                                                                            true,
                                                                        colors: [
                                                                          primaryColorDark,
                                                                          primaryColorDark
                                                                        ],
                                                                        borderWidth:
                                                                            1,
                                                                        onTap:
                                                                            () {
                                                                          if (formKey
                                                                              .currentState!
                                                                              .validate()) {
                                                                            showLoaderDialog(context);

                                                                            List<AuditQualityDatum>
                                                                                qvList =
                                                                                [];
                                                                            for (int i = 0;
                                                                                i < parametersData.data!.length;
                                                                                i++) {
                                                                              qvList.add(AuditQualityDatum(id: "${parametersData.data![i].id}", value: controllerList[i].text));
                                                                            }

                                                                            var model = AuditQualityRequestModel(
                                                                                auditId: "${auditid}",
                                                                                stackNo: "${ref.watch(selectedStackProvider)?.stackNumber}",
                                                                                commodityId: "${ref.watch(commodityIdProvider)}",
                                                                                data: qvList);

                                                                            ref.watch(auditQualityUpdateProvider(model: model).future).then(
                                                                                (value) {
                                                                              hideLoaderDialog(context);

                                                                              if (value['status'].toString() == "1") {
                                                                                context.pop();
                                                                              }
                                                                              Fluttertoast.showToast(msg: value['message']);
                                                                            }).onError((e,
                                                                                s) {
                                                                              hideLoaderDialog(context);
                                                                            });
                                                                          }
                                                                        },
                                                                        child:
                                                                            const Text(
                                                                          "Submit",
                                                                          style: TextStyle(
                                                                              color: Colors.white,
                                                                              fontWeight: FontWeight.bold),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                );
                                                              },
                                                              error: (e, s) => Text(
                                                                  'Error loading parameters'),
                                                              loading: () =>
                                                                  loader(
                                                                      context),
                                                            ),
                                                      ],
                                                    );
                                                  }
                                                },
                                                error: (e, s) => Center(
                                                    child: Text(
                                                        'Error loading data')),
                                                loading: () => loader(context),
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
                            ),
                        error: (e, s) => Center(child: Text('')),
                        loading: () => loader(context)),
                  ],
                ),
            error: (e, s) => Center(child: Text('')),
            loading: () => loader(context)));
  }
}
