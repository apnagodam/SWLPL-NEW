// ignore_for_file: must_be_immutable

import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:button_animations/button_animations.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:emp_apnagodam/Data/Models/AuditQvRequestModel.dart';
import 'package:emp_apnagodam/Data/Models/AuditStackModel.dart';
import 'package:emp_apnagodam/Domain/Audit/AuditService.dart';
import 'package:emp_apnagodam/Domain/Displeased/DispleasedService.dart';
import 'package:emp_apnagodam/Presentation/Constants/ColorConstant.dart';
import 'package:emp_apnagodam/Presentation/Widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';

import '../../../Data/Models/TerminalModel.dart' as terminal;

class Auditstackquality extends ConsumerWidget {
  Auditstackquality({super.key});
  TextEditingController searchController = TextEditingController();
  var terminalProvider = StateProvider<terminal.Terminal?>((ref) => null);
  var stacksProvider = StateProvider<Datum?>((ref) => null);
  final formKey = GlobalKey<FormState>();

  List<TextFormField> paramsList = [];
  List<TextEditingController> controllerList = [];
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Audit Stack Quality'),
      ),
      body: SingleChildScrollView(
          child: Padding(
              padding: Pad(all: 10),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    terminalsLayout(ref, context),
                    SizedBox(
                      height: 10,
                    ),
                    if (ref.watch(terminalProvider) != null)
                      stacksLayout(
                          "${ref.watch(terminalProvider)?.id}", ref, context),
                    if (ref.watch(stacksProvider) != null)
                      qualityLayout("${ref.watch(stacksProvider)?.commodityId}",
                          ref, context),
                  ],
                ),
              ))),
    );
  }

  terminalsLayout(WidgetRef ref, BuildContext context) =>
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
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          border: Border(
                              top: BorderSide(color: primaryColor),
                              bottom: BorderSide(color: primaryColor),
                              left: BorderSide(color: primaryColor),
                              right: BorderSide(color: primaryColor))),
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      height: 40,
                      width: 200,
                    ),
                    dropdownStyleData: DropdownStyleData(
                      maxHeight: MediaQuery.of(context).size.height / 2,
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
                          validator: (value) {
                            if (ref.watch(terminalProvider) == null) {
                              return 'Please select a Terminal';
                            }
                            return null;
                          },
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
                    onMenuStateChange: (isOpen) {
                      if (!isOpen) {
                        searchController.clear();
                      }
                    },
                  ),
                ),
              ),
          error: (e, s) => Container(),
          loading: () => TextFormField());

  stacksLayout(String terminalid, WidgetRef ref, BuildContext context) =>
      ref.watch(auditStacksProvider(terminalId: terminalid)).when(
          data: (stacksData) => SizedBox(
                width: MediaQuery.of(context).size.width,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2<Datum>(
                    isExpanded: true,
                    hint: Text(
                      'Select Stack No.',
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    items: stacksData.data!
                        .map((item) => DropdownMenuItem(
                              value: item,
                              child: Text(
                                item.stackNumber ?? "",
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ))
                        .toList(),
                    value: ref.watch(stacksProvider),
                    onChanged: (value) {
                      ref.watch(stacksProvider.notifier).state = value;
                    },

                    buttonStyleData: const ButtonStyleData(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          border: Border(
                              top: BorderSide(color: primaryColor),
                              bottom: BorderSide(color: primaryColor),
                              left: BorderSide(color: primaryColor),
                              right: BorderSide(color: primaryColor))),
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      height: 40,
                      width: 200,
                    ),
                    dropdownStyleData: DropdownStyleData(
                      maxHeight: MediaQuery.of(context).size.height / 2,
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
                          validator: (value) {
                            if (ref.watch(stacksProvider) == null) {
                              return 'Please select a stack';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 8,
                            ),
                            hintText: 'Search for Stack...',
                            hintStyle: const TextStyle(fontSize: 12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      searchMatchFn: (item, searchValue) {
                        return item.value?.stackNumber
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
          loading: () => TextFormField());

  qualityLayout(String commodityId, WidgetRef ref, BuildContext context) =>
      ref.watch(auditQualityParamsProvider(commodityId: commodityId)).when(
          data: (commodityData) {
            controllerList.clear();
            paramsList.clear();
            commodityData.dataArray?.forEach((element) {
              var controller = TextEditingController();
              var textFormField = TextFormField();
              paramsList.add(textFormField);
              controllerList.add(controller);
            });
            return Column(
              children: [
                Column(
                    children: List.generate(
                        commodityData.dataArray?.length ?? 0, (index) {
                  return Padding(
                    padding: Pad(top: 10, bottom: 10),
                    child: TextFormField(
                        controller: controllerList[index],
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select ${commodityData.dataArray?[index].name ?? ""}';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            labelText:
                                '${commodityData.dataArray?[index].name}',
                            contentPadding:
                                const Pad(top: 0, bottom: 0, left: 10),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)))),
                  );
                })),
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
                      showLoaderDialog(context);

                      List<QVMOdel> qvList = [];
                      for (int i = 0;
                          i < commodityData.dataArray!.length;
                          i++) {
                        qvList.add(QVMOdel("${commodityData.dataArray![i].id}",
                            controllerList[i].text));
                      }
                      var model = AuditQvRequestModel(
                          "${ref.watch(terminalProvider)?.id}",
                          "${ref.watch(stacksProvider)?.commodityId}",
                          "${ref.watch(stacksProvider)?.stackNumber}",
                          qvList);
                      ref
                          .watch(postAuditQualityProvider(model: model).future)
                          .then((value) {
                        hideLoaderDialog(context);
                        if (value['status'].toString() == "1") {
                          context.pop();
                        }
                        Fluttertoast.showToast(msg: value['message']);
                      }).onError((e, s) {
                        hideLoaderDialog(context);
                      });
                    }
                  },
                  child:  Text(
                    "Submit",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            );
          },
          error: (e, s) => Container(),
          loading: () => loader(context));
}
