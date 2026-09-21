// ignore_for_file: deprecated_member_use, body_might_complete_normally_nullable
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:calendar_view/calendar_view.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:emp_apnagodam/Data/Models/CaseRequestModel.dart';
import 'package:emp_apnagodam/Presentation/Constants/ColorConstant.dart';
import 'package:emp_apnagodam/Presentation/UI/Advances/AdvancesList.dart';
import 'package:emp_apnagodam/Presentation/UI/Advances/AdvancesScreen.dart';
import 'package:emp_apnagodam/Presentation/UI/Attendance/AttendanceRequests.dart';
import 'package:emp_apnagodam/Presentation/UI/Attendance/ListOfHolidaysScreen.dart';
import 'package:emp_apnagodam/Presentation/UI/Audit/AuditNeighbour.dart';
import 'package:emp_apnagodam/Presentation/UI/Audit/AuditPV.dart';
import 'package:emp_apnagodam/Presentation/UI/Audit/AuditStackQuality.dart';
import 'package:emp_apnagodam/Presentation/UI/Audit/Khemchand_Audit/ActiveAuditScreen.dart';
import 'package:emp_apnagodam/Presentation/UI/Audit/Khemchand_Audit/AssetsAuditScreen.dart';
import 'package:emp_apnagodam/Presentation/UI/Audit/Khemchand_Audit/EditAudit/AssetsEditScreen.dart';
import 'package:emp_apnagodam/Presentation/UI/Audit/Khemchand_Audit/EditAudit/CCTVAuditEditScreen.dart';
import 'package:emp_apnagodam/Presentation/UI/Audit/Khemchand_Audit/EditAudit/FumigationEditScreen.dart';
import 'package:emp_apnagodam/Presentation/UI/Audit/Khemchand_Audit/EditAudit/LockKeyEditScreen.dart';
import 'package:emp_apnagodam/Presentation/UI/Audit/Khemchand_Audit/EditAudit/PhysicalEditScreen.dart';
import 'package:emp_apnagodam/Presentation/UI/Audit/Khemchand_Audit/EditAudit/StackQualityEditList.dart';
import 'package:emp_apnagodam/Presentation/UI/Audit/Khemchand_Audit/EditAudit/StackQualityEditScreen.dart';
import 'package:emp_apnagodam/Presentation/UI/Audit/Khemchand_Audit/PDFDownload/AssetsPdfCreateScreen.dart';
import 'package:emp_apnagodam/Presentation/UI/Audit/Khemchand_Audit/PDFDownload/CctvpdfCreatescreen.dart';
import 'package:emp_apnagodam/Presentation/UI/Audit/Khemchand_Audit/PDFDownload/FumigationPdfCreateScreen.dart';
import 'package:emp_apnagodam/Presentation/UI/Audit/Khemchand_Audit/PDFDownload/LockAndKeyPdfScreen.dart';
import 'package:emp_apnagodam/Presentation/UI/Audit/Khemchand_Audit/PDFDownload/MainPagePdfScreen.dart.dart';
import 'package:emp_apnagodam/Presentation/UI/Audit/Khemchand_Audit/PDFDownload/StackPhycialPdfScreen.dart';
import 'package:emp_apnagodam/Presentation/UI/Audit/Khemchand_Audit/PDFDownload/StackQualityPdfCreateScreen.dart';
import 'package:emp_apnagodam/Presentation/UI/Audit/Khemchand_Audit/StartAudit.dart';
import 'package:emp_apnagodam/Presentation/UI/Audit/Khemchand_Audit/StartAuditListScreen.dart';
import 'package:emp_apnagodam/Presentation/UI/Audit/Khemchand_Audit/CCTVScreeen.dart';
import 'package:emp_apnagodam/Presentation/UI/Audit/Khemchand_Audit/FumigationScreen.dart';
import 'package:emp_apnagodam/Presentation/UI/Audit/Khemchand_Audit/LockAndKeyScreen.dart';
import 'package:emp_apnagodam/Presentation/UI/Audit/Khemchand_Audit/StackPVScreen.dart';
import 'package:emp_apnagodam/Presentation/UI/Audit/Khemchand_Audit/CompletedAudit.dart';
import 'package:emp_apnagodam/Presentation/UI/Audit/Khemchand_Audit/StackQualityAuditScreen.dart.dart';
import 'package:emp_apnagodam/Presentation/UI/Audit/Khemchand_Audit/StackPhysicalAudit.dart';
import 'package:emp_apnagodam/Presentation/UI/Authentication/Login/VerifyOtpScreen.dart';
import 'package:emp_apnagodam/Presentation/UI/CCTV/CCTVUpdateScreen.dart';
import 'package:emp_apnagodam/Presentation/UI/Dipleased/DispleasedApprovalRequests.dart';
import 'package:emp_apnagodam/Presentation/UI/Dipleased/DispleasedRequestList.dart';
import 'package:emp_apnagodam/Presentation/UI/Khemchand_Cleaning/CHRScreen.dart';
import 'package:emp_apnagodam/Presentation/UI/Khemchand_Cleaning/CleaningScreen.dart';
import 'package:emp_apnagodam/Presentation/UI/Khemchand_Cleaning/fumigation.dart';
import 'package:emp_apnagodam/Presentation/UI/Khemchand_Cleaning/GeneratedCleaning/UpdateChr.dart';
import 'package:emp_apnagodam/Presentation/UI/Khemchand_Cleaning/GeneratedCleaning/UpDateCleaning.dart';
import 'package:emp_apnagodam/Presentation/UI/Khemchand_Cleaning/GeneratedCleaning/UpdateFumigation.dart';
import 'package:emp_apnagodam/Presentation/UI/Khemchand_Cleaning/GeneratedCleaning/UpdateSpray.dart';
import 'package:emp_apnagodam/Presentation/UI/Khemchand_Cleaning/SprayScreen.dart';
import 'package:emp_apnagodam/Presentation/UI/DipleasedBags/DispleasedBags.dart';
import 'package:emp_apnagodam/Presentation/UI/FirstKantaParchi/FirstKantaParchi.dart';
import 'package:emp_apnagodam/Presentation/UI/FirstKantaParchi/FirstKantaParchiList.dart';
import 'package:emp_apnagodam/Presentation/UI/FirstQualityReport/FirstQualityList.dart';
import 'package:emp_apnagodam/Presentation/UI/FirstQualityReport/FirstQualityReport.dart';
import 'package:emp_apnagodam/Presentation/UI/Gatepass/GatepassScreen.dart';
import 'package:emp_apnagodam/Presentation/UI/GenerateLead/LeadGenerateScreen.dart';
import 'package:emp_apnagodam/Presentation/UI/GenerateLead/LeadsListScreen.dart';
import 'package:emp_apnagodam/Presentation/UI/Guard/GuardINScreen.dart';
import 'package:emp_apnagodam/Presentation/UI/Guard/GuardOutScreen.dart';
import 'package:emp_apnagodam/Presentation/UI/LabourBook/CreateLabourBook.dart';
import 'package:emp_apnagodam/Presentation/UI/LabourBook/LabourBookList.dart';
import 'package:emp_apnagodam/Presentation/UI/PV/PVScreen.dart';
import 'package:emp_apnagodam/Presentation/UI/QualityCalculator/QualityCalculationScreen.dart';
import 'package:emp_apnagodam/Presentation/UI/SancationLimit/SanctionLimitScreen.dart';
import 'package:emp_apnagodam/Presentation/UI/SecondKantaParchi/SecondKantaParchi.dart';
import 'package:emp_apnagodam/Presentation/UI/SecondQualityReport/SecondQualityList.dart';
import 'package:emp_apnagodam/Presentation/UI/CaseId/CancelCaseId.dart';
import 'package:emp_apnagodam/Presentation/UI/CaseId/CreateCaseId.dart';
import 'package:emp_apnagodam/Presentation/UI/CaseId/GenerateCaseId.dart';
import 'package:emp_apnagodam/Presentation/UI/TruckBook/TruckBookList.dart';
import 'package:emp_apnagodam/Presentation/UI/VendorVoucher/AddVoucherScreen.dart';
import 'package:emp_apnagodam/Presentation/UI/VendorVoucher/VenderVoucherApprover.dart';
import 'package:emp_apnagodam/Presentation/UI/VendorVoucher/VendorVoucher.dart';
import 'package:emp_apnagodam/Presentation/UI/VoiceQuestion/VoiceQuestionScreen.dart';
import 'package:emp_apnagodam/Presentation/UI/Questions/EmployeeQuestionsScreen.dart';
import 'package:emp_apnagodam/Presentation/UI/Voucher/VoucherList.dart';
import 'package:emp_apnagodam/Presentation/UI/Advances/WithdrawRequestsScreen.dart';
import 'package:emp_apnagodam/Presentation/UI/WhsScreens/WhsIn.dart';
import 'package:emp_apnagodam/Presentation/UI/WhsScreens/WhsOut.dart';
import 'package:emp_apnagodam/Presentation/UI/Onboarding/WarehouseOnboardingScreen.dart';
import 'package:emp_apnagodam/Presentation/Widgets/widgets.dart';
import 'package:emp_apnagodam/Presentation/utils/notification_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Data/SharedPrefs/SharedUtility.dart';
import 'Presentation/UI/Attendance/AttendanceMarkingScreen.dart';
import 'Presentation/UI/Authentication/Login/LoginScreen.dart';
import 'Presentation/UI/ErrorScreen/NotInLocation.dart';
import 'Presentation/UI/Home/DashboardScreen.dart';
import 'Presentation/UI/Home/HomeScreen.dart';
import 'Presentation/UI/Home/OptionsScreen.dart';
import 'Presentation/UI/Profile/ProfileScreen.dart';
import 'Presentation/UI/SecondKantaParchi/SecondKantaparchiList.dart';
import 'Presentation/UI/SecondQualityReport/SecondQualityReport.dart';
import 'Presentation/UI/CaseId/InwardsStackRequest.dart';
import 'Presentation/UI/CaseId/OutwardsStackRequest.dart';
import 'Presentation/UI/TruckBook/CreateTruckBook.dart';
import 'Presentation/UI/Voucher/CreateConveyanceVoucher.dart';
import 'Presentation/UI/Voucher/VoucherRequests.dart';
import 'Presentation/UI/Wallet/WalletStatementScreen.dart';
import 'package:elevarm_ui/elevarm_ui.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final sharedPreferences = await SharedPreferences.getInstance();
  ElevarmFontFamilies.init(
    allowRuntimeFetching: true,
  );
  await Firebase.initializeApp();
  await NotificationService.init();

  if (Platform.isAndroid) {
    InAppUpdate.checkForUpdate().then((updateInfo) async {
      if (updateInfo.updateAvailability == UpdateAvailability.updateAvailable) {
        await InAppUpdate.performImmediateUpdate();
      }
    });
  }

  runApp(ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(sharedPreferences),
      ],
      child: CalendarControllerProvider(
        controller: EventController(),
        child: ResponsiveSizer(
          builder: (context, orientation, screenType) {
            return const MyApp();
          },
        ),
      )));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final token = ref.watch(sharedUtilityProvider).getToken();
    if (token.isNotEmpty) {
      requestLocationPermission().then((value) {
        if (value) {
          ref.watch(positionStream).when(
              data: (location) {
                ref.watch(distanceProvider.notifier).state =
                    Geolocator.distanceBetween(
                            ref.watch(locationProvider)?.latitude ?? 0.0,
                            ref.watch(locationProvider)?.longitude ?? 0.0,
                            double.tryParse(ref
                                        .watch(sharedUtilityProvider)
                                        .getUser()
                                        ?.attenLat ??
                                    "0.0") ??
                                0.0,
                            double.tryParse(ref
                                        .watch(sharedUtilityProvider)
                                        .getUser()
                                        ?.attenLong ??
                                    "0.0") ??
                                0.0)
                        .toString();
                ref.watch(locationProvider.notifier).state = location;
                placemarkFromCoordinates(location.latitude, location.longitude)
                    .then((placemarks) {
                  ref.watch(addressProvider.notifier).state =
                      "${placemarks.first.name} ${placemarks.first.street} ${placemarks.first.locality} ${placemarks.first.administrativeArea}";
                }).onError((e, s) {
                  if (e is SocketException || e is TimeoutException) {
                    showErrorDialog(
                        context, 'please check your internet connection');
                  }
                });
              },
              error: (e, s) => null,
              loading: () => null);
        }
      });
    }

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: ref.watch(goRouterProvider),
      theme: ThemeData(
          fontFamily: GoogleFonts.poppins().fontFamily,
          colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
          appBarTheme: AppBarTheme(
              iconTheme: const IconThemeData(color: Colors.white),
              backgroundColor: primaryColorDark,
              titleTextStyle: const TextStyle().copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: Adaptive.sp(18))),

          scaffoldBackgroundColor: Colors.white),
      title: 'SWLPL',
    );
  }
}

