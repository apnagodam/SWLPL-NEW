// ignore_for_file: must_be_immutable

import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:button_animations/button_animations.dart';
import 'package:emp_apnagodam/Data/Models/FumigationAuditModal.dart';
import 'package:emp_apnagodam/Data/Models/StackModal.dart';
import 'package:emp_apnagodam/Domain/Audit/AuditService.dart';
import 'package:emp_apnagodam/Presentation/Constants/ColorConstant.dart';
import 'package:emp_apnagodam/Presentation/UI/PV/PVScreen.dart';
import 'package:emp_apnagodam/Presentation/Widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class FumigationAudit extends ConsumerWidget {
  FumigationAudit(
      {super.key, required this.auditid, required this.warehousename});

  String? auditid;
  String? warehousename;
  final reasonKey = GlobalKey<FormState>();

  var selectedAuditProvider = StateProvider<AuditDatum?>((ref) => null);
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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Fumigation'),
          foregroundColor: Colors.white,
        ),
        body: ref.watch(stackAuditProvider).when(
            data: (data) => ListView(
                  children: [
                    ref.watch(showStackAuditProvider(Id: auditid)).when(
                        data: (stackData) {
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  children: [
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
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          border: Border.all()),
                                      child: Text(
                                          "${stackData.warehouse?.warehouseName}"),
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
                                          itemCount:
                                              stackData.data?.length ?? 0,
                                          shrinkWrap: true,
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          itemBuilder: (context, index) {
                                            stackData.data?.forEach((e) {
                                              bagsControllerList
                                                  .add(TextEditingController());
                                              controllerList
                                                  .add(TextEditingController());
                                            });
                                            return Container(
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 10),
                                              decoration: BoxDecoration(
                                                  border: Border.all(),
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              padding: const Pad(all: 10),
                                              child: IntrinsicHeight(
                                                child: Column(children: [
                                                  Row(
                                                    children: [
                                                      Text(
                                                          'SN.Number ${index + 1},',
                                                          style: GoogleFonts
                                                              .aBeeZee(
                                                                  color:
                                                                      primaryColor)),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text(
                                                          'Category Name:- ${stackData.data?[index].category},')
                                                    ],
                                                  ),
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
                                                              '   Select Date.')),
                                                      Expanded(
                                                          child: Text(
                                                              '   Remark')),
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
                                                                  '${stackData.data?[index].stackNumber}'),
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
                                                          decoration:
                                                              InputDecoration(
                                                            border:
                                                                OutlineInputBorder(),
                                                            hintText:
                                                                'Tap to pick a date',
                                                          ),
                                                          readOnly: true,
                                                          onTap: () =>
                                                              _selectDate(
                                                                  context,
                                                                  index),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Expanded(
                                                        child: TextFormField(
                                                          decoration: InputDecoration(
                                                              border:
                                                                  OutlineInputBorder(),
                                                              hintText:
                                                                  'Enter Remark'),
                                                          keyboardType:
                                                              TextInputType
                                                                  .name,
                                                          controller:
                                                              controllerList[
                                                                  index],
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
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              1.1,
                                          height: 50,
                                          isOutline: true,
                                          isMultiColor: true,
                                          colors: [
                                            primaryColorDark,
                                            primaryColorDark
                                          ],
                                          borderWidth: 1,
                                          onTap: () async {
                                            List<FumigationDatum>
                                                saveDatumList = [];

                                            for (int i = 0;
                                                i < controllerList.length;
                                                i++) {
                                              if (i < stackData.data!.length) {
                                                saveDatumList
                                                    .add(FumigationDatum(
                                                  stackNo: stackData
                                                      .data?[i].stackNumber,
                                                  remark:
                                                      controllerList[i].text,
                                                  fumigationDate:
                                                      bagsControllerList[i]
                                                              .text
                                                              .isNotEmpty
                                                          ? DateTime.tryParse(
                                                              bagsControllerList[
                                                                      i]
                                                                  .text)
                                                          : null,
                                                ));
                                              }
                                            }

                                            if (saveDatumList.isNotEmpty) {
                                              FumigatonAuditModal stackModel =
                                                  FumigatonAuditModal(
                                                auditId: '${auditid}'.toInt(),
                                                data: saveDatumList,
                                              );

                                              try {
                                                var value = await ref.watch(
                                                    postFumigationUpdateProvider(
                                                            model: stackModel)
                                                        .future);

                                                hideLoaderDialog(context);

                                                if (value['status'] == "1") {
                                                  Fluttertoast.showToast(
                                                      msg: value['message']);
                                                } else {
                                                  Fluttertoast.showToast(
                                                      msg:
                                                          'Error: ${value['message']}');
                                                }
                                              } catch (e) {
                                                hideLoaderDialog(context);

                                                Fluttertoast.showToast(
                                                    msg:
                                                        'Error: ${e.toString()}');
                                                print('Error: ${e.toString()}');
                                              } finally {}
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
                          );
                        },
                        error: (e, s) => Center(child: Text('')),
                        loading: () => loader(context)),
                  ],
                ),
            error: (e, s) => Center(child: Text('')),
            loading: () => loader(context)));
  }
}
