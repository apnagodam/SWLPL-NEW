import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:button_animations/button_animations.dart';
import 'package:dio/dio.dart';
import 'package:emp_apnagodam/Data/Models/UpdateFumigationEditModal.dart';
import 'package:emp_apnagodam/Domain/Audit/AuditService.dart';
import 'package:emp_apnagodam/Presentation/Constants/ColorConstant.dart';
import 'package:emp_apnagodam/Presentation/Widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class FumigationEditScreen extends ConsumerStatefulWidget {
  const FumigationEditScreen(
      {super.key, required this.auditid, required this.warehousename});

  final String? auditid;
  final String? warehousename;

  @override
  ConsumerState<FumigationEditScreen> createState() => _LockAndKeyScreenState();
}

final reasonKey = GlobalKey<FormState>();

bool isButtonDisabled = false;
final formKey = GlobalKey<FormState>();
List<TextEditingController> bagsControllerList = [];
List<TextEditingController> controllerList = [];

Future<void> _selectDate(BuildContext context, int controllerIndex) async {
  DateTime initialDate = DateTime.now();
  DateTime? pickedDate = await showDatePicker(
    context: context,
    initialDate: initialDate,
    firstDate: DateTime(2000),
    lastDate: DateTime(2101),
  );

  if (pickedDate != null) {
    String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);

    bagsControllerList[controllerIndex].text = formattedDate;
  }
}

class _LockAndKeyScreenState extends ConsumerState<FumigationEditScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Fumigation Audit Edit'),
          foregroundColor: Colors.white,
        ),
        body: ref
            .watch(fumigationListProvider(auditId: "${widget.auditid}"))
            .when(
                data: (FumigationEdit) => ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text('Audit ID'),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 15),
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all()),
                                child: Text("${widget.auditid}"),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text('WareHouse Name'),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 15),
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all()),
                                child: Text("${widget.warehousename}"),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text('Stack No.'),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  // stackData == null &&
                                  //         stackData.data?.length == 0
                                  //     ? CircularProgressIndicator()
                                  //     :
                                  ListView.builder(
                                    itemCount: FumigationEdit.data?.length ?? 0,
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      FumigationEdit.data?.forEach((e) {
                                        bagsControllerList
                                            .add(TextEditingController());
                                        controllerList
                                            .add(TextEditingController());
                                      });
                                      return Container(
                                        margin:
                                            EdgeInsets.symmetric(vertical: 10),
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.grey),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        padding: const Pad(all: 10),
                                        child: IntrinsicHeight(
                                          child: Column(children: [
                                            // Row(
                                            //   children: [
                                            //     Text('SN.Number ${index + 1},',
                                            //         style: GoogleFonts.aBeeZee(
                                            //             color: primaryColor)),
                                            //     SizedBox(
                                            //       width: 10,
                                            //     ),
                                            //     Text(
                                            //         'Category Name:- ${FumigationEdit.data?[index].},')
                                            //   ],
                                            // ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                Expanded(
                                                    child: Text(
                                                        '   Stack Number')),
                                                Expanded(
                                                    child: Text(
                                                        '  Fumigation Date.')),
                                                Expanded(
                                                    child: Text('   Remark')),
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
                                                        border:
                                                            OutlineInputBorder(),
                                                        hintText:
                                                            '${FumigationEdit.data?[index].stackNo}'),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Expanded(
                                                  child: TextFormField(
                                                    controller:
                                                        bagsControllerList[
                                                            index],
                                                    decoration: InputDecoration(
                                                      border:
                                                          OutlineInputBorder(),
                                                      hintText:
                                                          '${FumigationEdit.data?[index].fumigationDate}',
                                                    ),
                                                    readOnly: true,
                                                    onTap: () => _selectDate(
                                                        context, index),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Expanded(
                                                  child: TextFormField(
                                                    controller:
                                                        controllerList[index],
                                                    decoration: InputDecoration(
                                                        border:
                                                            OutlineInputBorder(),
                                                        hintText:
                                                            '${FumigationEdit.data?[index].remark}'),
                                                    keyboardType:
                                                        TextInputType.name,
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
                                    width:
                                        MediaQuery.of(context).size.width / 1.1,
                                    height: 50,
                                    isOutline: true,
                                    isMultiColor: true,
                                    colors: [
                                      primaryColorDark,
                                      primaryColorDark
                                    ],
                                    borderWidth: 1,
                                    onTap: () async {
                                      List<FumigationUpdateDatum>
                                          saveDatumList = [];

                                      for (int i = 0;
                                          i < controllerList.length;
                                          i++) {
                                        if (i < FumigationEdit.data!.length) {
                                          saveDatumList
                                              .add(FumigationUpdateDatum(
                                            stackNo:
                                                FumigationEdit.data?[i].stackNo,
                                            remark: controllerList[i].text,
                                            fumigationDate: bagsControllerList[
                                                        i]
                                                    .text
                                                    .isNotEmpty
                                                ? DateTime.tryParse(
                                                    bagsControllerList[i].text)
                                                : null,
                                          ));
                                        }
                                      }

                                      if (saveDatumList.isNotEmpty) {
                                        FumigatiomUpdateEditModal stackModel =
                                            FumigatiomUpdateEditModal(
                                          auditId: widget.auditid,
                                          data: saveDatumList,
                                        );
                                        await ref
                                            .watch(UpdateFumigationProvider(
                                                    model: stackModel)
                                                .future)
                                            .then((value) {
                                          hideLoaderDialog(context);
                                          if (value['status'] == "1") {
                                            // context.pop();
                                          }
                                          Fluttertoast.showToast(
                                              msg: value['message']);
                                        });

//
                                      } else {
                                        Fluttertoast.showToast(
                                            msg:
                                                'Please fill all required fields.');
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
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                error: (e, s) => (e is DioException)
                    ? Center(
                        child: errorWidget("Please check your internet"),
                      )
                    : Text(e.toString()),
                loading: () => loader(context)));
  }
}
