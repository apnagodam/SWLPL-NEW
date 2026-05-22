// ignore_for_file: deprecated_member_use_from_same_package

import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:emp_apnagodam/Data/Models/ActiveAuditModsal.dart';
import 'package:emp_apnagodam/Data/Models/AddNeighbourRequestModel.dart';
import 'package:emp_apnagodam/Data/Models/AssetsPdfModal.dart';
import 'package:emp_apnagodam/Data/Models/AssetsUpdateModal.dart';
import 'package:emp_apnagodam/Data/Models/Assetsmodal.dart';
import 'package:emp_apnagodam/Data/Models/AuditQualityModel.dart';
import 'package:emp_apnagodam/Data/Models/AuditQualityRequestModel.dart';
import 'package:emp_apnagodam/Data/Models/AuditQvRequestModel.dart';
import 'package:emp_apnagodam/Data/Models/AuditStackBagEditModal.dart';
import 'package:emp_apnagodam/Data/Models/AuditStackListModal.dart';
import 'package:emp_apnagodam/Data/Models/AuditStackModel.dart';
import 'package:emp_apnagodam/Data/Models/AuditStartModal.dart';
import 'package:emp_apnagodam/Data/Models/CCTVAuditModal.dart';
import 'package:emp_apnagodam/Data/Models/CctvPdfCreateModal.dart';
import 'package:emp_apnagodam/Data/Models/CommdityPermetarModal.dart';
import 'package:emp_apnagodam/Data/Models/CommdityStackModal.dart';
import 'package:emp_apnagodam/Data/Models/CompletedAudit.dart';
import 'package:emp_apnagodam/Data/Models/EditAssetsModal.dart';
import 'package:emp_apnagodam/Data/Models/EditCCTVModal.dart';
import 'package:emp_apnagodam/Data/Models/FumigationListingModel.dart';
import 'package:emp_apnagodam/Data/Models/EditLockAndKeyModal.dart';
import 'package:emp_apnagodam/Data/Models/EditPhysicalModal.dart';
import 'package:emp_apnagodam/Data/Models/EditQualityStackModal.dart';
import 'package:emp_apnagodam/Data/Models/FumigationAuditModal.dart';
import 'package:emp_apnagodam/Data/Models/FumigationPdfModal.dart';
import 'package:emp_apnagodam/Data/Models/LockAndKeyModal.dart';
import 'package:emp_apnagodam/Data/Models/MainPagePdfModal.dart';
import 'package:emp_apnagodam/Data/Models/PVModel.dart';
import 'package:emp_apnagodam/Data/Models/PVStackAuditModal.dart';
import 'package:emp_apnagodam/Data/Models/ShowStackAuditModal.dart';
import 'package:emp_apnagodam/Data/Models/StackEditListModal.dart';
import 'package:emp_apnagodam/Data/Models/StackListAudit.dart';
import 'package:emp_apnagodam/Data/Models/StackModal.dart';
import 'package:emp_apnagodam/Data/Models/StackNumberModal.dart';
import 'package:emp_apnagodam/Data/Models/StackPhycialPdfModal.dart';
import 'package:emp_apnagodam/Data/Models/StackQualityPdfModal.dart';
import 'package:emp_apnagodam/Data/Models/StackQualityRequestModel.dart';
import 'package:emp_apnagodam/Data/Models/StackSaveSummaryModal.dart';
import 'package:emp_apnagodam/Data/Models/UpdateAssetsEditModal.dart';
import 'package:emp_apnagodam/Data/Models/UpdateCCTVModal.dart';
import 'package:emp_apnagodam/Data/Models/UpdateFumigationEditModal.dart';
import 'package:emp_apnagodam/Data/Models/UpdatePhisicalAuditEdit.dart';
import 'package:emp_apnagodam/Data/Models/UpdateStartAudit.dart';
import 'package:emp_apnagodam/Data/Models/lockAndKeyPDFModal.dart';
import 'package:emp_apnagodam/Domain/dio/DioProvider.dart';
import 'package:emp_apnagodam/Presentation/utils/extensions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'AuditService.g.dart';

@riverpod
Future<Map<String, dynamic>> addNeighbour(AddNeighbourRef ref,
    {Addneighbourrequestmodel? model}) async {
  var response = await ref
      .watch(dioProvider)
      .post(ApiClient.addNeighbour, data: model!.toMap());
  return response.data;
}

