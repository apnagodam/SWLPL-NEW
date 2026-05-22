import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:dio/dio.dart';
import 'package:emp_apnagodam/Domain/Audit/AuditService.dart';
import 'package:emp_apnagodam/Presentation/Constants/ColorConstant.dart';
import 'package:emp_apnagodam/Presentation/Widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class StackQualityEditListScreen extends ConsumerStatefulWidget {
  const StackQualityEditListScreen(
      {super.key,
      required this.auditid,
      required this.warehousename,
      required this.stackNo});

  final String? auditid;

  final String? warehousename;
  final String? stackNo;
  @override
  ConsumerState<StackQualityEditListScreen> createState() =>
      _LockAndKeyScreenState();
}

class _LockAndKeyScreenState extends ConsumerState<StackQualityEditListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Stack Quality Edit List'),
        ),
        body:
            ref.watch(stackEditListProvider(auditId: '${widget.auditid}')).when(
                  data: (StackList) => ListView(
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
                              "Stack Number",
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
                          itemCount: StackList.data?.length ?? 0,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => Container(
                              color: index % 2 == 0
                                  ? Colors.grey.withOpacity(0.2)
                                  : Colors.white,
                              padding: const Pad(all: 10),
                              child: IntrinsicHeight(
                                  child: Row(children: [
                                Container(
                                  color: primaryColorDark,
                                  padding: const Pad(all: 10),
                                  child: IntrinsicHeight(
                                    child: Row(children: [
                                      Expanded(
                                          child: Text(
                                        "${StackList.data?[index].auditId}",
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
                                        "Stack Number",
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
                              ])))),
                    ],
                  ),
                  error: (e, s) => (e is DioException)
                      ? Center(
                          child: errorWidget("Please check your internet"),
                        )
                      : Text(e.toString()),
                  loading: () => loader(context),
                ));
  }
}
