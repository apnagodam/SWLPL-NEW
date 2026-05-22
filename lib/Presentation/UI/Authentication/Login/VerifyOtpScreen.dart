// ignore_for_file: must_be_immutable

import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:button_animations/button_animations.dart';
import 'package:emp_apnagodam/Domain/Authentication/AuthenticationService.dart';
import 'package:emp_apnagodam/Domain/dio/DioProvider.dart';
import 'package:emp_apnagodam/Presentation/Widgets/widgets.dart';
import 'package:emp_apnagodam/Presentation/utils/SmsStrategy.dart';
import 'package:emp_apnagodam/main.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:otp_autofill/otp_autofill.dart';

import 'package:pinput/pinput.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../Data/SharedPrefs/SharedUtility.dart';
import '../../../Constants/ColorConstant.dart';

class VerifyOtpScreen extends ConsumerStatefulWidget {
  String? phoneNumber;

  VerifyOtpScreen({super.key, required this.phoneNumber});

  @override
  ConsumerState<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends ConsumerState<VerifyOtpScreen> {
  TextEditingController otpController = TextEditingController();
  late OTPTextEditController controller;
  late OTPInteractor _otpInteractor;
  @override
  void initState() {
    super.initState();
    _otpInteractor = OTPInteractor();
    _otpInteractor
        .getAppSignature()
        .then((value) => print('signature - $value'));

    controller = OTPTextEditController(
      codeLength: 6,
      onCodeReceive: (code) {
        print('Your Application receive code - $code');
        if (code.isNotEmpty) {
          otpController.text = code;
          setState(() {});
        }
      },
    )..startListenUserConsent(
        (code) {
          final exp = RegExp(r'(\d{6})');
          return exp.stringMatch(code ?? '') ?? '';
        },
        strategies: [
          Smsstrategy(),
        ],
      );
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: Pad(all: 10),
          child: ColumnSuper(
            children: [
              Image.asset(
                'assets/logo.png',
                fit: BoxFit.fill,
              ),
              SizedBox(
                height: 20,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  'Verify Otp',
                  style: TextStyle(
                      fontSize: Adaptive.sp(20), fontWeight: FontWeight.w800),
                )
              ]),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Pinput(
                    autofocus: true,
                    length: 6,
                    controller: otpController,
                    onCompleted: (pin) async {
                      // var token = await FirebaseMessaging.instance.getToken();
                      ref
                          .watch(verifyOtpProvider(
                                  otp: pin,
                                  number: widget.phoneNumber) //,fcmToken: token
                              .future)
                          .then((value) {
                        hideLoaderDialog(context);
                        if (value.status.toString() == "1") {
                          ref
                              .watch(sharedUtilityProvider)
                              .setUser(value.userDetails!);
                          ref
                              .watch(sharedUtilityProvider)
                              .setToken(value.authorization ?? "");

                          ref.invalidate(dioProvider);

                          Future.delayed(Duration(seconds: 1));
                          ref.watch(goRouterProvider).go('/');
                        }
                      }).onError((e, s) {});
                    },
                  ),
                ),
              ),
              AnimatedButton(
                height: 50,
                color: primaryColorDark,
                width: MediaQuery.of(context).size.width / 1.2,
                child: Text(
                  'Verify OTP',
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
                onTap: () {
                  if (otpController.text.isNotEmpty) {
                    ref
                        .watch(verifyOtpProvider(
                                otp: otpController.text,
                                number: widget.phoneNumber)
                            .future)
                        .then((value) {
                      if (value.status.toString() == "1") {
                        ref
                            .watch(sharedUtilityProvider)
                            .setUser(value.userDetails!);
                        ref
                            .watch(sharedUtilityProvider)
                            .setToken(value.authorization ?? "");

                        ref.invalidate(dioProvider);
                        ref.watch(goRouterProvider).go('/');
                      }
                    });
                  } else {}
                },
              ),
            ],
          ),
        ),
      )),
    );
  }
}