//
@riverpod
Stream<AuditStackModel> auditStacks(AuditStacksRef ref,
    {required String? terminalId}) async* {
  var response = await ref.watch(dioProvider).get(ApiClient.getAuditStacks,
      queryParameters: {'terminal_id': terminalId});
  yield auditStackModelFromJson(jsonEncode(response.data));
}

@riverpod
Stream<AuditModal> completeaudit(
  ref,
) async* {
  var response = await ref.watch(dioProvider).get(
        ApiClient.getCompletedAuditList,
      );
  yield auditModalFromJson(jsonEncode(response.data));
}

@riverpod
Stream<ActiveAuditModal> activeAudit(
  ref,
) async* {
  var response = await ref.watch(dioProvider).get(
        ApiClient.getActiveAuditList,
      );
  yield activeAuditModalFromJson(jsonEncode(response.data));
}

@riverpod
Stream<AuditQualityModel> auditQualityParams(AuditQualityParamsRef ref,
    {required String? commodityId}) async* {
  var response = await ref.watch(dioProvider).post(
      ApiClient.getAuditQualityParams,
      queryParameters: {'commodity_id': commodityId});

  yield auditQualityModelFromJson(jsonEncode(response.data));
}

@riverpod
Future<Map<String, dynamic>> postAuditQuality(PostAuditQualityRef ref,
    {required AuditQvRequestModel model}) async {
  var response = await ref
      .watch(dioProvider)
      .post(ApiClient.postAuditQuality, data: qvRequestModeltoMap(model));
  return response.data;
}

@riverpod
Future<Map<String, dynamic>> postAuditPv(PostAuditPvRef ref,
    {required Pvmodel model}) async {
  var response = await ref
      .watch(dioProvider)
      .post(ApiClient.postAuditPV, data: pvModeltoMap(model));
  return response.data;
}

@riverpod
Future<Map<String, dynamic>> cancelAudit(
  CancelAuditRef ref, {
  String? id,
  String? remark,
}) async {
  var response = await ref.watch(dioProvider).post(ApiClient.cancelledAudit,
      queryParameters: {"audit_id": id, "remark": remark});

  return response.data;
}

@riverpod
Future<Map<String, dynamic>> endAudit(
  EndAuditRef ref, {
  String? id,
}) async {
  var response = await ref
      .watch(dioProvider)
      .post(ApiClient.endledAudit, queryParameters: {
    "audit_id": id,
  });

  return response.data;
}

@riverpod
Stream<StackAuditModal> stackAudit(
  StackAuditRef ref,
) async* {
  var response = await ref
      .watch(dioProvider)
      .post(ApiClient.getstackAudit, queryParameters: {});

  yield stackAuditModalFromJson(jsonEncode(response.data));
}

@riverpod
Stream<ShowStackAuditModal> showStackAudit(ShowStackAuditRef ref,
    {required String? Id}) async* {
  var response = await ref
      .watch(dioProvider)
      .get(ApiClient.getShowStackAudit, queryParameters: {'audit_id': Id});
  yield showStackAuditModalFromJson(jsonEncode(response.data));
}

@riverpod
Stream<ShowStackAuditModal> showQualityStacks(ShowQualityStacksRef ref,
    {required String? auditId}) async* {
  var response = await ref
      .watch(dioProvider)
      .get(ApiClient.getShowStackAudit, queryParameters: {'audit_id': auditId});
  yield showStackAuditModalFromJson(jsonEncode(response.data));
}

@riverpod
Stream<CommdityAuditModal> commdityAuditQuality(CommdityAuditQualityRef ref,
    {required String? id, required String? stackNo}) async* {
  var response = await ref.watch(dioProvider).get(
      ApiClient.getCommdityAuditQuality,
      queryParameters: {"terminal_id": id, "stack_no": stackNo});
  yield commdityAuditModalFromJson(jsonEncode(response.data));
}

@riverpod
Stream<CommdityParametersModal> commdityParameters(
  CommdityParametersRef ref, {
  required String? id,
}) async* {
  var response = await ref
      .watch(dioProvider)
      .post(ApiClient.getCommodityParameters, queryParameters: {
    "commodity_id": id,
  });
  yield commdityParametersModalFromJson(jsonEncode(response.data));
}

@riverpod
Future<Map<String, dynamic>> auditQualityUpdate(Ref ref,
    {required AuditQualityRequestModel model}) async {
  var response = await ref.watch(dioProvider).post(ApiClient.updateAuditQuality,
      queryParameters: {'remark': "Ok"},
      data: auditQualityRequestModelToJson(model));
  ref.invalidate(getAuditStackListProvider);

  return response.data;
}

