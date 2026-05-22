// ignore_for_file: deprecated_member_use_from_same_package

import 'package:dio/dio.dart';
import 'package:emp_apnagodam/Data/SharedPrefs/SharedUtility.dart';
import 'package:emp_apnagodam/Presentation/utils/DioInterceptor.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'DioProvider.g.dart';

@riverpod
Dio dio(DioRef ref) {
  return Dio(BaseOptions(
      baseUrl: ApiClient.testBaseUrl,
      headers: {
        "Authorization": ref.watch(sharedUtilityProvider).getToken(),
      },
      connectTimeout: const Duration(minutes: 30),
      receiveTimeout: const Duration(minutes: 30),
      sendTimeout: const Duration(minutes: 30)))
    ..interceptors.addAll([
      PrettyDioLogger(
          request: true,
          responseBody: true,
          requestBody: true,
          error: true,
          requestHeader: true,
          responseHeader: true),
      // LogInterceptor(),
      DioInterceptor(ref),
    ]);
}

@riverpod
Dio locationDio(DioRef ref) {
  return Dio(BaseOptions(
      baseUrl: 'https://maps.googleapis.com/maps/api/',
      connectTimeout: const Duration(seconds: 1),
      receiveTimeout: const Duration(seconds: 1),
      sendTimeout: const Duration(seconds: 1)));
}

class ImageClient {
  static const employeeImageUrl =
      "https://apnagodam.com/resources/assets/upload/employees/";
  static const frontEndAssetsUrl =
      "https://apnagodam.com/resources/frontend_asse-ts/uploads/";
  static const assetsImageUrl =
      "https://apnagodam.com/resources/assets/upload/";
  static const displegedImageUrl =
      "https://apnagodam.com/resources/assets/upload/displedge/";
  static const attendanceImageUrl =
      'https://apnagodam.com/resources/assets/upload/attendance/';
  static const conveyanceImageUrl =
      'https://apnagodam.com/resources/assets/upload/conveyance/';
}

class ApiClient {
  static const baseUrl = "https://apnagodam.com/";
  static const testBaseUrl = "https://demoaws.apnagodam.com/";

  static String getFullUrl(String path, {bool useTestBase = false}) {
    return '${useTestBase ? testBaseUrl : baseUrl}$path';
  }

/*
terminals and commodities apis
*
*
*
*/
  static const getAllData = 'api/apna_default_list';

/*
login apis
*
*current version v1
*  static const verifyOtp = "api/apna_emp_verify_otp";

*/

  static const sendOtp = "api/v1_apna_send_otp";
  static const verifyOtp = "api/v1_apna_emp_verify_otp";
  static const logout = "api/apna_user_logout";

  /*
  * case id apis
  *
  *
  *current version v1
  * */

  static const getCaseIds =
      "emp_api/apna_emp_get_caseid?limit=100&page=&status=1&search";
  static const caseRequests = "emp_api/apna_emp_stack_request";
  static const verifyDriverOtp = "emp_api/apna_emp_caseid_otp";
  static const createCaseId = "emp_api/apna_emp_create_caseid";
  static const createCaseIdV1 = "emp_api/v1_apna_emp_create_caseid";
  static const cancelCaseId = "emp_api/store_cancelcase_request";
  static const byePassFq = 'emp_api/apna_emp_f_quality_dummy';
  static const updateCCTV = 'emp_api/apna_emp_cctv_update';
  static const updateCCTVV1 = 'emp_api/v1_apna_emp_cctv_update';

  static const submitIvr = 'emp_api/apna_emp_ivr_update';
  static const submitIvrV1 = 'emp_api/v1_apna_emp_ivr_update';

