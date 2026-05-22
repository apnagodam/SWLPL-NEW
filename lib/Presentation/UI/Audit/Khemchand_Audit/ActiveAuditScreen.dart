// ignore_for_file: deprecated_member_use

import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:button_animations/button_animations.dart';
import 'package:emp_apnagodam/Domain/Audit/AuditService.dart';
import 'package:emp_apnagodam/Presentation/Constants/ColorConstant.dart';
import 'package:emp_apnagodam/Presentation/Widgets/widgets.dart';
import 'package:emp_apnagodam/Presentation/utils/DialogUtils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ActiveAuditScreen extends ConsumerStatefulWidget {
  const ActiveAuditScreen({super.key});

  @override
  ConsumerState<ActiveAuditScreen> createState() => _AuditneighbourState();
}

class _AuditneighbourState extends ConsumerState<ActiveAuditScreen> {
  TextEditingController _controller = TextEditingController();
  final reasonKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Active Audit'),
        ),
        body: ref.watch(activeAuditProvider).when(
            data: (data) => ListView(
                  children: [
                    Container(
                      color: primaryColorDark,
                      padding: const Pad(all: 10),
                      child: IntrinsicHeight(
                        child: Row(children: [
                          Expanded(
                              child: Text(
                            "Audit ID",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: Adaptive.sp(14)),
                          )),
                          const VerticalDivider(),
                          Expanded(
                              child: Text(
                            "WareHouse Name",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: Adaptive.sp(14)),
                          )),
                          const VerticalDivider(),
                          Expanded(
                              child: Text(
                            "Start Date",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: Adaptive.sp(14)),
                          )),
                          const VerticalDivider(),
                          Expanded(
                              child: Text(
                            "Action",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: Adaptive.sp(14)),
                          )),
                        ]),
                      ),
                    ),
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
                                child: Text(
                              "${data.data?[index].auditId}",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: Adaptive.sp(14)),
                            )),
                            VerticalDivider(),
                            Expanded(
                                child: Text(
                              "${data.data?[index].warehouseName}(${data.data?[index].warehouseCode})",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: Adaptive.sp(14)),
                            )),
                            VerticalDivider(),
                            Expanded(
                                child: Text.rich(
                              TextSpan(
                                text: "${data.data?[index].startDate ?? ""}",
                              ),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: Adaptive.sp(14)),
                            )),
                            VerticalDivider(),
                            Expanded(
                              child: AnimatedButton(
                                height: 50,
                                color: primaryColorDark,
                                width: MediaQuery.of(context).size.width / 5,
                                isOutline: true,
                                isMultiColor: true,
                                colors: const [
                                  primaryColorDark,
                                  primaryColorDark
                                ],
                                borderWidth: 1,
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        backgroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        title: Row(
                                          children: [
                                            Text('Audit'),
                                            Spacer(),
                                            InkWell(
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                              child: CircleAvatar(
                                                backgroundColor: Colors.red,
                                                child: Icon(
                                                  Icons.cancel,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                                'Select one of the buttons below'),
                                            SizedBox(height: 16),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                // AnimatedButton(
                                                //   height: 50,
                                                //   color: primaryColorDark,
                                                //   width: MediaQuery.of(context)
                                                //           .size
                                                //           .width /
                                                //       7,
                                                //   isOutline: true,
                                                //   isMultiColor: true,
                                                //   colors: const [
                                                //     primaryColorDark,
                                                //     primaryColorDark
                                                //   ],
                                                //   borderWidth: 1,
                                                //   onTap: () {
                                                //     showDialog<void>(
                                                //       context: context,
                                                //       barrierDismissible: false,
                                                //       builder: (BuildContext
                                                //           context) {
                                                //         return showConfirmAlertDialog(
                                                //             context,
                                                //             Column(
                                                //               mainAxisSize:
                                                //                   MainAxisSize
                                                //                       .min,
                                                //               children: [
                                                //                 Text(
                                                //                     'Do you really want to end?'),
                                                //               ],
                                                //             ),
                                                //             "Are you sure ?",
                                                //             approve: () {
                                                //           ref
                                                //               .watch(
                                                //                   endAuditProvider(
                                                //             id: "${data.data?[index].auditId}",
                                                //           ).future)
                                                //               .then((value) {
                                                //             if (value[
                                                //                     'status'] ==
                                                //                 "1") {
                                                //               ref.invalidate(
                                                //                   activeAuditProvider);
                                                //               Navigator.of(
                                                //                       context)
                                                //                   .pop();
                                                //             }
                                                //             Fluttertoast.showToast(
                                                //                 msg: value[
                                                //                         'message']
                                                //                     .toString());
                                                //           });
                                                //         }, reject: () {
                                                //           Navigator.of(context)
                                                //               .pop();
                                                //         });
                                                //       },
                                                //     );
                                                //   },
                                                //   child: Text(
                                                //     "End",
                                                //     textAlign: TextAlign.center,
                                                //     style: TextStyle(
                                                //         color: Colors.white,
                                                //         fontSize:
                                                //             Adaptive.sp(14),
                                                //         fontWeight:
                                                //             FontWeight.w800),
                                                //   ),
                                                // ),

                                                SizedBox(
                                                  width: 5,
                                                ),
                                                AnimatedButton(
                                                  height: 50,
                                                  color: Colors.green,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      7,
                                                  isOutline: true,
                                                  isMultiColor: true,
                                                  colors: const [
                                                    primaryColorDark,
                                                    primaryColorDark
                                                  ],
                                                  borderWidth: 1,
                                                  onTap: () {
                                                    context.goNamed(
                                                        'audit_list',
                                                        extra: {
                                                          'audit_id':
                                                              "${data.data?[index].auditId}"
                                                        });
                                                  },
                                                  child: Text(
                                                    'Update',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize:
                                                            Adaptive.sp(14),
                                                        fontWeight:
                                                            FontWeight.w800),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                AnimatedButton(
                                                  height: 50,
                                                  color: Colors.red,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      7,
                                                  isOutline: true,
                                                  isMultiColor: true,
                                                  colors: const [
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
                                                                Form(
                                                                  key:
                                                                      reasonKey,
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    children: [
                                                                      TextFormField(
                                                                        controller:
                                                                            _controller,
                                                                        maxLines:
                                                                            5,
                                                                        validator:
                                                                            (value) {
                                                                          if (value == null ||
                                                                              value.isEmpty) {
                                                                            return 'Please input reason';
                                                                          }
                                                                          return null;
                                                                        },
                                                                        decoration: InputDecoration(
                                                                            label: Text(
                                                                                'Please input reason*'),
                                                                            contentPadding: const Pad(
                                                                                top: 0,
                                                                                bottom: 0,
                                                                                left: 10),
                                                                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                                                                            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                "Cancel Audit",
                                                                approve: () {
                                                              if (reasonKey
                                                                  .currentState!
                                                                  .validate()) {
                                                                ref
                                                                    .watch(cancelAuditProvider(
                                                                            id:
                                                                                "${data.data?[index].auditId}",
                                                                            remark: _controller
                                                                                .text)
                                                                        .future)
                                                                    .then(
                                                                        (value) {
                                                                  if (value[
                                                                          'status'] ==
                                                                      "1") {
                                                                    ref.invalidate(
                                                                        activeAuditProvider);
                                                                    Navigator.of(
                                                                            context)
                                                                        .pop();
                                                                  }
                                                                  Fluttertoast.showToast(
                                                                      msg: value[
                                                                              'message']
                                                                          .toString());
                                                                });
                                                              }
                                                            }, reject: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            }));
                                                  },
                                                  child: Text(
                                                    'Cancel Audit',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize:
                                                            Adaptive.sp(14),
                                                        fontWeight:
                                                            FontWeight.w800),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: Text(
                                  'Action',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: Adaptive.sp(14),
                                      fontWeight: FontWeight.w800),
                                ),
                              ),
                            ),
                          ]),
                        ),
                      ),
                    ),
                  ],
                ),
            error: (e, s) =>  Text(e.toString()),
            loading: () => loader(context)));
  }
}
