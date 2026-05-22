// ignore_for_file: deprecated_member_use

import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:dio/dio.dart';
import 'package:emp_apnagodam/Domain/Audit/AuditService.dart';
import 'package:emp_apnagodam/Presentation/Constants/ColorConstant.dart';
import 'package:emp_apnagodam/Presentation/Widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CompletedAuditScreenPage extends ConsumerStatefulWidget {
  const CompletedAuditScreenPage({super.key});

  @override
  ConsumerState<CompletedAuditScreenPage> createState() =>
      _AuditneighbourState();
}

class _AuditneighbourState extends ConsumerState<CompletedAuditScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Completed Audit '),
        ),
        body: ref.watch(completeauditProvider).when(
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
                            "End date",
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
                                child: Text.rich(
                              TextSpan(
                                text: "${data.data?[index].endDate ?? ""}",
                              ),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: Adaptive.sp(14)),
                            )),
                          ]),
                        ),
                      ),
                    ),
                  ],
                ),
            error: (e, s) => (e is DioException)
                ? Center(
                    child: errorWidget("please check your internet"),
                  )
                : Text(e.toString()),
            loading: () => loader(context)));
  }
}