  static const approveCancelCaseId = 'emp_api/approve_cancel_case';

/*
  * generate case id apis
  *
  *
  *
  * */
  static const getCaseGenerationUserList = 'emp_api/stack_book_user_list';
  static const getCaseGenerationCommodityList =
      'emp_api/stack_book_commodity_list';
  static const getCaseGenerationStackList = 'emp_api/stack_book_stack_list';
  static const getCaseGenerationContractorList =
      'emp_api/labour_contractor_list';
  static const getCaseGenerationContractorRateList =
      'emp_api/labour_contractor_rate_list';

  static const getCaseGenerationTripId = 'emp_api/stack_book_trip_ids';
  static const getCaseGenerationDriverList =
      'emp_api/stack_book_trip_driver_list';

  static const generateCaseId = 'emp_api/new_create_case';
  static const fetchFirstQualityData = 'emp_api/fetch_first_quality';
/*
  * transporter apis and truckbook
  *
  *
  *
  * */
  static const getTransporterList = 'emp_api/apna_emp_transpoter_name';
  static const uploadTruckBook = 'emp_api/apna_emp_update_truckbook';
  static const truckBookList =
      'emp_api/apna_emp_get_truckbook?limit=20&page=1&in_out=IN&search=';

  /*
  * labour contractor and labourbook
  *
  * current version v1
  *
  * */
  static const getLabourContractor = 'emp_api/apna_emp_term_l_contractor';
  static const getLabourContractorV1 = 'emp_api/v1_apna_emp_term_l_contractor';
  static const getLabourContractorRate =
      'emp_api/v1_apna_emp_term_l_contractor_rate';

  static const uploadLabour = 'emp_api/apna_emp_update_labour';
  static const labourList =
      'emp_api/apna_emp_get_labourbook?limit=20&page=1&in_out=IN&search=';

  /*
  * First Kanta Parchi apis
  * 
  * current version v1
  *
  * */
  static const getDharamKantas =
      'emp_api/apna_emp_get_kanta_prachi?limit&page&in_out=IN&search';

  static const uploadFirstKanta = 'emp_api/apna_emp_kanta_parchi';
  static const uploadFirstKantaV1 = 'emp_api/v1_apna_emp_kanta_parchi';

  static const getDharamKantaDetails = 'emp_api/apna_emp_term_d_kanta';
  static const fKantaList = 'emp_api/apna_emp_get_kanta_prachi';

  /*
  * First quality  apis
  *
  * current version v1
  *
  * */
  static const getCommodityParams = 'emp_api/apna_emp_qulaity_paramters';
  static const uploadFirstQualityReport = 'emp_api/apna_emp_f_quality';
  static const uploadFirstQualityReportV1 = 'emp_api/v1_apna_emp_f_quality';
  static const fQualityList =
      'emp_api/apna_emp_get_quality?limit=20&page=1&in_out=IN&search=';

  /*
  * Second Kanta Parchi apis
  *
  * current version v1
  *
  * */
  static const getDharamKantaByCaseId = 'emp_api/apna_emp_getkantaparchi';
  static const uploadSecondKanta = 'emp_api/apna_emp_s_kanta_parchi';
  static const uploadSecondKantaV1 = 'emp_api/v1_apna_emp_s_kanta_parchi';
  static const secondKantaparchiList =
      'emp_api/apna_emp_get_s_k_p?limit=20&page=1&in_out=IN&search=';

  /*
  * second quality  apis
  *
  * current version v1
  *
  * */
  static const uploadSecondQuality = 'emp_api/apna_emp_s_quality';
  static const uploadSecondQualityV1 = 'emp_api/v1_apna_emp_s_quality';
  static const secondQualityList =
      'emp_api/apna_emp_get_s_quality?limit=20&page=1&in_out=IN&search=';

/*
  * Attendance  apis
  *
  * current version v2

  *  static const attendanceStatus = 'emp_api/apna_emp_clock_status_new';
  static const postAttendance = 'emp_api/apna_emp_attendance_new';
  * */
  static const attendanceStatus = 'emp_api/apna_emp_clock_status_new';
  static const postAttendance = 'emp_api/v1_apna_emp_attendance_new';
  static const postAttendanceV2 = 'emp_api/v2_apna_emp_attendance_new';
  static const lateReason = 'emp_api/emp_attendance_time';
  static const getAttendenceInRequests = 'emp_api/in_atten_approval_list';
  static const getAttendenceOutRequests = 'emp_api/out_atten_approval_list';
  static const approveRejectRequest = 'emp_api/approve_emp_atten';
  static const getListOfHolidays = "emp_api/get_ag_holidays";

