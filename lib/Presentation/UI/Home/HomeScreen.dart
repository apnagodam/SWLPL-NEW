import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:button_animations/button_animations.dart';
import 'package:calendar_view/calendar_view.dart';
import 'package:dio/dio.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:emp_apnagodam/Data/Models/CaseIdResponseModel.dart';
import 'package:emp_apnagodam/Data/SharedPrefs/SharedUtility.dart';
import 'package:emp_apnagodam/Domain/Attendance/AttendanceService.dart';
import 'package:emp_apnagodam/Domain/Authentication/AuthenticationService.dart';
import 'package:emp_apnagodam/Domain/CaseId/CaseIdService.dart';
import 'package:emp_apnagodam/Domain/dio/DioProvider.dart';
import 'package:emp_apnagodam/Presentation/Constants/ColorConstant.dart';
import 'package:emp_apnagodam/Presentation/UI/Home/DashboardPanel.dart';
import 'package:emp_apnagodam/Presentation/UI/TruckBook/CreateTruckBook.dart';
import 'package:emp_apnagodam/Presentation/Widgets/widgets.dart';
import 'package:emp_apnagodam/Presentation/utils/DialogUtils.dart';
import 'package:emp_apnagodam/main.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:panara_dialogs/panara_dialogs.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:zoom_pinch_overlay/zoom_pinch_overlay.dart';

import '../../../Data/Models/AttendanceStatusModel.dart';
import '../../../Data/Models/SecondQualityUploadModel.dart';
import '../../../Domain/SecondQualityReport/SecondQualityReportService.dart';
import 'package:device_info_plus/device_info_plus.dart';

var isUiEnabled = StateProvider((ref) => false);
var monthGlobalKey = GlobalKey<MonthViewState>();