isThereCurrentDialogShowing(BuildContext context) =>
    ModalRoute.of(context)?.isCurrent != true;
final locationStateProvider = StreamProvider<Position>((ref) async* {
  LocationSettings locationSettings = const LocationSettings(
      accuracy: LocationAccuracy.medium, distanceFilter: 0);
  yield* Geolocator.getPositionStream(locationSettings: locationSettings)
      .map((position) {
    ref.watch(locationProvider.notifier).state = position;
    return position;
  });
});
var positionStream = StreamProvider((ref) => Geolocator.getPositionStream(
    locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.bestForNavigation, distanceFilter: 0)));

final locationPermissionProvider =
    StateProvider((ref) => Geolocator.checkPermission());

var goRouterProvider = StateProvider((ref) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: kDebugMode,
      redirect: (context, state) {
        final token = ref.watch(sharedUtilityProvider).getToken();
        final isLoggingIn = state.matchedLocation == '/login' ||
            state.matchedLocation == '/login/otp';

        if (token.isEmpty) {
          return isLoggingIn ? null : '/login';
        } else {
          return isLoggingIn ? '/' : null;
        }
      },
      routes: [
        GoRoute(
            path: "/",
            builder: (context, state) => DashboardScreen(),
            routes: [
              GoRoute(
                name: 'voice_question',
                path: "voice_question",
                builder: (context, state) => const VoiceQuestionScreen(),
              ),
              GoRoute(
                name: 'employee_questions',
                path: "employee_questions",
                builder: (context, state) => const EmployeeQuestionsScreen(),
              ),
              GoRoute(
                name: 'listOfHolidays',
                path: "listOfHolidays",
                builder: (context, state) => const Listofholidaysscreen(),
              ),
              GoRoute(
                name: 'quality_calculator',
                path: "quality_calculator",
                builder: (context, state) => const Qualitycalculationscreen(),
              ),
              GoRoute(
                name: 'attendanceRequest',
                path: "attendanceRequest",
                builder: (context, state) => const Attendancerequests(),
              ),
              GoRoute(
                name: 'withdraw_requests',
                path: "withdraw_requests",
                builder: (context, state) => Withdrawrequestsscreen(),
              ),
              GoRoute(
                name: 'warehouse_onboarding',
                path: "warehouse_onboarding",
                builder: (context, state) => const WarehouseOnboardingScreen(),
              ),

              GoRoute(
                name: 'walletStatementScreen',
                path: "walletStatementScreen",
                builder: (context, state) => const Walletstatementscreen(),
              ),
              GoRoute(
                name: 'audit_neighbour',
                path: "audit_neighbour",
                builder: (context, state) => const Auditneighbour(),
              ),
              GoRoute(
                name: 'guard_in_screen',
                path: "guard_in_screen",
                builder: (context, state) => const Guardinscreen(),
              ),
              GoRoute(
                name: 'guard_out_screen',
                path: "guard_out_screen",
                builder: (context, state) => const Guardoutscreen(),
              ),
              // GoRoute(
              //   name: 'audit_list',
              //   path: "audit_list",
              //   builder: (context, state) => AuditScreenListPage(),
              // ),

              //<-----------------------------------------------Khemchand Kumawat-------------------------------------------->
              GoRoute(
                  name: 'sancation_limit',
                  path: "sancation_limit",
                  builder: (context, state) => SancationLimitScreen(),
                  routes: [
                    // GoRoute(
                    //     name: 'sanction_letter_pdf',
                    //     path: "sanction_letter_pdf",
                    //     builder: (context, state) {
                    //       final data = state.extra as Map<String, dynamic>;

                    //       return SanctionLetterPDF(
                    //         id: data['id'],
                    //       );
                    //     }),
                    // GoRoute(
                    //     name: 'sme_tow_pdf',
                    //     path: "sme_tow_pdf",
                    //     builder: (context, state) {
                    //       final data = state.extra as Map<String, dynamic>;

                    //       return SMETwoPDFScreen(
                    //         id: data['id'],
                    //       );
                    //     }),
                  ]),
              GoRoute(
                  name: 'active_audit',
                  path: "active_audit",
                  builder: (context, state) => const ActiveAuditScreen(),
                  routes: [
                    GoRoute(
                        name: 'audit_list',
                        path: "audit_list",
                        builder: (context, state) {
                          final data = state.extra as Map<String, dynamic>;

                          return StartAuditListScreen(
                            auditid: data['audit_id'],
                          );
                        },
                        routes: [
                          GoRoute(
                              name: 'stack_physical_audit',
                              path: "stack_physical_audit",
                              builder: (context, state) {
                                final data =
                                    state.extra as Map<String, dynamic>;

                                return PhysicalAuditScreen(
                                  auditid: data['audit_id'],
                                );
                              }),
                          GoRoute(
                              name: 'stack_quality_audit',
                              path: "stack_quality_audit",
                              builder: (context, state) {
                                final data =
                                    state.extra as Map<String, dynamic>;

                                return StackQualityAudit(
                                  auditid: data['audit_id'],
                                );
                              }),
                          GoRoute(
                              name: 'stack_quality_pdf',
                              path: "stack_quality_pdf",
                              builder: (context, state) {
                                final data =
                                    state.extra as Map<String, dynamic>;

                                return StackQualityPdfScreen(
                                  auditid: data['audit_id'],
                                  warehousename: data['warehosue_name'],
                                );
                              }),
                          GoRoute(
                              name: 'stack_pv_audit',
                              path: "stack_pv_audit",
                              builder: (context, state) {
                                final data =
                                    state.extra as Map<String, dynamic>;

                                return StackPVAuditScreen(
                                  auditid: data['audit_id'],
                                  warehousename: data['warehosue_name'],
                                );
                              }),
                          GoRoute(
                              name: 'cctv_stack_audit',
                              path: "cctv_stack_audit",
                              builder: (context, state) {
                                final data =
                                    state.extra as Map<String, dynamic>;

                                return CCTVStackAudit(
                                  auditid: data['audit_id'],
                                  warehousename: data['warehosue_name'],
                                );
                              }),
                          GoRoute(
//                              name: 'cctv_pdf',
                              path: "cctv_pdf",
                              builder: (context, state) {
                                final data =
                                    state.extra as Map<String, dynamic>;

                                return CctvPdfCreateScreen(
                                  auditid: data['audit_id'],
                                  warehousename: data['warehosue_name'],
                                );
                              }),
                          GoRoute(
                              name: 'lock_key_audit',
                              path: "lock_key_audit",
                              builder: (context, state) {
                                final data =
                                    state.extra as Map<String, dynamic>;

                                return LockKeyStackAudit(
                                  auditid: data['audit_id'],
                                  warehousename: data['warehosue_name'],
                                );
                              }),
                          GoRoute(
                              name: 'main_page_pdf',
                              path: "main_page_pdf",
                              builder: (context, state) {
                                final data =
                                    state.extra as Map<String, dynamic>;

                                return MainPdfPageScreen(
                                  auditid: data['audit_id'],
                                  warehousename: data['warehosue_name'],
                                );
                              }),
                          GoRoute(
                              name: 'lock_key_pdf',
                              path: "lock_key_pdf",
                              builder: (context, state) {
                                final data =
                                    state.extra as Map<String, dynamic>;

                                return LockKeyPdfCreateScreen(
                                  auditid: data['audit_id'],
                                  warehousename: data['warehosue_name'],
                                );
                              }),
                          GoRoute(
                              name: 'fumigation_audit',
                              path: "fumigation_audit",
                              builder: (context, state) {
                                final data =
                                    state.extra as Map<String, dynamic>;

                                return FumigationAudit(
                                  auditid: data['audit_id'],
                                  warehousename: data['warehosue_name'],
                                );
                              }),
                          GoRoute(
                              name: 'fumigation_pdf',
                              path: "fumigation_pdf",
                              builder: (context, state) {
                                final data =
                                    state.extra as Map<String, dynamic>;

                                return FumigationPdfScreen(
                                  auditid: data['audit_id'],
                                  warehousename: data['warehosue_name'],
                                );
                              }),
                          GoRoute(
                              name: 'assets_audit',
                              path: "assets_audit",
                              builder: (context, state) {
                                final data =
                                    state.extra as Map<String, dynamic>;

                                return AssestStackAudit(
                                  auditid: data['audit_id'],
                                  warehousename: data['warehosue_name'],
                                );
                              }),
                          GoRoute(
                              name: 'physical_audit_edit',
                              path: "physical_audit_edit",
                              builder: (context, state) {
                                final data =
                                    state.extra as Map<String, dynamic>;

                                return EditPhysicalAuditScreen(
                                  auditid: data['audit_id'],
                                  warehousename: data['warehosue_name'],
                                );
                              }),
                          GoRoute(
                              name: 'physical_pdf',
                              path: "physical_pdf",
                              builder: (context, state) {
                                final data =
                                    state.extra as Map<String, dynamic>;

                                return StackPhycialPdfScreen(
                                  auditid: data['audit_id'],
                                  warehousename: data['warehosue_name'],
                                );
                              }),
                          GoRoute(
                              name: 'quality_audit_edit',
                              path: "quality_audit_edit",
                              builder: (context, state) {
                                final data =
                                    state.extra as Map<String, dynamic>;

                                return QualityEditScreenPage(
                                  auditid: data['audit_id'],
                                  warehousename: data['warehosue_name'],
                                  stackNo: data['stack_no'],
                                );
                              }),
                          GoRoute(
                              name: 'stack_edit_list',
                              path: "stack_edit_list",
                              builder: (context, state) {
                                final data =
                                    state.extra as Map<String, dynamic>;

                                return StackQualityEditListScreen(
                                  auditid: data['audit_id'],
                                  warehousename: data['warehosue_name'],
                                  stackNo: data['stack_no'],
                                );
                              }),
                          GoRoute(
                              name: 'cctv_audit_edit',
                              path: "cctv_audit_edit",
                              builder: (context, state) {
                                final data =
                                    state.extra as Map<String, dynamic>;

                                return CCTVAuditEditScreen(
                                  auditid: data['audit_id'],
                                  warehousename: data['warehosue_name'],
                                );
                              }),
                          GoRoute(
                              name: 'LockKey_audit_edit',
                              path: "LockKey_audit_edit",
                              builder: (context, state) {
                                final data =
                                    state.extra as Map<String, dynamic>;

                                return LockKeyAuditEditScreen(
                                  auditid: data['audit_id'],
                                  warehousename: data['warehosue_name'],
                                );
                              }),
                          GoRoute(
                              name: 'assets_audit_edit',
                              path: "assets_audit_edit",
                              builder: (context, state) {
                                final data =
                                    state.extra as Map<String, dynamic>;

                                return AssetsAuditEditScreen(
                                  auditid: data['audit_id'],
                                  warehousename: data['warehosue_name'],
                                );
                              }),
                          GoRoute(
                              name: 'assets_pdf',
                              path: "assets_pdf",
                              builder: (context, state) {
                                final data =
                                    state.extra as Map<String, dynamic>;

                                return AssetsPdfScreen(
                                  auditid: data['audit_id'],
                                  warehousename: data['warehosue_name'],
                                );
                              }),
                          GoRoute(
                              name: 'fumigation_audit_edit',
                              path: "fumigation_audit_edit",
                              builder: (context, state) {
                                final data =
                                    state.extra as Map<String, dynamic>;

                                return FumigationEditScreen(
                                  auditid: data['audit_id'],
                                  warehousename: data['warehosue_name'],
                                );
                              }),
                        ]),
                  ]),
              GoRoute(
                  name: 'spray_cleaning',
                  path: "spray_cleaning",
                  builder: (context, state) => const SprayCleaningScreen(),
                  routes: [
                    GoRoute(
                      name: 'add_spray',
                      path: "add_spray",
                      builder: (context, state) => const AddSprayScreen(),
                    ),
                  ]),
              GoRoute(
                  name: 'cleaning',
                  path: "cleaning",
                  builder: (context, state) => const CleaningScreenPage(),
                  routes: [
                    GoRoute(
                      name: 'add_cleaning',
                      path: "add_cleaning",
                      builder: (context, state) => const AddCleaningScreen(),
                    ),
                  ]),
              GoRoute(
                  name: 'chr_cleaning',
                  path: "chr_cleaning",
                  builder: (context, state) => const CHRCleaningScreen(),
                  routes: [
                    GoRoute(
                      name: 'add_chr',
                      path: "add_chr",
                      builder: (context, state) => const AddCHRScreen(),
                    ),
                  ]),
              GoRoute(
                  name: 'fumigation_cleaning',
                  path: "fumigation_cleaning",
                  builder: (context, state) => const FumigationCleaningScreen(),
                  routes: [
                    GoRoute(
                      name: 'add_fumigation',
                      path: "add_fumigation",
                      builder: (context, state) => const AddFumigationScreen(),
                    ),
                  ]),
              GoRoute(
                name: 'whs_in',
                path: "whs_in",
                builder: (context, state) => const WhsInScreen(),
              ),
              GoRoute(
                name: 'whs_out',
                path: "whs_out",
                builder: (context, state) => WhsOutScreen(),
              ),

              GoRoute(
                name: 'vendor_voucher',
                path: "vendor_voucher",
                builder: (context, state) => VendorVoucher(),
              ),
              GoRoute(
                name: 'vendor_voucher_approve',
                path: "vendor_voucher_approve",
                builder: (context, state) => VendorVoucherApproverScreen(),
              ),
              GoRoute(
                name: 'add_vendor_voucher',
                path: "add_vendor_voucher",
                builder: (context, state) => AddVendorVoucher(),
              ),

              GoRoute(
                name: 'completed_audit',
                path: "completed_audit",
                builder: (context, state) => CompletedAuditScreenPage(),
              ),
              GoRoute(
                name: 'start_audit',
                path: "start_audit",
                builder: (context, state) => const AuditStartScreen(),
              ),

              GoRoute(
                name: 'audit_stack_quality',
                path: "audit_stack_quality",
                builder: (context, state) => Auditstackquality(),
              ),

              //<-----------------------------------------------Khemchand Kumawat-------------------------------------------->

              GoRoute(
                name: 'audit_pv',
                path: "audit_pv",
                builder: (context, state) => Auditpv(),
              ),
              GoRoute(
                name: 'profile',
                path: "profile",
                builder: (context, state) => const ProfileScreen(),
              ),
              GoRoute(
                  name: 'home',
                  path: "home",
                  builder: (context, state) => const HomeScreen(),
                  routes: [
                    GoRoute(
                      name: 'attendance',
                      path: "attendance",
                      builder: (context, state) =>
                          const AttendanceMarkingScreen(),
                    ),
                    GoRoute(
                      name: 'generate_case_id',
                      path: "generate_case_id",
                      builder: (context, state) => const Generatecaseid(),
                    ),
                    // GoRoute(
                    //   name: 'attendanceRequest',
                    //   path: "attendanceRequest",
                    //   builder: (context, state) => const Attendancerequests(),
                    // ),
                  ]),
              GoRoute(
                name: 'truck_book',
                path: "truck_book",
                builder: (context, state) {
                  final data = state.extra as Map<String, dynamic>;

                  return CreateTruckBook(
                      caseId: data['case_id'],
                      customerName: data['customer_name']);
                },
              ),
              GoRoute(
                name: 'generate_lead',
                path: "generate_lead",
                builder: (context, state) {
                  return const Leadgeneratescreen();
                },
              ),
              GoRoute(
                name: 'leads_list',
                path: "leads_list",
                builder: (context, state) {
                  return const Leadslistscreen();
                },
              ),
              GoRoute(
                name: 'labour_book',
                path: "labour_book",
                builder: (context, state) {
                  final data = state.extra! as Map<String, dynamic>;

                  return Createlabourbook(
                    caseId: data['case_id'],
                    customerName: data['customer_name'],
                    terminalId: data['terminal_id'],
                    commodityId: data['commodity_id'],
                  );
                },
              ),
              GoRoute(
                name: 'cctv_update_screen',
                path: "cctv_update_screen",
                builder: (context, state) {
                  final data = state.extra! as Map<String, dynamic>;
                  return Cctvupdatescreen(
                    caseId: data['case_id'],
                    customerName: data['customer_name'],
                    inOut: data['in_out'],
                    warehouseId: data['terminal_id'],
                  );
                },
              ),
              GoRoute(
                name: 'gatepass_screen',
                path: "gatepass_screen",
                builder: (context, state) {
                  final data = state.extra! as Map<String, dynamic>;
                  return Gatepassscreen(
                    caseId: data['case_id'],
                    inOut: data['in_out'] ?? "",
                  );
                },
              ),
              GoRoute(
                name: 'f_kanta_parchi',
                path: "f_kanta_parchi",
                builder: (context, state) {
                  final data = state.extra! as Map<String, dynamic>;
                  return FirstKantaParchi(
                    caseId: data['case_id'],
                    customerName: data['customer_name'],
                    inOut: data['in_out'],
                    warehouseId: data['terminal_id'],
                  );
                },
              ),
              GoRoute(
                name: 'f_quality_report',
                path: "f_quality_report",
                builder: (context, state) {
                  final data = state.extra! as Map<String, dynamic>;
                  return Firstqualityreport(
                    caseId: data['case_id'],
                    customerName: data['customer_name'],
                    inOut: data['in_out'],
                  );
                },
              ),
              GoRoute(
                name: 's_kanta_parchi',
                path: "s_kanta_parchi",
                builder: (context, state) {
                  final data = state.extra! as Map<String, dynamic>;
                  return SecondKantaParchi(
                    caseId: data['case_id'],
                    customerName: data['customer_name'],
                    inOut: data['in_out'],
                    warehouseId: data['terminal_id'],
                  );
                },
              ),
              GoRoute(
                name: 's_quality_report',
                path: "s_quality_report",
                builder: (context, state) {
                  final data = state.extra! as Map<String, dynamic>;
                  return Secondqualityreport(
                    caseId: data['case_id'],
                    customerName: data['customer_name'],
                    inOut: data['in_out'],
                    averageWeight: data['avg_weight'],
                    commodityQuality: data['commodity_quality'],
                  );
                },
              ),
              GoRoute(
                name: 'truck_book_list',
                path: "truck_book_list",
                builder: (context, state) {
                  final data = state.extra as Map<String, dynamic>;

                  return Truckbooklist(
                    inOut: data['in_out'],
                  );
                },
              ),
              GoRoute(
                name: 'labour_book_list',
                path: "labour_book_list",
                builder: (context, state) {
                  final data = state.extra as Map<String, dynamic>;

                  return Labourbooklist(
                    inOut: data['in_out'],
                  );
                },
              ),
              GoRoute(
                  name: 'f_kanta_parchi_list',
                  path: "f_kanta_parchi_list",
                  builder: (context, state) {
                    final data = state.extra as Map<String, dynamic>;

                    return Firstkantaparchilist(
                      inOut: data['in_out'],
                    );
                  },
                  routes: []),
              GoRoute(
                  name: 'f_quality_report_list',
                  path: "f_quality_report_list",
                  builder: (context, state) => Firstqualitylist(),
                  routes: []),
              GoRoute(
                name: 's_kanta_parchi_list',
                path: "s_kanta_parchi_list",
                builder: (context, state) {
                  final data = state.extra! as Map<String, dynamic>;

                  return Secondkantaparchilist(
                    inOut: data['in_out'],
                  );
                },
              ),
              GoRoute(
                name: 's_quality_list',
                path: "s_quality_list",
                builder: (context, state) {
                  final data = state.extra! as Map<String, dynamic>;

                  return Secondqualitylist(
                    inOut: data['in_out'],
                  );
                },
              ),
              GoRoute(
                name: 'options',
                path: "options",
                builder: (context, state) => OptionsScreen(),
              ),
              GoRoute(
                name: 'inwards',
                path: "inwards",
                builder: (context, state) => InwardsStackRequest(),
              ),
              GoRoute(
                name: 'stack_request',
                path: "stack_request",
                builder: (context, state) {
                  final data = state.extra! as Map<String, dynamic>;

                  return CreateCaseId(
                    inwardRequestDatum: data['inwards'] == null
                        ? null
                        : InwardRequestDatum.fromMap(
                            jsonDecode(data['inwards'].toString())),
                    outwardRequestDatum: data['outwards'] == null
                        ? null
                        : OutwardRequestDatum.fromMap(
                            jsonDecode(data['outwards'].toString())),
                  );
                },
              ),
              GoRoute(
                name: 'outwards',
                path: "outwards",
                builder: (context, state) => const OutwardsStackRequest(),
              ),
              GoRoute(
                name: 'create_voucher',
                path: "create_voucher",
                pageBuilder: (context, state) => CustomTransitionPage(
                  key: state.pageKey,
                  child: Createconveyancevoucher(),
                  transitionDuration: const Duration(milliseconds: 300),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(-1, 0),
                        end: Offset.zero,
                      ).animate(animation),
                      child: child,
                    );
                  },
                ),
              ),
              GoRoute(
                name: 'voucher_history',
                path: "voucher_history",
                pageBuilder: (context, state) => CustomTransitionPage(
                  key: state.pageKey,
                  child: const Voucherlist(),
                  transitionDuration: const Duration(milliseconds: 300),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(-1, 0),
                        end: Offset.zero,
                      ).animate(animation),
                      child: child,
                    );
                  },
                ),
              ),
              GoRoute(
                name: 'voucher_request',
                path: "voucher_request",
                pageBuilder: (context, state) => CustomTransitionPage(
                  key: state.pageKey,
                  child: Voucherrequests(),
                  transitionDuration: const Duration(milliseconds: 300),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(-1, 0),
                        end: Offset.zero,
                      ).animate(animation),
                      child: child,
                    );
                  },
                ),
              ),
              GoRoute(
                name: 'cancel_case_id',
                path: "cancel_case_id",
                pageBuilder: (context, state) => CustomTransitionPage(
                  key: state.pageKey,
                  child: const Cancelcaseid(),
                  transitionDuration: const Duration(milliseconds: 300),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(-1, 0),
                        end: Offset.zero,
                      ).animate(animation),
                      child: child,
                    );
                  },
                ),
              ),
              GoRoute(
                name: 'displeased_bags',
                path: "displeased_bags",
                pageBuilder: (context, state) => CustomTransitionPage(
                  key: state.pageKey,
                  child: const Displeasedbags(),
                  transitionDuration: const Duration(milliseconds: 300),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(-1, 0),
                        end: Offset.zero,
                      ).animate(animation),
                      child: child,
                    );
                  },
                ),
              ),
              GoRoute(
                name: 'displeased_request_list',
                path: "displeased_request_list",
                builder: (context, state) {
                  return DispleasRequestListScreen();
                },
              ),
              GoRoute(
                name: 'displeased_approve_reject',
                path: "displeased_approve_reject",
                builder: (context, state) {
                  return DispleasApprovalRequestScreen();
                },
              ),
              GoRoute(
                name: 'advance',
                path: "advance",
                pageBuilder: (context, state) => CustomTransitionPage(
                  key: state.pageKey,
                  child: const Advancesscreen(),
                  transitionDuration: const Duration(milliseconds: 300),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(-1, 0),
                        end: Offset.zero,
                      ).animate(animation),
                      child: child,
                    );
                  },
                ),
              ),
              GoRoute(
                name: 'advance_history',
                path: "advance_history",
                pageBuilder: (context, state) => CustomTransitionPage(
                  key: state.pageKey,
                  child: const Advanceslist(),
                  transitionDuration: const Duration(milliseconds: 300),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(-1, 0),
                        end: Offset.zero,
                      ).animate(animation),
                      child: child,
                    );
                  },
                ),
              ),
              GoRoute(
                name: 'update',
                path: "update",
                pageBuilder: (context, state) => CustomTransitionPage(
                  key: state.pageKey,
                  child: const HomeScreen(),
                  transitionDuration: const Duration(milliseconds: 300),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(-1, 0),
                        end: Offset.zero,
                      ).animate(animation),
                      child: child,
                    );
                  },
                ),
              ),

              GoRoute(
                name: 'pv',
                path: "pv",
                pageBuilder: (context, state) => CustomTransitionPage(
                  key: state.pageKey,
                  child: const Pvscreen(),
                  transitionDuration: const Duration(milliseconds: 300),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(-1, 0),
                        end: Offset.zero,
                      ).animate(animation),
                      child: child,
                    );
                  },
                ),
              ),
            ]),
        GoRoute(
            name: "/login",
            path: "/login",
            builder: (context, state) => const LoginScreen(),
            routes: [
              GoRoute(
                name: 'otp',
                path: "otp",
                builder: (context, state) {
                  final data = state.extra! as Map<String, dynamic>;
                  return VerifyOtpScreen(
                    phoneNumber: data['phone'],
                  );
                },
              ),
            ]),
        GoRoute(
          name: "/no_in_location",
          path: "/no_in_location",
          builder: (context, state) => const Notinlocation(),
        ),
      ],
    ));
var distanceProvider = StateProvider<String?>((ref) => null);
var connectivityProvider = StreamProvider<List<ConnectivityResult>>(
    (ref) => Connectivity().onConnectivityChanged);
