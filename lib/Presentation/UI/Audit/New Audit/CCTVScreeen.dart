// ignore_for_file: must_be_immutable, unnecessary_null_comparison

import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:button_animations/button_animations.dart';
import 'package:emp_apnagodam/Data/Models/CCTVAuditModal.dart';
import 'package:emp_apnagodam/Data/Models/PVModel.dart';
import 'package:emp_apnagodam/Domain/Audit/AuditService.dart';
import 'package:emp_apnagodam/Presentation/Constants/ColorConstant.dart';
import 'package:emp_apnagodam/Presentation/Widgets/widgets.dart';
import 'package:emp_apnagodam/Presentation/utils/debouncer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// class CCTVStackAudit extends ConsumerWidget {
//   CCTVStackAudit(
//       {super.key, required this.auditid, required this.warehousename});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return
class CCTVStackAudit extends ConsumerStatefulWidget {
  const CCTVStackAudit(
      {super.key, required this.auditid, required this.warehousename});

  final String? auditid;
  final String? warehousename;
  @override
  ConsumerState<CCTVStackAudit> createState() => _LockAndKeyScreenState();
}

class _LockAndKeyScreenState extends ConsumerState<CCTVStackAudit> {
  String? auditid;
  String? warehousename;
  final reasonKey = GlobalKey<FormState>();
  TextEditingController searchController = TextEditingController();
  List<TextEditingController> controllerList = [];
  List<TextEditingController> remarkControllerList = [];
  final formKey = GlobalKey<FormState>();

  var selectedAuditProvider = StateProvider<CCTVDatum?>((ref) => null);
  var listOfCCTV = StateProvider<List<CCTVDatum>?>((ref) => []);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('CCTV Audit'),
          foregroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(' Audit Number'),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  child: Text('${widget.auditid}'),
                  padding: EdgeInsets.symmetric(vertical: 13, horizontal: 20),
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(7)),
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(' WareHouse Name'),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  width: double.infinity,
                  child: Text('${widget.warehousename}'),
                  padding: EdgeInsets.symmetric(vertical: 13, horizontal: 20),
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(7)),
                ),
                SizedBox(
                  height: 18,
                ),
                InkWell(
                  child: Container(
                    width: double.infinity,
                    padding: Pad(all: 10),
                    child: Text(
                      'Add Camera',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: primaryColorDark,
                          fontSize: Adaptive.sp(14),
                          fontWeight: FontWeight.w800),
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(color: primaryColorDark),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  onTap: () async {
                    ref.watch(listOfCCTV.notifier).state = [
                      ...ref.watch(listOfCCTV) ?? [],
                      CCTVDatum()
                    ];
                  },
                ),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: ref.watch(listOfCCTV)?.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Stack(
                        children: [
                          Card(
                            child: Padding(
                                padding: const Pad(all: 10),
                                child: ColumnSuper(children: [
                                  Row(children: [
                                    Expanded(
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                            label: Text('Camera No*'),
                                            contentPadding: const Pad(
                                                top: 0, bottom: 0, left: 10),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5))),
                                        onChanged: (value) {
                                          Debouncer(
                                                  delay: Duration(
                                                      milliseconds: 500))
                                              .call(() {
                                            ref
                                                .watch(listOfCCTV.notifier)
                                                .state?[index]
                                                .cameraNo = value;
                                          });
                                        },
                                        keyboardType: TextInputType.number,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Expanded(
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                            label: Text('Remark.*'),
                                            contentPadding: const Pad(
                                                top: 0, bottom: 0, left: 10),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5))),
                                        onChanged: (value) {
                                          Debouncer(
                                                  delay: Duration(
                                                      milliseconds: 500))
                                              .call(() {
                                            ref
                                                .watch(listOfCCTV.notifier)
                                                .state?[index]
                                                .remark = value;
                                          });
                                        },
                                        keyboardType: TextInputType.multiline,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                  ]),
                                ])),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: FloatingActionButton.small(
                              onPressed: () {
                                ref.watch(listOfCCTV)?.removeAt(index);
                                setState(() {});
                              },
                              child: Icon(
                                Icons.close,
                                size: Adaptive.sp(20),
                                color: Colors.white,
                              ),
                              shape: CircleBorder(),
                              backgroundColor: Colors.red.shade700,
                            ),
                          )
                        ],
                      );
                    }),
                SizedBox(
                  height: 20,
                ),
                AnimatedButton(
                  height: 50,
                  color: Colors.red,
                  width: Adaptive.w(90),
                  isOutline: true,
                  isMultiColor: true,
                  colors: const [primaryColorDark, primaryColorDark],
                  borderWidth: 1,
                  onTap: () {
                    var cctvAuditModel = CctvAuditModal(
                        auditId: widget.auditid, data: ref.watch(listOfCCTV));

                    // print(cctvAuditModel.auditId);
                    // print([...cctvAuditModel.data!]);
                    showLoaderDialog(context);
                    ref
                        .watch(
                            postCCTVAuditProvider(model: cctvAuditModel).future)
                        .then((value) {
                      hideLoaderDialog(context);

                      if (value['status'].toString() == "1") {
                        context.pop();
                      }
                      Fluttertoast.showToast(msg: value['message'].toString());
                    }).onError((e, s) {
                      hideLoaderDialog(context);
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
              ],
            ),
          ),
        ));
  }

  var listOfBlocks = StateProvider<List<BlockNo>>((ref) => []);
}
