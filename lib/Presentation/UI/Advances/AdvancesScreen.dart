import 'dart:io';

import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:button_animations/button_animations.dart';
import 'package:emp_apnagodam/Domain/Advance/AdvanceService.dart';
import 'package:emp_apnagodam/Domain/Authentication/AuthenticationService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Constants/ColorConstant.dart';
import '../../Widgets/widgets.dart';

class Advancesscreen extends ConsumerStatefulWidget {
  const Advancesscreen({super.key});

  @override
  ConsumerState<Advancesscreen> createState() => _AdvancesscreenState();
}

class _AdvancesscreenState extends ConsumerState<Advancesscreen> {
  TextEditingController notesController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController approverController = TextEditingController();
  var approverIdProvider = StateProvider((ref) => "0");
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Platform.isIOS
          ? CupertinoPageScaffold(
              navigationBar: cupertinoAppBar("Withdraw Request", context),
              child: advanceRequestLayout(context, ref))
          : Scaffold(
              appBar: AppBar(
                title: const Text('Withdraw Request'),
              ),
              body: advanceRequestLayout(context, ref),
            ),
    );
  }

  advanceRequestLayout(BuildContext context, WidgetRef ref) => Padding(
        padding: const Pad(all: 10),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Enter Amount',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: Adaptive.sp(12),
                      color: primaryColor),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: amountController,
                onChanged: (value) {
                  amountController.text = value;
                  setState(() {});
                },
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return "Please Enter Amount";
                  return null;
                },
                decoration: InputDecoration(
                    hintText: "Enter Amount*",
                    contentPadding: const Pad(top: 0, bottom: 0, left: 10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5))),
              ),
              const SizedBox(
                height: 10,
              ),
              ref.watch(profileDataProvider).when(
                  data: (profileData) {
                    return Visibility(
                        visible: double.parse(
                                profileData.profileData?.power ?? 0.0) <
                            num.parse(
                                "${amountController.text.isEmpty ? 0 : amountController.text}"),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Approver',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: Adaptive.sp(12),
                                    color: primaryColor),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ref.watch(advanceApproverProvider).when(
                                data: (data) {
                                  Future.delayed(Duration(seconds: 1))
                                      .then((value) {
                                    ref
                                        .watch(approverIdProvider.notifier)
                                        .state = "${data.data?.userId}";
                                  });
                                  approverController.text =
                                      "${data.data?.firstName ?? ""} ${data.data?.lastName ?? ""}";
                                  return TextFormField(
                                    keyboardType: TextInputType.text,
                                    controller: approverController,
                                    maxLines: 1,
                                    readOnly: true,
                                    validator: (value) {
                                      if (value == null || value.isEmpty)
                                        return "No Approver Found!";
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                        hintText: "Approver*",
                                        contentPadding: const Pad(all: 10),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5))),
                                  );
                                },
                                error: (e, s) => Container(),
                                loading: () => const Center(
                                      child:
                                          CircularProgressIndicator.adaptive(),
                                    ))
                          ],
                        ));
                  },
                  error: (e, s) => Container(),
                  loading: () => Container()),
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Enter Reason',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: Adaptive.sp(12),
                      color: primaryColor),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                controller: notesController,
                maxLines: 5,
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return "Please Enter Reason";
                  return null;
                },
                decoration: InputDecoration(
                    hintText: "Reason*",
                    contentPadding: const Pad(all: 10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5))),
              ),
              const SizedBox(
                height: 10,
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
                  if (formKey.currentState!.validate()) {
                    ref
                        .watch(requestAdvanceProvider(
                                requestedAmount:
                                    amountController.text.toString(),
                                notes: notesController.text.toString(),
                                approverId: ref.watch(approverIdProvider))
                            .future)
                        .then((value) {
                      if (value.status.toString() == "1") {
                        context.go('/');
                      }
                    }).onError(
                            (e, s) => showErrorDialog(context, e.toString()));
                  }
                },
                child: const Text(
                  "Submit",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      );
}
