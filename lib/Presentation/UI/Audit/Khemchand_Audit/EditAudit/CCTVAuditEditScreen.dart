import 'package:button_animations/button_animations.dart';
import 'package:dio/dio.dart';
import 'package:emp_apnagodam/Data/Models/UpdateCCTVModal.dart';
import 'package:emp_apnagodam/Domain/Audit/AuditService.dart';
import 'package:emp_apnagodam/Presentation/Constants/ColorConstant.dart';
import 'package:emp_apnagodam/Presentation/UI/PV/PVScreen.dart';
import 'package:emp_apnagodam/Presentation/Widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CCTVAuditEditScreen extends ConsumerStatefulWidget {
  const CCTVAuditEditScreen(
      {super.key, required this.auditid, required this.warehousename});

  final String? auditid;
  final String? warehousename;

  @override
  ConsumerState<CCTVAuditEditScreen> createState() => _LockAndKeyScreenState();
}

List<TextEditingController> cameracontrollerList = [];
List<TextEditingController> remarkcontrollerList = [];

class _LockAndKeyScreenState extends ConsumerState<CCTVAuditEditScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('CCTV Audit Edit'),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text('Audit Number'),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              child: Text('${widget.auditid}'),
              padding: EdgeInsets.symmetric(vertical: 13, horizontal: 20),
              decoration: BoxDecoration(
                  border: Border.all(), borderRadius: BorderRadius.circular(7)),
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text('Warehouse Name'),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              width: double.infinity,
              child: Text('${widget.warehousename}'),
              padding: EdgeInsets.symmetric(vertical: 13, horizontal: 20),
              decoration: BoxDecoration(
                  border: Border.all(), borderRadius: BorderRadius.circular(7)),
            ),
            SizedBox(
              height: 20,
            ),
            ref.watch(cctvAuditEditProvider(Id: widget.auditid)).when(
                data: (CctvEdit) {
                  // cameracontrollerList.clear();
                  // remarkcontrollerList.clear();

                  for (var cctvData in CctvEdit.data ?? []) {
                    cameracontrollerList.add(
                        TextEditingController(text: cctvData.cameraNo ?? ''));
                    remarkcontrollerList.add(
                        TextEditingController(text: cctvData.remark ?? ''));
                  }

                  return Column(
                    children: [
                      ListView.builder(
                        itemCount: CctvEdit.data?.length ?? 0,
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
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                          child: Text('   Camera Number*')),
                                      Expanded(child: Text('   Remark*')),
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
                                              cameracontrollerList[index],
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                              hintText: 'Camera ${index + 1}',
                                              border: OutlineInputBorder()),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: TextFormField(
                                          controller:
                                              remarkcontrollerList[index],
                                          keyboardType: TextInputType.text,
                                          decoration: InputDecoration(
                                              hintText: 'Enter Remark',
                                              border: OutlineInputBorder()),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
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
                          List<CameraDatum> saveDatumList = [];

                          int length = cameracontrollerList.length;
                          for (int i = 0; i < length; i++) {
                            if (i < CctvEdit.data!.length) {
                              saveDatumList.add(CameraDatum(
                                cameraNo: cameracontrollerList[i].text,
                                remark: remarkcontrollerList[i].text,
                              ));
                            }
                          }

                          if (saveDatumList.isNotEmpty) {
                            CctvUpdateModal stackModel = CctvUpdateModal(
                              data: saveDatumList,
                              auditId: '${widget.auditid}'.toInt(),
                            );

                            ref
                                .watch(updateCctvEditProvider(model: stackModel)
                                    .future)
                                .then((value) {
                              hideLoaderDialog(context);

                              if (value['status'] == "1") {
                                Fluttertoast.showToast(msg: value['message']);
                              }
                            }).onError((e, s) {
                              hideLoaderDialog(context);
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
                    ? Center(
                        child: errorWidget("Please check your internet"),
                      )
                    : Text(e.toString()),
                loading: () => loader(context)),
          ],
        ),
      ),
    );
  }
}