@riverpod
Future<Map<String, dynamic>> postPVStackAudit(PostPVStackAuditRef ref,
    {required Pvmodel model}) async {
  var response = await ref
      .watch(dioProvider)
      .post(ApiClient.postStackAudit, data: PvStackAuditModel());
  return response.data;
}

@riverpod
Future<Map<String, dynamic>> postStackQualityAudit(PostStackQualityAuditRef ref,
    {required StackSaveSummaryModal model}) async {
  var response = await ref.watch(dioProvider).post(
        ApiClient.postStackQuality,
        queryParameters: {'remark': "Ok"},
        data: stackSaveSummaryModalToJson(model),
      );
  ref.invalidate(getAuditStackListProvider);
  return response.data;
}

@riverpod
Stream<StackAuditListmodal> getStackAuditList(
  GetStackAuditListRef ref,
) async* {
  var response = await ref
      .watch(dioProvider)
      .post(ApiClient.getStackAuditList, queryParameters: {});

  yield stackAuditListmodalFromJson(jsonEncode(response.data));
}

@riverpod
Stream<AuditStackbagEditModal> getAuditStackEditBag(GetAuditStackEditBagRef ref,
    {required String? id}) async* {
  var response = await ref
      .watch(dioProvider)
      .get(ApiClient.getAuditEditStackbag, queryParameters: {
    "terminal_id": id,
  });
  yield auditStackbagEditModalFromJson(jsonEncode(response.data));
}

@riverpod
Stream<AuditStackListModal> getAuditStackList(GetAuditStackListRef ref,
    {required String? id}) async* {
  var response = await ref
      .watch(dioProvider)
      .get(ApiClient.getAuditStackList, queryParameters: {
    "audit_id": id,
  });
  yield auditStackListModalFromJson(jsonEncode(response.data));
}

@riverpod
Stream<AuditStartModal> getStartAudit(
  GetStartAuditRef ref,
) async* {
  var response = await ref
      .watch(dioProvider)
      .get(ApiClient.getAuditStart, queryParameters: {});
  yield auditStartModalFromJson(jsonEncode(response.data));
}

@riverpod
Stream<UpdateStartAuditStackModal> postStartAuditStack(
    PostStartAuditStackRef ref,
    {required String? terminalId}) async* {
  var response = await ref
      .watch(dioProvider)
      .post(ApiClient.startAudit, queryParameters: {'terminal_id': terminalId});
  ref.invalidate(getAuditStackListProvider);
  yield updateStartAuditStackModalFromJson(jsonEncode(response.data));
}

@riverpod
Future<Map<String, dynamic>> postCCTVAudit(PostCCTVAuditRef ref,
    {required CctvAuditModal model}) async {
  var response = await ref
      .watch(dioProvider)
      .post(ApiClient.postCCTVAuditStack, data: cctvAuditModalToJson(model));
  ref.invalidate(getAuditStackListProvider);

  return response.data;
}

@riverpod
Future<Map<String, dynamic>> postLockAndKey(PostLockAndKeyRef ref,
    {required LockAndKeyModal model}) async {
  var response = await ref.watch(dioProvider).post(
        ApiClient.postLockAndKey,
        queryParameters: {'remark': "Ok"},
        data: model.toJson(),
      );

  ref.invalidate(getAuditStackListProvider);
  return response.data;
}

@riverpod
Future<Map<String, dynamic>> postFumigationUpdate(PostFumigationUpdateRef ref,
    {required FumigatonAuditModal model}) async {
  var response = await ref.watch(dioProvider).post(
      ApiClient.postFumigationAudit,
      queryParameters: {'remark': " "},
      data: fumigatonAuditModalToJson(model));

  ref.invalidate(getAuditStackListProvider);
  return response.data;
}

@riverpod
Stream<AssetsModal> getAssetsAudit(GetAssetsAuditRef ref,
    {required String? id}) async* {
  var response = await ref
      .watch(dioProvider)
      .get(ApiClient.getAssetsAudit, queryParameters: {"audit_id": id});

  ref.invalidate(getAuditStackListProvider);

  yield assetsModalFromJson(jsonEncode(response.data));
}

