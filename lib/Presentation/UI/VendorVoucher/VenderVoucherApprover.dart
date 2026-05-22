import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:button_animations/button_animations.dart';
import 'package:dio/dio.dart';
import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:emp_apnagodam/Domain/Conveyance/ConveyanceService.dart';
import 'package:emp_apnagodam/Presentation/Constants/ColorConstant.dart';
import 'package:emp_apnagodam/Presentation/Widgets/widgets.dart';
import 'package:emp_apnagodam/Presentation/utils/DialogUtils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class VendorVoucherApproverScreen extends ConsumerStatefulWidget {
  const VendorVoucherApproverScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _GuardinscreenState();
}

class _GuardinscreenState extends ConsumerState<VendorVoucherApproverScreen> {
  TextEditingController reasonController = TextEditingController();
  final approvalAmount = TextEditingController();
  final rejectAmount = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Vendor Voucher Approve List"),
      ),
      body: ref.watch(venderVoucherApproveListProvider).when(
          data: (venderVoucherApproveData) => (venderVoucherApproveData.data ??
                      [])
                  .isEmpty
              ? noItems('vouchers', context)
              : ListView(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  children: [
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: venderVoucherApproveData.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        return Container(
                          child: Column(
                            children: [
                              Padding(
                                padding: Pad(all: 10),
                                child: Text.rich(TextSpan(
                                    text:
                                        'Unique Id:  ${venderVoucherApproveData.data?[index].uniqueId}',
                                    style: TextStyle(
                                        color: primaryColorDark,
                                        fontSize: Adaptive.sp(14),
                                        fontWeight: FontWeight.w700))),
                              ),
                              Divider(
                                height: 2,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        '${venderVoucherApproveData.data?[index].employeeName}',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: Adaptive.sp(14),
                                            fontWeight: FontWeight.w800),
                                      ),
                                    ),
                                    Container(
                                      height: 50,
                                      color: Colors.grey,
                                      width: 1,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: Pad(all: 10),
                                        child: Text(
                                          '${venderVoucherApproveData.data?[index].warehouseName}',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: Adaptive.sp(14),
                                              fontWeight: FontWeight.w800),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 50,
                                      color: Colors.grey,
                                      width: 1,
                                    ),
                                    Expanded(
                                      child: Text(
                                        '${venderVoucherApproveData.data?[index].vendorName}',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: Adaptive.sp(14),
                                            fontWeight: FontWeight.w800),
                                      ),
                                    ),
                                  ]),
                              const SizedBox(
                                height: 10,
                              ),
                              ColumnSuper(
                                  alignment: Alignment.center,
                                  children: [
                                    Text(
                                      'Date:- ${venderVoucherApproveData.data?[index].date}',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: primaryColor,
                                          fontSize: Adaptive.sp(14),
                                          fontWeight: FontWeight.w800),
                                    ),
                                    Text(
                                      'Create Date:- ${venderVoucherApproveData.data?[index].createdAt}',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: primaryColor,
                                          fontSize: Adaptive.sp(14),
                                          fontWeight: FontWeight.w800),
                                    ),
                                  ]),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  AnimatedButton(
                                    height: 50,
                                    color: primaryColorDark,
                                    width:
                                        MediaQuery.of(context).size.width / 2.7,
                                    isOutline: true,
                                    isMultiColor: true,
                                    colors: [
                                      primaryColorDark,
                                      primaryColorDark
                                    ],
                                    borderWidth: 1,
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: (dialogContext) =>
                                              showConfirmAlertDialog(
                                                  context,
                                                  Consumer(
                                                      builder:
                                                          (context, ref,
                                                                  child) =>
                                                              Form(
                                                                  key: formKey,
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    children: [
                                                                      Align(
                                                                          alignment: Alignment
                                                                              .topLeft,
                                                                          child:
                                                                              Text(
                                                                            'GroupFirm',
                                                                            style:
                                                                                TextStyle(fontWeight: FontWeight.w600),
                                                                          )),
                                                                      SizedBox(
                                                                          height:
                                                                              5),
                                                                      Container(
                                                                        decoration: BoxDecoration(
                                                                            border:
                                                                                Border.all(color: Colors.grey.shade300),
                                                                            borderRadius: BorderRadius.circular(10)),
                                                                        height:
                                                                            50,
                                                                        child: ref.watch(venderGroupFirmListProvider).when(
                                                                            data: (groupFirm) => Consumer(
                                                                                  builder: (context, ref, child) => DropdownButton<String>(
                                                                                    underline: SizedBox.shrink(),
                                                                                    value: selectedValue,
                                                                                    onChanged: (newValue) {
                                                                                      setState(() {
                                                                                        selectedValue = newValue;
                                                                                      });
                                                                                    },
                                                                                    items: groupFirm.data
                                                                                            ?.map<DropdownMenuItem<String>>((item) {
                                                                                              return DropdownMenuItem<String>(
                                                                                                value: item.name,
                                                                                                child: Text(item.name),
                                                                                              );
                                                                                            })
                                                                                            .toSet()
                                                                                            .toList() ??
                                                                                        [],
                                                                                  ),
                                                                                ),
                                                                            error: (e, s) => Text(''),
                                                                            loading: () => loader(context)),
                                                                      ),
                                                                      ElevarmTextInputField(
                                                                        label:
                                                                            'Approval Amount',
                                                                        hintText:
                                                                            '',
                                                                        helperText:
                                                                            'Amount to be approved',
                                                                        suffixIconAssetName:
                                                                            Icons.money,
                                                                        onTapSuffix:
                                                                            null,
                                                                        errorText:
                                                                            null,
                                                                        enabled:
                                                                            true,
                                                                        controller:
                                                                            approvalAmount,
                                                                        validator:
                                                                            (value) {
                                                                          if (value == null ||
                                                                              value.isEmpty) {
                                                                            return "This field cant be empty";
                                                                          } else {
                                                                            return null;
                                                                          }
                                                                        },
                                                                        isRequired:
                                                                            true,
                                                                        keyboardType:
                                                                            TextInputType.number,
                                                                      ),
                                                                      ElevarmTextInputField(
                                                                        label:
                                                                            'Approval Notes',
                                                                        hintText:
                                                                            '',
                                                                        helperText:
                                                                            'notes for the approving amount',
                                                                        suffixIconAssetName:
                                                                            Icons.money,
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
                                                                          if (value == null ||
                                                                              value.isEmpty) {
                                                                            return "This field cant be empty";
                                                                          } else {
                                                                            return null;
                                                                          }
                                                                        },
                                                                        isRequired:
                                                                            true,
                                                                        keyboardType:
                                                                            TextInputType.name,
                                                                      ),
                                                                    ],
                                                                  ))),
                                                  "Approve", approve: () {
                                                if (formKey.currentState!
                                                    .validate()) {
                                                  showLoaderDialog(context);
                                                  ref
                                                      .watch(
                                                          venderVoucherApproveProvider(
                                                    groupfirm: selectedValue,
                                                    amount: approvalAmount.text
                                                        .toString(),
                                                    id: "${venderVoucherApproveData.data?[index].id}",
                                                    notes: reasonController.text
                                                        .toString(),
                                                  ).future)
                                                      .then((value) {
                                                    hideLoaderDialog(context);
                                                    Fluttertoast.showToast(
                                                        msg: value['message']);
                                                    Navigator.of(context).pop();
                                                  }).onError((e, s) {
                                                    hideLoaderDialog(context);
                                                    Navigator.of(context).pop();
                                                  });
                                                }
                                              }, reject: () {
                                                Navigator.of(context).pop();
                                              }));
                                    },
                                    child: Text(
                                      'Approve',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: Adaptive.sp(14),
                                          fontWeight: FontWeight.w800),
                                    ),
                                  ),
                                  AnimatedButton(
                                    height: 50,
                                    color: primaryColorDark,
                                    width:
                                        MediaQuery.of(context).size.width / 2.7,
                                    isOutline: true,
                                    isMultiColor: true,
                                    colors: [Colors.red, Colors.red],
                                    borderWidth: 1,
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
                                                            MainAxisSize.min,
                                                        children: [
                                                          ElevarmTextInputField(
                                                            label:
                                                                'Reject Notes',
                                                            hintText: '',
                                                            helperText:
                                                                'notes for the rejecting amount',
                                                            suffixIconAssetName:
                                                                Icons.money,
                                                            onTapSuffix: null,
                                                            errorText: null,
                                                            enabled: true,
                                                            maxLines: 5,
                                                            controller:
                                                                reasonController,
                                                            validator: (value) {
                                                              if (value ==
                                                                      null ||
                                                                  value
                                                                      .isEmpty) {
                                                                return "This field cant be empty";
                                                              } else {
                                                                return null;
                                                              }
                                                            },
                                                            isRequired: true,
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
                                                          venderVoucherRejectedProvider(
                                                    id: "${venderVoucherApproveData.data?[index].id}",
                                                    notes: reasonController.text
                                                        .toString(),
                                                  ).future)
                                                      .then((value) {
                                                    Fluttertoast.showToast(
                                                        msg: value['message']);
                                                    hideLoaderDialog(context);
                                                    Navigator.of(context).pop();
                                                    Navigator.of(dialogContext)
                                                        .pop();
                                                    ref.invalidate(
                                                        venderVoucherApproveListProvider);
                                                  }).onError((e, s) {
                                                    hideLoaderDialog(context);
                                                    Navigator.of(context).pop();
                                                  });
                                                }
                                              }, reject: () {
                                                Navigator.of(context).pop();
                                              }));
                                    },
                                    child: Text(
                                      'Rejected',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: Adaptive.sp(14),
                                          fontWeight: FontWeight.w800),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              AnimatedButton(
                                height: 50,
                                color: primaryColorDark,
                                width: MediaQuery.of(context).size.width / 1.2,
                                isOutline: true,
                                isMultiColor: true,
                                colors: [primaryColorDark, primaryColorDark],
                                borderWidth: 1,
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return ElevarmBottomSheet(
                                          initialChildSize: 0.65,
                                          title: 'Vendor Voucher',
                                          onPressedClose: () {
                                            Navigator.pop(context);
                                          },
                                          children: [
                                            Column(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 15,
                                                      vertical: 10),
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Expanded(
                                                            child: Text(
                                                              'Unique ID :-',
                                                              style: GoogleFonts.roboto(
                                                                  color:
                                                                      primaryColorDark,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                            ),
                                                          ),
                                                          Expanded(
                                                              child: Text(
                                                                  ' ${venderVoucherApproveData.data?[index].uniqueId ?? "--"}'))
                                                        ],
                                                      ),
                                                      Divider(),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Expanded(
                                                            child: Text(
                                                              'Date',
                                                              style: GoogleFonts.roboto(
                                                                  color:
                                                                      primaryColorDark,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                            ),
                                                          ),
                                                          Expanded(
                                                              child: Text(
                                                                  '${venderVoucherApproveData.data?[index].date ?? "--"}'))
                                                        ],
                                                      ),
                                                      Divider(),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Expanded(
                                                            child: Text(
                                                              'Group',
                                                              style: GoogleFonts.roboto(
                                                                  color:
                                                                      primaryColorDark,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Text(
                                                                '${venderVoucherApproveData.data?[index].groupFirm ?? "--"}'),
                                                          )
                                                        ],
                                                      ),
                                                      Divider(),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Expanded(
                                                            child: Text(
                                                              'Employee Name',
                                                              style: GoogleFonts.roboto(
                                                                  color:
                                                                      primaryColorDark,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Text(
                                                                '${venderVoucherApproveData.data?[index].employeeName ?? "--"}'),
                                                          )
                                                        ],
                                                      ),
                                                      Divider(),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Expanded(
                                                            child: Text(
                                                              'Vendor Name',
                                                              style: GoogleFonts.roboto(
                                                                  color:
                                                                      primaryColorDark,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Text(
                                                                '${venderVoucherApproveData.data?[index].vendorName ?? "--"}'),
                                                          )
                                                        ],
                                                      ),
                                                      Divider(),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Expanded(
                                                            child: Text(
                                                              'Terminal',
                                                              style: GoogleFonts.roboto(
                                                                  color:
                                                                      primaryColorDark,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Text(
                                                                '${venderVoucherApproveData.data?[index].warehouseName ?? "--"}'),
                                                          )
                                                        ],
                                                      ),
                                                      Divider(),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Expanded(
                                                            child: Text(
                                                              'Expense Type',
                                                              style: GoogleFonts.roboto(
                                                                  color:
                                                                      primaryColorDark,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                            ),
                                                          ),
                                                          Expanded(
                                                              child: Text(
                                                                  ' ${venderVoucherApproveData.data?[index].expensesType ?? "--"}'))
                                                        ],
                                                      ),
                                                      Divider(),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Expanded(
                                                            child: Text(
                                                              'Amount',
                                                              style: GoogleFonts.roboto(
                                                                  color:
                                                                      primaryColorDark,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                            ),
                                                          ),
                                                          Expanded(
                                                              child: Text(
                                                                  ' ${venderVoucherApproveData.data?[index].amount ?? "--"}'))
                                                        ],
                                                      ),
                                                      Divider(),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Expanded(
                                                            child: Text(
                                                              'Image-1',
                                                              style: GoogleFonts.roboto(
                                                                  color:
                                                                      primaryColorDark,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Align(
                                                              alignment: Alignment
                                                                  .centerRight,
                                                              child: InkWell(
                                                                onTap: () {},
                                                                child:
                                                                    InstaImageViewer(
                                                                  imageUrl:
                                                                      "${venderVoucherApproveData.data?[index].expImage1}",
                                                                  child: Icon(
                                                                    Icons
                                                                        .remove_red_eye,
                                                                    color:
                                                                        primaryColorDark,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Divider(),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Expanded(
                                                            child: Text(
                                                              'Image-2',
                                                              style: GoogleFonts.roboto(
                                                                  color:
                                                                      primaryColorDark,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Align(
                                                              alignment: Alignment
                                                                  .centerRight,
                                                              child: InkWell(
                                                                onTap: () {},
                                                                child:
                                                                    InstaImageViewer(
                                                                  imageUrl:
                                                                      "${venderVoucherApproveData.data?[index].expImage2}",
                                                                  child: Icon(
                                                                    Icons
                                                                        .remove_red_eye,
                                                                    color:
                                                                        primaryColorDark,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Divider(),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Expanded(
                                                            child: Text(
                                                              'Voucher Purpose',
                                                              style: GoogleFonts.roboto(
                                                                  color:
                                                                      primaryColorDark,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Text(
                                                              ' ${venderVoucherApproveData.data?[index].purpose ?? "--"}',
                                                              maxLines: 3,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                      Divider(),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Expanded(
                                                            child: Text(
                                                              'Payment Status',
                                                              style: GoogleFonts.roboto(
                                                                  color:
                                                                      primaryColorDark,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                            ),
                                                          ),
                                                          if (venderVoucherApproveData
                                                                  .data?[index]
                                                                  .amount ==
                                                              4)
                                                            Expanded(
                                                                child: Text(
                                                              'Done',
                                                              style: TextStyle(
                                                                  color:
                                                                      primaryColorDark,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                            ))
                                                          else if (venderVoucherApproveData
                                                                  .data?[index]
                                                                  .amount ==
                                                              0)
                                                            Expanded(
                                                              child: Text(
                                                                'Rejected',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .red,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                              ),
                                                            )
                                                          else
                                                            Expanded(
                                                                child: Text(
                                                                    'Pending...'))
                                                        ],
                                                      ),
                                                      Divider(),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Expanded(
                                                            child: Text(
                                                              'Verify',
                                                              style: GoogleFonts.roboto(
                                                                  color:
                                                                      primaryColorDark,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                            ),
                                                          ),
                                                          if (venderVoucherApproveData
                                                                  .data?[index]
                                                                  .amount ==
                                                              1)
                                                            Expanded(
                                                                child: Text(
                                                              '  Pending...',
                                                              style: TextStyle(
                                                                  color:
                                                                      primaryColorDark,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                            ))
                                                          else if (venderVoucherApproveData
                                                                  .data?[index]
                                                                  .amount ==
                                                              2)
                                                            Expanded(
                                                              child: Text(
                                                                'Verified',
                                                                style: TextStyle(
                                                                    color:
                                                                        primaryColorDark,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                              ),
                                                            )
                                                          else
                                                            Expanded(
                                                                child: Text(
                                                              'Rejected',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .red,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                            ))
                                                        ],
                                                      ),
                                                      Divider(),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Expanded(
                                                            child: Text(
                                                              'Voucher From',
                                                              style: GoogleFonts.roboto(
                                                                  color:
                                                                      primaryColorDark,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                            ),
                                                          ),
                                                          Expanded(
                                                              child: Text(
                                                                  ' ${venderVoucherApproveData.data?[index].voucherFrom ?? "--"}'))
                                                        ],
                                                      ),
                                                      Divider(),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Expanded(
                                                            child: Text(
                                                              'Voucher To',
                                                              style: GoogleFonts.roboto(
                                                                  color:
                                                                      primaryColorDark,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                            ),
                                                          ),
                                                          Expanded(
                                                              child: Text(
                                                                  ' ${venderVoucherApproveData.data?[index].voucherTo ?? "--"}'))
                                                        ],
                                                      ),
                                                      Divider(),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Expanded(
                                                            child: Text(
                                                              'Created Date',
                                                              style: GoogleFonts.roboto(
                                                                  color:
                                                                      primaryColorDark,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                            ),
                                                          ),
                                                          Expanded(
                                                              child: Text(
                                                                  ' ${venderVoucherApproveData.data?[index].createdAt ?? "--"}'))
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ]);
                                    },
                                  );
                                },
                                child: Text(
                                  'View Details',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: Adaptive.sp(14),
                                      fontWeight: FontWeight.w800),
                                ),
                              ),
                            ],
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          margin: Pad(all: 10),
                          decoration: BoxDecoration(
                              border: Border.all(color: primaryColor),
                              borderRadius: BorderRadius.circular(10)),
                        );
                      },
                    ),
                    // ref.watch(venderGroupFirmListProvider).when(
                    //     data: (groupFirm) => ListView.builder(
                    //           itemCount: groupFirm.data?.length ?? 0,
                    //           physics: NeverScrollableScrollPhysics(),
                    //           shrinkWrap: true,
                    //           itemBuilder: (context, index) {
                    //             return Row(
                    //               children: [
                    //                 Text('${groupFirm.data?[index].name}'),
                    //                 Text('${groupFirm.data?[index].id}'),
                    //               ],
                    //             );
                    //           },
                    //         ),
                    //     error: (e, s) => Text(''),
                    //     loading: () => loader(context)),
                  ],
                ),
          error: (e, s) => (e is DioException)
              ? Center(
                  child: errorWidget("please check your internet"),
                )
              : Text(e.toString()),
          loading: () => loader(context)),
    );
  }
}
