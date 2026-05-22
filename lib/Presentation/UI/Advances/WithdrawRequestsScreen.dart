// ignore_for_file: deprecated_member_use

import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:emp_apnagodam/Domain/Advance/AdvanceService.dart';
import 'package:emp_apnagodam/Domain/Attendance/AttendanceService.dart';
import 'package:emp_apnagodam/Presentation/Constants/ColorConstant.dart';
import 'package:emp_apnagodam/Presentation/Widgets/widgets.dart';
import 'package:emp_apnagodam/Presentation/utils/DialogUtils.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Withdrawrequestsscreen extends ConsumerWidget {
  Withdrawrequestsscreen({super.key});
  final formKey = GlobalKey<FormState>();
  final approvalAmount = TextEditingController();
  final rejectAmount = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Withdraw Request"),
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(70),
            child: Padding(
              padding: Pad(all: 10),
              child: Container(
                color: primaryColorDark,
                padding: const Pad(all: 10),
                child: IntrinsicHeight(
                  child: Row(children: [
                    Expanded(
                        child: Text(
                      "Date",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: Adaptive.sp(14)),
                    )),
                    const VerticalDivider(),
                    Expanded(
                        child: Text(
                      "Employee",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: Adaptive.sp(14)),
                    )),
                    const VerticalDivider(),
                    Expanded(
                        child: Text(
                      "Requested Amount",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: Adaptive.sp(14)),
                    )),
                    const VerticalDivider(),
                    Expanded(
                        child: Text(
                      "Purpose",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: Adaptive.sp(14)),
                    )),
                  ]),
                ),
              ),
            )),
      ),
      body: ListView(
        children: [withdrawRequestsLayout(ref, context)],
      ),
    );
  }

  withdrawRequestsLayout(WidgetRef ref, BuildContext context) =>
      ref.watch(withdrawRequestsProvider).when(
          data: (data) {
            return ColumnSuper(
              children: [
                ListView.builder(
                  itemCount: data.data?.length ?? 0,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => Container(
                    color: index % 2 == 0
                        ? Colors.grey.withOpacity(0.2)
                        : Colors.white,
                    padding: const Pad(all: 10),
                    child: IntrinsicHeight(
                      child: Row(children: [
                        Expanded(
                            child: Text.rich(
                          TextSpan(
                            text:
                                "${DateTime.parse((data.data?[index].createdAt).toString()).day}/${DateTime.parse((data.data?[index].createdAt).toString()).month}/${DateTime.parse((data.data?[index].createdAt).toString()).year}",
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                TextEditingController reasonController =
                                    TextEditingController();

                                showDialog(
                                    context: context,
                                    builder: (context) => showCustomAlertDialog(
                                            context,
                                            ColumnSuper(children: [
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: Text('Name:',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.black,
                                                            fontSize:
                                                                Adaptive.sp(
                                                                    14))),
                                                  ),
                                                  Expanded(
                                                      child: Text(
                                                    "${data.data?[index].firstName}(${data.data?[index].empId})",
                                                    textAlign: TextAlign.end,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black,
                                                        fontSize:
                                                            Adaptive.sp(14)),
                                                  )),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                        'Requested Amount: ',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.black,
                                                            fontSize:
                                                                Adaptive.sp(
                                                                    14))),
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      "${data.data?[index].requestedAmount}",
                                                      textAlign: TextAlign.end,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.black,
                                                          fontSize:
                                                              Adaptive.sp(14)),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: Text('Purpose: ',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.black,
                                                            fontSize:
                                                                Adaptive.sp(
                                                                    14))),
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      "${data.data?[index].notes}",
                                                      textAlign: TextAlign.end,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.black,
                                                          fontSize:
                                                              Adaptive.sp(14)),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: Text('Date: ',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.black,
                                                            fontSize:
                                                                Adaptive.sp(
                                                                    14))),
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      "${DateTime.parse((data.data?[index].createdAt).toString()).day}/${DateTime.parse((data.data?[index].createdAt).toString()).month}/${DateTime.parse((data.data?[index].createdAt).toString()).year}",
                                                      textAlign: TextAlign.end,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.black,
                                                          fontSize:
                                                              Adaptive.sp(14)),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                            ]),
                                            "Request Details", approve: () {
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
                                                                    'Approval Amount',
                                                                hintText: '',
                                                                helperText:
                                                                    'Amount to be approved',
                                                                suffixIconAssetName:
                                                                    Icons.money,
                                                                onTapSuffix:
                                                                    null,
                                                                errorText: null,
                                                                enabled: true,
                                                                controller:
                                                                    approvalAmount,
                                                                validator:
                                                                    (value) {
                                                                  if (value ==
                                                                          null ||
                                                                      value
                                                                          .isEmpty) {
                                                                    return "This field cant be empty";
                                                                  } else {
                                                                    return null;
                                                                  }
                                                                },
                                                                isRequired:
                                                                    true,
                                                                keyboardType:
                                                                    TextInputType
                                                                        .number,
                                                              ),
                                                              ElevarmTextInputField(
                                                                label:
                                                                    'Approval Notes',
                                                                hintText: '',
                                                                helperText:
                                                                    'notes for the approving amount',
                                                                suffixIconAssetName:
                                                                    Icons.money,
                                                                onTapSuffix:
                                                                    null,
                                                                errorText: null,
                                                                enabled: true,
                                                                maxLines: 5,
                                                                controller:
                                                                    reasonController,
                                                                validator:
                                                                    (value) {
                                                                  if (value ==
                                                                          null ||
                                                                      value
                                                                          .isEmpty) {
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
                                                      "Approve", approve: () {
                                                    if (formKey.currentState!
                                                        .validate()) {
                                                      showLoaderDialog(context);
                                                      ref
                                                          .watch(
                                                              approveWithdrawRequestProvider(
                                                        amount: approvalAmount
                                                            .text
                                                            .toString(),
                                                        id: "${data.data?[index].id}",
                                                        notes: reasonController
                                                            .text
                                                            .toString(),
                                                      ).future)
                                                          .then((value) {
                                                        hideLoaderDialog(
                                                            context);
                                                        Fluttertoast.showToast(
                                                            msg: value[
                                                                'message']);
                                                        Navigator.of(context)
                                                            .pop();
                                                        Navigator.of(
                                                                dialogContext)
                                                            .pop();
                                                        ref.invalidate(
                                                            attendanceRequestsInProvider);
                                                      }).onError((e, s) {
                                                        hideLoaderDialog(
                                                            context);
                                                        Navigator.of(context)
                                                            .pop();
                                                      });
                                                    }
                                                  }, reject: () {
                                                    Navigator.of(context).pop();
                                                  }));
                                        }, reject: () {
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
                                                                hintText: '',
                                                                helperText:
                                                                    'notes for the rejecting amount',
                                                                suffixIconAssetName:
                                                                    Icons.money,
                                                                onTapSuffix:
                                                                    null,
                                                                errorText: null,
                                                                enabled: true,
                                                                maxLines: 5,
                                                                controller:
                                                                    reasonController,
                                                                validator:
                                                                    (value) {
                                                                  if (value ==
                                                                          null ||
                                                                      value
                                                                          .isEmpty) {
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
                                                      "Reject", approve: () {
                                                    if (formKey.currentState!
                                                        .validate()) {
                                                      showLoaderDialog(context);
                                                      ref
                                                          .watch(
                                                              rejectWithdrawRequestProvider(
                                                        id: "${data.data?[index].id}",
                                                        notes: reasonController
                                                            .text
                                                            .toString(),
                                                      ).future)
                                                          .then((value) {
                                                        Fluttertoast.showToast(
                                                            msg: value[
                                                                'message']);
                                                        hideLoaderDialog(
                                                            context);
                                                        Navigator.of(context)
                                                            .pop();
                                                        Navigator.of(
                                                                dialogContext)
                                                            .pop();
                                                        ref.invalidate(
                                                            attendanceRequestsInProvider);
                                                      }).onError((e, s) {
                                                        hideLoaderDialog(
                                                            context);
                                                        Navigator.of(context)
                                                            .pop();
                                                      });
                                                    }
                                                  }, reject: () {
                                                    Navigator.of(context).pop();
                                                  }));
                                        }));
                              },
                          ),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: primaryColorDark,
                              fontWeight: FontWeight.bold,
                              fontSize: Adaptive.sp(14)),
                        )),
                        const VerticalDivider(),
                        Expanded(
                            child: Text(
                          "${data.data?[index].firstName}(${data.data?[index].empId})",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: Adaptive.sp(14)),
                        )),
                        const VerticalDivider(),
                        Expanded(
                            child: Text.rich(
                          TextSpan(
                            text: "${data.data?[index].requestedAmount ?? "0"}",
                          ),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: Adaptive.sp(14)),
                        )),
                        const VerticalDivider(),
                        Expanded(
                            child: Text.rich(
                          TextSpan(
                            text: "${data.data?[index].notes ?? "0"}",
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: Adaptive.sp(14)),
                        )),
                      ]),
                    ),
                  ),
                ),
              ],
            );
          },
          error: (e, s) => Container(),
          loading: () => Container(
                height: Adaptive.h(100),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ));
}
