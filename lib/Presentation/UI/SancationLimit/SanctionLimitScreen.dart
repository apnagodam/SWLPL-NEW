// ignore_for_file: deprecated_member_use, unused_catch_stack, must_be_immutable
import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:emp_apnagodam/Domain/SanctionLimit/SanctionLimitService.dart';
import 'package:emp_apnagodam/Presentation/Constants/ColorConstant.dart';
import 'package:emp_apnagodam/Presentation/Widgets/widgets.dart';
import 'package:emp_apnagodam/Presentation/utils/DialogUtils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SancationLimitScreen extends ConsumerStatefulWidget {
  SancationLimitScreen({
    super.key,
  });

  @override
  ConsumerState<SancationLimitScreen> createState() => _CreateTruckBookState();
}

class _CreateTruckBookState extends ConsumerState<SancationLimitScreen> {
  TextEditingController reasonController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  String? _chosenValue;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Sancation Limit'),
        ),
        body: RefreshIndicator.adaptive(
            child: ListView(
              children: [
                ref.watch(sanctionLimitListProvider).when(
                    data: (sancationList) => ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: sancationList.data?.length ?? 0,
                          itemBuilder: (context, index) {
                            return Container(
                                margin: Pad(all: 10),
                                decoration: BoxDecoration(
                                    border: Border.all(color: primaryColor),
                                    borderRadius: BorderRadius.circular(10)),
                                child: ColumnSuper(
                                    alignment: Alignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            width: 100,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text('User:',
                                                    textAlign: TextAlign.start,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 3,
                                                    style: TextStyle(
                                                        fontSize:
                                                            Adaptive.sp(14),
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w700)),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text('Sanction Id :',
                                                    textAlign: TextAlign.start,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 3,
                                                    style: TextStyle(
                                                        fontSize:
                                                            Adaptive.sp(14),
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w700)),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text('Status :',
                                                    textAlign: TextAlign.start,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 3,
                                                    style: TextStyle(
                                                        fontSize:
                                                            Adaptive.sp(14),
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w700)),
                                              ],
                                            ),
                                            decoration: BoxDecoration(
                                                color: primaryColorDark,
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(9))),
                                            padding: EdgeInsets.all(10),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    '${sancationList.data?[index].userName}',
                                                    textAlign: TextAlign.start,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 2,
                                                    style: TextStyle(
                                                        fontSize:
                                                            Adaptive.sp(14),
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w700)),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  '${sancationList.data?[index].sanctionId}',
                                                  textAlign: TextAlign.start,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 3,
                                                  // style: TextStyle(
                                                  //     fontSize:
                                                  //         Adaptive.sp(14),
                                                  //     color: Colors.black,
                                                  //     fontWeight:
                                                  //         FontWeight.w700)
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  '${sancationList.data?[index].status}',
                                                  textAlign: TextAlign.start,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 3,
                                                  // style: TextStyle(
                                                  //     fontSize:
                                                  //         Adaptive.sp(14),
                                                  //     color: Colors.black,
                                                  //     fontWeight:
                                                  //         FontWeight.w700)
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        color: primaryColorDark,
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  'Requested Amount',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: Adaptive.sp(14),
                                                      fontWeight:
                                                          FontWeight.w800),
                                                ),
                                              ),
                                              Container(
                                                height: 50,
                                                color: Colors.white,
                                                width: 1,
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: Pad(all: 10),
                                                  child: Text(
                                                    'Approved Amount',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize:
                                                            Adaptive.sp(14),
                                                        fontWeight:
                                                            FontWeight.w800),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: 50,
                                                color: Colors.white,
                                                width: 1,
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: Pad(all: 10),
                                                  child: Text(
                                                    'Document Verification',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize:
                                                            Adaptive.sp(14),
                                                        fontWeight:
                                                            FontWeight.w800),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: 50,
                                                color: Colors.white,
                                                width: 1,
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: Pad(all: 10),
                                                  child: Text(
                                                    'Bank',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize:
                                                            Adaptive.sp(14),
                                                        fontWeight:
                                                            FontWeight.w800),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                              ),
                                            ]),
                                      ),
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                '${sancationList.data?[index].requestedAmount}',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: Adaptive.sp(14),
                                                    fontWeight:
                                                        FontWeight.w800),
                                              ),
                                            ),
                                            Container(
                                              height: 50,
                                              color: primaryColorDark,
                                              width: 1,
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: Pad(all: 10),
                                                child: Text(
                                                  '${sancationList.data?[index].approvedAmount}',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: Adaptive.sp(14),
                                                      fontWeight:
                                                          FontWeight.w800),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              height: 50,
                                              color: primaryColorDark,
                                              width: 1,
                                            ),
                                            Expanded(
                                              child: Text(
                                                '${sancationList.data?[index].docVerification}',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: Adaptive.sp(14),
                                                    fontWeight:
                                                        FontWeight.w800),
                                              ),
                                            ),
                                            Container(
                                              height: 50,
                                              color: primaryColorDark,
                                              width: 1,
                                            ),
                                            Expanded(
                                              child: InkWell(
                                                onTap: () {
                                                  showDialog(
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return AlertDialog(
                                                            backgroundColor:
                                                                Colors.white,
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12.0),
                                                            ),
                                                            title: ColumnSuper(
                                                                children: [
                                                                  Text(
                                                                    'Bank : ${sancationList.data?[index].bankName}',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                  ),
                                                                  Divider(),
                                                                  Text(
                                                                    'Interest rate(%) : ${sancationList.data?[index].interestRate}',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                  ),
                                                                  Divider(),
                                                                  Text(
                                                                    'PF (%) : ${sancationList.data?[index].pf}',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                  ),
                                                                  Divider(),
                                                                  Text(
                                                                    'LTR (%) : ${sancationList.data?[index].ltr}',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                  ),
                                                                ]));
                                                      });
                                                },
                                                child: Text(
                                                  'View',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: primaryColorDark,
                                                      fontSize: Adaptive.sp(14),
                                                      fontWeight:
                                                          FontWeight.w800),
                                                ),
                                              ),
                                            ),
                                          ]),
                                      Divider(
                                        color: primaryColorDark,
                                        height: 2,
                                      ),
                                      if (sancationList.data?[index].action ==
                                          1)
                                        Row(
                                          children: [
                                            Expanded(
                                                child: InkWell(
                                              onTap: () {
                                                showDialog(
                                                    context: context,
                                                    builder: (dialogContext) =>
                                                        showConfirmAlertDialog(
                                                            context,
                                                            Form(
                                                                key: formKey,
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  children: [
                                                                    ElevarmTextInputField(
                                                                      label:
                                                                          'Amount',
                                                                      hintText:
                                                                          '',
                                                                      helperText:
                                                                          'approve amount',
                                                                      suffixIconAssetName:
                                                                          Icons
                                                                              .money,
                                                                      onTapSuffix:
                                                                          null,
                                                                      errorText:
                                                                          null,
                                                                      enabled:
                                                                          true,
                                                                      controller:
                                                                          amountController,
                                                                      validator:
                                                                          (value) {
                                                                        if (value ==
                                                                                null ||
                                                                            value.isEmpty) {
                                                                          return "This field cant be empty";
                                                                        } else {
                                                                          return null;
                                                                        }
                                                                      },
                                                                      isRequired:
                                                                          true,
                                                                      keyboardType:
                                                                          TextInputType
                                                                              .name,
                                                                    ),
                                                                    ElevarmTextInputField(
                                                                      label:
                                                                          'Approve Notes',
                                                                      hintText:
                                                                          '',
                                                                      helperText:
                                                                          'notes for the approve amount',
                                                                      suffixIconAssetName:
                                                                          Icons
                                                                              .money,
                                                                      onTapSuffix:
                                                                          null,
                                                                      errorText:
                                                                          null,
                                                                      enabled:
                                                                          true,
                                                                      maxLines:
                                                                          5,
                                                                      controller:
                                                                          reasonController,
                                                                      validator:
                                                                          (value) {
                                                                        if (value ==
                                                                                null ||
                                                                            value.isEmpty) {
                                                                          return "This field cant be empty";
                                                                        } else {
                                                                          return null;
                                                                        }
                                                                      },
                                                                      isRequired:
                                                                          true,
                                                                      keyboardType:
                                                                          TextInputType
                                                                              .name,
                                                                    ),
                                                                  ],
                                                                )),
                                                            "Approve",
                                                            approve: () {
                                                          if (formKey
                                                              .currentState!
                                                              .validate()) {
                                                            ref
                                                                .watch(
                                                                    sanctionLimitApproveProvider(
                                                              amount:
                                                                  amountController
                                                                      .text
                                                                      .toString(),
                                                              id: "${sancationList.data?[index].id}",
                                                              notes:
                                                                  reasonController
                                                                      .text
                                                                      .toString(),
                                                            ).future)
                                                                .then((value) {
                                                              hideLoaderDialog(
                                                                  context);
                                                              Fluttertoast.showToast(
                                                                  msg: value[
                                                                      'message']);
                                                              Navigator.pop;
                                                              amountController
                                                                  .clear();
                                                              reasonController
                                                                  .clear();
                                                              ref.invalidate(
                                                                  sanctionLimitListProvider);
                                                            }).onError((e, s) {
                                                              hideLoaderDialog(
                                                                  context);
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            });
                                                          }
                                                        }, reject: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        }));
                                              },
                                              child: Container(
                                                child: Center(
                                                  child: Text(
                                                    'Approve',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  ),
                                                ),
                                                padding: EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                    color: primaryColorDark,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    9))),
                                              ),
                                            )),
                                            Expanded(
                                                child: InkWell(
                                              onTap: () {
                                                showDialog(
                                                    context: context,
                                                    builder: (dialogContext) =>
                                                        showConfirmAlertDialog(
                                                            context,
                                                            Form(
                                                                key: formKey,
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  children: [
                                                                    ElevarmTextInputField(
                                                                      label:
                                                                          'Reject Notes',
                                                                      hintText:
                                                                          '',
                                                                      helperText:
                                                                          'notes for the rejecting amount',
                                                                      suffixIconAssetName:
                                                                          Icons
                                                                              .money,
                                                                      onTapSuffix:
                                                                          null,
                                                                      errorText:
                                                                          null,
                                                                      enabled:
                                                                          true,
                                                                      maxLines:
                                                                          5,
                                                                      controller:
                                                                          reasonController,
                                                                      validator:
                                                                          (value) {
                                                                        if (value ==
                                                                                null ||
                                                                            value.isEmpty) {
                                                                          return "This field cant be empty";
                                                                        } else {
                                                                          return null;
                                                                        }
                                                                      },
                                                                      isRequired:
                                                                          true,
                                                                      keyboardType:
                                                                          TextInputType
                                                                              .name,
                                                                    ),
                                                                  ],
                                                                )),
                                                            "Reject",
                                                            approve: () {
                                                          if (formKey
                                                              .currentState!
                                                              .validate()) {
                                                            ref
                                                                .watch(
                                                                    sanctionLimitRejectProvider(
                                                              id: "${sancationList.data?[index].id}",
                                                              notes:
                                                                  reasonController
                                                                      .text
                                                                      .toString(),
                                                            ).future)
                                                                .then((value) {
                                                              hideLoaderDialog(
                                                                  context);
                                                              Fluttertoast.showToast(
                                                                  msg: value[
                                                                      'message']);
                                                              Navigator.pop;
                                                              reasonController
                                                                  .clear();
                                                              ref.invalidate(
                                                                  sanctionLimitListProvider);
                                                            }).onError((e, s) {
                                                              hideLoaderDialog(
                                                                  context);
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            });
                                                          }
                                                        }, reject: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        }));
                                              },
                                              child: Container(
                                                child: Center(
                                                  child: Text(
                                                    'Reject',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  ),
                                                ),
                                                padding: EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                    color: const Color.fromARGB(
                                                        255, 213, 16, 2),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            bottomRight:
                                                                Radius.circular(
                                                                    9))),
                                              ),
                                            ))
                                          ],
                                        )
                                      else if (sancationList
                                              .data?[index].action ==
                                          2)
                                        InkWell(
                                          onTap: () {
                                            showDialog(
                                                context: context,
                                                builder:
                                                    (dialogContext) =>
                                                        showConfirmAlertDialog(
                                                            context,
                                                            Form(
                                                                key: formKey,
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  children: [
                                                                    // ElevarmTextInputField(

                                                                    //   label:
                                                                    //       'Email',
                                                                    //   hintText:
                                                                    //       'olivia@untitledui.com',
                                                                    //   helperText:
                                                                    //       'This is a hint text to help user.',
                                                                    //   onTapSuffix:
                                                                    //       null,
                                                                    //   errorText:
                                                                    //       null,
                                                                    //   enabled: true,
                                                                    // )
                                                                    Align(
                                                                      alignment:
                                                                          Alignment
                                                                              .topLeft,
                                                                      child: Text(
                                                                          'Sanction Letter'),
                                                                    ),
                                                                    SizedBox(
                                                                      height: 5,
                                                                    ),
                                                                    Container(
                                                                      padding: EdgeInsets.symmetric(
                                                                          horizontal:
                                                                              5),
                                                                      decoration: BoxDecoration(
                                                                          border:
                                                                              Border.all(color: Colors.grey.shade500),
                                                                          borderRadius: BorderRadius.circular(5)),
                                                                      child:
                                                                          DropdownButton(
                                                                        isExpanded:
                                                                            true,
                                                                        hint: Text(
                                                                            'Yes'),
                                                                        value:
                                                                            _chosenValue,
                                                                        underline:
                                                                            Container(),
                                                                        items: <String>[
                                                                          'Yes'
                                                                        ].map((String
                                                                            value) {
                                                                          return DropdownMenuItem<
                                                                              String>(
                                                                            value:
                                                                                value,
                                                                            child:
                                                                                Text(
                                                                              value,
                                                                              style: TextStyle(fontWeight: FontWeight.w500),
                                                                            ),
                                                                          );
                                                                        }).toList(),
                                                                        onChanged:
                                                                            (value) {},
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          10,
                                                                    ),
                                                                    Align(
                                                                      alignment:
                                                                          Alignment
                                                                              .topLeft,
                                                                      child: Text(
                                                                          'PDC'),
                                                                    ),
                                                                    SizedBox(
                                                                      height: 5,
                                                                    ),
                                                                    Container(
                                                                      padding: EdgeInsets.symmetric(
                                                                          horizontal:
                                                                              5),
                                                                      decoration: BoxDecoration(
                                                                          border:
                                                                              Border.all(color: Colors.grey.shade500),
                                                                          borderRadius: BorderRadius.circular(5)),
                                                                      child:
                                                                          DropdownButton(
                                                                        isExpanded:
                                                                            true,
                                                                        hint: Text(
                                                                            'Yes'),
                                                                        value:
                                                                            _chosenValue,
                                                                        underline:
                                                                            Container(),
                                                                        items: <String>[
                                                                          'Yes'
                                                                        ].map((String
                                                                            value) {
                                                                          return DropdownMenuItem<
                                                                              String>(
                                                                            value:
                                                                                value,
                                                                            child:
                                                                                Text(
                                                                              value,
                                                                              style: TextStyle(fontWeight: FontWeight.w500),
                                                                            ),
                                                                          );
                                                                        }).toList(),
                                                                        onChanged:
                                                                            (value) {},
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          10,
                                                                    ),
                                                                    Align(
                                                                      alignment:
                                                                          Alignment
                                                                              .topLeft,
                                                                      child: Text(
                                                                          'SME2'),
                                                                    ),
                                                                    SizedBox(
                                                                      height: 5,
                                                                    ),
                                                                    Container(
                                                                      padding: EdgeInsets.symmetric(
                                                                          horizontal:
                                                                              5),
                                                                      decoration: BoxDecoration(
                                                                          border:
                                                                              Border.all(color: Colors.grey.shade500),
                                                                          borderRadius: BorderRadius.circular(5)),
                                                                      child:
                                                                          DropdownButton(
                                                                        isExpanded:
                                                                            true,
                                                                        hint: Text(
                                                                            'Yes'),
                                                                        value:
                                                                            _chosenValue,
                                                                        underline:
                                                                            Container(),
                                                                        items: <String>[
                                                                          'Yes'
                                                                        ].map((String
                                                                            value) {
                                                                          return DropdownMenuItem<
                                                                              String>(
                                                                            value:
                                                                                value,
                                                                            child:
                                                                                Text(
                                                                              value,
                                                                              style: TextStyle(fontWeight: FontWeight.w500),
                                                                            ),
                                                                          );
                                                                        }).toList(),
                                                                        onChanged:
                                                                            (value) {},
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          10,
                                                                    ),
                                                                    Align(
                                                                      alignment:
                                                                          Alignment
                                                                              .topLeft,
                                                                      child: Text(
                                                                          'Agreement'),
                                                                    ),
                                                                    SizedBox(
                                                                      height: 5,
                                                                    ),
                                                                    Container(
                                                                      padding: EdgeInsets.symmetric(
                                                                          horizontal:
                                                                              5),
                                                                      decoration: BoxDecoration(
                                                                          border:
                                                                              Border.all(color: Colors.grey.shade500),
                                                                          borderRadius: BorderRadius.circular(5)),
                                                                      child:
                                                                          DropdownButton(
                                                                        isExpanded:
                                                                            true,
                                                                        hint: Text(
                                                                            'Yes'),
                                                                        value:
                                                                            _chosenValue,
                                                                        underline:
                                                                            Container(),
                                                                        items: <String>[
                                                                          'Yes'
                                                                        ].map((String
                                                                            value) {
                                                                          return DropdownMenuItem<
                                                                              String>(
                                                                            value:
                                                                                value,
                                                                            child:
                                                                                Text(
                                                                              value,
                                                                              style: TextStyle(fontWeight: FontWeight.w500),
                                                                            ),
                                                                          );
                                                                        }).toList(),
                                                                        onChanged:
                                                                            (value) {},
                                                                      ),
                                                                    ),
                                                                  ],
                                                                )),
                                                            "Verify Documents",
                                                            approve: () {
                                                          showLoaderDialog(
                                                              context);
                                                          ref
                                                              .watch(sanctionLimitDocumentUpdateProvider(
                                                                      id:
                                                                          '${sancationList.data?[index].id}',
                                                                      agreement:
                                                                          '1',
                                                                      pda: '1',
                                                                      pdc: '1',
                                                                      sabctionLetter:
                                                                          '1')
                                                                  .future)
                                                              .then((value) {
                                                            hideLoaderDialog(
                                                                context);
                                                            Fluttertoast.showToast(
                                                                msg: value[
                                                                    'message']);
                                                            Navigator.of(
                                                                    context)
                                                                .pop();

                                                            ref.invalidate(
                                                                sanctionLimitListProvider);
                                                          }).onError((e, s) {
                                                            hideLoaderDialog(
                                                                context);
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          });
                                                        }, reject: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        }));
                                          },
                                          child: Container(
                                            margin: EdgeInsets.all(5),
                                            child: Center(
                                              child: Text(
                                                'Verify Documents',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                            ),
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                                color: primaryColor,
                                                borderRadius:
                                                    BorderRadius.circular(5)
                                                // only(
                                                //     bottomLeft:
                                                //         Radius.circular(9),
                                                //     bottomRight:
                                                //         Radius.circular(9))
                                                ),
                                          ),
                                        )
                                      else
                                        Column(
                                          children: [
                                            if (sancationList
                                                    .data?[index].action ==
                                                'Rejected')
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 10, bottom: 10),
                                                child: Text(
                                                    '${sancationList.data?[index].action}',
                                                    style: TextStyle(
                                                        color: Colors.red,
                                                        fontWeight:
                                                            FontWeight.w600)),
                                              )
                                            else
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 10, bottom: 10),
                                                child: Text(
                                                  '${sancationList.data?[index].action}',
                                                  style: TextStyle(
                                                      color: primaryColorDark,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ),
                                          ],
                                        ),
                                    ]));
                          },
                        ),
                    error: (e, s) => Container(),
                    loading: () => loader(context))
              ],
            ),
            onRefresh: () => Future(() {
                  ref.invalidate(sanctionLimitListProvider);
                })));
  }
}
