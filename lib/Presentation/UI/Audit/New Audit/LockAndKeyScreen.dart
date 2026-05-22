// ignore_for_file: must_be_immutable

import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:button_animations/button_animations.dart';
import 'package:emp_apnagodam/Data/Models/LockAndKeyModal.dart';
import 'package:emp_apnagodam/Domain/Audit/AuditService.dart';
import 'package:emp_apnagodam/Presentation/Constants/ColorConstant.dart';
import 'package:emp_apnagodam/Presentation/Widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:emp_apnagodam/Presentation/utils/debouncer.dart' as mDebounce;

class LockKeyStackAudit extends ConsumerStatefulWidget {
  const LockKeyStackAudit(
      {super.key, required this.auditid, required this.warehousename});

  final String? auditid;
  final String? warehousename;
  @override
  ConsumerState<LockKeyStackAudit> createState() => _LockAndKeyScreenState();
}

class _LockAndKeyScreenState extends ConsumerState<LockKeyStackAudit> {
  final formKey = GlobalKey<FormState>();
  var listOfBlocks = StateProvider<List<LockKeyDatum>?>((ref) => []);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Lock & Key'),
          foregroundColor: Colors.white,
        ),
        body: ref.watch(ShowStackAuditProvider(Id: widget.auditid)).when(
            data: (stackData) => Padding(
                  padding: const EdgeInsets.all(18.0),
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
                        padding:
                            EdgeInsets.symmetric(vertical: 13, horizontal: 20),
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
                        padding:
                            EdgeInsets.symmetric(vertical: 13, horizontal: 20),
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(7)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          ref.watch(listOfBlocks.notifier).state = [
                            ...ref.watch(listOfBlocks) ?? [],
                            LockKeyDatum(
                                sealNo: "", lockNo: "", keyNo: "", remark: "")
                          ];
                          setState(() {});
                        },
                        child: Container(
                          width: double.infinity,
                          child: Center(
                            child: Text(
                              'Add Lock & Key',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: primaryColor,
                                  fontSize: Adaptive.sp(14),
                                  fontWeight: FontWeight.w800),
                            ),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 8),
                          decoration: BoxDecoration(
                              border: Border.all(color: primaryColor),
                              borderRadius: BorderRadius.circular(5)),
                        ),
                      ),
                      if ((ref.watch(listOfBlocks) ?? []).isNotEmpty)
                        ListView.builder(
                            shrinkWrap: true,
                            itemCount: ref.watch(listOfBlocks)?.length,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Stack(children: [
                                Card(
                                  child: Padding(
                                    padding: const Pad(all: 10),
                                    child: ColumnSuper(children: [
                                      Text(
                                        'Lock & Key ${index + 1}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w900,
                                            color: primaryColorDark,
                                            fontSize: Adaptive.sp(16),
                                            decoration:
                                                TextDecoration.underline),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(children: [
                                        Expanded(
                                            child: TextFormField(
                                          onChanged: (value) {
                                            mDebounce.Debouncer(
                                                    delay: Duration(
                                                        milliseconds: 500))
                                                .call(() {
                                              ref
                                                  .watch(listOfBlocks.notifier)
                                                  .state?[index]
                                                  .lockNo = value;

                                              Fluttertoast.showToast(
                                                  msg:
                                                      '${ref.watch(listOfBlocks.notifier).state?[index].keyNo}');
                                            });
                                          },
                                          decoration: InputDecoration(
                                              labelText: "Lock No.",
                                              contentPadding: const Pad(
                                                  top: 0, bottom: 0, left: 10),
                                              disabledBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  borderSide: const BorderSide(
                                                      color: primaryColorDark)),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              enabledBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5))),
                                        )),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Expanded(
                                            child: TextFormField(
                                          onChanged: (value) {
                                            mDebounce.Debouncer(
                                                    delay: Duration(
                                                        milliseconds: 500))
                                                .call(() {
                                              ref
                                                  .watch(listOfBlocks.notifier)
                                                  .state?[index]
                                                  .keyNo = value;

                                              Fluttertoast.showToast(
                                                  msg:
                                                      '${ref.watch(listOfBlocks.notifier).state?[index].keyNo}');
                                            });
                                          },
                                          decoration: InputDecoration(
                                              labelText: "key No.",
                                              contentPadding: const Pad(
                                                  top: 0, bottom: 0, left: 10),
                                              disabledBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  borderSide: const BorderSide(
                                                      color: primaryColorDark)),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              enabledBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5))),
                                        )),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                      ]),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(children: [
                                        Expanded(
                                            child: TextFormField(
                                          onChanged: (value) {
                                            mDebounce.Debouncer(
                                                    delay: Duration(
                                                        milliseconds: 500))
                                                .call(() {
                                              ref
                                                  .watch(listOfBlocks.notifier)
                                                  .state?[index]
                                                  .sealNo = value;
                                              Fluttertoast.showToast(
                                                  msg:
                                                      '${ref.watch(listOfBlocks.notifier).state?[index].keyNo}');
                                            });
                                          },
                                          decoration: InputDecoration(
                                              labelText: "Seal No.",
                                              contentPadding: const Pad(
                                                  top: 0, bottom: 0, left: 10),
                                              disabledBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  borderSide: const BorderSide(
                                                      color: primaryColorDark)),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              enabledBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5))),
                                        )),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Expanded(
                                            child: TextFormField(
                                          onChanged: (value) {
                                            mDebounce.Debouncer(
                                                    delay: Duration(
                                                        milliseconds: 500))
                                                .call(() {
                                              ref
                                                  .watch(listOfBlocks.notifier)
                                                  .state?[index]
                                                  .remark = value;
                                              Fluttertoast.showToast(
                                                  msg:
                                                      '${ref.watch(listOfBlocks.notifier).state?[index].keyNo}');
                                            });
                                          },
                                          decoration: InputDecoration(
                                              labelText: "Remark ",
                                              contentPadding: const Pad(
                                                  top: 0, bottom: 0, left: 10),
                                              disabledBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  borderSide: const BorderSide(
                                                      color: primaryColorDark)),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              enabledBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5))),
                                        )),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                      ]),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                    ]),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: FloatingActionButton.small(
                                    onPressed: () {
                                      ref.watch(listOfBlocks)?.removeAt(index);
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
                              ]);
                            }),
                      SizedBox(
                        height: 10,
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
                          var lAndKeyModel = LockAndKeyModal(
                              auditId: widget.auditid,
                              data: ref.watch(listOfBlocks) ?? []);

                          showLoaderDialog(context);

                          ref
                              .watch(postLockAndKeyProvider(model: lAndKeyModel)
                                  .future)
                              .then((value) {
                            hideLoaderDialog(context);

                            if (value['status'] == "1") {
                              context.pop();
                            }
                            Fluttertoast.showToast(msg: value['message']);
                          }).onError((e, s) {
                            hideLoaderDialog(context);
                          });
                        },
                        child: Text(
                          'Submit',
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
