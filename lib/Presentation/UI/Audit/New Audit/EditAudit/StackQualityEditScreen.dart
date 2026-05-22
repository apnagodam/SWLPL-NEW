import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:button_animations/button_animations.dart';
import 'package:dio/dio.dart';
import 'package:emp_apnagodam/Data/Models/StackNumberModal.dart';
import 'package:emp_apnagodam/Data/Models/StackQualityRequestModel.dart';
import 'package:emp_apnagodam/Domain/Audit/AuditService.dart';
import 'package:emp_apnagodam/Presentation/Constants/ColorConstant.dart';
import 'package:emp_apnagodam/Presentation/Widgets/widgets.dart';
import 'package:emp_apnagodam/Presentation/utils/debouncer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';

class QualityEditScreenPage extends ConsumerStatefulWidget {
  const QualityEditScreenPage(
      {super.key,
      required this.auditid,
      required this.warehousename,
      required this.stackNo});

  final String? auditid;
  final String? warehousename;
  final String? stackNo;
  @override
  ConsumerState<QualityEditScreenPage> createState() =>
      _LockAndKeyScreenState();
}

List<TextEditingController> controllerList = [];
List<TextEditingController> remarkcontrollerList = [];
final formKey = GlobalKey<FormState>();
List<TextFormField> paramsList = [];

//qualityStack
class _LockAndKeyScreenState extends ConsumerState<QualityEditScreenPage> {
  var selectedStackProvider = StateProvider<StackDatum?>((ref) => null);
  var remarkController = TextEditingController();
  var listOfQualityParamsProvider =
      StateProvider<List<QualityDatum>>((ref) => []);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Stack Quality Edit'),
          foregroundColor: Colors.white,
        ),
        body: ListView(padding: Pad(all: 10), children: [
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
            child: Text('wareHouse Nmae'),
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
          ref.watch(qualityStackProvider(Id: widget.auditid)).when(
              data: (stackData) => SizedBox(
                    child: DropdownMenu<StackDatum?>(
                      expandedInsets: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.width),
                      initialSelection: ref.watch(selectedStackProvider),
                      label: Text("Select Stack No."),
                      onSelected: (StackDatum? audit) {
                        ref.watch(selectedStackProvider.notifier).state = audit;
                      },
                      dropdownMenuEntries: stackData.data!
                          .map<DropdownMenuEntry<StackDatum?>>(
                              (StackDatum? stack) {
                        return DropdownMenuEntry<StackDatum?>(
                          value: stack,
                          label: "${stack?.stackNo ?? "Select Stack Number"}",
                        );
                      }).toList(),
                    ),
                  ),
              error: (e, s) => Container(),
              loading: () => loader(context)),
          ref
              .watch(stackQualityEditProvider(
                  Id: widget.auditid,
                  stackno: ref.watch(selectedStackProvider)?.stackNo ?? ""))
              .when(
                  data: (data) {
                    Future.delayed(Duration(seconds: 1)).then((_) {
                      ref.watch(listOfQualityParamsProvider).clear();
                      // controllerList.clear();
                      //                   paramsList.clear();
                      data.parametersData?.forEach((element) {
                        ref.watch(listOfQualityParamsProvider).add(QualityDatum(
                            id: "${element.parameterId}",
                            value: "${element.value}"));
                      });
                    });

                    return Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text('Stack Number '),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Form(
                            key: formKey,
                            child: Column(
                              children: [
                                Column(
                                    children: List.generate(
                                        data.parametersData?.length ?? 0,
                                        (index) {
                                  return Padding(
                                    padding: Pad(top: 10, bottom: 10),
                                    child: TextFormField(
                                        initialValue:
                                            data.parametersData?[index].value ??
                                                "",
                                        onChanged: (value) {
                                          Debouncer(
                                                  delay: Duration(
                                                      milliseconds: 500))
                                              .call(() {
                                            ref
                                                .watch(
                                                    listOfQualityParamsProvider
                                                        .notifier)
                                                .state[index]
                                                .value = value.toString();
                                          });
                                        },
                                        keyboardType:
                                            TextInputType.numberWithOptions(
                                                decimal: true),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please select ${data.parametersData?[index].parameter ?? ""}';
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                            labelText:
                                                '${data.parametersData?[index].parameter}',
                                            contentPadding: Pad(
                                                top: 0, bottom: 0, left: 10),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10)))),
                                  );
                                })),
                                TextFormField(
                                    controller: remarkController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please input valid value';
                                      } else
                                        return null;
                                    },
                                    decoration: InputDecoration(
                                        hintText: 'Remark',
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)))),
                                SizedBox(
                                  height: 10,
                                ),
                                AnimatedButton(
                                  color: primaryColorDark,
                                  width:
                                      MediaQuery.of(context).size.width / 1.1,
                                  height: 50,
                                  isOutline: true,
                                  isMultiColor: true,
                                  colors: [primaryColorDark, primaryColorDark],
                                  borderWidth: 1,
                                  onTap: () {
                                    if (formKey.currentState!.validate()) {
                                      showLoaderDialog(context);

                                      var model = StackQualityRequestModel(
                                          auditId: widget.auditid,
                                          commodityId: '',
                                          remark: remarkController.text,
                                          stackNo: ref
                                                  .watch(selectedStackProvider)
                                                  ?.stackNo ??
                                              "",
                                          data: ref.watch(
                                              listOfQualityParamsProvider));

                                      ref
                                          .watch(stackQualityUpdateProvider(
                                                  model: model)
                                              .future)
                                          .then((value) {
                                        hideLoaderDialog(context);

                                        if (value['status'].toString() == "1") {
                                          context.pop();
                                        }
                                        Fluttertoast.showToast(
                                            msg: value['message']);
                                      }).onError((e, s) {
                                        hideLoaderDialog(context);
                                      });
                                    }
                                  },
                                  child: const Text(
                                    "Submit",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ))
                      ],
                    );
                  },
                  error: (e, s) => (e is DioException)
                      ? Center(
                          child: errorWidget("please check your internet"),
                        )
                      : Text(e.toString()),
                  loading: () => loader(context))
        ]));
  }
}