  /*
  * conveyance  apis
  *
  *
  *
  * */
  static const getLevelWiseList = 'emp_api/apna_emp_get_levelwiselist';
  static const postConveyance = "emp_api/apna_emp_conveyance_create";
  static const getVoucherList = "emp_api/apna_emp_get_conveyance";
  static const cancelVoucherRequest = 'emp_api/apna_emp_conveyance_delete';
  static const approveVoucherList = 'emp_api/apna_emp_get_conveyance_req';
  static const verifyRequest = 'emp_api/apna_emp_conveyance_verify';
  static const rejectRequest = 'emp_api/apna_emp_conveyance_reject';

/*
  * Displeased  apis
  *
  *
  *
  * */
  static const getDispleasedUsers = "emp_api/user_terminalewise_users";

  static const getDispleasedCommodities =
      'emp_api/user_terminalewise_commodity';

  static const getDispleasedStacks = 'emp_api/user_terminalewise_stack';

  static const getTerminals = "api/apna_terminals";

  static const getApprover = 'emp_api/displedge_request_employee';

  static const postDispleasedRequest = 'emp_api/add_displedge';

  static const getDispledgeRequestlist = 'emp_api/emp_displedge_req_data';

  static const getDispledgeApprovalRequestList =
      'emp_api/emp_displedge_req_approval_data';

  static const getDispledgeApprove = 'emp_api/emp_approve_displedge_req';

  static const getDispledgeReject = 'emp_api/emp_disable_displedge_req';
/*
  * Advance  apis
  *
  *
  *
  * */
  static const postAdvanceRequest = 'emp_api/store_advance';
  static const getAdvanceList = 'emp_api/apna_emp_get_advance?limit=20';
  static const getApproverDetails = 'emp_api/get_advance_payment_approver';
  static const getWithdrawRequests = 'emp_api/apna_emp_withdrawal_approve_list';
  static const approveWithdrawRequest =
      'emp_api/apna_emp_approve_withdrawal_request';
  static const rejectWithdrawRequest =
      'emp_api/apna_emp_reject_withdrawal_request';

/*
  * PV  apis
  *
  *
  *
  * */
  static const postPv = 'emp_api/save_pv_data';
  static const getPv = 'emp_api/get_pv';

  /*
  * lead generate apis
  *
  *
  *
  * */
  static const generateLead = 'emp_api/apna_emp_create_lead';
  static const leadsList = 'emp_api/apna_emp_leads';

/*
  * Geocoding Apis
  *
  *
  *
  * */
  static const getAddress = 'geocode/json';

  /*
  * profile Apis
  *
  *
  *
  * */
  static const getProfile = 'emp_api/apna_emp_profile';

  /*
  * Wallet Apis
  *
  *
  *
  * */
  static const getWalletStatement = 'emp_api/gen_emp_wallet_statement';

/*
  * Gatepass Apis
  *
  *
  *
  * */

