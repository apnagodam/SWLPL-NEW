import 'package:button_animations/button_animations.dart';
import 'package:dio/dio.dart';
import 'package:emp_apnagodam/Data/Models/UpdatePhisicalAuditEdit.dart';
import 'package:emp_apnagodam/Domain/Audit/AuditService.dart';
import 'package:emp_apnagodam/Presentation/Constants/ColorConstant.dart';
import 'package:emp_apnagodam/Presentation/Widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EditPhysicalAuditScreen extends ConsumerStatefulWidget {
  const EditPhysicalAuditScreen(
      {super.key, required this.auditid, required this.warehousename});

  final String? auditid;
  final String? warehousename;

  @override
  ConsumerState<EditPhysicalAuditScreen> createState() =>
      _LockAndKeyScreenState();
}

final formKey = GlobalKey<FormState>();
List<TextEditingController> stackcontrollerList = [];
List<TextEditingController> commoditycontrollerList = [];
List<TextEditingController> auditbagcontrollerList = [];
List<TextEditingController> remarkcontrollerList = [];

class _LockAndKeyScreenState extends ConsumerState<EditPhysicalAuditScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Stack Physical Edit'),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text('Audit Number'),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: '${widget.auditid}'),
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text('Warehouse Name'),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: '${widget.warehousename}'),
            ),
            SizedBox(
              height: 10,
            ),
            ref.watch(physicalAuditEditProvider(Id: widget.auditid)).when(
                data: (PhysicalEdit) {
                  // stackcontrollerList.clear();
                  // commoditycontrollerList.clear();
                  // auditbagcontrollerList.clear();
                  // remarkcontrollerList.clear();

                  // Initialize controllers with current data
                  for (var physicalData in PhysicalEdit.data ?? []) {
                    stackcontrollerList
                        .add(TextEditingController(text: physicalData.stackNo));
                    commoditycontrollerList.add(
                        TextEditingController(text: physicalData.category));
                    auditbagcontrollerList.add(TextEditingController(
                        text: physicalData.auditBags.toString()));
                    remarkcontrollerList
                        .add(TextEditingController(text: physicalData.remark));
                  }

                  return Column(
                    children: [
                      ListView.builder(
                        itemCount: PhysicalEdit.data?.length ?? 0,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(5)),
                            padding: const EdgeInsets.all(10),
                            child: IntrinsicHeight(
                              child: Column(children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Expanded(child: Text('   Stack Number*')),
                                    Expanded(child: Text('   Commodity*.')),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: TextFormField(
                                        controller: stackcontrollerList[index],
                                        readOnly: true,
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder()),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: TextFormField(
                                        readOnly: true,
                                        controller:
                                            commoditycontrollerList[index],
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder()),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Expanded(child: Text('   Audit Bags*')),
                                    Expanded(child: Text('   Remark.')),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: TextFormField(
                                        controller:
                                            auditbagcontrollerList[index],
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder()),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: TextFormField(
                                        controller: remarkcontrollerList[index],
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder()),
                                      ),
                                    ),
                                  ],
                                ),
                              ]),
                            ),
                          );
                        },
                      ),
                      AnimatedButton(
                        color: primaryColorDark,
                        width: MediaQuery.of(context).size.width / 1.1,
                        height: 50,
                        isOutline: true,
                        isMultiColor: true,
                        colors: [primaryColorDark, primaryColorDark],
                        borderWidth: 1,
                        onTap: () {
                          List<PhysicalDatum> saveDatumList = [];

                          // Collect updated values from controllers
                          for (int i = 0; i < stackcontrollerList.length; i++) {
                            saveDatumList.add(PhysicalDatum(
                              auditBags: auditbagcontrollerList[i].text,
                              commodityId: commoditycontrollerList[i].text,
                              remark: remarkcontrollerList[i].text,
                              stackNo: stackcontrollerList[i].text,
                            ));
                          }

                          if (saveDatumList.isNotEmpty) {
                            PhysicalAuditUpdateModal stackModel =
                                PhysicalAuditUpdateModal(
                              auditId: int.parse('${widget.auditid}'),
                              data: saveDatumList,
                            );

                            // Make API request and handle response
                            ref
                                .watch(updatePhisicalAuditProvider(
                                        model: stackModel)
                                    .future)
                                .then((value) {
                              hideLoaderDialog(context);

                              if (value['status'] == "1") {
                                Fluttertoast.showToast(msg: value['message']);
                              } else {
                                Fluttertoast.showToast(
                                    msg: "Update failed: ${value['message']}");
                              }
                            }).onError((e, s) {
                              hideLoaderDialog(context);
                              Fluttertoast.showToast(msg: "Error: $e, $s");
                            });
                          }
                        },
                        child: const Text(
                          "Submit",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  );
                },
                error: (e, s) => (e is DioException)
                    ? Center(child: errorWidget("please check your internet"))
                    : Text(e.toString()),
                loading: () => loader(context)),
          ],
        ),
      ),
    );
  }
}