@riverpod
Future<Map<String, dynamic>> postAssetsUpdate(PostAssetsUpdateRef ref,
    {required AssetsUpdateModal model}) async {
  var response = await ref.watch(dioProvider).post(
      ApiClient.postAssetsAuditUpdate,
      queryParameters: {'remark': "Ok"},
      data: assetsUpdateModalToJson(model));
  ref.invalidate(getAuditStackListProvider);
  return response.data;
}

@riverpod
Stream<PhysicalAuditEditModal> physicalAuditEdit(PhysicalAuditEditRef ref,
    {required String? Id}) async* {
  var response = await ref
      .watch(dioProvider)
      .get(ApiClient.getPhysicalAuditEdit, queryParameters: {'audit_id': Id});
  yield physicalAuditEditModalFromJson(jsonEncode(response.data));
}

@riverpod
Future<Map<String, dynamic>> updatePhisicalAudit(UpdatePhisicalAuditRef ref,
    {required PhysicalAuditUpdateModal model}) async {
  var response = await ref.watch(dioProvider).post(
      ApiClient.postUpdatePhysicalAudit,
      queryParameters: {'remark': "Ok"},
      data: physicalAuditUpdateModalToJson(model));
  ref.invalidate(getAuditStackListProvider);
  return response.data;
}

///Work Panding
@riverpod
Stream<StackQualityModal> stackQualityEdit(StackQualityEditRef ref,
    {required String? Id, required String? stackno}) async* {
  var response = await ref.watch(dioProvider).get(ApiClient.getStackQualityEdit,
      queryParameters: {'audit_id': Id, 'stack_no': stackno});
  yield stackQualityModalFromJson(jsonEncode(response.data));
}

//////////
@riverpod
Stream<StackNumberMOdal> qualityStack(QualityStackRef ref,
    {required String? Id}) async* {
  var response = await ref
      .watch(dioProvider)
      .get(ApiClient.getStackNumerAudit, queryParameters: {'audit_id': Id});
  yield stackNumberMOdalFromJson(jsonEncode(response.data));
}

////complete
@riverpod
Stream<CctvAuditEditModal> cctvAuditEdit(CctvAuditEditRef ref,
    {required String? Id}) async* {
  var response = await ref
      .watch(dioProvider)
      .get(ApiClient.getCctvAuditEdit, queryParameters: {'audit_id': Id});
  yield cctvAuditEditModalFromJson(jsonEncode(response.data));
}

@riverpod
Future<Map<String, dynamic>> updateCctvEdit(UpdateCctvEditRef ref,
    {required CctvUpdateModal model}) async {
  var response = await ref.watch(dioProvider).post(ApiClient.postUpdateCctvedit,
      queryParameters: {'remark': "Ok"}, data: cctvUpdateModalToJson(model));
  ref.invalidate(getAuditStackListProvider);
  return response.data;
}

////////
@riverpod
Stream<EditLockAndKeyModal> lockKeyAuditEdit(LockKeyAuditEditRef ref,
    {required String? Id}) async* {
  var response = await ref
      .watch(dioProvider)
      .get(ApiClient.getLockKeyEdit, queryParameters: {'audit_id': Id});
  yield editLockAndKeyModalFromJson(jsonEncode(response.data));
}
//////

@riverpod
Future<FumigationListingModel> fumigationList(FumigationListRef ref,
    {required String auditId}) async {
  var response = await ref
      .watch(dioProvider)
      .get(ApiClient.getFumigationList, queryParameters: {"audit_id": auditId});

  ref.invalidate(getAuditStackListProvider);
  return fumigationListingModelFromJson(jsonEncode(response.data));
}

@riverpod
Future<Map<String, dynamic>> updateFumigation(UpdateFumigationRef ref,
    {required FumigatiomUpdateEditModal model}) async {
  var response = await ref.watch(dioProvider).get(
      ApiClient.postFumigationUpdate,
      data: fumigatiomUpdateEditModalToJson(model));

  ref.invalidate(getAuditStackListProvider);
  return response.data;
}

@riverpod
Future<Map<String, dynamic>> stackQualityUpdate(StackQualityUpdateRef ref,
    {required StackQualityRequestModel model}) async {
  var response = await ref.watch(dioProvider).post(
      ApiClient.postStackQualityUpdate,
      data: stackQualityRequestModelToJson(model));

  return response.data;
}

@riverpod
Future<AssetsEditModal> editAssets(EditAssetsRef ref,
    {required String auditId}) async {
  var response = await ref
      .watch(dioProvider)
      .get(ApiClient.getEditAssets, queryParameters: {"audit_id": auditId});

  ref.invalidate(getAuditStackListProvider);
  return assetsEditModalFromJson(jsonEncode(response.data));
}