@pragma('vm:entry-point')
void notificationTapBackground(NotificationResponse notificationResponse) {
  debugPrint(notificationResponse.toString());
}

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen>
    with WidgetsBindingObserver {
  var labReportImageProvider = StateProvider<Uint8List?>((ref) => null);
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  ImagePicker imagePicker = ImagePicker();
  bool _isAttendanceDialogShowing = false;
  BuildContext? _attendanceDialogContext;
  final ValueNotifier<bool> _canPopAttendanceDialog = ValueNotifier(false);

  void _checkAttendanceAndShowDialog(dynamic clockStatus) {
    if (clockStatus == null || clockStatus.toString() != "2") {
      if (!_isAttendanceDialogShowing && mounted) {
        _isAttendanceDialogShowing = true;
        _canPopAttendanceDialog.value = false;
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (dialogCtx) {
            _attendanceDialogContext = dialogCtx;
            return ValueListenableBuilder<bool>(
              valueListenable: _canPopAttendanceDialog,
              builder: (context, canPop, child) {
                return PopScope(
                  canPop: canPop,
                  child: attendanceAlertDialog(
                    dialogCtx,
                    ref,
                    onDismiss: () {
                      _canPopAttendanceDialog.value = true;
                      _isAttendanceDialogShowing = false;
                      if (Navigator.of(dialogCtx, rootNavigator: true).canPop()) {
                        Navigator.of(dialogCtx, rootNavigator: true).pop();
                      }
                      _attendanceDialogContext = null;
                    },
                  ),
                );
              },
            );
          },
        ).then((_) {
          _isAttendanceDialogShowing = false;
          _attendanceDialogContext = null;
        });
      }
    } else {
      // User is already clocked in (clockStatus == "2")
      if (_isAttendanceDialogShowing && _attendanceDialogContext != null) {
        _canPopAttendanceDialog.value = true;
        _isAttendanceDialogShowing = false;
        try {
          if (Navigator.of(_attendanceDialogContext!, rootNavigator: true).canPop()) {
            Navigator.of(_attendanceDialogContext!, rootNavigator: true).pop();
          }
        } catch (_) {}
        _attendanceDialogContext = null;
      }
    }
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);

    FirebaseMessaging.onMessage.listen((data) {
      if (data.data['type'].toString().toLowerCase() == "attendance") {
        Fluttertoast.showToast(msg: data.data['name'].toString());
      } else if (data.data['type'].toString().toLowerCase() == "route") {
        ref.watch(goRouterProvider).goNamed('advance_history');
      } else if (data.data['type'].toString().toLowerCase() == "dialog") {
        showAdaptiveDialog(
            context: context,
            builder: (context) => Scaffold(
                  body: Column(
                    children: [
                      Text(data.data['title'].toString()),
                      Text(data.data['body'].toString())
                    ],
                  ),
                ));
      }
      debugPrint(data.data['type']);
    });

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      ref.read(attendanceStatusProvider.future).then((value) {
        debugPrint("CLOCK STATUS => ${value.clockStatus}");
        _checkAttendanceAndShowDialog(value.clockStatus);
      }).catchError((e) {
        debugPrint("Error fetching attendance status: $e");
      });

      _initLocationAndDevice();

      FirebaseMessaging.onMessageOpenedApp.listen((data) {
        if (data.data['type'].toString().toLowerCase() == "attendance") {
          Fluttertoast.showToast(msg: data.data['name'].toString());
        } else if (data.data['type'].toString().toLowerCase() == "route") {
          ref.watch(goRouterProvider).goNamed('advance_history');
        }
        debugPrint(data.data['type']);
      });
      const AndroidInitializationSettings initializationSettingsAndroid =
          AndroidInitializationSettings('@mipmap/ic_launcher');

      const DarwinInitializationSettings initializationSettingsIOS =
          DarwinInitializationSettings(
        requestSoundPermission: false,
        requestBadgePermission: false,
        requestAlertPermission: false,
      );

      await FlutterLocalNotificationsPlugin().initialize(
          const InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsIOS,
          ), onDidReceiveNotificationResponse: (response) {
        debugPrint(response.toString());
      }, onDidReceiveBackgroundNotificationResponse: notificationTapBackground);
    });
  }

  void _initLocationAndDevice() async {
    try {
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      AndroidDeviceInfo? androidInfo;
      if (Platform.isAndroid) {
        androidInfo = await deviceInfo.androidInfo;
      }

      await requestLocationPermission();
      var position = await Geolocator.getCurrentPosition();

      ref.watch(distanceProvider.notifier).state = Geolocator.distanceBetween(
              ref.watch(locationProvider)?.latitude ?? 0.0,
              ref.watch(locationProvider)?.longitude ?? 0.0,
              double.tryParse(
                      ref.watch(sharedUtilityProvider).getUser()?.attenLat ??
                          "0.0") ??
                  0.0,
              double.tryParse(
                      ref.watch(sharedUtilityProvider).getUser()?.attenLong ??
                          "0.0") ??
                  0.0)
          .toString();
      ref.watch(locationProvider.notifier).state = position;
      placemarkFromCoordinates(position.latitude, position.longitude)
          .then((placemarks) {
        ref.watch(addressProvider.notifier).state =
            "${placemarks.first.name} ${placemarks.first.street} ${placemarks.first.locality} ${placemarks.first.administrativeArea}";
      }).catchError((_) {});

      ref.read(profileDataProvider.future).then((userData) async {
        if (androidInfo == null) return;
        try {
          if (ref.watch(dioProvider).options.baseUrl == ApiClient.testBaseUrl) {
            Dio dio = Dio(BaseOptions(
                baseUrl: 'http://localhost:3000/api/',
                connectTimeout: const Duration(minutes: 10),
                sendTimeout: const Duration(minutes: 10),
                receiveTimeout: const Duration(minutes: 10)))
              ..interceptors.addAll([PrettyDioLogger()]);

            await dio.post('location/itegrityLocation', data: {
              "fullName": "${userData.profileData?.firstName}",
              "phone": "${userData.profileData?.phone ?? "0000000000"}",
              "loginType": "emp",
              "deviceId": "${androidInfo.id}",
              "empId": "${userData.profileData?.empId}",
              "location": {
                "type": "Point",
                "coordinates": [
                  ref.watch(locationProvider)?.longitude ?? 0.0,
                  ref.watch(locationProvider)?.latitude ?? 0.0
                ]
              },
              "appType":
                  "${ref.watch(dioProvider).options.baseUrl == ApiClient.testBaseUrl ? 'test' : 'live'}",
            });
            await dio.post('location', data: {
              "empId": "${userData.profileData?.empId}",
              "location": {
                "type": "Point",
                "coordinates": [
                  ref.watch(locationProvider)?.longitude ?? 0.0,
                  ref.watch(locationProvider)?.latitude ?? 0.0
                ]
              },
            });
          } else {
            Dio dio = Dio(BaseOptions(
                baseUrl: 'https://swlpl-next.vercel.app/api/',
                connectTimeout: const Duration(minutes: 10),
                sendTimeout: const Duration(minutes: 10),
                receiveTimeout: const Duration(minutes: 10)))
              ..interceptors.addAll([PrettyDioLogger()]);

            await dio.post('location/itegrityLocation', data: {
              "fullName": "${userData.profileData?.firstName}",
              "phone": "${userData.profileData?.phone ?? "0000000000"}",
              "loginType": "emp",
              "deviceId": "${androidInfo.id}",
              "empId": "${userData.profileData?.empId}",
              "location": {
                "type": "Point",
                "coordinates": [
                  ref.watch(locationProvider)?.longitude ?? 0.0,
                  ref.watch(locationProvider)?.latitude ?? 0.0
                ]
              },
              "appType":
                  "${ref.watch(dioProvider).options.baseUrl == ApiClient.testBaseUrl ? 'test' : 'live'}",
            });
            await dio.post('location', data: {
              "empId": "${userData.profileData?.empId}",
              "location": {
                "type": "Point",
                "coordinates": [
                  ref.watch(locationProvider)?.longitude ?? 0.0,
                  ref.watch(locationProvider)?.latitude ?? 0.0
                ]
              },
            });
          }
        } catch (_) {}
      }).catchError((_) {});
    } catch (_) {}
  }

  int getExtendedVersionNumber(String version) {
    List versionCells = version.split('.');
    versionCells = versionCells.map((i) => int.parse(i)).toList();
    return versionCells[0] * 100000 + versionCells[1] * 1000 + versionCells[2];
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);

    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      ref.invalidate(caseIdProvider);
      ref.invalidate(caseRequestsProvider);
    } else if (state == AppLifecycleState.hidden) {
      ref.invalidate(caseIdProvider);
      ref.invalidate(caseRequestsProvider);
    } else if (state == AppLifecycleState.detached) {
      ref.invalidate(caseIdProvider);
      ref.invalidate(caseRequestsProvider);
    } else if (state == AppLifecycleState.paused) {
      ref.invalidate(caseIdProvider);
      ref.invalidate(caseRequestsProvider);
    }
  }

  void _navigateWithClockCheck(String routeName, {Object? extra}) {
    ref.read(attendanceStatusProvider.future).then((value) {
      if (value.clockStatus.toString() == "2") {
        if (extra != null) {
          context.goNamed(routeName, extra: extra);
        } else {
          context.goNamed(routeName);
        }
      } else {
        Fluttertoast.showToast(msg: "please checking first to open this page ");
      }
    }).onError((e, s) {
      Fluttertoast.showToast(msg: "please checking first to open this page ");
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue<AttendanceStatusModel>>(
      attendanceStatusProvider,
      (previous, next) {
        next.whenData((status) {
          _checkAttendanceAndShowDialog(status.clockStatus);
        });
      },
    );

    return RefreshIndicator(
        child: androidLayout(context, ref),
        onRefresh: () {
          return Future.delayed(Duration.zero).then((value) {
            ref.invalidate(caseIdProvider);
            ref.invalidate(caseRequestsProvider);
          });
        });
  }

  androidLayout(BuildContext context, WidgetRef ref) => Scaffold(
        appBar: AppBar(
          title: const Text("Staff Dashboard"),
          actions: [
            IconButton(
              tooltip: "Voice Question",
              onPressed: () {
                _navigateWithClockCheck('voice_question');
              },
              icon: const Icon(Icons.mic_rounded),
            ),
            IconButton(
                onPressed: () {
                  _navigateWithClockCheck('attendance');
                },
                icon: const Icon(Icons.calendar_month)),
          ],
        ),
        key: _scaffoldKey,
        drawer: Drawer(
          backgroundColor: Colors.white,
          child: Padding(
              padding: const Pad(all: 10),
              child: ListView(
                children: [
                  (ref.watch(sharedUtilityProvider).getUser()?.designation)
                          .toString()
                          .toLowerCase()
                          .replaceAll(" ", '')
                          .contains('guard')
                      ? CupertinoListSection(
                          children: [
                            ListTile(
                              title: Text(
                                '${ref.watch(sharedUtilityProvider).getUser()?.firstName} ${ref.watch(sharedUtilityProvider).getUser()?.lastName}(${ref.watch(sharedUtilityProvider).getUser()?.empId})',
                                style: TextStyle(fontSize: Adaptive.sp(16)),
                              ),
                              leading:
                                  ref.watch(sharedUtilityProvider).getUser() ==
                                          null
                                      ? const Icon(Icons.person)
                                      : CircleAvatar(
                                          radius: Adaptive.sp(16),
                                          foregroundImage: NetworkImage(
                                            "${ref.watch(dioProvider).options.baseUrl}resources/assets/upload/employees/${ref.watch(sharedUtilityProvider).getUser()?.passportImage}",
                                          ),
                                        ),
                              onTap: () => _navigateWithClockCheck('profile'),
                            ),
                            ref.watch(profileDataProvider).when(
                                data: (profileData) => ListTile(
                                      title: Text(
                                        'Wallet Power - \u{20B9}${profileData.profileData?.power ?? 0}',
                                        style: TextStyle(
                                            fontSize: Adaptive.sp(16)),
                                      ),
                                      leading: const Icon(
                                        Icons.wallet,
                                        color: primaryColor,
                                      ),
                                      onTap: () => _navigateWithClockCheck(
                                          'walletStatementScreen'),
                                    ),
                                error: (e, s) => Container(),
                                loading: () =>
                                    CircularProgressIndicator.adaptive()),
                            CupertinoListTile(
                              title: Text(
                                'Questions & Answers',
                                style: TextStyle(fontSize: Adaptive.sp(16)),
                              ),
                              leading: Icon(
                                Icons.question_answer_rounded,
                                color: primaryColor,
                              ),
                              onTap: () =>

                                  _navigateWithClockCheck('employee_questions'),
                            ),
                            ExpansionTile(
                              shape: const Border(
                                  bottom: BorderSide(color: primaryColorDark)),
                              expandedAlignment: Alignment.centerLeft,
                              title: Text(
                                'Attendance',
                                style: TextStyle(fontSize: Adaptive.sp(16)),
                              ),
                              leading: Icon(Icons.calendar_month,
                                  color: primaryColorDark),
                              children: [
                                CupertinoListTile(
                                  title: Text(
                                              'List Of Holidays',
                                    style: TextStyle(fontSize: Adaptive.sp(16)),
                                  ),
                                  leading: Icon(Icons.calendar_month,
                                      color: primaryColorDark),
                                  onTap: () =>
                                      _navigateWithClockCheck('listOfHolidays'),
                                ),
                              ],
                            ),
                            CupertinoListTile(
                              title: Text(
                                'Check IN',
                                style: TextStyle(fontSize: Adaptive.sp(16)),
                              ),
                              leading: Icon(
                                Icons.lock,
                                color: primaryColor,
                                size: Adaptive.sp(21),
                              ),
                              onTap: () {
                                context.goNamed('guard_in_screen');
                              },
                            ),
                            CupertinoListTile(
                              title: Text(
                                'Check OUT',
                                style: TextStyle(fontSize: Adaptive.sp(16)),
                              ),
                              leading: Icon(
                                Icons.lock,
                                color: primaryColor,
                                size: Adaptive.sp(21),
                              ),
                              onTap: () {
                                context.goNamed('guard_out_screen');
                              },
                            ),
                            ExpansionTile(
                              shape: const Border(
                                  bottom: BorderSide(color: primaryColorDark)),
                              expandedAlignment: Alignment.centerLeft,
                              title: Text(
                                'Withdraw',
                                style: TextStyle(fontSize: Adaptive.sp(16)),
                              ),
                              leading: SvgPicture.asset(
                                'assets/advance.svg',
                                height: Adaptive.sp(20),
                                width: Adaptive.sp(20),
                              ),
                              children: [
                                CupertinoListTile(
                                  title: Text(
                                    'My Withdraw Requests',
                                    style: TextStyle(fontSize: Adaptive.sp(16)),
                                  ),
                                  leading: SvgPicture.asset(
                                    'assets/advance_request.svg',
                                    height: Adaptive.sp(20),
                                    width: Adaptive.sp(20),
                                  ),
                                  onTap: () {
                                    _navigateWithClockCheck('advance');
                                  },
                                ),
                                CupertinoListTile(
                                  title: Text(
                                    'Withdraw History',
                                    style: TextStyle(fontSize: Adaptive.sp(16)),
                                  ),
                                  leading: SvgPicture.asset(
                                    'assets/advance_request.svg',
                                    height: Adaptive.sp(20),
                                    width: Adaptive.sp(20),
                                  ),
                                  onTap: () {
                                    _navigateWithClockCheck('advance_history');
                                  },
                                ),
                              ],
                            ),
                            TextButton(
                              onPressed: () async {
                                await ref
                                    .watch(sharedUtilityProvider)
                                    .sharedPreferences
                                    .clear()
                                    .then((value) {
                                  context.go('/login');
                                });
                              },
                              child: Text("Logout",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: Adaptive.sp(16))),
                            )
                          ],
                        )
                      : CupertinoListSection(
                          backgroundColor: Colors.white,
                          children: [
                            ListTile(
                              title: Text(
                                '${ref.watch(sharedUtilityProvider).getUser()?.firstName} ${ref.watch(sharedUtilityProvider).getUser()?.lastName}(${ref.watch(sharedUtilityProvider).getUser()?.empId})',
                                style: TextStyle(
                                    fontSize: Adaptive.sp(16),
                                    color: Colors.black),
                              ),
                              leading:
                                  ref.watch(sharedUtilityProvider).getUser() ==
                                          null
                                      ? const Icon(Icons.person)
                                      : CircleAvatar(
                                          radius: Adaptive.sp(16),
                                          foregroundImage: NetworkImage(
                                            "${ref.watch(dioProvider).options.baseUrl}resources/assets/upload/employees/${ref.watch(sharedUtilityProvider).getUser()?.passportImage}",
                                          ),
                                        ),
                              onTap: () => _navigateWithClockCheck('profile'),
                            ),
                            ref.watch(profileDataProvider).when(
                                data: (profileData) => ListTile(
                                      title: Text(
                                        'Wallet Power - \u{20B9}${profileData.profileData?.power ?? 0}',
                                        style: TextStyle(
                                            fontSize: Adaptive.sp(16)),
                                      ),
                                      leading: const Icon(
                                        Icons.wallet,
                                        color: primaryColor,
                                      ),
                                      onTap: () => _navigateWithClockCheck(
                                          'walletStatementScreen'),
                                    ),
                                error: (e, s) => Container(),
                                loading: () =>
                                    CircularProgressIndicator.adaptive()),
                            ListTile(
                                title: Text(
                                  'Quality Calculator',
                                  style: TextStyle(fontSize: Adaptive.sp(16)),
                                ),
                                leading: Icon(
                                  Icons.calculate_outlined,
                                  color: primaryColor,
                                ),
                                trailing: const CupertinoListTileChevron(),
                                onTap: () =>
                                    _navigateWithClockCheck('quality_calculator')),
                            ListTile(
                                title: Text(
                                  'Questions & Answers',
                                  style: TextStyle(fontSize: Adaptive.sp(16)),
                                ),
                                leading: const Icon(
                                  Icons.question_answer_rounded,
                                  color: primaryColor,
                                ),
                                trailing: const CupertinoListTileChevron(),
                                onTap: () =>
                                    _navigateWithClockCheck('employee_questions')),
                            ExpansionTile(
                              shape: const Border(
                                  bottom: BorderSide(color: primaryColorDark)),
                              expandedAlignment: Alignment.centerLeft,
                              title: Text(
                                'Attendance',
                                style: TextStyle(fontSize: Adaptive.sp(16)),
                              ),
                              leading: Icon(Icons.calendar_month,
                                  color: primaryColorDark),
                              children: [
                                CupertinoListTile(
                                  title: Text(
                                    'List Of Holidays',
                                    style: TextStyle(fontSize: Adaptive.sp(16)),
                                  ),
                                  leading: Icon(Icons.calendar_month,
                                      color: primaryColorDark),
                                  onTap: () =>
                                      _navigateWithClockCheck('listOfHolidays'),
                                ),
                                CupertinoListTile(
                                  title: Text(
                                    'Attendance Requests',
                                    style: TextStyle(fontSize: Adaptive.sp(16)),
                                  ),
                                  leading: Icon(Icons.perm_contact_calendar,
                                      color: primaryColorDark),
                                  onTap: () =>
                                      _navigateWithClockCheck('attendanceRequest'),
                                ),
                              ],
                            ),
                            ExpansionTile(
                              shape: const Border(
                                  bottom: BorderSide(color: primaryColorDark)),
                              expandedAlignment: Alignment.centerLeft,
                              title: Text(
                                'Maintenance',
                                style: TextStyle(fontSize: Adaptive.sp(16)),
                              ),
                              leading: Image.asset(
                                'assets/cleaning-one.png',
                                height: Adaptive.sp(20),
                                width: Adaptive.sp(20),
                              ),
                              children: [
                                CupertinoListTile(
                                  title: Text(
                                    'Spray',
                                    style: TextStyle(fontSize: Adaptive.sp(16)),
                                  ),
                                  leading: Image.asset(
                                    'assets/spray-icon (1).png',
                                    height: Adaptive.sp(20),
                                    width: Adaptive.sp(20),
                                  ),
                                  onTap: () =>
                                      _navigateWithClockCheck('spray_cleaning'),
                                ),
                                CupertinoListTile(
                                  title: Text(
                                    'Cleaning',
                                    style: TextStyle(fontSize: Adaptive.sp(16)),
                                  ),
                                  leading: Image.asset(
                                    'assets/cleaning-two-icon.png',
                                    height: Adaptive.sp(20),
                                    width: Adaptive.sp(20),
                                  ),
                                  onTap: () => _navigateWithClockCheck('cleaning'),
                                ),
                                CupertinoListTile(
                                  title: Text(
                                    'CHR',
                                    style: TextStyle(fontSize: Adaptive.sp(16)),
                                  ),
                                  leading: Image.asset(
                                    'assets/chr-icon.png',
                                    height: Adaptive.sp(20),
                                    width: Adaptive.sp(20),
                                  ),
                                  onTap: () => _navigateWithClockCheck('chr_cleaning'),
                                ),
                                CupertinoListTile(
                                  title: Text(
                                    'Fumigation',
                                    style: TextStyle(fontSize: Adaptive.sp(16)),
                                  ),
                                  leading: Image.asset(
                                    'assets/fumigation-icon.png',
                                    height: Adaptive.sp(20),
                                    width: Adaptive.sp(20),
                                  ),
                                  onTap: () =>
                                      _navigateWithClockCheck('fumigation_cleaning'),
                                ),
                              ],
                            ),
                            ExpansionTile(
                              shape: const Border(
                                  bottom: BorderSide(color: primaryColorDark)),
                              expandedAlignment: Alignment.centerLeft,
                              title: Text(
                                'WHS',
                                style: TextStyle(fontSize: Adaptive.sp(16)),
                              ),
                              leading: Image.asset(
                                'assets/WHS-removebg-preview (1).png',
                                height: Adaptive.sp(20),
                                width: Adaptive.sp(20),
                              ),
                              children: [
                                CupertinoListTile(
                                  title: Text(
                                    'IN',
                                    style: TextStyle(fontSize: Adaptive.sp(16)),
                                  ),
                                  leading: Image.asset(
                                    'assets/in-icon.png',
                                    height: Adaptive.sp(20),
                                    width: Adaptive.sp(20),
                                  ),
                                  onTap: () => _navigateWithClockCheck('whs_in'),
                                ),
                                CupertinoListTile(
                                  title: Text(
                                    'OUT',
                                    style: TextStyle(fontSize: Adaptive.sp(16)),
                                  ),
                                  leading: Image.asset(
                                    'assets/out-icon.png',
                                    height: Adaptive.sp(20),
                                    width: Adaptive.sp(20),
                                  ),
                                  onTap: () => _navigateWithClockCheck('whs_out'),
                                ),
                              ],
                            ),
                            ExpansionTile(
                              shape: const Border(
                                  bottom: BorderSide(color: primaryColorDark)),
                              expandedAlignment: Alignment.centerLeft,
                              title: Text(
                                'Leads',
                                style: TextStyle(fontSize: Adaptive.sp(16)),
                              ),
                              leading: SvgPicture.asset(
                                'assets/leads.svg',
                                height: Adaptive.sp(20),
                                width: Adaptive.sp(20),
                              ),
                              children: [
                                CupertinoListTile(
                                  title: Text(
                                    'Generate Leads',
                                    style: TextStyle(fontSize: Adaptive.sp(16)),
                                  ),
                                  leading: SvgPicture.asset(
                                    'assets/leads.svg',
                                    height: Adaptive.sp(20),
                                    width: Adaptive.sp(20),
                                  ),
                                  onTap: () => _navigateWithClockCheck('generate_lead'),
                                ),
                                CupertinoListTile(
                                  title: Text(
                                    'Leads List',
                                    style: TextStyle(fontSize: Adaptive.sp(16)),
                                  ),
                                  leading: SvgPicture.asset(
                                    'assets/leads_list.svg',
                                    height: Adaptive.sp(20),
                                    width: Adaptive.sp(20),
                                  ),
                                  onTap: () => _navigateWithClockCheck('leads_list'),
                                ),
                              ],
                            ),
                            ExpansionTile(
                              shape: Border(
                                  bottom: BorderSide(color: primaryColorDark)),
                              expandedAlignment: Alignment.centerLeft,
                              title: Text(
                                'Audit',
                                style: TextStyle(fontSize: Adaptive.sp(16)),
                              ),
                              leading: SvgPicture.asset(
                                'assets/leads.svg',
                                height: Adaptive.sp(20),
                                width: Adaptive.sp(20),
                              ),
                              children: [
                                CupertinoListTile(
                                  title: Text(
                                    'Audit Start',
                                    style: TextStyle(fontSize: Adaptive.sp(16)),
                                  ),
                                  leading: SvgPicture.asset(
                                    'assets/leads.svg',
                                    height: Adaptive.sp(20),
                                    width: Adaptive.sp(20),
                                  ),
                                  onTap: () => _navigateWithClockCheck('start_audit'),
                                ),
                                CupertinoListTile(
                                  title: Text(
                                    'Active  Audit',
                                    style: TextStyle(fontSize: Adaptive.sp(16)),
                                  ),
                                  leading: SvgPicture.asset(
                                    'assets/leads.svg',
                                    height: Adaptive.sp(20),
                                    width: Adaptive.sp(20),
                                  ),
                                  onTap: () => _navigateWithClockCheck('active_audit'),
                                ),
                                CupertinoListTile(
                                  title: Text(
                                    'Completed  Audit',
                                    style: TextStyle(fontSize: Adaptive.sp(16)),
                                  ),
                                  leading: SvgPicture.asset(
                                    'assets/leads.svg',
                                    height: Adaptive.sp(20),
                                    width: Adaptive.sp(20),
                                  ),
                                  onTap: () =>
                                      _navigateWithClockCheck('completed_audit'),
                                ),
                              ],
                            ),
                            ExpansionTile(
                              shape: const Border(
                                  bottom: BorderSide(color: primaryColorDark)),
                              expandedAlignment: Alignment.centerLeft,
                              title: Text(
                                'Vendor Voucher',
                                style: TextStyle(fontSize: Adaptive.sp(16)),
                              ),
                              leading: Image.asset(
                                'assets/WHS-removebg-preview.png',
                                height: Adaptive.sp(20),
                                width: Adaptive.sp(20),
                              ),
                              children: [
                                CupertinoListTile(
                                  title: Text(
                                    'Vendor Voucher List',
                                    style: TextStyle(fontSize: Adaptive.sp(16)),
                                  ),
                                  leading: Image.asset(
                                    'assets/vendor-approve-icon (1).png',
                                    height: Adaptive.sp(20),
                                    width: Adaptive.sp(20),
                                  ),
                                  onTap: () =>
                                      _navigateWithClockCheck('vendor_voucher'),
                                ),
                                CupertinoListTile(
                                  title: Text(
                                    'Vendor Voucher Approve',
                                    style: TextStyle(fontSize: Adaptive.sp(16)),
                                  ),
                                  leading: Image.asset(
                                    'assets/approve-vendor-voucher.png',
                                    height: Adaptive.sp(20),
                                    width: Adaptive.sp(20),
                                  ),
                                  onTap: () =>
                                      _navigateWithClockCheck('vendor_voucher_approve'),
                                ),
                                CupertinoListTile(
                                  title: Text(
                                    'Add Voucher',
                                    style: TextStyle(fontSize: Adaptive.sp(16)),
                                  ),
                                  leading: Image.asset(
                                    'assets/add-vendor-voucher.png',
                                    height: Adaptive.sp(20),
                                    width: Adaptive.sp(20),
                                  ),
                                  onTap: () =>
                                      _navigateWithClockCheck('add_vendor_voucher'),
                                ),
                              ],
                            ),
                            ExpansionTile(
                              shape: const Border(
                                  bottom: BorderSide(color: primaryColorDark)),
                              expandedAlignment: Alignment.centerLeft,
                              title: Text(
                                'Conveyance Voucher',
                                style: TextStyle(fontSize: Adaptive.sp(16)),
                              ),
                              leading: SvgPicture.asset(
                                'assets/voucher.svg',
                                height: Adaptive.sp(20),
                                width: Adaptive.sp(20),
                              ),
                              children: [
                                CupertinoListTile(
                                  title: Text(
                                    'Create Conveyance Voucher',
                                    style: TextStyle(fontSize: Adaptive.sp(16)),
                                  ),
                                  leading: SvgPicture.asset(
                                    'assets/voucher.svg',
                                    height: Adaptive.sp(20),
                                    width: Adaptive.sp(20),
                                  ),
                                  onTap: () =>
                                      _navigateWithClockCheck('create_voucher'),
                                ),
                                CupertinoListTile(
                                  title: Text(
                                    'Voucher History',
                                    style: TextStyle(fontSize: Adaptive.sp(16)),
                                  ),
                                  leading: SvgPicture.asset(
                                    'assets/voucher.svg',
                                    height: Adaptive.sp(20),
                                    width: Adaptive.sp(20),
                                  ),
                                  onTap: () =>
                                      _navigateWithClockCheck('voucher_history'),
                                ),
                                CupertinoListTile(
                                  title: Text(
                                    'Voucher Requests',
                                    style: TextStyle(fontSize: Adaptive.sp(16)),
                                  ),
                                  leading: SvgPicture.asset(
                                    'assets/voucher.svg',
                                    height: Adaptive.sp(20),
                                    width: Adaptive.sp(20),
                                  ),
                                  onTap: () =>
                                      _navigateWithClockCheck('voucher_request'),
                                ),
                              ],
                            ),
                            ListTile(
                                title: Text(
                                  'Cancel Case Ids',
                                  style: TextStyle(fontSize: Adaptive.sp(16)),
                                ),
                                leading: SvgPicture.asset(
                                  'assets/truck.svg',
                                  height: Adaptive.sp(20),
                                  width: Adaptive.sp(20),
                                ),
                                trailing: const CupertinoListTileChevron(),
                                 onTap: () => _navigateWithClockCheck('cancel_case_id')),
                            ExpansionTile(
                              shape: const Border(
                                  bottom: BorderSide(color: primaryColorDark)),
                              expandedAlignment: Alignment.centerLeft,
                              title: Text(
                                'Spillage Collection(Displeased)',
                                style: TextStyle(fontSize: Adaptive.sp(16)),
                              ),
                              leading: Image.asset(
                                'assets/displeased-icon.png',
                                height: Adaptive.sp(20),
                                width: Adaptive.sp(20),
                              ),
                              children: [
                                CupertinoListTile(
                                  title: Text(
                                    'Add Spillage Request',
                                    style: TextStyle(fontSize: Adaptive.sp(16)),
                                  ),
                                  leading: Image.asset(
                                    'assets/displeased-bags-icon.png',
                                    height: Adaptive.sp(20),
                                    width: Adaptive.sp(20),
                                  ),
                                  onTap: () =>
                                      _navigateWithClockCheck('displeased_bags'),
                                ),
                                CupertinoListTile(
                                  title: Text(
                                    'Requests For Me',
                                    style: TextStyle(fontSize: Adaptive.sp(16)),
                                  ),
                                  leading: Image.asset(
                                    'assets/displeased-request-icon.png',
                                    height: Adaptive.sp(20),
                                    width: Adaptive.sp(20),
                                  ),
                                  onTap: () => _navigateWithClockCheck(
                                      'displeased_request_list'),
                                ),
                                CupertinoListTile(
                                  title: Text(
                                    'My Requests',
                                    style: TextStyle(fontSize: Adaptive.sp(16)),
                                  ),
                                  leading: Image.asset(
                                    'assets/displeased-approval-icon.png',
                                    height: Adaptive.sp(20),
                                    width: Adaptive.sp(20),
                                  ),
                                  onTap: () => _navigateWithClockCheck(
                                      'displeased_approve_reject'),
                                ),
                              ],
                            ),
                            ExpansionTile(
                              shape: const Border(
                                  bottom: BorderSide(color: primaryColorDark)),
                              expandedAlignment: Alignment.centerLeft,
                              title: Text(
                                'In',
                                style: TextStyle(fontSize: Adaptive.sp(16)),
                              ),
                              leading: SvgPicture.asset(
                                'assets/truck_in.svg',
                                height: Adaptive.sp(20),
                                width: Adaptive.sp(20),
                              ),
                              children: [
                                CupertinoListTile(
                                  title: Text(
                                    'Truck Book',
                                    style: TextStyle(fontSize: Adaptive.sp(16)),
                                  ),
                                  leading: SvgPicture.asset(
                                    'assets/truck.svg',
                                    height: Adaptive.sp(20),
                                    width: Adaptive.sp(20),
                                  ),
                                  onTap: () {
                                    _navigateWithClockCheck('truck_book_list',
                                        extra: {'in_out': 'IN'});
                                  },
                                ),
                                CupertinoListTile(
                                    title: Text(
                                      'Labour Book',
                                      style:
                                          TextStyle(fontSize: Adaptive.sp(16)),
                                    ),
                                    leading: SvgPicture.asset(
                                      'assets/labour.svg',
                                      height: Adaptive.sp(20),
                                      width: Adaptive.sp(20),
                                    ),
                                    onTap: () {
                                      _navigateWithClockCheck('labour_book_list',
                                          extra: {'in_out': 'IN'});
                                    }),
                                CupertinoListTile(
                                  title: Text(
                                    'First Kanta Parchi',
                                    style: TextStyle(fontSize: Adaptive.sp(16)),
                                  ),
                                  leading: SvgPicture.asset(
                                    'assets/bag.svg',
                                    height: Adaptive.sp(20),
                                    width: Adaptive.sp(20),
                                  ),
                                  onTap: () {
                                    _navigateWithClockCheck('f_kanta_parchi_list',
                                        extra: {'in_out': 'IN'});
                                  },
                                ),
                                CupertinoListTile(
                                  title: Text(
                                    'First Quality Report',
                                    style: TextStyle(fontSize: Adaptive.sp(16)),
                                  ),
                                  leading: SvgPicture.asset(
                                    'assets/f_quality.svg',
                                    height: Adaptive.sp(20),
                                    width: Adaptive.sp(20),
                                  ),
                                  onTap: () {
                                    _navigateWithClockCheck('f_quality_report_list');
                                  },
                                ),
                                CupertinoListTile(
                                  title: Text(
                                    'Second Kanta Parchi',
                                    style: TextStyle(fontSize: Adaptive.sp(16)),
                                  ),
                                  leading: SvgPicture.asset(
                                    'assets/bag.svg',
                                    height: Adaptive.sp(20),
                                    width: Adaptive.sp(20),
                                  ),
                                  onTap: () {
                                    _navigateWithClockCheck('s_kanta_parchi_list',
                                        extra: {'in_out': 'IN'});
                                  },
                                ),
                                CupertinoListTile(
                                  title: Text(
                                    'Second Quality Report',
                                    style: TextStyle(fontSize: Adaptive.sp(16)),
                                  ),
                                  leading: SvgPicture.asset(
                                    'assets/f_quality.svg',
                                    height: Adaptive.sp(20),
                                    width: Adaptive.sp(20),
                                  ),
                                  onTap: () {
                                    _navigateWithClockCheck('s_quality_list',
                                        extra: {'in_out': 'IN'});
                                  },
                                ),
                              ],
                            ),
                            ExpansionTile(
                              shape: const Border(
                                  bottom: BorderSide(color: primaryColorDark)),
                              expandedAlignment: Alignment.centerLeft,
                              title: Text(
                                'OUT',
                                style: TextStyle(fontSize: Adaptive.sp(16)),
                              ),
                              leading: SvgPicture.asset(
                                'assets/truck_out.svg',
                                height: Adaptive.sp(20),
                                width: Adaptive.sp(20),
                              ),
                              children: [
                                CupertinoListTile(
                                  title: Text(
                                    'Truck Book',
                                    style: TextStyle(fontSize: Adaptive.sp(16)),
                                  ),
                                  leading: SvgPicture.asset(
                                    'assets/truck.svg',
                                    height: Adaptive.sp(20),
                                    width: Adaptive.sp(20),
                                  ),
                                  onTap: () {
                                    _navigateWithClockCheck('truck_book_list',
                                        extra: {'in_out': 'OUT'});
                                  },
                                ),
                                CupertinoListTile(
                                    title: Text(
                                      'Labour Book',
                                      style:
                                          TextStyle(fontSize: Adaptive.sp(16)),
                                    ),
                                    leading: SvgPicture.asset(
                                      'assets/labour.svg',
                                      height: Adaptive.sp(20),
                                      width: Adaptive.sp(20),
                                    ),
                                    onTap: () => _navigateWithClockCheck(
                                        'labour_book_list',
                                        extra: {'in_out': 'OUT'})),
                                CupertinoListTile(
                                  title: Text(
                                    'First Kanta Parchi',
                                    style: TextStyle(fontSize: Adaptive.sp(16)),
                                  ),
                                  leading: SvgPicture.asset(
                                    'assets/bag.svg',
                                    height: Adaptive.sp(20),
                                    width: Adaptive.sp(20),
                                  ),
                                  onTap: () {
                                    _navigateWithClockCheck('f_kanta_parchi_list',
                                        extra: {'in_out': 'OUT'});
                                  },
                                ),
                                CupertinoListTile(
                                  title: Text(
                                    'Second Quality Report',
                                    style: TextStyle(fontSize: Adaptive.sp(16)),
                                  ),
                                  leading: SvgPicture.asset(
                                    'assets/f_quality.svg',
                                    height: Adaptive.sp(20),
                                    width: Adaptive.sp(20),
                                  ),
                                  onTap: () {
                                    _navigateWithClockCheck('s_quality_list',
                                        extra: {'in_out': 'OUT'});
                                  },
                                ),
                                CupertinoListTile(
                                  title: Text(
                                    'Second Kanta Parchi',
                                    style: TextStyle(fontSize: Adaptive.sp(16)),
                                  ),
                                  leading: SvgPicture.asset(
                                    'assets/bag.svg',
                                    height: Adaptive.sp(20),
                                    width: Adaptive.sp(20),
                                  ),
                                  onTap: () {
                                    _navigateWithClockCheck('s_kanta_parchi_list',
                                        extra: {'in_out': 'OUT'});
                                  },
                                ),
                              ],
                            ),
                            ExpansionTile(
                              shape: const Border(
                                  bottom: BorderSide(color: primaryColorDark)),
                              expandedAlignment: Alignment.centerLeft,
                              title: Text(
                                'Withdraw',
                                style: TextStyle(fontSize: Adaptive.sp(16)),
                              ),
                              leading: SvgPicture.asset(
                                'assets/advance.svg',
                                height: Adaptive.sp(20),
                                width: Adaptive.sp(20),
                              ),
                              children: [
                                CupertinoListTile(
                                  title: Text(
                                    'Withdraw Requests',
                                    style: TextStyle(fontSize: Adaptive.sp(16)),
                                  ),
                                  leading: SvgPicture.asset(
                                    'assets/advance_request.svg',
                                    height: Adaptive.sp(20),
                                    width: Adaptive.sp(20),
                                  ),
                                  onTap: () {
                                    _navigateWithClockCheck('withdraw_requests');
                                  },
                                ),
                                CupertinoListTile(
                                  title: Text(
                                    'My Withdraw Requests',
                                    style: TextStyle(fontSize: Adaptive.sp(16)),
                                  ),
                                  leading: SvgPicture.asset(
                                    'assets/advance_request.svg',
                                    height: Adaptive.sp(20),
                                    width: Adaptive.sp(20),
                                  ),
                                  onTap: () {
                                    _navigateWithClockCheck('advance');
                                  },
                                ),
                                CupertinoListTile(
                                  title: Text(
                                    'Withdraw History',
                                    style: TextStyle(fontSize: Adaptive.sp(16)),
                                  ),
                                  leading: SvgPicture.asset(
                                    'assets/advance_request.svg',
                                    height: Adaptive.sp(20),
                                    width: Adaptive.sp(20),
                                  ),
                                  onTap: () {
                                    _navigateWithClockCheck('advance_history');
                                  },
                                ),
                              ],
                            ),
                            ListTile(
                              title: Text(
                                'PV',
                                style: TextStyle(fontSize: Adaptive.sp(16)),
                              ),
                              leading: SvgPicture.asset(
                                'assets/pv.svg',
                                height: Adaptive.sp(20),
                                width: Adaptive.sp(20),
                              ),
                              onTap: () {
                                _navigateWithClockCheck('pv');
                              },
                            ),
                            ListTile(
                              title: Text(
                                'Check for update',
                                style: TextStyle(fontSize: Adaptive.sp(16)),
                              ),
                              leading: SvgPicture.asset(
                                'assets/update.svg',
                                height: Adaptive.sp(20),
                                width: Adaptive.sp(20),
                              ),
                              onTap: () {
                                _navigateWithClockCheck('update');
                              },
                            ),
                            TextButton(
                              onPressed: () async {
                                await ref
                                    .watch(sharedUtilityProvider)
                                    .sharedPreferences
                                    .clear()
                                    .then((value) {
                                  context.go('/login');
                                });
                              },
                              child: Text("Logout",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red,
                                      fontSize: Adaptive.sp(16))),
                            )
                          ],
                        )
                ],
              )),
        ),
        body: homeLayout(context, ref),
      );

  toggleDrawer() async {
    if (_scaffoldKey.currentState?.isDrawerOpen ?? false) {
      _scaffoldKey.currentState?.openEndDrawer();
    } else {
      _scaffoldKey.currentState?.openDrawer();
    }
  }

  TextEditingController notesController = TextEditingController();

  homeLayout(BuildContext context, WidgetRef ref) => SafeArea(
      child:
          (ref.watch(sharedUtilityProvider).getUser()?.designation)
                  .toString()
                  .toLowerCase()
                  .replaceAll(" ", '')
                  .contains('guard')
              ? ListView(
                  children: [
                    RowSuper(fill: true, children: [
                      InkWell(
                        child: Card(
                          color: primaryColor,
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          margin: const Pad(all: 10),
                          child: Padding(
                            padding: const Pad(all: 10),
                            child: RowSuper(children: [
                              const Card.outlined(
                                child: Padding(
                                  padding: Pad(all: 10),
                                  child: Icon(CupertinoIcons.arrow_down_left),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Gaurd IN',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: Adaptive.sp(14),
                                        color: Colors.white),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ]),
                          ),
                        ),
                        onTap: () {
                          context.goNamed('guard_in_screen');
                        },
                      ),
                      InkWell(
                        child: Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          color: primaryColor,
                          margin: const Pad(all: 10),
                          child: Padding(
                            padding: const Pad(all: 10),
                            child: RowSuper(children: [
                              const Card.outlined(
                                child: Padding(
                                  padding: Pad(all: 10),
                                  child: Icon(CupertinoIcons.arrow_up_right),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Guard OUT',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: Adaptive.sp(14),
                                        color: Colors.white),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ]),
                          ),
                        ),
                        onTap: () {
                          context.goNamed('guard_out_screen');
                        },
                      ),
                    ])
                  ],
                )
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      ref.watch(caseRequestsProvider).when(
                          data: (data) {
                            var inwardsList = [];
                            var outwardsList = [];
                            data.inwardRequestData?.forEach((element) {
                              if (ref
                                      .watch(sharedUtilityProvider)
                                      .getUser()
                                      ?.terminal ==
                                  null) {
                                inwardsList.add(element);
                              } else if (ref
                                      .watch(sharedUtilityProvider)
                                      .getUser()
                                      ?.terminal ==
                                  element.terminalId) {
                                inwardsList.add(element);
                              }
                            });

                            data.outwardRequestData?.forEach((element) {
                              if (ref
                                      .watch(sharedUtilityProvider)
                                      .getUser()
                                      ?.terminal ==
                                  null) {
                                outwardsList.add(element);
                              } else if (ref
                                      .watch(sharedUtilityProvider)
                                      .getUser()
                                      ?.terminal ==
                                  element.terminalId) {
                                outwardsList.add(element);
                              }
                            });

                            return RowSuper(fill: true, children: [
                              InkWell(
                                child: Card(
                                  color: primaryColor,
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  margin: const Pad(all: 10),
                                  child: Padding(
                                    padding: const Pad(all: 10),
                                    child: RowSuper(children: [
                                      const Card.outlined(
                                        child: Padding(
                                          padding: Pad(all: 10),
                                          child: Icon(
                                              CupertinoIcons.arrow_down_left),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Inwards Requests',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: Adaptive.sp(14),
                                                color: Colors.white),
                                          ),
                                          Text(
                                            '${inwardsList.length}',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: Adaptive.sp(18),
                                                color: Colors.white),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                    ]),
                                  ),
                                ),
                                onTap: () {
                                  context.goNamed('inwards');
                                },
                              ),
                              InkWell(
                                child: Card(
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  color: primaryColor,
                                  margin: const Pad(all: 10),
                                  child: Padding(
                                    padding: const Pad(all: 10),
                                    child: RowSuper(children: [
                                      const Card.outlined(
                                        child: Padding(
                                          padding: Pad(all: 10),
                                          child: Icon(
                                              CupertinoIcons.arrow_up_right),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Outwards Requests',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: Adaptive.sp(14),
                                                color: Colors.white),
                                          ),
                                          Text(
                                            '${outwardsList.length}',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: Adaptive.sp(18),
                                                color: Colors.white),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                    ]),
                                  ),
                                ),
                                onTap: () {
                                  context.goNamed('outwards');
                                },
                              ),
                            ]);
                          },
                          error: (e, s) => const SizedBox(),
                          loading: () => shimmerCaseId()),
                      if ((ref
                              .watch(sharedUtilityProvider)
                              .getUser()
                              ?.terminal !=
                          null))
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: InkWell(
                            child: Card(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              color: primaryColor,
                              margin: const Pad(all: 10),
                              child: Padding(
                                padding: const Pad(all: 10),
                                child: RowSuper(children: [
                                  const Card.outlined(
                                    child: Padding(
                                      padding: Pad(all: 10),
                                      child: Icon(CupertinoIcons.book),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Generate Case ID',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: Adaptive.sp(14),
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ]),
                              ),
                            ),
                            onTap: () {
                              context.goNamed('generate_case_id');
                            },
                          ),
                        ),
                      const SizedBox(
                        height: 10,
                      ),
                      Dashboardpanel(),
                      Padding(
                        padding: const Pad(all: 10),
                        child: Text(
                          "Running Case Ids",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: Adaptive.sp(18)),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: ref.watch(caseIdProvider).when(
                            data: (data) {
                              List<Datum> distinctList = [];
                              if (data.data != null) {
                                if (data.data!.data != null) {
                                  if (ref
                                          .watch(sharedUtilityProvider)
                                          .getUser()
                                          ?.terminal !=
                                      null) {
                                    distinctList.addAll(data.data!.data!.where(
                                        (element) =>
                                            element.terminalId.toString() ==
                                            ref
                                                .watch(sharedUtilityProvider)
                                                .getUser()
                                                ?.terminal
                                                .toString()));
                                  } else {
                                    distinctList.addAll(data.data!.data!);
                                  }
                                }
                              }

                              if (distinctList.isNotEmpty) {
                                distinctList =
                                    distinctList.reversed.toSet().toList();
                              }

                              return distinctList.isEmpty
                                  ? noItems("Case Ids", context)
                                  : SizedBox(
                                      child: ListView.builder(
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemCount: distinctList.length,
                                          shrinkWrap: true,
                                          itemBuilder: (context, index) {
                                            DateTime dateTimeCreatedAt =
                                                DateTime.parse(
                                                    distinctList[index]
                                                            .createdAt ??
                                                        "");
                                            DateTime dateTimeNow =
                                                DateTime.now();
                                            debugPrint(dateTimeNow
                                                .difference(dateTimeCreatedAt)
                                                .toString());

                                            DateTime a = DateTime.parse(
                                                distinctList[index].createdAt ??
                                                    "");
                                            DateTime b = DateTime.now();

                                            var currentInStatus =
                                                "CCTV Pending";

                                            final profileData = ref
                                                .watch(profileDataProvider)
                                                .value;

                                            final isQualityAssayer = profileData
                                                    ?.profileData
                                                    ?.isQualityAssayer
                                                    .toString() ==
                                                "1";
                                            var currentOutStatus =
                                                'CCTV Pending';
                                            if (isQualityAssayer) {
                                              if (distinctList[index]
                                                          .sQualityReport ==
                                                      null &&
                                                  distinctList[index]
                                                          .sKParchi !=
                                                      null) {
                                                currentInStatus =
                                                    "Add Second Quality Report";
                                              } else {
                                                currentInStatus = "Gatepass Recommend Approval Pending ";
                                              }
                                            } else if (distinctList[index]
                                                    .truckbook ==
                                                null) {
                                              currentInStatus =
                                                  "Add Truck Book";

                                              a = DateTime.parse(
                                                  distinctList[index]
                                                          .createdAt ??
                                                      "");
                                            } else if (distinctList[index]
                                                    .labourbook ==
                                                null) {
                                              currentInStatus = "Add Labour";
                                            } else if (distinctList[index]
                                                    .firstKantaParchi ==
                                                null) {
                                              a = DateTime.parse(
                                                  distinctList[index]
                                                          .labourbookDate ??
                                                      "");

                                              currentInStatus =
                                                  "Add First Kanta Parchi";
                                            } else if (distinctList[index]
                                                    .firstQuality ==
                                                null) {
                                              a = DateTime.parse(distinctList[
                                                          index]
                                                      .firstKantaParchiDate ??
                                                  "");

                                              currentInStatus =
                                                  "Add First Quality";
                                            } else if (distinctList[index]
                                                    .fQTagging ==
                                                null) {
                                              a = DateTime.parse(
                                                  distinctList[index]
                                                          .firstQualityDate ??
                                                      "");

                                              currentInStatus =
                                                  "Quality Approval Pending from user side";
                                            } else if (distinctList[index]
                                                    .sKParchi ==
                                                null) {
                                              a = DateTime.parse(
                                                  distinctList[index]
                                                          .fQTaggingDate ??
                                                      "");

                                              currentInStatus =
                                                  "Add Second Kanta Parchi";
                                            } else if (distinctList[index]
                                                    .sQualityReport ==
                                                null) {
                                              a = DateTime.parse(
                                                  distinctList[index]
                                                          .sKParchiDate ??
                                                      "");

                                              if (isQualityAssayer) {
                                                currentInStatus =
                                                    "Add Second Quality Report";
                                              } else {
                                                currentInStatus =
                                                    "Second Quality Pending";
                                              }
                                            } else if (distinctList[index]
                                                    .ivrReport ==
                                                null) {
                                              a = DateTime.parse(
                                                  distinctList[index]
                                                          .sKParchiDate ??
                                                      "");

                                              if (ref
                                                      .watch(
                                                          sharedUtilityProvider)
                                                      .getUser()
                                                      ?.terminal !=
                                                  null) {
                                                currentInStatus =
                                                    "Gatepass Recommeded Approval Pending";
                                              } else {
                                                currentInStatus =
                                                    "Gatepass recommended";
                                              }
                                            } else if (distinctList[index]
                                                    .gatepassReport ==
                                                null) {
                                              a = DateTime.parse(
                                                  distinctList[index].ivrDate ??
                                                      "");

                                              currentInStatus =
                                                  "Gatepass Approval Pending";
                                            } else {
                                              currentInStatus = "Done";
                                            }
                                            ;
                                            if (distinctList[index].truckbook ==
                                                null) {
                                              currentOutStatus =
                                                  "Add Truck Book";
                                            } else if (distinctList[index]
                                                    .labourbook ==
                                                null) {
                                              currentOutStatus = "Add Labour";
                                            } else if (distinctList[index]
                                                    .firstKantaParchi ==
                                                null) {
                                              currentOutStatus =
                                                  "Add First Kanta Parchi";
                                            } else if (distinctList[index]
                                                    .firstQuality ==
                                                null) {
                                              currentOutStatus =
                                                  "Add First Quality";
                                            } else if (distinctList[index]
                                                    .fQTagging ==
                                                null) {
                                              currentOutStatus =
                                                  "Quality Approval Pending";
                                            } else if (distinctList[index]
                                                    .sKParchi ==
                                                null) {
                                              currentOutStatus =
                                                  "Add Second Kanta Parchi";
                                            } else if (distinctList[index]
                                                    .sQualityReport ==
                                                null) {
                                              currentOutStatus =
                                                  "Add Second Quality Report";
                                            } else if (distinctList[index]
                                                    .ivrReport ==
                                                null) {
                                              if (ref
                                                      .watch(
                                                          sharedUtilityProvider)
                                                      .getUser()
                                                      ?.terminal !=
                                                  null) {
                                                currentOutStatus =
                                                    "Gatepass Recommeded Approval Pending";
                                              } else {
                                                currentOutStatus =
                                                    "Gatepass recommended";
                                              }
                                            } else if (distinctList[index]
                                                    .gatepassReport ==
                                                null) {
                                              currentOutStatus =
                                                  "Gatepass Approval Pending";
                                            } else {
                                              currentOutStatus = "Done";
                                            }
                                            Duration difference =
                                                b.difference(a);

                                            print(difference);

                                            int days = difference.inDays;
                                            int hours = difference.inHours % 24;
                                            int minutes =
                                                difference.inMinutes % 60;
                                            return distinctList[index].inOut ==
                                                    "IN"
                                                ? Container(
                                                    margin: const Pad(all: 10),
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color:
                                                                primaryColor),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10)),
                                                    child: Padding(
                                                      padding:
                                                          const Pad(all: 10),
                                                      child: ColumnSuper(
                                                          alignment:
                                                              Alignment.center,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const Pad(
                                                                      all: 10),
                                                              child: Text.rich(TextSpan(
                                                                  text:
                                                                      'Case Id: ${distinctList[index].caseId}',
                                                                  style: TextStyle(
                                                                      color:
                                                                          primaryColorDark,
                                                                      fontSize:
                                                                          Adaptive.sp(
                                                                              14),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700))),
                                                            ),
                                                            const Divider(
                                                              height: 2,
                                                            ),
                                                            const SizedBox(
                                                              height: 10,
                                                            ),
                                                            Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Expanded(
                                                                    child: Text(
                                                                      '${distinctList[index].stackNumber}',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .black,
                                                                          fontSize: Adaptive.sp(
                                                                              14),
                                                                          fontWeight:
                                                                              FontWeight.w800),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    height: 50,
                                                                    color: Colors
                                                                        .grey,
                                                                    width: 1,
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          const Pad(
                                                                              all: 10),
                                                                      child:
                                                                          Text(
                                                                        '${distinctList[index].custFname}  (${distinctList[index].phone})',
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.black,
                                                                            fontSize: Adaptive.sp(14),
                                                                            fontWeight: FontWeight.w800),
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    height: 50,
                                                                    color: Colors
                                                                        .grey,
                                                                    width: 1,
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        ColumnSuper(
                                                                      alignment:
                                                                          Alignment
                                                                              .topCenter,
                                                                      children: [
                                                                        Text(
                                                                          '${distinctList[index].vehicleNo}',
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          style: TextStyle(
                                                                              color: Colors.black,
                                                                              fontSize: Adaptive.sp(14),
                                                                              fontWeight: FontWeight.w800),
                                                                        ),
                                                                        Text(
                                                                          '${distinctList[index].driverPhone}',
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          style: TextStyle(
                                                                              color: Colors.black,
                                                                              fontSize: Adaptive.sp(14),
                                                                              fontWeight: FontWeight.w800),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    height: 50,
                                                                    color: Colors
                                                                        .grey,
                                                                    width: 1,
                                                                  ),
                                                                ]),
                                                            const SizedBox(
                                                              height: 10,
                                                            ),
                                                            RowSuper(
                                                                fill: true,
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    'TAT : $days days, ${hours} hours, and ${minutes} minutes',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: TextStyle(
                                                                        color:
                                                                            primaryColor,
                                                                        fontSize:
                                                                            Adaptive.sp(
                                                                                14),
                                                                        fontWeight:
                                                                            FontWeight.w800),
                                                                  ),
                                                                ]),
                                                            const SizedBox(
                                                              height: 10,
                                                            ),
                                                            distinctList[index]
                                                                            .truckbook ==
                                                                        null ||
                                                                    (distinctList[index].labourbook ==
                                                                            null &&
                                                                        distinctList[index]
                                                                                .truckbook !=
                                                                            null) ||
                                                                    (distinctList[index]
                                                                            .firstKantaParchi ==
                                                                        null) ||
                                                                    (distinctList[index]
                                                                                .firstQuality ==
                                                                            null &&
                                                                        distinctList[index]
                                                                                .firstKantaParchi !=
                                                                            null) ||
                                                                    (distinctList[index].sKParchi ==
                                                                            null &&
                                                                        distinctList[index].fQTagging !=
                                                                            null) ||
                                                                    (distinctList[index].sQualityReport ==
                                                                            null &&
                                                                        isQualityAssayer &&
                                                                        distinctList[index].inOut ==
                                                                            "IN") ||
                                                                    (distinctList[index].ivrReport ==
                                                                            null &&
                                                                        ref.watch(sharedUtilityProvider).getUser()?.terminal ==
                                                                            null)
                                                                ? Column(
                                                                    children: [
                                                                      AnimatedButton(
                                                                        height:
                                                                            50,
                                                                        color:
                                                                            primaryColorDark,
                                                                        width: MediaQuery.of(context).size.width /
                                                                            1.2,
                                                                        isOutline:
                                                                            true,
                                                                        isMultiColor:
                                                                            true,
                                                                        colors: const [
                                                                          primaryColorDark,
                                                                          primaryColorDark
                                                                        ],
                                                                        borderWidth:
                                                                            1,
                                                                        onTap:
                                                                            () {
                                                                          if (distinctList[index].truckbook ==
                                                                              null) {
                                                                            context.goNamed('truck_book', extra: {
                                                                              'case_id': distinctList[index].caseId ?? "",
                                                                              'customer_name': distinctList[index].custFname ?? ""
                                                                            });
                                                                          } else if (distinctList[index].labourbook ==
                                                                              null) {
                                                                            context.goNamed('labour_book', extra: {
                                                                              'case_id': distinctList[index].caseId ?? "",
                                                                              'customer_name': distinctList[index].custFname ?? "",
                                                                              'terminal_id': "${distinctList[index].terminalId ?? 0}",
                                                                              "commodity_id": "${distinctList[index].commodityId ?? 0}"
                                                                            });
                                                                          } else if (distinctList[index].firstKantaParchi ==
                                                                              null) {
                                                                            context.goNamed('f_kanta_parchi', extra: {
                                                                              'case_id': distinctList[index].caseId ?? "",
                                                                              'customer_name': distinctList[index].custFname ?? "",
                                                                              'terminal_id': "${distinctList[index].terminalId ?? 0}",
                                                                              "in_out": "${distinctList[index].inOut}"
                                                                            });
                                                                          } else if (distinctList[index].firstQuality ==
                                                                              null) {
                                                                            context.goNamed('f_quality_report', extra: {
                                                                              'case_id': distinctList[index].caseId ?? "",
                                                                              'customer_name': distinctList[index].custFname ?? "",
                                                                              "in_out": "${distinctList[index].inOut}"
                                                                            });
                                                                          } else if (distinctList[index].fQTagging ==
                                                                              null) {
                                                                          } // SECOND KANTA
                                                                          else if (distinctList[index].sKParchi ==
                                                                              null) {
                                                                            context.goNamed(
                                                                              's_kanta_parchi',
                                                                              extra: {
                                                                                'case_id': distinctList[index].caseId ?? "",
                                                                                'customer_name': distinctList[index].custFname ?? "",
                                                                                'terminal_id': "${distinctList[index].terminalId ?? 0}",
                                                                                "in_out": "${distinctList[index].inOut}"
                                                                              },
                                                                            );
                                                                          } else if (distinctList[index].sQualityReport ==
                                                                              null) {
                                                                            context.goNamed(
                                                                              's_quality_report',
                                                                              extra: {
                                                                                'case_id': distinctList[index].caseId ?? "",
                                                                                'customer_name': distinctList[index].custFname ?? "",
                                                                                'avg_weight': "${distinctList[index].sKPAvgWeight ?? 0}",
                                                                                "in_out": "${distinctList[index].inOut}",
                                                                                "commodity_quality": "${distinctList[index].commodityQuality ?? 0}",
                                                                              },
                                                                            );
                                                                          } else if (distinctList[index].ivrReport ==
                                                                              null) {
                                                                            context.goNamed(
                                                                              'gatepass_screen',
                                                                              extra: {
                                                                                'case_id': distinctList[index].caseId ?? "",
                                                                                'in_out': "${distinctList[index].inOut ?? ""}",
                                                                              },
                                                                            );
                                                                          }
                                                                        },
                                                                        child:
                                                                            Text(
                                                                          currentInStatus,
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          style: TextStyle(
                                                                              color: Colors.white,
                                                                              fontSize: Adaptive.sp(14),
                                                                              fontWeight: FontWeight.w800),
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            10,
                                                                      ),
                                                                      Visibility(
                                                                          visible:
                                                                              false,
                                                                          child:
                                                                              AnimatedButton(
                                                                            height:
                                                                                50,
                                                                            color:
                                                                                primaryColorDark,
                                                                            width:
                                                                                MediaQuery.of(context).size.width / 1.2,
                                                                            isOutline:
                                                                                true,
                                                                            isMultiColor:
                                                                                true,
                                                                            colors: const [
                                                                              primaryColorDark,
                                                                              primaryColorDark
                                                                            ],
                                                                            borderWidth:
                                                                                1,
                                                                            onTap:
                                                                                () {
                                                                              PanaraConfirmDialog.show(
                                                                                context,
                                                                                title: "Are you sure?",
                                                                                message: "You want to byepass first quality?",
                                                                                confirmButtonText: "Confirm",
                                                                                cancelButtonText: "Cancel",
                                                                                color: Colors.red,
                                                                                onTapCancel: () {
                                                                                  Navigator.pop(context);
                                                                                },
                                                                                onTapConfirm: () {
                                                                                  Navigator.pop(context);
                                                                                  showLoaderDialog(context);
                                                                                  ref.watch(byePassFqProvider(caseId: distinctList[index].caseId).future).then((value) {
                                                                                    hideLoaderDialog(context);
                                                                                    if (value['status'].toString() == "1") {
                                                                                      ref.invalidate(caseIdProvider);
                                                                                      ref.invalidate(caseRequestsProvider);
                                                                                    }
                                                                                  }).onError((e, s) {
                                                                                    hideLoaderDialog(context);
                                                                                  });
                                                                                },
                                                                                panaraDialogType: PanaraDialogType.custom,
                                                                                barrierDismissible: false,
                                                                              );
                                                                            },
                                                                            child:
                                                                                Text(
                                                                              'Waive',
                                                                              textAlign: TextAlign.center,
                                                                              style: TextStyle(color: Colors.white, fontSize: Adaptive.sp(14), fontWeight: FontWeight.w800),
                                                                            ),
                                                                          ))
                                                                    ],
                                                                  )
                                                                : Text(
                                                                    currentInStatus,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: TextStyle(
                                                                        color:
                                                                            primaryColorDark,
                                                                        fontSize:
                                                                            Adaptive.sp(
                                                                                14),
                                                                        fontWeight:
                                                                            FontWeight.w800),
                                                                  ),
                                                            distinctList[index]
                                                                            .cancelCaseId !=
                                                                        null &&
                                                                    ref
                                                                            .watch(sharedUtilityProvider)
                                                                            .getUser()
                                                                            ?.empId
                                                                            .toString()
                                                                            .toLowerCase() ==
                                                                        "ag0212"
                                                                ? AnimatedButton(
                                                                    height: 50,
                                                                    color: Colors
                                                                        .red
                                                                        .shade800,
                                                                    width: MediaQuery.of(context)
                                                                            .size
                                                                            .width /
                                                                        1.2,
                                                                    isOutline:
                                                                        true,
                                                                    isMultiColor:
                                                                        true,
                                                                    colors: [
                                                                      Colors.red
                                                                          .shade800,
                                                                      Colors.red
                                                                          .shade800
                                                                    ],
                                                                    borderWidth:
                                                                        1,
                                                                    onTap:
                                                                        () async {
                                                                      ElevarmConfirmAlertDialog(
                                                                              title: 'Confirmation Dialog',
                                                                              subtitle: 'Are you sure you want to cancel this case?',
                                                                              onPositiveButton: () {
                                                                                showLoaderDialog(context);
                                                                                ref.watch(postCancelCaseIdRequestProvider(caseId: distinctList[index].caseId).future).then((value) {
                                                                                  hideLoaderDialog(context);

                                                                                  if (value['status'].toString() == "1") {
                                                                                    ref.invalidate(caseIdProvider);
                                                                                    ref.invalidate(caseRequestsProvider);
                                                                                  }
                                                                                  Fluttertoast.showToast(msg: value['message'].toString());
                                                                                  Navigator.of(context, rootNavigator: false).pop();
                                                                                }).onError((e, s) {
                                                                                  hideLoaderDialog(context);
                                                                                });
                                                                              },
                                                                              onNegativeButton: () {
                                                                                Navigator.of(context, rootNavigator: false).pop();
                                                                              },
                                                                              positiveText: 'Cancel',
                                                                              negativeText: 'No',
                                                                              variant: ElevarmDialogVariant.danger)
                                                                          .show(context);
                                                                    },
                                                                    child: Text(
                                                                      'Cancel CaseId',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .white,
                                                                          fontSize: Adaptive.sp(
                                                                              14),
                                                                          fontWeight:
                                                                              FontWeight.w800),
                                                                    ),
                                                                  )
                                                                : null,
                                                            const SizedBox(
                                                              height: 10,
                                                            ),
                                                            Visibility(
                                                                visible: (distinctList[index].sendToLab ==
                                                                            null &&
                                                                        distinctList[index].sQualityReport ==
                                                                            null) &&
                                                                    distinctList[index]
                                                                            .sKParchi !=
                                                                        null &&
                                                                    !(distinctList[index].terminalName ??
                                                                            "")
                                                                        .toString()
                                                                        .toLowerCase()
                                                                        .contains(
                                                                            'vdc'),
                                                                child:
                                                                    AnimatedButton(
                                                                  height: 50,
                                                                  color:
                                                                      primaryColorDark,
                                                                  width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width /
                                                                      1.2,
                                                                  isOutline:
                                                                      true,
                                                                  isMultiColor:
                                                                      true,
                                                                  colors: const [
                                                                    primaryColorDark,
                                                                    primaryColorDark
                                                                  ],
                                                                  borderWidth:
                                                                      1,
                                                                  onTap:
                                                                      () async {
                                                                    showBarModalBottomSheet(
                                                                        context:
                                                                            context,
                                                                        builder: (context) =>
                                                                            SafeArea(
                                                                                child: Padding(
                                                                              padding: const Pad(all: 10),
                                                                              child: ColumnSuper(children: [
                                                                                Text(
                                                                                  'Submit  ',
                                                                                  style: TextStyle(fontWeight: FontWeight.bold, color: primaryColorDark, fontSize: Adaptive.sp(18)),
                                                                                ),
                                                                                SizedBox(
                                                                                  height: 250,
                                                                                  child: InkWell(
                                                                                    child: DottedBorder(
                                                                                      color: primaryColorDark,
                                                                                      borderType: BorderType.RRect,
                                                                                      padding: const Pad(all: 10),
                                                                                      radius: const Radius.circular(5),
                                                                                      child: Center(
                                                                                        child: ref.watch(labReportImageProvider) == null
                                                                                            ? ColumnSuper(
                                                                                                children: const [
                                                                                                  Icon(
                                                                                                    Icons.file_upload_rounded,
                                                                                                    color: primaryColorDark,
                                                                                                  ),
                                                                                                  Text(
                                                                                                    'Capture Lab Report Image',
                                                                                                    style: TextStyle(color: primaryColorDark, fontWeight: FontWeight.bold),
                                                                                                  )
                                                                                                ],
                                                                                              )
                                                                                            : InkWell(
                                                                                                onTap: () async {
                                                                                                  try {
                                                                                                    imagePicker.pickImage(source: ImageSource.camera, maxWidth: 1800, maxHeight: 2000, imageQuality: 25).then((value) async {
                                                                                                      if (value != null) {
                                                                                                        var u8int = await value.readAsBytes();
                                                                                                        createStampedImage(u8int, ref).then((value) {
                                                                                                          ref.watch(labReportImageProvider.notifier).state = value;
                                                                                                        });
                                                                                                      }
                                                                                                    });
                                                                                                  } catch (e, s) {
                                                                                                    debugPrintStack(
                                                                                                      stackTrace: s,
                                                                                                    );
                                                                                                  }
                                                                                                },
                                                                                                child: ZoomOverlay(
                                                                                                  modalBarrierColor: Colors.black12,
                                                                                                  // Optional
                                                                                                  minScale: 0.5,
                                                                                                  // Optional
                                                                                                  maxScale: 3.0,
                                                                                                  // Optional
                                                                                                  animationCurve: Curves.fastOutSlowIn,
                                                                                                  // Defaults to fastOutSlowIn which mimics IOS instagram behavior
                                                                                                  animationDuration: const Duration(milliseconds: 300),
                                                                                                  // Defaults to 100 Milliseconds. Recommended duration is 300 milliseconds for Curves.fastOutSlowIn
                                                                                                  twoTouchOnly: true,
                                                                                                  // Defaults to false
                                                                                                  onScaleStart: () {},
                                                                                                  // optional VoidCallback
                                                                                                  onScaleStop: () {},
                                                                                                  // optional VoidCallback
                                                                                                  child: Image.memory(
                                                                                                    ref.watch(labReportImageProvider) ?? Uint8List(0),
                                                                                                    fit: BoxFit.contain,
                                                                                                    height: 250,
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                      ),
                                                                                    ),
                                                                                    onTap: () async {
                                                                                      try {
                                                                                        imagePicker.pickImage(source: ImageSource.camera, maxWidth: 1800, maxHeight: 2000, imageQuality: 25).then((value) async {
                                                                                          if (value != null) {
                                                                                            var u8int = await value.readAsBytes();
                                                                                            createStampedImage(u8int, ref).then((value) {
                                                                                              ref.watch(labReportImageProvider.notifier).state = value;
                                                                                            });
                                                                                          }
                                                                                        });
                                                                                      } catch (e, s) {
                                                                                        debugPrintStack(
                                                                                          stackTrace: s,
                                                                                        );
                                                                                      }
                                                                                    },
                                                                                  ),
                                                                                ),
                                                                                const SizedBox(
                                                                                  height: 10,
                                                                                ),
                                                                                RowSuper(fitHorizontally: true, children: [
                                                                                  isQualityAssayer
                                                                                      ? Padding(
                                                                                          padding: const Pad(all: 10),
                                                                                          child: AnimatedButton(
                                                                                            height: 50,
                                                                                            color: primaryColorDark,
                                                                                            isOutline: true,
                                                                                            isMultiColor: true,
                                                                                            colors: const [
                                                                                              primaryColorDark,
                                                                                              primaryColorDark
                                                                                            ],
                                                                                            borderWidth: 1,
                                                                                            onTap: () async {
                                                                                              if (ref.watch(labReportImageProvider) == null) {
                                                                                                Fluttertoast.showToast(
                                                                                                  msg: 'Please select lab report image',
                                                                                                );
                                                                                              } else {
                                                                                                ref
                                                                                                    .watch(
                                                                                                  uploadSecondQualityReportProvider(
                                                                                                    data: Secondqualityuploadmodel(
                                                                                                      caseId: distinctList[index].caseId,
                                                                                                      sendToLab: "1",
                                                                                                      sendToReportFile: base64Encode(
                                                                                                        ref.watch(labReportImageProvider) ?? Uint8List(0),
                                                                                                      ),
                                                                                                      inOut: distinctList[index].inOut,
                                                                                                      extraClaim: "0",
                                                                                                    ),
                                                                                                  ).future,
                                                                                                )
                                                                                                    .then((value) {
                                                                                                  if (value['status'].toString() == "1") {
                                                                                                    ref.invalidate(caseIdProvider);

                                                                                                    Navigator.pop(context);
                                                                                                  }

                                                                                                  Fluttertoast.showToast(
                                                                                                    msg: value['message'].toString(),
                                                                                                  );
                                                                                                });
                                                                                              }
                                                                                            },
                                                                                            child: Text(
                                                                                              'Yes',
                                                                                              textAlign: TextAlign.center,
                                                                                              style: TextStyle(
                                                                                                color: Colors.white,
                                                                                                fontSize: Adaptive.sp(14),
                                                                                                fontWeight: FontWeight.w800,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        )
                                                                                      : Padding(
                                                                                          padding: const Pad(all: 10),
                                                                                          child: Text(
                                                                                            "Second Quality Pending",
                                                                                            style: TextStyle(
                                                                                              color: Colors.orange,
                                                                                              fontWeight: FontWeight.bold,
                                                                                              fontSize: Adaptive.sp(14),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                  const SizedBox(
                                                                                    width: 10,
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: const Pad(all: 10),
                                                                                    child: AnimatedButton(
                                                                                      height: 50,
                                                                                      color: primaryColorDark,
                                                                                      isOutline: true,
                                                                                      isMultiColor: true,
                                                                                      colors: const [
                                                                                        primaryColorDark,
                                                                                        primaryColorDark
                                                                                      ],
                                                                                      borderWidth: 1,
                                                                                      onTap: () async {
                                                                                        ref.watch(goRouterProvider).pop();
                                                                                      },
                                                                                      child: Text(
                                                                                        'No',
                                                                                        textAlign: TextAlign.center,
                                                                                        style: TextStyle(color: Colors.white, fontSize: Adaptive.sp(14), fontWeight: FontWeight.w800),
                                                                                      ),
                                                                                    ),
                                                                                  )
                                                                                ]),
                                                                                const SizedBox(
                                                                                  height: 10,
                                                                                ),
                                                                              ]),
                                                                            )));
                                                                  },
                                                                  child: Text(
                                                                    'Submit lab report',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            Adaptive.sp(
                                                                                14),
                                                                        fontWeight:
                                                                            FontWeight.w800),
                                                                  ),
                                                                )),
                                                          ]),
                                                    ),
                                                  )
                                                : Container(
                                                    margin: const Pad(all: 10),
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color:
                                                                primaryColor),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10)),
                                                    child: Padding(
                                                      padding:
                                                          const Pad(all: 10),
                                                      child: ColumnSuper(
                                                          alignment:
                                                              Alignment.center,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const Pad(
                                                                      all: 10),
                                                              child: Text.rich(TextSpan(
                                                                  text:
                                                                      'Case Id: ${distinctList[index].caseId}',
                                                                  style: TextStyle(
                                                                      color:
                                                                          primaryColorDark,
                                                                      fontSize:
                                                                          Adaptive.sp(
                                                                              14),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700))),
                                                            ),
                                                            const Divider(
                                                              height: 2,
                                                            ),
                                                            const SizedBox(
                                                              height: 10,
                                                            ),
                                                            Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Expanded(
                                                                    child: Text(
                                                                      '${distinctList[index].stackNumber}',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .black,
                                                                          fontSize: Adaptive.sp(
                                                                              14),
                                                                          fontWeight:
                                                                              FontWeight.w800),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    height: 50,
                                                                    color: Colors
                                                                        .grey,
                                                                    width: 1,
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          const Pad(
                                                                              all: 10),
                                                                      child:
                                                                          Text(
                                                                        '${distinctList[index].custFname}  (${distinctList[index].phone})',
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.black,
                                                                            fontSize: Adaptive.sp(14),
                                                                            fontWeight: FontWeight.w800),
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    height: 50,
                                                                    color: Colors
                                                                        .grey,
                                                                    width: 1,
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        ColumnSuper(
                                                                      alignment:
                                                                          Alignment
                                                                              .topCenter,
                                                                      children: [
                                                                        Text(
                                                                          '${distinctList[index].vehicleNo}',
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          style: TextStyle(
                                                                              color: Colors.black,
                                                                              fontSize: Adaptive.sp(14),
                                                                              fontWeight: FontWeight.w800),
                                                                        ),
                                                                        Text(
                                                                          '${distinctList[index].driverPhone}',
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          style: TextStyle(
                                                                              color: Colors.black,
                                                                              fontSize: Adaptive.sp(14),
                                                                              fontWeight: FontWeight.w800),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    height: 50,
                                                                    color: Colors
                                                                        .grey,
                                                                    width: 1,
                                                                  ),
                                                                ]),
                                                            const SizedBox(
                                                              height: 10,
                                                            ),
                                                            RowSuper(
                                                                fill: true,
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    'TAT : $days days, ${hours} hours, and ${minutes} minutes',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: TextStyle(
                                                                        color:
                                                                            primaryColor,
                                                                        fontSize:
                                                                            Adaptive.sp(
                                                                                14),
                                                                        fontWeight:
                                                                            FontWeight.w800),
                                                                  ),
                                                                ]),
                                                            const SizedBox(
                                                              height: 10,
                                                            ),
                                                            Row(
                                                              children: [
                                                                Expanded(
                                                                    child: Text(
                                                                        "Release Weight: ${distinctList[index].releaseWeight ?? "0"}")),
                                                                Expanded(
                                                                    child: Text(
                                                                  "Release Bags: ${distinctList[index].releaseBags ?? "0"}",
                                                                  textAlign:
                                                                      TextAlign
                                                                          .end,
                                                                ))
                                                              ],
                                                            ),
                                                            const SizedBox(
                                                              height: 10,
                                                            ),
                                                            distinctList[index]
                                                                            .truckbook ==
                                                                        null ||
                                                                    distinctList[index]
                                                                            .labourbook ==
                                                                        null ||
                                                                    distinctList[
                                                                                index]
                                                                            .firstKantaParchi ==
                                                                        null ||
                                                                    distinctList[
                                                                                index]
                                                                            .sKParchi ==
                                                                        null ||
                                                                    (distinctList[index].ivrReport ==
                                                                            null &&
                                                                        ref.watch(sharedUtilityProvider).getUser()?.terminal ==
                                                                            null) ||
                                                                    (distinctList[index]
                                                                            .sQualityReport ==
                                                                        null)
                                                                ? AnimatedButton(
                                                                    height: 50,
                                                                    color:
                                                                        primaryColorDark,
                                                                    width: MediaQuery.of(context)
                                                                            .size
                                                                            .width /
                                                                        1.2,
                                                                    isOutline:
                                                                        true,
                                                                    isMultiColor:
                                                                        true,
                                                                    colors: const [
                                                                      primaryColorDark,
                                                                      primaryColorDark
                                                                    ],
                                                                    borderWidth:
                                                                        1,
                                                                    onTap: () {
                                                                      if (distinctList[index]
                                                                              .truckbook ==
                                                                          null) {
                                                                        context.goNamed(
                                                                            'truck_book',
                                                                            extra: {
                                                                              'case_id': distinctList[index].caseId ?? "",
                                                                              'customer_name': distinctList[index].custFname ?? ""
                                                                            });
                                                                      } else if (distinctList[index]
                                                                              .labourbook ==
                                                                          null) {
                                                                        context.goNamed(
                                                                            'labour_book',
                                                                            extra: {
                                                                              'case_id': distinctList[index].caseId ?? "",
                                                                              'customer_name': distinctList[index].custFname ?? "",
                                                                              'terminal_id': "${distinctList[index].terminalId ?? 0}",
                                                                              "commodity_id": "${distinctList[index].commodityId ?? 0}"
                                                                            });
                                                                      } else if (distinctList[index]
                                                                              .firstKantaParchi ==
                                                                          null) {
                                                                        context.goNamed(
                                                                            'f_kanta_parchi',
                                                                            extra: {
                                                                              'case_id': distinctList[index].caseId ?? "",
                                                                              'customer_name': distinctList[index].custFname ?? "",
                                                                              'terminal_id': "${distinctList[index].terminalId ?? 0}",
                                                                              "in_out": "${distinctList[index].inOut}"
                                                                            });
                                                                      } else if (distinctList[index]
                                                                              .firstQuality ==
                                                                          null) {
                                                                        context
                                                                            .goNamed(
                                                                          'f_quality_report',
                                                                          extra: {
                                                                            'case_id':
                                                                                distinctList[index].caseId ?? "",
                                                                            'customer_name':
                                                                                distinctList[index].custFname ?? "",
                                                                            "in_out":
                                                                                "${distinctList[index].inOut}"
                                                                          },
                                                                        );
                                                                      } else if (distinctList[index]
                                                                              .fQTagging ==
                                                                          null) {
                                                                        return;
                                                                      } else if (distinctList[index]
                                                                              .sKParchi ==
                                                                          null) {
                                                                        context
                                                                            .goNamed(
                                                                          's_kanta_parchi',
                                                                          extra: {
                                                                            'case_id':
                                                                                distinctList[index].caseId ?? "",
                                                                            'customer_name':
                                                                                distinctList[index].custFname ?? "",
                                                                            'terminal_id':
                                                                                "${distinctList[index].terminalId ?? 0}",
                                                                            "in_out":
                                                                                "${distinctList[index].inOut}"
                                                                          },
                                                                        );
                                                                      } else if (distinctList[index].sQualityReport ==
                                                                              null &&
                                                                          distinctList[index].inOut ==
                                                                              "IN") {
                                                                        if (isQualityAssayer) {
                                                                          context
                                                                              .goNamed(
                                                                            's_quality_report',
                                                                            extra: {
                                                                              'case_id': distinctList[index].caseId ?? "",
                                                                              'customer_name': distinctList[index].custFname ?? "",
                                                                              'avg_weight': "${distinctList[index].sKPAvgWeight ?? 0}",
                                                                              "in_out": "${distinctList[index].inOut}",
                                                                              "commodity_quality": "${distinctList[index].commodityQuality ?? 0}",
                                                                            },
                                                                          );
                                                                        } else {
                                                                          Fluttertoast
                                                                              .showToast(
                                                                            msg:
                                                                                "Second Quality Pending",
                                                                          );

                                                                          return;
                                                                        }
                                                                      } else if (distinctList[index]
                                                                              .sKParchi ==
                                                                          null) {
                                                                        context
                                                                            .goNamed(
                                                                          's_kanta_parchi',
                                                                          extra: {
                                                                            'case_id':
                                                                                distinctList[index].caseId ?? "",
                                                                            'customer_name':
                                                                                distinctList[index].custFname ?? "",
                                                                            'terminal_id':
                                                                                "${distinctList[index].terminalId ?? 0}",
                                                                            "in_out":
                                                                                "${distinctList[index].inOut}"
                                                                          },
                                                                        );
                                                                      } else if (distinctList[index]
                                                                              .sQualityReport ==
                                                                          null) {
                                                                        context
                                                                            .goNamed(
                                                                          's_quality_report',
                                                                          extra: {
                                                                            'case_id':
                                                                                distinctList[index].caseId ?? "",
                                                                            'customer_name':
                                                                                distinctList[index].custFname ?? "",
                                                                            'avg_weight':
                                                                                "${distinctList[index].sKPAvgWeight ?? 0}",
                                                                            "in_out":
                                                                                "${distinctList[index].inOut}",
                                                                            "commodity_quality":
                                                                                "${distinctList[index].commodityQuality ?? 0}",
                                                                          },
                                                                        );
                                                                      } else if (distinctList[index]
                                                                              .ivrReport ==
                                                                          null) {
                                                                        context
                                                                            .goNamed(
                                                                          'gatepass_screen',
                                                                          extra: {
                                                                            'case_id':
                                                                                distinctList[index].caseId ?? "",
                                                                            'in_out':
                                                                                "${distinctList[index].inOut ?? ""}",
                                                                          },
                                                                        );
                                                                      } else if (distinctList[index]
                                                                              .gatepassReport ==
                                                                          null) {}
                                                                    },
                                                                    child: Text(
                                                                      currentOutStatus,
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .white,
                                                                          fontSize: Adaptive.sp(
                                                                              14),
                                                                          fontWeight:
                                                                              FontWeight.w800),
                                                                    ),
                                                                  )
                                                                : Text(
                                                                    currentOutStatus,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: TextStyle(
                                                                        color:
                                                                            primaryColorDark,
                                                                        fontSize:
                                                                            Adaptive.sp(
                                                                                14),
                                                                        fontWeight:
                                                                            FontWeight.w800),
                                                                  ),
                                                            distinctList[index]
                                                                            .cancelCaseId !=
                                                                        null &&
                                                                    ref
                                                                            .watch(sharedUtilityProvider)
                                                                            .getUser()
                                                                            ?.empId
                                                                            .toString()
                                                                            .toLowerCase() ==
                                                                        "ag0212"
                                                                ? AnimatedButton(
                                                                    height: 50,
                                                                    color: Colors
                                                                        .red
                                                                        .shade800,
                                                                    width: MediaQuery.of(context)
                                                                            .size
                                                                            .width /
                                                                        1.2,
                                                                    isOutline:
                                                                        true,
                                                                    isMultiColor:
                                                                        true,
                                                                    colors: [
                                                                      Colors.red
                                                                          .shade800,
                                                                      Colors.red
                                                                          .shade800
                                                                    ],
                                                                    borderWidth:
                                                                        1,
                                                                    onTap: () {
                                                                      ElevarmConfirmAlertDialog(
                                                                              title: 'Confirmation Dialog',
                                                                              subtitle: 'Are you sure you want to cancel this case?',
                                                                              onPositiveButton: () {
                                                                                showLoaderDialog(context);
                                                                                ref.watch(postCancelCaseIdRequestProvider(caseId: distinctList[index].caseId).future).then((value) {
                                                                                  hideLoaderDialog(context);

                                                                                  if (value['status'].toString() == "1") {
                                                                                    ref.invalidate(caseIdProvider);
                                                                                    ref.invalidate(caseRequestsProvider);
                                                                                  }
                                                                                  Fluttertoast.showToast(msg: value['message'].toString());
                                                                                  Navigator.of(context, rootNavigator: false).pop();
                                                                                }).onError((e, s) {
                                                                                  hideLoaderDialog(context);
                                                                                });
                                                                              },
                                                                              onNegativeButton: () {
                                                                                Navigator.of(context, rootNavigator: false).pop();
                                                                              },
                                                                              positiveText: 'Cancel',
                                                                              negativeText: 'No',
                                                                              variant: ElevarmDialogVariant.danger)
                                                                          .show(context);
                                                                    },
                                                                    child: Text(
                                                                      'Cancel CaseId',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .white,
                                                                          fontSize: Adaptive.sp(
                                                                              14),
                                                                          fontWeight:
                                                                              FontWeight.w800),
                                                                    ),
                                                                  )
                                                                : null,
                                                            const SizedBox(
                                                              height: 10,
                                                            ),
                                                            Visibility(
                                                                visible: (distinctList[index].sendToLab ==
                                                                            null &&
                                                                        distinctList[index].sQualityReport ==
                                                                            null) &&
                                                                    distinctList[index]
                                                                            .firstKantaParchi !=
                                                                        null,
                                                                child:
                                                                    AnimatedButton(
                                                                  height: 50,
                                                                  color:
                                                                      primaryColorDark,
                                                                  width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width /
                                                                      1.2,
                                                                  isOutline:
                                                                      true,
                                                                  isMultiColor:
                                                                      true,
                                                                  colors: const [
                                                                    primaryColorDark,
                                                                    primaryColorDark
                                                                  ],
                                                                  borderWidth:
                                                                      1,
                                                                  onTap:
                                                                      () async {
                                                                    if (!isQualityAssayer) {
                                                                      Fluttertoast
                                                                          .showToast(
                                                                        msg:
                                                                            "Second Quality Pending",
                                                                      );

                                                                      return;
                                                                    }

                                                                    showBarModalBottomSheet(
                                                                        context:
                                                                            context,
                                                                        builder: (context) =>
                                                                            Padding(
                                                                              padding: const Pad(all: 10),
                                                                              child: ColumnSuper(children: [
                                                                                Text(
                                                                                  'Submit Lab Report',
                                                                                  style: TextStyle(fontWeight: FontWeight.bold, color: primaryColorDark, fontSize: Adaptive.sp(18)),
                                                                                ),
                                                                                SizedBox(
                                                                                  height: 250,
                                                                                  child: InkWell(
                                                                                    child: DottedBorder(
                                                                                      color: primaryColorDark,
                                                                                      borderType: BorderType.RRect,
                                                                                      padding: const Pad(all: 10),
                                                                                      radius: const Radius.circular(5),
                                                                                      child: Center(
                                                                                        child: ref.watch(labReportImageProvider) == null
                                                                                            ? ColumnSuper(
                                                                                                children: const [
                                                                                                  Icon(
                                                                                                    Icons.file_upload_rounded,
                                                                                                    color: primaryColorDark,
                                                                                                  ),
                                                                                                  Text(
                                                                                                    'Capture Lab Report Image',
                                                                                                    style: TextStyle(color: primaryColorDark, fontWeight: FontWeight.bold),
                                                                                                  )
                                                                                                ],
                                                                                              )
                                                                                            : InkWell(
                                                                                                onTap: () async {
                                                                                                  try {
                                                                                                    imagePicker.pickImage(source: ImageSource.camera, maxWidth: 1600, maxHeight: 1800, imageQuality: 25).then((value) async {
                                                                                                      if (value != null) {
                                                                                                        var u8int = await value.readAsBytes();
                                                                                                        createStampedImage(u8int, ref).then((value) {
                                                                                                          ref.watch(labReportImageProvider.notifier).state = value;
                                                                                                        });
                                                                                                      }
                                                                                                    });
                                                                                                  } catch (e, s) {
                                                                                                    debugPrintStack(
                                                                                                      stackTrace: s,
                                                                                                    );
                                                                                                  }
                                                                                                },
                                                                                                child: ZoomOverlay(
                                                                                                  modalBarrierColor: Colors.black12,
                                                                                                  // Optional
                                                                                                  minScale: 0.5,
                                                                                                  // Optional
                                                                                                  maxScale: 3.0,
                                                                                                  // Optional
                                                                                                  animationCurve: Curves.fastOutSlowIn,
                                                                                                  // Defaults to fastOutSlowIn which mimics IOS instagram behavior
                                                                                                  animationDuration: const Duration(milliseconds: 300),
                                                                                                  // Defaults to 100 Milliseconds. Recommended duration is 300 milliseconds for Curves.fastOutSlowIn
                                                                                                  twoTouchOnly: true,
                                                                                                  // Defaults to false
                                                                                                  onScaleStart: () {},
                                                                                                  // optional VoidCallback
                                                                                                  onScaleStop: () {},
                                                                                                  // optional VoidCallback
                                                                                                  child: Image.memory(
                                                                                                    ref.watch(labReportImageProvider) ?? Uint8List(0),
                                                                                                    fit: BoxFit.contain,
                                                                                                    height: 250,
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                      ),
                                                                                    ),
                                                                                    onTap: () async {
                                                                                      // showLoaderDialog(context);
                                                                                      try {
                                                                                        imagePicker.pickImage(source: ImageSource.camera, maxWidth: 1800, maxHeight: 2000, imageQuality: 25).then((value) async {
                                                                                          if (value != null) {
                                                                                            var u8int = await value.readAsBytes();
                                                                                            createStampedImage(u8int, ref).then((value) {
                                                                                              ref.watch(labReportImageProvider.notifier).state = value;
                                                                                            });
                                                                                          }
                                                                                        });
                                                                                      } catch (e, s) {
                                                                                        debugPrintStack(
                                                                                          stackTrace: s,
                                                                                        );
                                                                                      }
                                                                                    },
                                                                                  ),
                                                                                ),
                                                                                const SizedBox(
                                                                                  height: 10,
                                                                                ),
                                                                                RowSuper(fitHorizontally: true, children: [
                                                                                  Padding(
                                                                                    padding: const Pad(all: 10),
                                                                                    child: AnimatedButton(
                                                                                      height: 50,
                                                                                      color: primaryColorDark,
                                                                                      isOutline: true,
                                                                                      isMultiColor: true,
                                                                                      colors: const [
                                                                                        primaryColorDark,
                                                                                        primaryColorDark
                                                                                      ],
                                                                                      borderWidth: 1,
                                                                                      onTap: () async {
                                                                                        if (ref.watch(labReportImageProvider) == null) {
                                                                                          Fluttertoast.showToast(msg: 'Please select lab report image');
                                                                                        } else {
                                                                                          ref.watch(uploadSecondQualityReportProvider(data: Secondqualityuploadmodel(caseId: distinctList[index].caseId, sendToLab: "1", sendToReportFile: base64Encode(ref.watch(labReportImageProvider) ?? Uint8List(0)), inOut: distinctList[index].inOut, extraClaim: "0")).future).then((value) {
                                                                                            if (value['status'].toString() == "1") {
                                                                                              ref.invalidate(caseIdProvider);
                                                                                              Navigator.pop(context);
                                                                                            }
                                                                                            Fluttertoast.showToast(msg: value['message'].toString());
                                                                                          });
                                                                                        }
                                                                                      },
                                                                                      child: Text(
                                                                                        'Yes',
                                                                                        textAlign: TextAlign.center,
                                                                                        style: TextStyle(color: Colors.white, fontSize: Adaptive.sp(14), fontWeight: FontWeight.w800),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  const SizedBox(
                                                                                    width: 10,
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: const Pad(all: 10),
                                                                                    child: AnimatedButton(
                                                                                      height: 50,
                                                                                      color: primaryColorDark,
                                                                                      isOutline: true,
                                                                                      isMultiColor: true,
                                                                                      colors: const [
                                                                                        primaryColorDark,
                                                                                        primaryColorDark
                                                                                      ],
                                                                                      borderWidth: 1,
                                                                                      onTap: () async {
                                                                                        Navigator.pop(context);
                                                                                      },
                                                                                      child: Text(
                                                                                        'No',
                                                                                        textAlign: TextAlign.center,
                                                                                        style: TextStyle(color: Colors.white, fontSize: Adaptive.sp(14), fontWeight: FontWeight.w800),
                                                                                      ),
                                                                                    ),
                                                                                  )
                                                                                ]),
                                                                                const SizedBox(
                                                                                  height: 10,
                                                                                ),
                                                                              ]),
                                                                            ));
                                                                  },
                                                                  child: Text(
                                                                    'Submit lab report',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            Adaptive.sp(
                                                                                14),
                                                                        fontWeight:
                                                                            FontWeight.w800),
                                                                  ),
                                                                )),
                                                          ]),
                                                    ),
                                                  );
                                          }),
                                    );
                            },
                            error: (e, s) => (e is DioException)
                                ? Center(
                                    child: errorWidget(
                                        "please check your internet"),
                                  )
                                : Text(e.toString()),
                            loading: () => runninggCaseIdShimmer()),
                      )
                    ],
                  ),
                ));
}
