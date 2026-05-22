// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:button_animations/button_animations.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:emp_apnagodam/Data/Models/LabourContractorV1Model.dart';
import 'package:emp_apnagodam/Domain/CaseId/CaseIdService.dart';
import 'package:emp_apnagodam/Domain/Labour/LabourService.dart';
import 'package:emp_apnagodam/Presentation/UI/LabourBook/CreateLabourBook.dart';
import 'package:emp_apnagodam/Presentation/Widgets/widgets.dart';
import 'package:emp_apnagodam/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../Data/Models/CaseRequestModel.dart';
import '../../Constants/ColorConstant.dart';

class CreateCaseId extends ConsumerWidget {
  CreateCaseId({super.key, this.inwardRequestDatum, this.outwardRequestDatum});

  InwardRequestDatum? inwardRequestDatum;
  OutwardRequestDatum? outwardRequestDatum;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Platform.isIOS
          ? iosLayout(context, ref)
          : androidLayout(context, ref),
    );
  }

  var labourTypeProvider =
      StateProvider<LabourType?>((ref) => LabourType.defaultType);

  var labourContractorProvider = StateProvider<LabourDatum?>((ref) => null);
  var labourRateProvider = StateProvider<String?>((ref) => null);
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
          "Create Stack Request",
          style: TextStyle(color: Colors.white),
        ),
      ),
      child: stackLayout(context, ref));

  stackLayout(BuildContext context, WidgetRef ref) => Padding(
        padding: Pad(all: 10),
        child: ListView(
          children: [
            SizedBox(
              height: 10,
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              initialValue: inwardRequestDatum == null
                  ? outwardRequestDatum?.terminalName
                  : inwardRequestDatum?.terminalName,
              readOnly: true,
              decoration: InputDecoration(
                  label: Text('Terminal Name'),
                  contentPadding: const Pad(top: 0, bottom: 0, left: 10),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8))),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              initialValue: inwardRequestDatum == null
                  ? outwardRequestDatum?.inOutType
                  : inwardRequestDatum?.inOutType,
              readOnly: true,
              decoration: InputDecoration(
                  label: Text('In/Out'),
                  contentPadding: const Pad(top: 0, bottom: 0, left: 10),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8))),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              initialValue: inwardRequestDatum == null
                  ? outwardRequestDatum?.userName
                  : inwardRequestDatum?.userName,
              readOnly: true,
              decoration: InputDecoration(
                  label: Text('Customer'),
                  contentPadding: const Pad(top: 0, bottom: 0, left: 10),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8))),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              initialValue: inwardRequestDatum == null
                  ? outwardRequestDatum?.commodity
                  : inwardRequestDatum?.commodity,
              readOnly: true,
              decoration: InputDecoration(
                  label: Text('Commodity Type'),
                  contentPadding: const Pad(top: 0, bottom: 0, left: 10),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8))),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              initialValue: inwardRequestDatum == null
                  ? outwardRequestDatum?.stackNumber
                  : inwardRequestDatum?.stackNumber,
              readOnly: true,
              decoration: InputDecoration(
                  label: Text('Stack No'),
                  contentPadding: const Pad(top: 0, bottom: 0, left: 10),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8))),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              initialValue: inwardRequestDatum == null
                  ? outwardRequestDatum?.wgtInQtl
                  : inwardRequestDatum?.wgtInQtl,
              readOnly: true,
              decoration: InputDecoration(
                  label: Text('Weight(Qtl)'),
                  contentPadding: const Pad(top: 0, bottom: 0, left: 10),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8))),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              initialValue: inwardRequestDatum == null
                  ? outwardRequestDatum?.vehicleNumber
                  : inwardRequestDatum?.vehicleNumber,
              readOnly: true,
              decoration: InputDecoration(
                  label: Text('Vehicle/Truck No.'),
                  contentPadding: const Pad(top: 0, bottom: 0, left: 10),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8))),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              initialValue: inwardRequestDatum == null
                  ? outwardRequestDatum?.driverNumber
                  : inwardRequestDatum?.driverNumber,
              readOnly: true,
              decoration: InputDecoration(
                  label: Text('Driver Mobile No.'),
                  contentPadding: const Pad(top: 0, bottom: 0, left: 10),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8))),
            ),
            SizedBox(
              height: 10,
            ),
            // Visibility(
            //   visible: !ref.watch(isOtpVerified) && !ref.watch(isOtpSent),
            //   child: AnimatedButton(
            //     height: 50,
            //     color: primaryColorDark,
            //     width: MediaQuery.of(context).size.width / 1.2,
            //     child: Text(
            //       "Verify Driver Otp",
            //       textAlign: TextAlign.center,
            //       style: TextStyle(
            //           color: Colors.white,
            //           fontSize: Adaptive.sp(14),
            //           fontWeight: FontWeight.w800),
            //     ),
            //     isOutline: true,
            //     isMultiColor: true,
            //     colors: [primaryColorDark, primaryColorDark],
            //     borderWidth: 1,
            //     onTap: () {
            //       showLoaderDialog(context);
            //       ref
            //           .watch(verifyDriverOtpProvider(
            //                   phone: inwardRequestDatum == null
            //                       ? outwardRequestDatum?.driverNumber
            //                       : inwardRequestDatum?.driverNumber,
            //                   stackId:
            //                       "${inwardRequestDatum == null ? outwardRequestDatum?.stackId : inwardRequestDatum?.stackId}",
            //                   type: inwardRequestDatum == null ? "OUT" : "IN")
            //               .future)
            //           .then((value) {
            //         hideLoaderDialog(context);
            //         if (value.status.toString() == "1") {
            //           ref.watch(isOtpSent.notifier).state = true;
            //         }
            //       }).onError((e, s) {
            //         hideLoaderDialog(context);
            //       });
            //     },
            //   ),
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            // Visibility(
            //     visible: ref.watch(isOtpSent),
            //     child: SizedBox(
            //       width: MediaQuery.of(context).size.width,
            //       child: Pinput(
            //         autofocus: true,
            //         length: 6,
            //         onCompleted: (pin) async {
            //           showLoaderDialog(context);
            //           ref
            //               .watch(verifyDriverOtpProvider(
            //                       phone: inwardRequestDatum == null
            //                           ? outwardRequestDatum?.driverNumber
            //                           : inwardRequestDatum?.driverNumber,
            //                       stackId:
            //                           "${inwardRequestDatum == null ? outwardRequestDatum?.stackId : inwardRequestDatum?.stackId}",
            //                       type:
            //                           inwardRequestDatum == null ? "OUT" : "IN",
            //                       otp: pin)
            //                   .future)
            //               .then((value) {
            //             hideLoaderDialog(context);
            //             if (value.status.toString() == "1") {
            //               ref.watch(isOtpVerified.notifier).state = true;
            //               ref.watch(isOtpSent.notifier).state = true;
            //             }
            //           }).onError((e, s) {
            //             hideLoaderDialog(context);
            //           });
            //         },
            //       ),
            //     )),
            // SizedBox(
            //   height: 10,
            // ),

            labourLayout(
                context,
                ref,
                "${inwardRequestDatum == null ? outwardRequestDatum?.terminalId : inwardRequestDatum?.terminalId}",
                "${inwardRequestDatum == null ? outwardRequestDatum?.commodityId : inwardRequestDatum?.commodityId}"),
            IntrinsicWidth(
              child: Visibility(
                visible: true,
                child: AnimatedButton(
                  height: 50,
                  color: primaryColorDark,
                  child: Text(
                    "Create Case Id",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: Adaptive.sp(14),
                        fontWeight: FontWeight.w800),
                  ),
                  isOutline: true,
                  isMultiColor: true,
                  colors: [primaryColorDark, primaryColorDark],
                  borderWidth: 1,
                  onTap: () {
                    if (ref.watch(labourTypeProvider) ==
                        LabourType.defaultType) {
                      Fluttertoast.showToast(msg: "Please select Labour type");
                    } else if (ref.watch(labourTypeProvider) ==
                            LabourType.companyLabour &&
                        ref.watch(labourContractorProvider) == null) {
                      Fluttertoast.showToast(msg: "Please select Labour type");
                    } else {
                      showLoaderDialog(context);
                      ref
                          .watch(createCaseIdProvider(
                        terminalId:
                            "${inwardRequestDatum == null ? outwardRequestDatum?.terminalId : inwardRequestDatum?.terminalId}",
                        inOut: inwardRequestDatum == null ? "OUT" : "IN",
                        userId:
                            "${inwardRequestDatum == null ? outwardRequestDatum?.userNumber : inwardRequestDatum?.userNumber}",
                        commodityId:
                            "${inwardRequestDatum == null ? outwardRequestDatum?.commodityId : inwardRequestDatum?.commodityId}",
                        stackId:
                            "${inwardRequestDatum == null ? outwardRequestDatum?.stackId : inwardRequestDatum?.stackId}",
                        weight:
                            "${inwardRequestDatum == null ? outwardRequestDatum?.wgtInKg : inwardRequestDatum?.wgtInKg}",
                        quantitiy:
                            "${inwardRequestDatum == null ? outwardRequestDatum?.wgtInQtl : inwardRequestDatum?.wgtInQtl}",
                        vehicleNo:
                            '${inwardRequestDatum == null ? outwardRequestDatum?.vehicleNumber : inwardRequestDatum?.vehicleNumber}',
                        driverNumber:
                            '${inwardRequestDatum == null ? outwardRequestDatum?.driverNumber : inwardRequestDatum?.driverNumber}',
                        contractorId:
                        ref.watch(labourTypeProvider) ==
                            LabourType.clientLabour?"1":    ref.watch(labourContractorProvider)?.id.toString(),
                        contractorName: ref
                                .watch(labourContractorProvider)
                                ?.contractorName ??
                            "",
                        contractorPhone: ref
                                .watch(labourContractorProvider)
                                ?.contractorPhone ??
                            "",
                        labourRate: ref.watch(labourRateProvider),
                      ).future)
                          .then((value) {
                        hideLoaderDialog(context);
                        if (value['status'].toString() == "1") {
                          ref.invalidate(caseIdProvider);
                          ref.invalidate(caseRequestsProvider);
                          ref.watch(goRouterProvider).pop();
                        }
                      }).onError((e, s) {
                        hideLoaderDialog(context);
                      });
                    }
                  },
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      );

  androidLayout(BuildContext context, WidgetRef ref) => Scaffold(
      appBar: AppBar(
        title: Text('Create Case Id'),
      ),
      body: stackLayout(context, ref));

  labourLayout(BuildContext context, WidgetRef ref, String terminalId,
          String commodityId) =>
      ref
          .watch(labourContractorV1Provider(
              terminalId: terminalId, commodityId: commodityId))
          .when(
              data: (data) => data.status.toString() == "3"
                  ? logoutWidget('Session Expire please login again!', context)
                  : Padding(
                      padding: const Pad(all: 0),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
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
                                        value:
                                            ref.watch(labourContractorProvider),
                                        onChanged: (value) {
                                          ref
                                              .watch(labourContractorProvider
                                                  .notifier)
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
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 16),
                                          height: 40,
                                          width: 200,
                                        ),
                                        dropdownStyleData:
                                            const DropdownStyleData(
                                          maxHeight: 200,
                                        ),
                                        menuItemStyleData:
                                            const MenuItemStyleData(
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
                                                hintStyle: const TextStyle(
                                                    fontSize: 12),
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
                                  if (ref.watch(labourContractorProvider) !=
                                      null)
                                    ref
                                        .watch(labourContractorRateProvider(
                                            commodityId: "${commodityId}",
                                            contractorId:
                                                "${ref.watch(labourContractorProvider)?.id}"))
                                        .when(
                                            data: (rateData) {
                                              Future.delayed(Duration(
                                                      milliseconds: 500))
                                                  .then((value) {
                                                ref
                                                        .watch(
                                                            labourRateProvider
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
                                                        BorderRadius.circular(
                                                            5)),
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
                        ],
                      ),
                    ),
              error: (e, s) => Container(
                    child: Text(e.toString()),
                  ),
              loading: () => loader(context));

  var isOtpVerified = StateProvider((ref) => false);
  var isOtpSent = StateProvider((ref) => false);
}