@riverpod
Future<Map<String, dynamic>> assetsEditUpdate(AssetsEditUpdateRef ref,
    {required AssetsUpdateRequestModel model}) async {
  var response = await ref.watch(dioProvider).post(
      ApiClient.postUpdateAssetsEdit,
      data: assetsUpdateRequestModelToJson(model));

  return response.data;
}

@riverpod
Future<StackEditListModal> stackEditList(StackEditListRef ref,
    {required String auditId}) async {
  var response = await ref
      .watch(dioProvider)
      .get(ApiClient.getStackEditList, queryParameters: {"audit_id": auditId});

  ref.invalidate(getAuditStackListProvider);
  return stackEditListModalFromJson(jsonEncode(response.data));
}

// <----------------------------------------------Audit PDF Funcation Start  ------------------------------------------->
@riverpod
Future<CctvPdfCreatemodal> cctvPdfCreate(CctvPdfCreateRef ref,
    {required String auditId}) async {
  var response = await ref
      .watch(dioProvider)
      .get(ApiClient.getCctvCreatePdf, queryParameters: {"audit_id": auditId});

  ref.invalidate(getAuditStackListProvider);
  return cctvPdfCreatemodalFromJson(jsonEncode(response.data));
}

@riverpod
Future<LockKeyPdfCreatemodal> lockKeyPdfCreate(Ref ref,
    {required String auditId}) async {
  var response = await ref.watch(dioProvider).get(ApiClient.getLockKeyCreatePdf,
      queryParameters: {"audit_id": auditId});

  ref.invalidate(getAuditStackListProvider);
  return lockKeyPdfCreatemodalFromJson(jsonEncode(response.data));
}

@riverpod
Future<StackQualityPdfCreatemodal> stackQualityPdfCreate(Ref ref,
    {required String auditId}) async {
  var response = await ref.watch(dioProvider).get(
      ApiClient.getStackQualityCreatePdf,
      queryParameters: {"audit_id": auditId});

  ref.invalidate(getAuditStackListProvider);
  return stackQualityPdfCreatemodalFromJson(jsonEncode(response.data));
}

@riverpod
Future<AssetsPdfCreatemodal> assetsPdfCreate(Ref ref,
    {required String auditId}) async {
  var response = await ref.watch(dioProvider).get(ApiClient.getAssetsCreatePdf,
      queryParameters: {"audit_id": auditId});

  ref.invalidate(getAuditStackListProvider);
  return assetsPdfCreatemodalFromJson(jsonEncode(response.data));
}

@riverpod
Future<StackPhycialPdfCreatemodal> stackPhycialPdfCreate(Ref ref,
    {required String auditId}) async {
  var response = await ref.watch(dioProvider).get(
      ApiClient.getStackPhycialCreatePdf,
      queryParameters: {"audit_id": auditId});

  ref.invalidate(getAuditStackListProvider);
  return stackPhycialPdfCreatemodalFromJson(jsonEncode(response.data));
}

@riverpod
Future<FumigationPdfCreatemodal> fumigationPdfCreate(Ref ref,
    {required String auditId}) async {
  var response = await ref
      .watch(dioProvider)
      .get(ApiClient.getFumigationPdf, queryParameters: {"audit_id": auditId});

  ref.invalidate(getAuditStackListProvider);
  return fumigationPdfCreatemodalFromJson(jsonEncode(response.data));
}

@riverpod
Future<MainPagePdfModal> mainPagePdfCreate(Ref ref,
    {required String auditId}) async {
  var response = await ref
      .watch(dioProvider)
      .get(ApiClient.getMainPagePdf, queryParameters: {"audit_id": auditId});

  ref.invalidate(getAuditStackListProvider);
  return mainPagePdfModalFromJson(jsonEncode(response.data));
}

@riverpod
Future<Map<String, dynamic>> postAuditPdf(Ref ref,
    {String? auditId, String? remark, File? file}) async {
  final formData = FormData.fromMap({
    'audit_id': 21,
    'remark': 'ok',
    'file': file == null
        ? ""
        : await MultipartFile.fromFile(
            file.path, // provide actual file path
            filename: file.name,
          ),
  });

  var response =
      await ref.watch(dioProvider).post(ApiClient.postAuditPdf, data: formData);
        ref.invalidate(getAuditStackListProvider);
  return response.data;
}
// <----------------------------------------------Audit PDF Funcation------------------------------------------->