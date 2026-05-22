import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:button_animations/button_animations.dart';
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

class VendorVoucher extends ConsumerStatefulWidget {
  const VendorVoucher({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _GuardinscreenState();
}

class _GuardinscreenState extends ConsumerState<VendorVoucher> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Vendor Voucher List"),
      ),
      body: ref.watch(venderVoucherListProvider).when(
          data: (venderVoucherData) =>ListView.builder(
                  shrinkWrap: true,
                  itemCount: venderVoucherData.data?.length ?? 0,
                  itemBuilder: (context, index) {
                    return Container(
                      child: Column(
                        children: [
                          Padding(
                            padding: Pad(all: 10),
                            child: Text.rich(TextSpan(
                                text:
                                    'Unique Id:  ${venderVoucherData.data?[index].uniqueId}',
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
                                    '${venderVoucherData.data?[index].employeeName}',
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
                                      '${venderVoucherData.data?[index].warehouseName}',
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
                                    '${venderVoucherData.data?[index].vendorName}',
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
                          ColumnSuper(alignment: Alignment.center, children: [
                            Text(
                              'Date:- ${venderVoucherData.data?[index].date}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: primaryColor,
                                  fontSize: Adaptive.sp(14),
                                  fontWeight: FontWeight.w800),
                            ),
                            Text(
                              'Create Date:- ${venderVoucherData.data?[index].createdAt}',
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
                          if (venderVoucherData.data?[index].status == 1)
                            AnimatedButton(
                              height: 50,
                              color: primaryColorDark,
                              width: MediaQuery.of(context).size.width / 1.2,
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
                                            Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text('are you sure',
                                                    style: TextStyle(
                                                        color: primaryColorDark,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w600))
                                              ],
                                            ),
                                            "Rejecte", approve: () {
                                          ref
                                              .watch(
                                                  venderVoucherRejectProvider(
                                            id: "${venderVoucherData.data?[index].id}",
                                          ).future)
                                              .then((value) {
                                            Fluttertoast.showToast(
                                                msg: value['message']);
                                            hideLoaderDialog(context);

                                            ref.invalidate(
                                                venderVoucherListProvider);
                                          }).onError((e, s) {
                                            hideLoaderDialog(context);
                                            Navigator.of(context).pop();
                                          });
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
                            )
                          else if (venderVoucherData.data?[index].status == 2)
                            Text(
                              'Approved',
                              style: TextStyle(
                                  color: primaryColorDark,
                                  fontWeight: FontWeight.w600),
                            )
                          else
                            Text(
                              'Rejected',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.w600),
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
                                              padding:
                                                  const EdgeInsets.symmetric(
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
                                                              ' ${venderVoucherData.data?[index].uniqueId ?? "--"}'))
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
                                                              ' ${venderVoucherData.data?[index].date ?? "--"}'))
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
                                                            ' ${venderVoucherData.data?[index].groupFirm ?? "--"}'),
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
                                                            ' ${venderVoucherData.data?[index].employeeName ?? "--"}'),
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
                                                            ' ${venderVoucherData.data?[index].vendorName ?? "--"}'),
                                                      )
                                                    ],
                                                  ),
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
                                                            ' ${venderVoucherData.data?[index].warehouseName ?? "--"}'),
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
                                                              ' ${venderVoucherData.data?[index].expensesType ?? "--"}'))
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
                                                              ' ${venderVoucherData.data?[index].amount ?? "--"}'))
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
                                                          'Final Amount',
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
                                                              ' ${venderVoucherData.data?[index].finalPrice ?? "--"}'))
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
                                                                  "${venderVoucherData.data?[index].expImage1}",
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
                                                                  "${venderVoucherData.data?[index].expImage2}",
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
                                                          ' ${venderVoucherData.data?[index].purpose ?? "--"}',
                                                          maxLines: 3,
                                                          overflow: TextOverflow
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
                                                          'Notes',
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
                                                              ' ${venderVoucherData.data?[index].notes ?? "--"}'))
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
                                                          'Approval For',
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
                                                              ' ${venderVoucherData.data?[index].approvalFor ?? "--"}'))
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
                                                      if (venderVoucherData
                                                              .data?[index]
                                                              .paymentStatus ==
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
                                                      else if (venderVoucherData
                                                              .data?[index]
                                                              .paymentStatus ==
                                                          0)
                                                        Expanded(
                                                          child: Text(
                                                            'Rejected',
                                                            style: TextStyle(
                                                                color:
                                                                    Colors.red,
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
                                                      if (venderVoucherData
                                                              .data?[index]
                                                              .verfiyStatus ==
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
                                                      else if (venderVoucherData
                                                              .data?[index]
                                                              .verfiyStatus ==
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
                                                              color: Colors.red,
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
                                                          'Approve',
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
                                                              ' ${venderVoucherData.data?[index].approvalFor ?? "--"}'))
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
                                                              ' ${venderVoucherData.data?[index].createdAt ?? "--"}'))
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
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      margin: Pad(all: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: primaryColor),
                          borderRadius: BorderRadius.circular(10)),
                    );
                  },
                ),
          error: (e, s) => Container(),
          loading: () => loader(context)),
    );
  }
}