  static const getGatepass = 'emp_api/apna_emp_gatepass_detail';
  static const submitGatepass = 'emp_api/apna_emp_gate_pass';

/*
  * Audit Apis
  *
  *
  *
  * */
  static const getActiveAuditList = 'emp_api/active_audit_list';
  static const getCompletedAuditList = 'emp_api/audit_summary';
  static const cancelledAudit = 'emp_api/audit_cancel_audit';
  static const endledAudit = 'emp_api/audit_end_audit';
  static const getstackAudit = 'emp_api/audit_ids_for_stack_bag';
  static const getShowStackAudit = 'emp_api/audit_show_stacks';
  static const getAuditStackQuality = 'emp_api/audit_show_quality_stacks';
  static const getCommdityAuditQuality = 'emp_api/audit_show_stacks_commodity';
  static const getCommodityParameters =
      'emp_api/audit_show_commodity_parameters';
  static const getStackAuditList = 'emp_api/audit_stack_bag_list';
  static const getAuditEditStackbag = 'emp_api/audit_stack_bag_edit_data';
  static const getAuditStackList = 'emp_api/audit_work_status';
  static const getAuditStart = 'api/apna_terminals';
  static const getAssetsAudit = 'emp_api/audit_assets_list';
  static const postAssetsAuditUpdate = 'emp_api/audit_assets_update';
  static const startAudit = 'emp_api/audit_start_audit';
  static const postCCTVAuditStack = 'emp_api/audit_update_cctv';
  static const postStackQuality = 'emp_api/audit_save_stack_summary';
  static const postFumigationAudit = 'emp_api/audit_fumigation_update';
  static const postLockAndKey = 'emp_api/audit_lock_key_update';
  static const postStackAudit = 'emp_api/audit_save_pv_data';
  static const updateAuditQuality = 'emp_api/audit_save_stack_quality';
  static const postStackSaveSummaty = "emp_api/audit_save_stack_summary";
  static const addNeighbour = 'emp_api/save_neighbour';
  static const getAuditStacks = 'emp_api/apna_get_Stack';
  static const getAuditQualityParams = 'emp_api/get_quality';
  static const postAuditQuality = 'emp_api/save_quality';
  static const postAuditPV = 'emp_api/auditpv_save';
  static const getPhysicalAuditEdit = 'emp_api/audit_stack_physical_edit';
  static const postUpdatePhysicalAudit = 'emp_api/audit_update_stack_summary';
  static const getStackQualityEdit = 'emp_api/audit_stack_quality_edit';
  static const getStackNumerAudit = 'emp_api/audit_stack_quality_edit_stacks';
  static const getCctvAuditEdit = 'emp_api/audit_cctv_edit';
  static const postUpdateCctvedit = 'emp_api/audit_cctv_update_data';
  static const getLockKeyEdit = 'emp_api/audit_lock_key_edit';

  static const getFumigationList = 'emp_api/audit_fumigation_edit';

  static const postFumigationUpdate = 'emp_api/audit_fumigation_data_update';
  static const postStackQualityUpdate = 'emp_api/audit_stack_quality_update';
  static const getEditAssets = 'emp_api/audit_assets_edit';
  static const postUpdateAssetsEdit = 'emp_api/audit_assets_data_update';
  static const getStackEditList =
      'emp_api/audit_show_editable_quality_stack_list';
  static const getCctvCreatePdf = 'emp_api/gen_audit_fumigation_pdf';
  static const getLockKeyCreatePdf = 'emp_api/gen_audit_lock_pdf';
  static const getStackQualityCreatePdf = 'emp_api/gen_audit_stack_quality_pdf';
  static const getAssetsCreatePdf = 'emp_api/gen_audit_assets_pdf';
  static const getStackPhycialCreatePdf =
      'emp_api/gen_audit_stack_physical_pdf';
  static const getFumigationPdf = 'emp_api/gen_audit_fumigation_pdf';
  static const getMainPagePdf = 'emp_api/gen_completed_audit_pdf';
  static const postAuditPdf = 'emp_api/audit_save_pv_data';
/*
  * guard Apis
  *
  *
  *
  * */

  static const getGuardTerminalList = 'emp_api/guard_terminal_list';
  static const getShutterAndLockList = '/emp_api/guard_terminal_lock_data';
  static const getShutterAndLockOutList =
      'emp_api/guard_out_terminal_gate_data';
  static const saveGuardInData = 'emp_api/guard_in_terminal_seal_save';
  static const saveGuardOutData = 'emp_api/guard_out_terminal_seal_save';

