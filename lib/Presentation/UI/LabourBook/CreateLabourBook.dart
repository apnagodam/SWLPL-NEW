// ignore_for_file: must_be_immutable


import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:button_animations/button_animations.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:emp_apnagodam/Data/Models/LabourContractorV1Model.dart';
import 'package:emp_apnagodam/Domain/CaseId/CaseIdService.dart';
import 'package:emp_apnagodam/Domain/Labour/LabourService.dart';
import 'package:emp_apnagodam/Presentation/Widgets/widgets.dart';
import 'package:emp_apnagodam/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Constants/ColorConstant.dart';

class Createlabourbook extends ConsumerWidget {
  Createlabourbook(
      {super.key,
      required this.caseId,
      required this.customerName,
      required this.terminalId,
      required this.commodityId});

  String? caseId;
  String? customerName;
  String? terminalId;
  String? commodityId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: androidLayout(context, ref),
    );
  }

  iosLayout(BuildContext context, WidgetRef ref) => CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: primaryColor,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              CupertinoIcons.back,
              color: Colors.white,
            )),
        middle: const Text(
          "Labour Book",
          style: TextStyle(color: Colors.white),
        ),
      ),
      child: labourLayout(context, ref));

  labourLayout(BuildContext context, WidgetRef ref) => ref
      .watch(labourContractorV1Provider(
          terminalId: terminalId, commodityId: commodityId))
      .when(
          data: (data) => data.status.toString() == "3"
              ? logoutWidget('Session Expire please login again!', context)
              : Padding(
                  padding: const Pad(all: 10),
                  child: ListView(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Text(
                          caseId ?? "",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: Adaptive.sp(17)),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(customerName ?? "",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: Adaptive.sp(17))),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        child: DropdownMenu<LabourType>(
                          expandedInsets: EdgeInsets.symmetric(
                              vertical: MediaQuery.of(context).size.width),
                          initialSelection: LabourType.defaultType,
                          label: const Text('Labour type'),
                          onSelected: (LabourType? labour) {
                            ref.watch(labourTypeProvider.notifier).state =
                                labour;
                          },
                          dropdownMenuEntries: LabourType.values
                              .map<DropdownMenuEntry<LabourType>>(
                                  (LabourType labour) {
                            return DropdownMenuEntry<LabourType>(
                              value: labour,
                              label: labour.title,
                              enabled: labour.type != 'Grey',
                            );
                          }).toList(),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Visibility(
                          visible: ref.watch(labourTypeProvider) ==
                              LabourType.companyLabour,
                          child: Column(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton2<LabourDatum>(
                                    isExpanded: true,
                                    hint: Text(
                                      'Select Contractor',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Theme.of(context).hintColor,
                                      ),
                                    ),
                                    items: data.data!
                                        .map((item) => DropdownMenuItem(
                                              value: item,
                                              child: Text(
                                                "${item.contractorName}",
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ))
                                        .toList(),
                                    value: ref.watch(labourContractorProvider),
                                    onChanged: (value) {
                                      ref
                                          .watch(
                                              labourContractorProvider.notifier)
                                          .state = value;
                                    },
                                    buttonStyleData: const ButtonStyleData(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5)),
                                          border: Border(
                                              top: BorderSide(
                                                  color: primaryColor),
                                              bottom: BorderSide(
                                                  color: primaryColor),
                                              left: BorderSide(
                                                  color: primaryColor),
                                              right: BorderSide(
                                                  color: primaryColor))),
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 16),
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
                                          decoration: InputDecoration(
                                            isDense: true,
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                              horizontal: 10,
                                              vertical: 8,
                                            ),
                                            hintText:
                                                'Search for Contractor...',
                                            hintStyle:
                                                const TextStyle(fontSize: 12),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          ),
                                        ),
                                      ),
                                      searchMatchFn: (item, searchValue) {
                                        return item.value?.contractorName
                                                ?.toLowerCase()
                                                .contains(searchValue) ??
                                            false;
                                      },
                                    ),
                                    //This to clear the search value when you close the menu
                                    onMenuStateChange: (isOpen) {
                                      if (!isOpen) {}
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              if (ref.watch(labourContractorProvider) != null)
                                ref
                                    .watch(labourContractorRateProvider(
                                        commodityId: "${commodityId}",
                                        contractorId:
                                            "${ref.watch(labourContractorProvider)?.id}"))
                                    .when(
                                        data: (rateData) {
                                          Future.delayed(
                                                  Duration(milliseconds: 500))
                                              .then((value) {
                                            ref
                                                    .watch(labourRateProvider
                                                        .notifier)
                                                    .state =
                                                "${rateData.data?.labourRate}";
                                          });
                                          return Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            padding: const Pad(all: 10),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: primaryColor),
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: Text(
                                                "${rateData.data?.labourRate}"),
                                          );
                                        },
                                        error: (e, s) => Container(),
                                        loading: () => loader(context)),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          )),
                      const SizedBox(
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
                          if (ref.watch(labourTypeProvider) ==
                              LabourType.defaultType) {
                            Fluttertoast.showToast(msg: "Please select a type");
                          }
                          if (ref.watch(labourTypeProvider) ==
                              LabourType.clientLabour) {
                            showLoaderDialog(context);

                            ref
                                .watch(uploadLabourProvider(
                                        caseId: caseId.toString(),
                                        contractorId: "1")
                                    .future)
                                .then((value) {
                              hideLoaderDialog(context);
                              if (value['status'].toString() == "1") {
                                ref.invalidate(caseIdProvider);
                                ref.watch(goRouterProvider).pop();
                              }
                              Fluttertoast.showToast(
                                  msg: value['message'].toString());
                            }).onError((error, s) {
                              hideLoaderDialog(context);
                              showErrorDialog(context, error.toString());
                            });
                          }
                          if (ref.watch(labourTypeProvider) ==
                              LabourType.companyLabour) {
                            showLoaderDialog(context);
                            ref
                                .watch(uploadLabourProvider(
                                        caseId: caseId.toString(),
                                        contractorId: ref
                                            .watch(labourContractorProvider)
                                            ?.id
                                            .toString(),
                                        contractorName: ref
                                                .watch(labourContractorProvider)
                                                ?.contractorName ??
                                            "",
                                        contractorPhone: ref
                                                .watch(labourContractorProvider)
                                                ?.contractorPhone ??
                                            "",
                                        labourRate:
                                            ref.watch(labourRateProvider),
                                        notes: "")
                                    .future)
                                .then((value) {
                              hideLoaderDialog(context);
                              if (value['status'].toString() == "1") {
                                ref.invalidate(caseIdProvider);
                                ref.watch(goRouterProvider).pop();
                              }
                            }).onError((error, s) {
                              hideLoaderDialog(context);
                            });
                          }
                        },
                        child: const Text(
                          "Submit",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
          error: (e, s) => Container(
                child: Text(e.toString()),
              ),
          loading: () => loader(context));

  androidLayout(BuildContext context, WidgetRef ref) => Scaffold(
      appBar: AppBar(
        title: const Text("Labour Book"),
      ),
      body: labourLayout(context, ref));

  var labourTypeProvider =
      StateProvider<LabourType?>((ref) => LabourType.defaultType);

  var labourContractorProvider = StateProvider<LabourDatum?>((ref) => null);
  var labourRateProvider = StateProvider<String?>((ref) => null);
}

enum LabourType {
  defaultType('Select Labour Type', "Select Labour Type"),
  clientLabour('Client Labour', "Client Labour"),
  companyLabour('Company Labour', 'Company Labour');

  const LabourType(this.type, this.title);

  final String type;
  final String title;
}
