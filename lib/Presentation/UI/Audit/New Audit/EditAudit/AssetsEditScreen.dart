import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:button_animations/button_animations.dart';
import 'package:emp_apnagodam/Data/Models/UpdateAssetsEditModal.dart';
import 'package:emp_apnagodam/Domain/Audit/AuditService.dart';
import 'package:emp_apnagodam/Presentation/Constants/ColorConstant.dart';
import 'package:emp_apnagodam/Presentation/Widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AssetsAuditEditScreen extends ConsumerStatefulWidget {
  const AssetsAuditEditScreen(
      {super.key, required this.auditid, required this.warehousename});

  final String? auditid;
  final String? warehousename;

  @override
  ConsumerState<AssetsAuditEditScreen> createState() =>
      _LockAndKeyScreenState();
}

List<TextEditingController> NumberControllerList = [];
List<TextEditingController> remarkcontrollerList = [];

class _LockAndKeyScreenState extends ConsumerState<AssetsAuditEditScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Assets Audit Edit'),
        foregroundColor: Colors.white,
      ),
      body: ListView(children: [
        Padding(
          padding:
              const EdgeInsets.only(top: 10, left: 10, bottom: 0, right: 10),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text('Audit ID'),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: '${widget.auditid}'),
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text('WareHouse Name'),
              ),
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: '${widget.warehousename}'),
              ),
              SizedBox(
                height: 10,
              ),
              ref.watch(editAssetsProvider(auditId: '${widget.auditid}')).when(
                  data: (AssetsEdit) => Column(
                        children: [
                          ListView.builder(
                            itemCount: AssetsEdit.data?.length ?? 0,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              AssetsEdit.data?.forEach((e) {
                                NumberControllerList.add(
                                    TextEditingController());
                                remarkcontrollerList
                                    .add(TextEditingController());
                              });
                              return Card(
                                elevation: 2,
                                child: Container(
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5)),
                                  padding: const Pad(all: 10),
                                  child: IntrinsicHeight(
                                    child: Column(children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                              child: Text('  Assets Name')),
                                          Expanded(
                                              child:
                                                  Text('   Number Of Items*.')),
                                          Expanded(child: Text('   Remark*')),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: TextFormField(
                                              readOnly: true,
                                              decoration: InputDecoration(
                                                  border: OutlineInputBorder(),
                                                  hintText:
                                                      '${AssetsEdit.data?[index].assetName}'),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                            child: TextFormField(
                                              controller:
                                                  NumberControllerList[index],
                                              keyboardType:
                                                  TextInputType.number,
                                              decoration: InputDecoration(
                                                labelText:
                                                    '${AssetsEdit.data?[index].assetId}',
                                                border: OutlineInputBorder(),
                                                hintText: 'Assets Name',
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                            child: TextFormField(
                                              controller:
                                                  remarkcontrollerList[index],
                                              decoration: InputDecoration(
                                                hintText:
                                                    '${AssetsEdit.data?[index].remark}',
                                                border: OutlineInputBorder(),
                                              ),
                                              keyboardType: TextInputType.name,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ]),
                                  ),
                                ),
                              );
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          AnimatedButton(
                            color: primaryColorDark,
                            width: MediaQuery.of(context).size.width / 1.1,
                            height: 50,
                            isOutline: true,
                            isMultiColor: true,
                            colors: [primaryColorDark, primaryColorDark],
                            borderWidth: 1,
                            onTap: () async {
                              List<AssetsUpdateDatum> saveDatumList = [];

                              for (int i = 0;
                                  i < NumberControllerList.length;
                                  i++) {
                                if (i < AssetsEdit.data!.length) {
                                  var assetId = AssetsEdit.data?[i].assetId;
                                  saveDatumList.add(AssetsUpdateDatum(
                                      remark: remarkcontrollerList[i].text,
                                      assetId: '${assetId}',
                                      value: NumberControllerList[i].text));
                                }
                              }

                              if (saveDatumList.isNotEmpty) {
                                AssetsUpdateRequestModel stackModel =
                                    AssetsUpdateRequestModel(
                                  auditId: '${widget.auditid}',
                                  data: saveDatumList,
                                );

                                try {
                                  var value = await ref.watch(
                                      assetsEditUpdateProvider(
                                              model: stackModel)
                                          .future);

                                  hideLoaderDialog(context);

                                  if (value['status'] == "1") {
                                    Fluttertoast.showToast(
                                        msg: value['message']);
                                  } else {
                                    Fluttertoast.showToast(
                                        msg: 'Error: ${value['message']}');
                                  }
                                } catch (e) {
                                  hideLoaderDialog(context);

                                  Fluttertoast.showToast(
                                      msg: 'Error: ${e.toString()}');
                                  print('Error: ${e.toString()}');
                                } finally {}
                              } else {
                                Fluttertoast.showToast(
                                    msg: 'Please fill all required fields.');
                              }
                            },
                            child: const Text(
                              "Submit",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                  error: (e, s) => Center(child: Text('')),
                  loading: () => loader(context))
            ],
          ),
        ),
      ]),
    );
  }
}
