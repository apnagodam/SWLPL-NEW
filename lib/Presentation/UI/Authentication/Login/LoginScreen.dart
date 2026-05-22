import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:button_animations/button_animations.dart';
import 'package:emp_apnagodam/Domain/Authentication/AuthenticationService.dart';
import 'package:emp_apnagodam/Presentation/Constants/ColorConstant.dart';
import 'package:emp_apnagodam/Presentation/utils/extensions.dart';
import 'package:emp_apnagodam/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../Domain/dio/DioProvider.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  TextEditingController empController = TextEditingController();
  final loginKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Form(
              key: loginKey,
              child: Center(
                child: Padding(
                  padding: Pad(
                      left: 10,
                      right: 10,
                      top: 10,
                      bottom: MediaQuery.of(context).padding.bottom),
                  child: ColumnSuper(
                    children: [
                      Image.asset(
                        'assets/logo.png',
                        fit: BoxFit.fill,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Login',
                              style: TextStyle(
                                  fontSize: Adaptive.sp(20),
                                  fontWeight: FontWeight.w800),
                            )
                          ]),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        controller: empController,
                        maxLength: 6,
                        textCapitalization: TextCapitalization.characters,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please input employee code';
                          }
                          if (!value.isValidEmpId()) {
                            return "Enter Proper Employee Id - Example.. AG0212";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            hintText: "Input Employee Code",
                            contentPadding:
                                const Pad(top: 0, bottom: 0, left: 10),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      AnimatedButton(
                        height: 50,
                        color: primaryColorDark,
                        width: MediaQuery.of(context).size.width / 1.2,
                        child: Text(
                          'Login',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: Adaptive.sp(14),
                              fontWeight: FontWeight.w800),
                        ),
                        isOutline: true,
                        isMultiColor: true,
                        colors: [primaryColorDark, primaryColorDark],
                        borderWidth: 1,
                        onTap: () async {
                          if (loginKey.currentState!.validate()) {
                            if (ref
                                .watch(dioProvider)
                                .options
                                .baseUrl
                                .contains('test')) {
                              // showLoaderDialog(context);

                              await ref
                                  .watch(sendOtpV1Provider(
                                          empCode: empController.text)
                                      .future)
                                  .then((value) {
                                // hideLoaderDialog(context);
                                if (value.status == "1") {
                                  ref.watch(goRouterProvider).goNamed('otp',
                                      extra: {'phone': value.phone.toString()});
                                }
                                Fluttertoast.showToast(msg: '${value.message}');
                              }).onError((e, s) {
                                // hideLoaderDialog(context);
                              });
                            } else {
                              // showLoaderDialog(context);

                              await ref
                                  .watch(sendOtpProvider(
                                          empCode: empController.text)
                                      .future)
                                  .then((value) {
                                // hideLoaderDialog(context);
                                if (value.status == "1") {
                                  ref.watch(goRouterProvider).goNamed('otp',
                                      extra: {'phone': value.phone.toString()});
                                }
                                Fluttertoast.showToast(msg: '${value.message}');
                              }).onError((e, s) {
                                // hideLoaderDialog(context);
                              });
                            }
                          } else {}
                        },
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).padding.bottom,
                      ),
                    ],
                  ),
                ),
              ))),
    );
  }
}