  /*
  * Cleaning Apis
  *
  *
  *
  * */
  static const getSpray = 'emp_api/w_q_spray_data';
  static const getCleaning = 'emp_api/w_q_cleaning_data';
  static const getCHR = 'emp_api/w_q_chr_data';
  static const getfumigationList =
      'emp_api/w_q_fumigation_data?limit=100&page=1&in_out=IN&search=';
  static const getChrQualityPerameter = 'emp_api/w_q_getChrQualityReport';
  static const getAllTerminalList = 'emp_api/w_q_terminal_list';
  static const getStackList = 'emp_api/w_q_terminal_wise_stack';
  static const getStackWiseCommdity = 'emp_api/w_q_t_stack_wise_commodity';
  static const getFumigatiomAgency = 'emp_api/w_q_fumigation_agency';
  static const addSpray = 'emp_api/w_q_spray_store';
  static const addCleaning = 'emp_api/w_q_cleaning_store';
  static const addFumigation = 'emp_api/w_q_fumigation_store';
  static const addChr = 'emp_api/w_q_chr_store';
  static const updateDegas = 'emp_api/w_q_degas_done';
  /*
  * WHS
  *
  *
  *
  * */
  static const getWhsInTerminal = 'emp_api/emp_in_terminal_gate_data';
  static const getWhsOutTerminal = 'emp_api/emp_out_terminal_gate_data';
  static const saveWhsInTerminalData = 'emp_api/emp_in_terminal_seal_save';
  static const saveWhsOutTerminalData = 'emp_api/emp_out_terminal_seal_save';

  /*
  * Vender Voucher
  *
  *
  *
  * */
  static const getVenderVoucherList = 'emp_api/apna_emp_vendor_voucher_list';
  static const postVenderVoucherReject =
      'emp_api/emp_vendor_voucher_reject_by_user';
  static const getVenderVoucherApproveList =
      'emp_api/emp_vendor_voucher_approve_list';
  static const postVenderVoucherApprove = 'emp_api/emp_vendor_voucher_approve';
  static const postVenderVoucherRejected = 'emp_api/emp_vendor_voucher_reject';
  static const postvendorGropfirmList = 'emp_api/group_firm_list';
  static const getVendorList = 'emp_api/emp_vendors_list';
  static const getVendorExpenses = 'emp_api/emp_get_vendorExpList';
  static const getVendorExpensesTerminal =
      'emp_api/emp_get_vendorExpTerminalList';
  static const getVendorApproveName = 'emp_api/emp_get_vendorApproverName';
  static const postCreateVendorVoucher = 'emp_api/emp_vendor_voucher_create';

/*
  * Sanction Limit
  *
  *
  *
  * */

  static const getSanctionLimitList = 'emp_api/emp_sanction_limit_data';
  static const getSanctionLimitApprove = 'emp_api/emp_sanction_limit_approve';
  static const getSanctionLimitReject = 'emp_api/emp_sanction_limit_reject';
  static const getSanctionLetterPdf = 'emp_api/emp_sanction_limit_pdf';
  static const getSmeTowPdf = 'emp_api/emp_sme2_pdf';
  static const sanctionLimitDocumentUpdate =
      'emp_api/emp_sanction_limit_doc_store';

/*
  * Quality Calculator
  *
  *
  *
  * */

  static const getQualityParamsList = 'user_api/get_quality_parameter_list';
  static const getQualityPrice = 'user_api/get_quality_deduction_amount';
  /*
  * States and district
  *
  *
  *
  * */

  static const getStates = "api/get_state_name";
  static const getDistricts = 'api/district-list';
/*
  * Index Data
  *
  *
  *
  * */
  static const getIndexData = 'api/index-data';
  // Example usage:
  // final fullUrl = ApiClient.getFullUrl(ApiClient.getWhsInTerminal);
  // final testUrl = ApiClient.getFullUrl(ApiClient.getWhsInTerminal, useTestBase: true);
}
