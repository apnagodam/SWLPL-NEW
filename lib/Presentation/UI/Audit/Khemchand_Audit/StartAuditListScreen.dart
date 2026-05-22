// ignore_for_file: must_be_immutable

import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:button_animations/button_animations.dart';
import 'package:emp_apnagodam/Domain/Audit/AuditService.dart';
import 'package:emp_apnagodam/Presentation/Constants/ColorConstant.dart';
import 'package:emp_apnagodam/Presentation/Widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class StartAuditListScreen extends ConsumerWidget {
  StartAuditListScreen({super.key, required this.auditid});

  String? auditid;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Start Audit'),
        ),
        body: ref.watch(getAuditStackListProvider(id: auditid)).when(
            data: (AuditList) => SingleChildScrollView(
                  child: Column(
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
                      Container(
                        color: Colors.white,
                        padding: const Pad(all: 10),
                        child: IntrinsicHeight(
                          child: Row(children: [
                            Expanded(
                                child: Text(
                              '${AuditList.data?.auditId ?? '--'}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: Adaptive.sp(14)),
                            )),
                            const VerticalDivider(),
                            Expanded(
                                child: Text(
                              '${AuditList.data?.warehosueName ?? 'Not Found\nwareHouse Name'}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: Adaptive.sp(14)),
                            )),
                            const VerticalDivider(),
                            Expanded(
                                child: Text(
                              "Stack Physical Audit",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: Adaptive.sp(14)),
                            )),
                            const VerticalDivider(),
                            AuditList.data?.auditStack == null
                                ? Expanded(
                                    child: AnimatedButton(
                                      height: 50,
                                      color: Colors.red,
                                      width:
                                          MediaQuery.of(context).size.width / 7,
                                      isOutline: true,
                                      isMultiColor: true,
                                      colors: const [
                                        primaryColorDark,
                                        primaryColorDark
                                      ],
                                      borderWidth: 1,
                                      onTap: () {
                                        context.goNamed('stack_physical_audit',
                                            extra: {
                                              'audit_id':
                                                  "${AuditList.data?.auditId}"
                                            });
                                      },
                                      child: Text(
                                        'Update',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: Adaptive.sp(14),
                                            fontWeight: FontWeight.w800),
                                      ),
                                    ),
                                  )
                                : Expanded(
                                    child: Center(
                                        child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      MaterialButton(
                                        color: primaryColor,
                                        onPressed: () {
                                          context.goNamed('physical_audit_edit',
                                              extra: {
                                                'audit_id':
                                                    "${AuditList.data?.auditId}",
                                                "warehosue_name":
                                                    "${AuditList.data?.warehosueName}"
                                              });
                                        },
                                        child: Text(
                                          'Edit',
                                          style: GoogleFonts.aBeeZee(
                                              color: Colors.white),
                                        ),
                                      ),
                                      MaterialButton(
                                        color: Colors.red,
                                        onPressed: () {
                                          context
                                              .goNamed('physical_pdf', extra: {
                                            'audit_id':
                                                "${AuditList.data?.auditId}",
                                            "warehosue_name":
                                                "${AuditList.data?.warehosueName}"
                                          });
                                        },
                                        child: Text(
                                          'PDF Download',
                                          style: GoogleFonts.aBeeZee(
                                              color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ))),
                          ]),
                        ),
                      ),
                      Divider(),
                      Container(
                        color: Colors.white,
                        padding: const Pad(all: 10),
                        child: IntrinsicHeight(
                          child: Row(children: [
                            Expanded(
                                child: Text(
                              '${AuditList.data?.auditId ?? '--'}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: Adaptive.sp(14)),
                            )),
                            const VerticalDivider(),
                            Expanded(
                                child: Text(
                              '${AuditList.data?.warehosueName ?? 'Not Found\nwareHouse Name'}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: Adaptive.sp(14)),
                            )),
                            const VerticalDivider(),
                            Expanded(
                                child: Text(
                              "Stack Quality Audit",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: Adaptive.sp(14)),
                            )),
                            const VerticalDivider(),
                            AuditList.data?.auditQuality == null
                                ? Expanded(
                                    child: AnimatedButton(
                                      height: 50,
                                      color: Colors.red,
                                      width:
                                          MediaQuery.of(context).size.width / 7,
                                      isOutline: true,
                                      isMultiColor: true,
                                      colors: const [
                                        primaryColorDark,
                                        primaryColorDark
                                      ],
                                      borderWidth: 1,
                                      onTap: () {
                                        context.goNamed('stack_quality_audit',
                                            extra: {
                                              'audit_id':
                                                  "${AuditList.data?.auditId ?? ""}"
                                            });
                                      },
                                      // onTap: () =>
                                      //     context.goNamed('stack_quality_audit'),
                                      child: Text(
                                        'Update',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: Adaptive.sp(14),
                                            fontWeight: FontWeight.w800),
                                      ),
                                    ),
                                  )
                                : Expanded(
                                    child: Center(
                                        child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      MaterialButton(
                                        color: primaryColor,
                                        onPressed: () {
                                          context.goNamed('stack_quality_audit',
                                              extra: {
                                                'audit_id':
                                                    "${AuditList.data?.auditId ?? ""}"
                                              });
                                          // context.goNamed('quality_audit_edit',
                                          //     extra: {
                                          //       'audit_id':
                                          //           "${AuditList.data?.auditId}",
                                          //       "warehosue_name":
                                          //           "${AuditList.data?.warehosueName}",
                                          //       "stack_no":
                                          //           "${AuditList.data?.auditStack}"
                                          //     });
                                          // context.goNamed('stack_edit_list',
                                          //     extra: {
                                          //       'audit_id':
                                          //           "${AuditList.data?.auditId}",
                                          //       "warehosue_name":
                                          //           "${AuditList.data?.warehosueName}",
                                          //       "stack_no":
                                          //           "${AuditList.data?.auditStack}"
                                          //     });
                                          //
                                        },
                                        child: Text(
                                          'Update More Stack',
                                          style: GoogleFonts.aBeeZee(
                                              color: Colors.white),
                                        ),
                                      ),
                                      Expanded(
                                          child: Center(
                                              child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          MaterialButton(
                                            color: Colors.red,
                                            onPressed: () {
                                              context.goNamed(
                                                  'stack_quality_pdf',
                                                  extra: {
                                                    'audit_id':
                                                        "${AuditList.data?.auditId}",
                                                    "warehosue_name":
                                                        "${AuditList.data?.warehosueName}"
                                                  });
                                            },
                                            child: Text(
                                              'PDF Download',
                                              style: GoogleFonts.aBeeZee(
                                                  color: Colors.white),
                                            ),
                                          )
                                        ],
                                      ))),
                                    ],
                                  ))),
                          ]),
                        ),
                      ),
                      Divider(),
                      Container(
                        color: Colors.white,
                        padding: const Pad(all: 10),
                        child: IntrinsicHeight(
                          child: Row(children: [
                            Expanded(
                                child: Text(
                              '${AuditList.data?.auditId ?? '--'}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: Adaptive.sp(14)),
                            )),
                            const VerticalDivider(),
                            Expanded(
                                child: Text(
                              '${AuditList.data?.warehosueName ?? 'Not Found\nwareHouse Name'}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: Adaptive.sp(14)),
                            )),
                            const VerticalDivider(),
                            Expanded(
                                child: Text(
                              "Stack PV",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: Adaptive.sp(14)),
                            )),
                            const VerticalDivider(),
                            AuditList.data?.auditPv == null
                                ? Expanded(
                                    child: AnimatedButton(
                                      height: 50,
                                      color: Colors.red,
                                      width:
                                          MediaQuery.of(context).size.width / 7,
                                      isOutline: true,
                                      isMultiColor: true,
                                      colors: const [
                                        primaryColorDark,
                                        primaryColorDark
                                      ],
                                      borderWidth: 1,
                                      onTap: () {
                                        context.goNamed('stack_pv_audit',
                                            extra: {
                                              'audit_id':
                                                  "${AuditList.data?.auditId ?? ""}"
                                            });
                                      },
                                      child: Text(
                                        'Update',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: Adaptive.sp(14),
                                            fontWeight: FontWeight.w800),
                                      ),
                                    ),
                                  )
                                : Expanded(
                                    child: Center(
                                        child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      MaterialButton(
                                        color: primaryColor,
                                        onPressed: () {},
                                        child: Text(
                                          'Edit',
                                          style: GoogleFonts.aBeeZee(
                                              color: Colors.white),
                                        ),
                                      ),
                                      MaterialButton(
                                        color: Colors.red,
                                        onPressed: () {},
                                        child: Text(
                                          'PDF Download',
                                          style: GoogleFonts.aBeeZee(
                                              color: Colors.white),
                                        ),
                                      )
                                    ],
                                  ))),
                          ]),
                        ),
                      ),
                      Divider(),
                      Container(
                        color: Colors.white,
                        padding: const Pad(all: 10),
                        child: IntrinsicHeight(
                          child: Row(children: [
                            Expanded(
                                child: Text(
                              '${AuditList.data?.auditId ?? '--'}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: Adaptive.sp(14)),
                            )),
                            const VerticalDivider(),
                            Expanded(
                                child: Text(
                              '${AuditList.data?.warehosueName ?? 'Not Found\nwareHouse Name'}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: Adaptive.sp(14)),
                            )),
                            const VerticalDivider(),
                            Expanded(
                                child: Text(
                              "CCTV",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: Adaptive.sp(14)),
                            )),
                            const VerticalDivider(),
                            AuditList.data?.auditCctv == null
                                ? Expanded(
                                    child: AnimatedButton(
                                      height: 50,
                                      color: Colors.red,
                                      width:
                                          MediaQuery.of(context).size.width / 7,
                                      isOutline: true,
                                      isMultiColor: true,
                                      colors: const [
                                        primaryColorDark,
                                        primaryColorDark
                                      ],
                                      borderWidth: 1,
                                      onTap: () {
                                        context.goNamed('cctv_stack_audit',
                                            extra: {
                                              'audit_id':
                                                  "${AuditList.data?.auditId}",
                                              "warehosue_name":
                                                  "${AuditList.data?.warehosueName}"
                                            });
                                      },
                                      child: Text(
                                        'Update',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: Adaptive.sp(14),
                                            fontWeight: FontWeight.w800),
                                      ),
                                    ),
                                  )
                                : Expanded(
                                    child: Center(
                                        child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      MaterialButton(
                                        color: primaryColor,
                                        onPressed: () {
                                          context.goNamed('cctv_audit_edit',
                                              extra: {
                                                'audit_id':
                                                    "${AuditList.data?.auditId}",
                                                "warehosue_name":
                                                    "${AuditList.data?.warehosueName}"
                                              });
                                        },
                                        child: Text(
                                          'Edit',
                                          style: GoogleFonts.aBeeZee(
                                              color: Colors.white),
                                        ),
                                      ),
                                      MaterialButton(
                                        color: Colors.red,
                                        onPressed: () {
                                          context.goNamed('cctv_pdf', extra: {
                                            'audit_id':
                                                "${AuditList.data?.auditId}",
                                            "warehosue_name":
                                                "${AuditList.data?.warehosueName}"
                                          });
                                        },
                                        child: Text(
                                          'PDF Download',
                                          style: GoogleFonts.aBeeZee(
                                              color: Colors.white),
                                        ),
                                      )
                                    ],
                                  ))),
                          ]),
                        ),
                      ),
                      Divider(),
                      Container(
                        color: Colors.white,
                        padding: const Pad(all: 10),
                        child: IntrinsicHeight(
                          child: Row(children: [
                            Expanded(
                                child: Text(
                              '${AuditList.data?.auditId ?? '--'}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: Adaptive.sp(14)),
                            )),
                            const VerticalDivider(),
                            Expanded(
                                child: Text(
                              '${AuditList.data?.warehosueName ?? 'Not Found\nwareHouse Name'}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: Adaptive.sp(14)),
                            )),
                            const VerticalDivider(),
                            Expanded(
                                child: Text(
                              "Lock & key",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: Adaptive.sp(14)),
                            )),
                            const VerticalDivider(),
                            AuditList.data?.auditLock == null
                                ? Expanded(
                                    child: AnimatedButton(
                                      height: 50,
                                      color: Colors.red,
                                      width:
                                          MediaQuery.of(context).size.width / 7,
                                      isOutline: true,
                                      isMultiColor: true,
                                      colors: const [
                                        primaryColorDark,
                                        primaryColorDark
                                      ],
                                      borderWidth: 1,
                                      onTap: () {
                                        context
                                            .goNamed('lock_key_audit', extra: {
                                          'audit_id':
                                              "${AuditList.data?.auditId}",
                                          "warehosue_name":
                                              "${AuditList.data?.warehosueName}"
                                        });
                                      },
                                      child: Text(
                                        'Update',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: Adaptive.sp(14),
                                            fontWeight: FontWeight.w800),
                                      ),
                                    ),
                                  )
                                : Expanded(
                                    child: Center(
                                        child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      MaterialButton(
                                        color: primaryColor,
                                        onPressed: () {
                                          context.goNamed('LockKey_audit_edit',
                                              extra: {
                                                'audit_id':
                                                    "${AuditList.data?.auditId}",
                                                "warehosue_name":
                                                    "${AuditList.data?.warehosueName}"
                                              });
                                        },
                                        child: Text(
                                          'Edit',
                                          style: GoogleFonts.aBeeZee(
                                              color: Colors.white),
                                        ),
                                      ),
                                      MaterialButton(
                                        color: Colors.red,
                                        onPressed: () {
                                          context
                                              .goNamed('lock_key_pdf', extra: {
                                            'audit_id':
                                                "${AuditList.data?.auditId}",
                                            "warehosue_name":
                                                "${AuditList.data?.warehosueName}"
                                          });
                                        },
                                        child: Text(
                                          'PDF Download',
                                          style: GoogleFonts.aBeeZee(
                                              color: Colors.white),
                                        ),
                                      )
                                    ],
                                  ))),
                          ]),
                        ),
                      ),
                      Divider(),
                      Container(
                        color: Colors.white,
                        padding: const Pad(all: 10),
                        child: IntrinsicHeight(
                          child: Row(children: [
                            Expanded(
                                child: Text(
                              '${AuditList.data?.auditId ?? '--'}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: Adaptive.sp(14)),
                            )),
                            const VerticalDivider(),
                            Expanded(
                                child: Text(
                              '${AuditList.data?.warehosueName ?? 'Not Found\nwareHouse Name'}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: Adaptive.sp(14)),
                            )),
                            const VerticalDivider(),
                            Expanded(
                                child: Text(
                              "Fumigation Audit",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: Adaptive.sp(14)),
                            )),
                            const VerticalDivider(),
                            AuditList.data?.auditFumigation == null
                                ? Expanded(
                                    child: AnimatedButton(
                                      height: 50,
                                      color: Colors.red,
                                      width:
                                          MediaQuery.of(context).size.width / 7,
                                      isOutline: true,
                                      isMultiColor: true,
                                      colors: const [
                                        primaryColorDark,
                                        primaryColorDark
                                      ],
                                      borderWidth: 1,
                                      onTap: () {
                                        context.goNamed('fumigation_audit',
                                            extra: {
                                              'audit_id':
                                                  "${AuditList.data?.auditId}",
                                              "warehosue_name":
                                                  "${AuditList.data?.warehosueName}"
                                            });
                                      },
                                      child: Text(
                                        'Update',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: Adaptive.sp(14),
                                            fontWeight: FontWeight.w800),
                                      ),
                                    ),
                                  )
                                : Expanded(
                                    child: Center(
                                        child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      MaterialButton(
                                        color: primaryColor,
                                        onPressed: () {
                                          context.goNamed(
                                              'fumigation_audit_edit',
                                              extra: {
                                                'audit_id':
                                                    "${AuditList.data?.auditId}",
                                                "warehosue_name":
                                                    "${AuditList.data?.warehosueName}"
                                              });
                                        },
                                        child: Text(
                                          'Edit',
                                          style: GoogleFonts.aBeeZee(
                                              color: Colors.white),
                                        ),
                                      ),
                                      MaterialButton(
                                        color: Colors.red,
                                        onPressed: () {
                                          context.goNamed('fumigation_pdf',
                                              extra: {
                                                'audit_id':
                                                    "${AuditList.data?.auditId}",
                                                "warehosue_name":
                                                    "${AuditList.data?.warehosueName}"
                                              });
                                        },
                                        child: Text(
                                          'PDF Download',
                                          style: GoogleFonts.aBeeZee(
                                              color: Colors.white),
                                        ),
                                      )
                                    ],
                                  ))),
                          ]),
                        ),
                      ),
                      Divider(),
                      Container(
                        color: Colors.white,
                        padding: const Pad(all: 10),
                        child: IntrinsicHeight(
                          child: Row(children: [
                            Expanded(
                                child: Text(
                              '${AuditList.data?.auditId ?? '--'}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: Adaptive.sp(14)),
                            )),
                            const VerticalDivider(),
                            Expanded(
                                child: Text(
                              '${AuditList.data?.warehosueName ?? 'Not Found\nwareHouse Name'}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: Adaptive.sp(14)),
                            )),
                            const VerticalDivider(),
                            Expanded(
                                child: Text(
                              "Assets",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: Adaptive.sp(14)),
                            )),
                            const VerticalDivider(),
                            AuditList.data?.auditAssets == null
                                ? Expanded(
                                    child: AnimatedButton(
                                      height: 50,
                                      color: Colors.red,
                                      width:
                                          MediaQuery.of(context).size.width / 7,
                                      isOutline: true,
                                      isMultiColor: true,
                                      colors: const [
                                        primaryColorDark,
                                        primaryColorDark
                                      ],
                                      borderWidth: 1,
                                      onTap: () {
                                        //   print(AuditList.data);
                                        context.goNamed('assets_audit', extra: {
                                          'audit_id':
                                              "${AuditList.data?.auditId ?? ""}",
                                          "warehosue_name":
                                              "${AuditList.data?.warehosueName ?? ""}"
                                        });
                                      },
                                      child: Text(
                                        'Update',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: Adaptive.sp(14),
                                            fontWeight: FontWeight.w800),
                                      ),
                                    ),
                                  )
                                : Expanded(
                                    child: Center(
                                        child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      MaterialButton(
                                        color: primaryColor,
                                        onPressed: () {
                                          context.goNamed('assets_audit_edit',
                                              extra: {
                                                'audit_id':
                                                    "${AuditList.data?.auditId}",
                                                "warehosue_name":
                                                    "${AuditList.data?.warehosueName}"
                                              });
                                        },
                                        child: Text(
                                          'Edit',
                                          style: GoogleFonts.aBeeZee(
                                              color: Colors.white),
                                        ),
                                      ),
                                      MaterialButton(
                                        color: Colors.red,
                                        onPressed: () {
                                          context.goNamed('assets_pdf', extra: {
                                            'audit_id':
                                                "${AuditList.data?.auditId}",
                                            "warehosue_name":
                                                "${AuditList.data?.warehosueName}"
                                          });
                                        },
                                        child: Text(
                                          'PDF Download',
                                          style: GoogleFonts.aBeeZee(
                                              color: Colors.white),
                                        ),
                                      )
                                    ],
                                  ))),
                          ]),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      AnimatedButton(
                        height: 50,
                        color: Colors.red,
                        width: MediaQuery.of(context).size.width / 1.5,
                        isOutline: true,
                        isMultiColor: true,
                        colors: const [primaryColorDark, primaryColorDark],
                        borderWidth: 1,
                        onTap: () {
                          context.goNamed('main_page_pdf', extra: {
                            'audit_id': "${AuditList.data?.auditId ?? ""}",
                            "warehosue_name":
                                "${AuditList.data?.warehosueName ?? ""}"
                          });
                        },
                        child: Text(
                          'Download Main Page PDF',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: Adaptive.sp(14),
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                    ],
                  ),
                ),
            error: (e, s) => Text(''),
            loading: () => loader(context)));
  }
}
