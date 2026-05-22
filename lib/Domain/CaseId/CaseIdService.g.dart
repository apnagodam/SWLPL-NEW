// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CaseIdService.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$caseIdHash() => r'22cb09f52c7daf6373aee189b7a4a213ad3e790d';

/// See also [caseId].
@ProviderFor(caseId)
final caseIdProvider = AutoDisposeStreamProvider<CaseIdResponseModel>.internal(
  caseId,
  name: r'caseIdProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$caseIdHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CaseIdRef = AutoDisposeStreamProviderRef<CaseIdResponseModel>;
String _$caseRequestsHash() => r'e86aecf9d990634aad6f99f8dacf763493e50709';

/// See also [caseRequests].
@ProviderFor(caseRequests)
final caseRequestsProvider =
    AutoDisposeStreamProvider<CaseRequestModel>.internal(
  caseRequests,
  name: r'caseRequestsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$caseRequestsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CaseRequestsRef = AutoDisposeStreamProviderRef<CaseRequestModel>;
String _$defaultListHash() => r'12456e251a072da3c10d683f2ace6c91a56a9e72';

/// See also [defaultList].
@ProviderFor(defaultList)
final defaultListProvider =
    AutoDisposeStreamProvider<DefaultListModel>.internal(
  defaultList,
  name: r'defaultListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$defaultListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DefaultListRef = AutoDisposeStreamProviderRef<DefaultListModel>;
String _$verifyDriverOtpHash() => r'a4ce05419039eb9bc7dbd2722f61a34f6094eb88';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [verifyDriverOtp].
@ProviderFor(verifyDriverOtp)
const verifyDriverOtpProvider = VerifyDriverOtpFamily();

/// See also [verifyDriverOtp].
class VerifyDriverOtpFamily extends Family<AsyncValue<DriverOtpModel>> {
  /// See also [verifyDriverOtp].
  const VerifyDriverOtpFamily();

  /// See also [verifyDriverOtp].
  VerifyDriverOtpProvider call({
    String? phone = "",
    String? stackId = "",
    String? type = "",
    String? otp = "",
  }) {
    return VerifyDriverOtpProvider(
      phone: phone,
      stackId: stackId,
      type: type,
      otp: otp,
    );
  }

  @override
  VerifyDriverOtpProvider getProviderOverride(
    covariant VerifyDriverOtpProvider provider,
  ) {
    return call(
      phone: provider.phone,
      stackId: provider.stackId,
      type: provider.type,
      otp: provider.otp,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'verifyDriverOtpProvider';
}

/// See also [verifyDriverOtp].
class VerifyDriverOtpProvider
    extends AutoDisposeFutureProvider<DriverOtpModel> {
  /// See also [verifyDriverOtp].
  VerifyDriverOtpProvider({
    String? phone = "",
    String? stackId = "",
    String? type = "",
    String? otp = "",
  }) : this._internal(
          (ref) => verifyDriverOtp(
            ref as VerifyDriverOtpRef,
            phone: phone,
            stackId: stackId,
            type: type,
            otp: otp,
          ),
          from: verifyDriverOtpProvider,
          name: r'verifyDriverOtpProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$verifyDriverOtpHash,
          dependencies: VerifyDriverOtpFamily._dependencies,
          allTransitiveDependencies:
              VerifyDriverOtpFamily._allTransitiveDependencies,
          phone: phone,
          stackId: stackId,
          type: type,
          otp: otp,
        );

  VerifyDriverOtpProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.phone,
    required this.stackId,
    required this.type,
    required this.otp,
  }) : super.internal();

  final String? phone;
  final String? stackId;
  final String? type;
  final String? otp;

  @override
  Override overrideWith(
    FutureOr<DriverOtpModel> Function(VerifyDriverOtpRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: VerifyDriverOtpProvider._internal(
        (ref) => create(ref as VerifyDriverOtpRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        phone: phone,
        stackId: stackId,
        type: type,
        otp: otp,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<DriverOtpModel> createElement() {
    return _VerifyDriverOtpProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is VerifyDriverOtpProvider &&
        other.phone == phone &&
        other.stackId == stackId &&
        other.type == type &&
        other.otp == otp;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, phone.hashCode);
    hash = _SystemHash.combine(hash, stackId.hashCode);
    hash = _SystemHash.combine(hash, type.hashCode);
    hash = _SystemHash.combine(hash, otp.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin VerifyDriverOtpRef on AutoDisposeFutureProviderRef<DriverOtpModel> {
  /// The parameter `phone` of this provider.
  String? get phone;

  /// The parameter `stackId` of this provider.
  String? get stackId;

  /// The parameter `type` of this provider.
  String? get type;

  /// The parameter `otp` of this provider.
  String? get otp;
}

class _VerifyDriverOtpProviderElement
    extends AutoDisposeFutureProviderElement<DriverOtpModel>
    with VerifyDriverOtpRef {
  _VerifyDriverOtpProviderElement(super.provider);

  @override
  String? get phone => (origin as VerifyDriverOtpProvider).phone;
  @override
  String? get stackId => (origin as VerifyDriverOtpProvider).stackId;
  @override
  String? get type => (origin as VerifyDriverOtpProvider).type;
  @override
  String? get otp => (origin as VerifyDriverOtpProvider).otp;
}

String _$cancelCaseIdHash() => r'91af8dae030db8973186c3406c230c011c0f07b1';

/// See also [cancelCaseId].
@ProviderFor(cancelCaseId)
const cancelCaseIdProvider = CancelCaseIdFamily();

/// See also [cancelCaseId].
class CancelCaseIdFamily extends Family<AsyncValue<BaseResponse>> {
  /// See also [cancelCaseId].
  const CancelCaseIdFamily();

  /// See also [cancelCaseId].
  CancelCaseIdProvider call({
    String? caseId,
    String? notes,
  }) {
    return CancelCaseIdProvider(
      caseId: caseId,
      notes: notes,
    );
  }

  @override
  CancelCaseIdProvider getProviderOverride(
    covariant CancelCaseIdProvider provider,
  ) {
    return call(
      caseId: provider.caseId,
      notes: provider.notes,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'cancelCaseIdProvider';
}

/// See also [cancelCaseId].
class CancelCaseIdProvider extends AutoDisposeFutureProvider<BaseResponse> {
  /// See also [cancelCaseId].
  CancelCaseIdProvider({
    String? caseId,
    String? notes,
  }) : this._internal(
          (ref) => cancelCaseId(
            ref as CancelCaseIdRef,
            caseId: caseId,
            notes: notes,
          ),
          from: cancelCaseIdProvider,
          name: r'cancelCaseIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$cancelCaseIdHash,
          dependencies: CancelCaseIdFamily._dependencies,
          allTransitiveDependencies:
              CancelCaseIdFamily._allTransitiveDependencies,
          caseId: caseId,
          notes: notes,
        );

  CancelCaseIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.caseId,
    required this.notes,
  }) : super.internal();

  final String? caseId;
  final String? notes;

  @override
  Override overrideWith(
    FutureOr<BaseResponse> Function(CancelCaseIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CancelCaseIdProvider._internal(
        (ref) => create(ref as CancelCaseIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        caseId: caseId,
        notes: notes,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<BaseResponse> createElement() {
    return _CancelCaseIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CancelCaseIdProvider &&
        other.caseId == caseId &&
        other.notes == notes;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, caseId.hashCode);
    hash = _SystemHash.combine(hash, notes.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CancelCaseIdRef on AutoDisposeFutureProviderRef<BaseResponse> {
  /// The parameter `caseId` of this provider.
  String? get caseId;

  /// The parameter `notes` of this provider.
  String? get notes;
}

class _CancelCaseIdProviderElement
    extends AutoDisposeFutureProviderElement<BaseResponse>
    with CancelCaseIdRef {
  _CancelCaseIdProviderElement(super.provider);

  @override
  String? get caseId => (origin as CancelCaseIdProvider).caseId;
  @override
  String? get notes => (origin as CancelCaseIdProvider).notes;
}

String _$createCaseIdHash() => r'f2f59a5d1a94f74f3b95659f707e3bc7ee036fc1';

/// See also [createCaseId].
@ProviderFor(createCaseId)
const createCaseIdProvider = CreateCaseIdFamily();

/// See also [createCaseId].
class CreateCaseIdFamily extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [createCaseId].
  const CreateCaseIdFamily();

  /// See also [createCaseId].
  CreateCaseIdProvider call({
    String? terminalId = "",
    String? inOut = "",
    String? userId = "",
    String? commodityId = "",
    String? stackId = "",
    String? weight = "",
    String? quantitiy = "",
    String? vehicleNo = '',
    String? spotToken = "",
    String? driverNumber = "",
    String? contractorId,
    String? contractorName,
    String? contractorPhone,
    String? labourRate,
  }) {
    return CreateCaseIdProvider(
      terminalId: terminalId,
      inOut: inOut,
      userId: userId,
      commodityId: commodityId,
      stackId: stackId,
      weight: weight,
      quantitiy: quantitiy,
      vehicleNo: vehicleNo,
      spotToken: spotToken,
      driverNumber: driverNumber,
      contractorId: contractorId,
      contractorName: contractorName,
      contractorPhone: contractorPhone,
      labourRate: labourRate,
    );
  }

  @override
  CreateCaseIdProvider getProviderOverride(
    covariant CreateCaseIdProvider provider,
  ) {
    return call(
      terminalId: provider.terminalId,
      inOut: provider.inOut,
      userId: provider.userId,
      commodityId: provider.commodityId,
      stackId: provider.stackId,
      weight: provider.weight,
      quantitiy: provider.quantitiy,
      vehicleNo: provider.vehicleNo,
      spotToken: provider.spotToken,
      driverNumber: provider.driverNumber,
      contractorId: provider.contractorId,
      contractorName: provider.contractorName,
      contractorPhone: provider.contractorPhone,
      labourRate: provider.labourRate,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'createCaseIdProvider';
}

/// See also [createCaseId].
class CreateCaseIdProvider
    extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [createCaseId].
  CreateCaseIdProvider({
    String? terminalId = "",
    String? inOut = "",
    String? userId = "",
    String? commodityId = "",
    String? stackId = "",
    String? weight = "",
    String? quantitiy = "",
    String? vehicleNo = '',
    String? spotToken = "",
    String? driverNumber = "",
    String? contractorId,
    String? contractorName,
    String? contractorPhone,
    String? labourRate,
  }) : this._internal(
          (ref) => createCaseId(
            ref as CreateCaseIdRef,
            terminalId: terminalId,
            inOut: inOut,
            userId: userId,
            commodityId: commodityId,
            stackId: stackId,
            weight: weight,
            quantitiy: quantitiy,
            vehicleNo: vehicleNo,
            spotToken: spotToken,
            driverNumber: driverNumber,
            contractorId: contractorId,
            contractorName: contractorName,
            contractorPhone: contractorPhone,
            labourRate: labourRate,
          ),
          from: createCaseIdProvider,
          name: r'createCaseIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$createCaseIdHash,
          dependencies: CreateCaseIdFamily._dependencies,
          allTransitiveDependencies:
              CreateCaseIdFamily._allTransitiveDependencies,
          terminalId: terminalId,
          inOut: inOut,
          userId: userId,
          commodityId: commodityId,
          stackId: stackId,
          weight: weight,
          quantitiy: quantitiy,
          vehicleNo: vehicleNo,
          spotToken: spotToken,
          driverNumber: driverNumber,
          contractorId: contractorId,
          contractorName: contractorName,
          contractorPhone: contractorPhone,
          labourRate: labourRate,
        );

  CreateCaseIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.terminalId,
    required this.inOut,
    required this.userId,
    required this.commodityId,
    required this.stackId,
    required this.weight,
    required this.quantitiy,
    required this.vehicleNo,
    required this.spotToken,
    required this.driverNumber,
    required this.contractorId,
    required this.contractorName,
    required this.contractorPhone,
    required this.labourRate,
  }) : super.internal();

  final String? terminalId;
  final String? inOut;
  final String? userId;
  final String? commodityId;
  final String? stackId;
  final String? weight;
  final String? quantitiy;
  final String? vehicleNo;
  final String? spotToken;
  final String? driverNumber;
  final String? contractorId;
  final String? contractorName;
  final String? contractorPhone;
  final String? labourRate;

  @override
  Override overrideWith(
    FutureOr<Map<String, dynamic>> Function(CreateCaseIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CreateCaseIdProvider._internal(
        (ref) => create(ref as CreateCaseIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        terminalId: terminalId,
        inOut: inOut,
        userId: userId,
        commodityId: commodityId,
        stackId: stackId,
        weight: weight,
        quantitiy: quantitiy,
        vehicleNo: vehicleNo,
        spotToken: spotToken,
        driverNumber: driverNumber,
        contractorId: contractorId,
        contractorName: contractorName,
        contractorPhone: contractorPhone,
        labourRate: labourRate,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<String, dynamic>> createElement() {
    return _CreateCaseIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CreateCaseIdProvider &&
        other.terminalId == terminalId &&
        other.inOut == inOut &&
        other.userId == userId &&
        other.commodityId == commodityId &&
        other.stackId == stackId &&
        other.weight == weight &&
        other.quantitiy == quantitiy &&
        other.vehicleNo == vehicleNo &&
        other.spotToken == spotToken &&
        other.driverNumber == driverNumber &&
        other.contractorId == contractorId &&
        other.contractorName == contractorName &&
        other.contractorPhone == contractorPhone &&
        other.labourRate == labourRate;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, terminalId.hashCode);
    hash = _SystemHash.combine(hash, inOut.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);
    hash = _SystemHash.combine(hash, commodityId.hashCode);
    hash = _SystemHash.combine(hash, stackId.hashCode);
    hash = _SystemHash.combine(hash, weight.hashCode);
    hash = _SystemHash.combine(hash, quantitiy.hashCode);
    hash = _SystemHash.combine(hash, vehicleNo.hashCode);
    hash = _SystemHash.combine(hash, spotToken.hashCode);
    hash = _SystemHash.combine(hash, driverNumber.hashCode);
    hash = _SystemHash.combine(hash, contractorId.hashCode);
    hash = _SystemHash.combine(hash, contractorName.hashCode);
    hash = _SystemHash.combine(hash, contractorPhone.hashCode);
    hash = _SystemHash.combine(hash, labourRate.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CreateCaseIdRef on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `terminalId` of this provider.
  String? get terminalId;

  /// The parameter `inOut` of this provider.
  String? get inOut;

  /// The parameter `userId` of this provider.
  String? get userId;

  /// The parameter `commodityId` of this provider.
  String? get commodityId;

  /// The parameter `stackId` of this provider.
  String? get stackId;

  /// The parameter `weight` of this provider.
  String? get weight;

  /// The parameter `quantitiy` of this provider.
  String? get quantitiy;

  /// The parameter `vehicleNo` of this provider.
  String? get vehicleNo;

  /// The parameter `spotToken` of this provider.
  String? get spotToken;

  /// The parameter `driverNumber` of this provider.
  String? get driverNumber;

  /// The parameter `contractorId` of this provider.
  String? get contractorId;

  /// The parameter `contractorName` of this provider.
  String? get contractorName;

  /// The parameter `contractorPhone` of this provider.
  String? get contractorPhone;

  /// The parameter `labourRate` of this provider.
  String? get labourRate;
}

class _CreateCaseIdProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with CreateCaseIdRef {
  _CreateCaseIdProviderElement(super.provider);

  @override
  String? get terminalId => (origin as CreateCaseIdProvider).terminalId;
  @override
  String? get inOut => (origin as CreateCaseIdProvider).inOut;
  @override
  String? get userId => (origin as CreateCaseIdProvider).userId;
  @override
  String? get commodityId => (origin as CreateCaseIdProvider).commodityId;
  @override
  String? get stackId => (origin as CreateCaseIdProvider).stackId;
  @override
  String? get weight => (origin as CreateCaseIdProvider).weight;
  @override
  String? get quantitiy => (origin as CreateCaseIdProvider).quantitiy;
  @override
  String? get vehicleNo => (origin as CreateCaseIdProvider).vehicleNo;
  @override
  String? get spotToken => (origin as CreateCaseIdProvider).spotToken;
  @override
  String? get driverNumber => (origin as CreateCaseIdProvider).driverNumber;
  @override
  String? get contractorId => (origin as CreateCaseIdProvider).contractorId;
  @override
  String? get contractorName => (origin as CreateCaseIdProvider).contractorName;
  @override
  String? get contractorPhone =>
      (origin as CreateCaseIdProvider).contractorPhone;
  @override
  String? get labourRate => (origin as CreateCaseIdProvider).labourRate;
}

String _$byePassFqHash() => r'bb489f5e8686652d7b1ab0686ad9c9700f6c9bff';

/// See also [byePassFq].
@ProviderFor(byePassFq)
const byePassFqProvider = ByePassFqFamily();

/// See also [byePassFq].
class ByePassFqFamily extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [byePassFq].
  const ByePassFqFamily();

  /// See also [byePassFq].
  ByePassFqProvider call({
    String? caseId,
  }) {
    return ByePassFqProvider(
      caseId: caseId,
    );
  }

  @override
  ByePassFqProvider getProviderOverride(
    covariant ByePassFqProvider provider,
  ) {
    return call(
      caseId: provider.caseId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'byePassFqProvider';
}

/// See also [byePassFq].
class ByePassFqProvider
    extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [byePassFq].
  ByePassFqProvider({
    String? caseId,
  }) : this._internal(
          (ref) => byePassFq(
            ref as ByePassFqRef,
            caseId: caseId,
          ),
          from: byePassFqProvider,
          name: r'byePassFqProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$byePassFqHash,
          dependencies: ByePassFqFamily._dependencies,
          allTransitiveDependencies: ByePassFqFamily._allTransitiveDependencies,
          caseId: caseId,
        );

  ByePassFqProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.caseId,
  }) : super.internal();

  final String? caseId;

  @override
  Override overrideWith(
    FutureOr<Map<String, dynamic>> Function(ByePassFqRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ByePassFqProvider._internal(
        (ref) => create(ref as ByePassFqRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        caseId: caseId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<String, dynamic>> createElement() {
    return _ByePassFqProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ByePassFqProvider && other.caseId == caseId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, caseId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ByePassFqRef on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `caseId` of this provider.
  String? get caseId;
}

class _ByePassFqProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with ByePassFqRef {
  _ByePassFqProviderElement(super.provider);

  @override
  String? get caseId => (origin as ByePassFqProvider).caseId;
}

String _$updateCCTVReportHash() => r'c9a59fd4b84416fd7ed60483971548d6501dd772';

/// See also [updateCCTVReport].
@ProviderFor(updateCCTVReport)
const updateCCTVReportProvider = UpdateCCTVReportFamily();

/// See also [updateCCTVReport].
class UpdateCCTVReportFamily extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [updateCCTVReport].
  const UpdateCCTVReportFamily();

  /// See also [updateCCTVReport].
  UpdateCCTVReportProvider call({
    String? caseId,
    String? notes,
    String? cctvImage1,
    String? cctvImage2,
  }) {
    return UpdateCCTVReportProvider(
      caseId: caseId,
      notes: notes,
      cctvImage1: cctvImage1,
      cctvImage2: cctvImage2,
    );
  }

  @override
  UpdateCCTVReportProvider getProviderOverride(
    covariant UpdateCCTVReportProvider provider,
  ) {
    return call(
      caseId: provider.caseId,
      notes: provider.notes,
      cctvImage1: provider.cctvImage1,
      cctvImage2: provider.cctvImage2,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'updateCCTVReportProvider';
}

/// See also [updateCCTVReport].
class UpdateCCTVReportProvider
    extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [updateCCTVReport].
  UpdateCCTVReportProvider({
    String? caseId,
    String? notes,
    String? cctvImage1,
    String? cctvImage2,
  }) : this._internal(
          (ref) => updateCCTVReport(
            ref as UpdateCCTVReportRef,
            caseId: caseId,
            notes: notes,
            cctvImage1: cctvImage1,
            cctvImage2: cctvImage2,
          ),
          from: updateCCTVReportProvider,
          name: r'updateCCTVReportProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$updateCCTVReportHash,
          dependencies: UpdateCCTVReportFamily._dependencies,
          allTransitiveDependencies:
              UpdateCCTVReportFamily._allTransitiveDependencies,
          caseId: caseId,
          notes: notes,
          cctvImage1: cctvImage1,
          cctvImage2: cctvImage2,
        );

  UpdateCCTVReportProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.caseId,
    required this.notes,
    required this.cctvImage1,
    required this.cctvImage2,
  }) : super.internal();

  final String? caseId;
  final String? notes;
  final String? cctvImage1;
  final String? cctvImage2;

  @override
  Override overrideWith(
    FutureOr<Map<String, dynamic>> Function(UpdateCCTVReportRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UpdateCCTVReportProvider._internal(
        (ref) => create(ref as UpdateCCTVReportRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        caseId: caseId,
        notes: notes,
        cctvImage1: cctvImage1,
        cctvImage2: cctvImage2,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<String, dynamic>> createElement() {
    return _UpdateCCTVReportProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateCCTVReportProvider &&
        other.caseId == caseId &&
        other.notes == notes &&
        other.cctvImage1 == cctvImage1 &&
        other.cctvImage2 == cctvImage2;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, caseId.hashCode);
    hash = _SystemHash.combine(hash, notes.hashCode);
    hash = _SystemHash.combine(hash, cctvImage1.hashCode);
    hash = _SystemHash.combine(hash, cctvImage2.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UpdateCCTVReportRef
    on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `caseId` of this provider.
  String? get caseId;

  /// The parameter `notes` of this provider.
  String? get notes;

  /// The parameter `cctvImage1` of this provider.
  String? get cctvImage1;

  /// The parameter `cctvImage2` of this provider.
  String? get cctvImage2;
}

class _UpdateCCTVReportProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with UpdateCCTVReportRef {
  _UpdateCCTVReportProviderElement(super.provider);

  @override
  String? get caseId => (origin as UpdateCCTVReportProvider).caseId;
  @override
  String? get notes => (origin as UpdateCCTVReportProvider).notes;
  @override
  String? get cctvImage1 => (origin as UpdateCCTVReportProvider).cctvImage1;
  @override
  String? get cctvImage2 => (origin as UpdateCCTVReportProvider).cctvImage2;
}

String _$updateCCTVReportV1Hash() =>
    r'cffcecefff93375bb19fa77f7443f52187bfb729';

/// See also [updateCCTVReportV1].
@ProviderFor(updateCCTVReportV1)
const updateCCTVReportV1Provider = UpdateCCTVReportV1Family();

/// See also [updateCCTVReportV1].
class UpdateCCTVReportV1Family
    extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [updateCCTVReportV1].
  const UpdateCCTVReportV1Family();

  /// See also [updateCCTVReportV1].
  UpdateCCTVReportV1Provider call({
    String? caseId,
    String? notes,
    File? cctvImage1,
    File? cctvImage2,
  }) {
    return UpdateCCTVReportV1Provider(
      caseId: caseId,
      notes: notes,
      cctvImage1: cctvImage1,
      cctvImage2: cctvImage2,
    );
  }

  @override
  UpdateCCTVReportV1Provider getProviderOverride(
    covariant UpdateCCTVReportV1Provider provider,
  ) {
    return call(
      caseId: provider.caseId,
      notes: provider.notes,
      cctvImage1: provider.cctvImage1,
      cctvImage2: provider.cctvImage2,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'updateCCTVReportV1Provider';
}

/// See also [updateCCTVReportV1].
class UpdateCCTVReportV1Provider
    extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [updateCCTVReportV1].
  UpdateCCTVReportV1Provider({
    String? caseId,
    String? notes,
    File? cctvImage1,
    File? cctvImage2,
  }) : this._internal(
          (ref) => updateCCTVReportV1(
            ref as UpdateCCTVReportV1Ref,
            caseId: caseId,
            notes: notes,
            cctvImage1: cctvImage1,
            cctvImage2: cctvImage2,
          ),
          from: updateCCTVReportV1Provider,
          name: r'updateCCTVReportV1Provider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$updateCCTVReportV1Hash,
          dependencies: UpdateCCTVReportV1Family._dependencies,
          allTransitiveDependencies:
              UpdateCCTVReportV1Family._allTransitiveDependencies,
          caseId: caseId,
          notes: notes,
          cctvImage1: cctvImage1,
          cctvImage2: cctvImage2,
        );

  UpdateCCTVReportV1Provider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.caseId,
    required this.notes,
    required this.cctvImage1,
    required this.cctvImage2,
  }) : super.internal();

  final String? caseId;
  final String? notes;
  final File? cctvImage1;
  final File? cctvImage2;

  @override
  Override overrideWith(
    FutureOr<Map<String, dynamic>> Function(UpdateCCTVReportV1Ref provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UpdateCCTVReportV1Provider._internal(
        (ref) => create(ref as UpdateCCTVReportV1Ref),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        caseId: caseId,
        notes: notes,
        cctvImage1: cctvImage1,
        cctvImage2: cctvImage2,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<String, dynamic>> createElement() {
    return _UpdateCCTVReportV1ProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateCCTVReportV1Provider &&
        other.caseId == caseId &&
        other.notes == notes &&
        other.cctvImage1 == cctvImage1 &&
        other.cctvImage2 == cctvImage2;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, caseId.hashCode);
    hash = _SystemHash.combine(hash, notes.hashCode);
    hash = _SystemHash.combine(hash, cctvImage1.hashCode);
    hash = _SystemHash.combine(hash, cctvImage2.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UpdateCCTVReportV1Ref
    on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `caseId` of this provider.
  String? get caseId;

  /// The parameter `notes` of this provider.
  String? get notes;

  /// The parameter `cctvImage1` of this provider.
  File? get cctvImage1;

  /// The parameter `cctvImage2` of this provider.
  File? get cctvImage2;
}

class _UpdateCCTVReportV1ProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with UpdateCCTVReportV1Ref {
  _UpdateCCTVReportV1ProviderElement(super.provider);

  @override
  String? get caseId => (origin as UpdateCCTVReportV1Provider).caseId;
  @override
  String? get notes => (origin as UpdateCCTVReportV1Provider).notes;
  @override
  File? get cctvImage1 => (origin as UpdateCCTVReportV1Provider).cctvImage1;
  @override
  File? get cctvImage2 => (origin as UpdateCCTVReportV1Provider).cctvImage2;
}

String _$gatepassDataHash() => r'd60c6109d0b3f0e560dda4c87a9c3bd6e19605bf';

/// See also [gatepassData].
@ProviderFor(gatepassData)
const gatepassDataProvider = GatepassDataFamily();

/// See also [gatepassData].
class GatepassDataFamily extends Family<AsyncValue<GatepassModel>> {
  /// See also [gatepassData].
  const GatepassDataFamily();

  /// See also [gatepassData].
  GatepassDataProvider call({
    required String caseId,
  }) {
    return GatepassDataProvider(
      caseId: caseId,
    );
  }

  @override
  GatepassDataProvider getProviderOverride(
    covariant GatepassDataProvider provider,
  ) {
    return call(
      caseId: provider.caseId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'gatepassDataProvider';
}

/// See also [gatepassData].
class GatepassDataProvider extends AutoDisposeStreamProvider<GatepassModel> {
  /// See also [gatepassData].
  GatepassDataProvider({
    required String caseId,
  }) : this._internal(
          (ref) => gatepassData(
            ref as GatepassDataRef,
            caseId: caseId,
          ),
          from: gatepassDataProvider,
          name: r'gatepassDataProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$gatepassDataHash,
          dependencies: GatepassDataFamily._dependencies,
          allTransitiveDependencies:
              GatepassDataFamily._allTransitiveDependencies,
          caseId: caseId,
        );

  GatepassDataProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.caseId,
  }) : super.internal();

  final String caseId;

  @override
  Override overrideWith(
    Stream<GatepassModel> Function(GatepassDataRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GatepassDataProvider._internal(
        (ref) => create(ref as GatepassDataRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        caseId: caseId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<GatepassModel> createElement() {
    return _GatepassDataProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GatepassDataProvider && other.caseId == caseId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, caseId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GatepassDataRef on AutoDisposeStreamProviderRef<GatepassModel> {
  /// The parameter `caseId` of this provider.
  String get caseId;
}

class _GatepassDataProviderElement
    extends AutoDisposeStreamProviderElement<GatepassModel>
    with GatepassDataRef {
  _GatepassDataProviderElement(super.provider);

  @override
  String get caseId => (origin as GatepassDataProvider).caseId;
}

String _$submitGatepassReportHash() =>
    r'3cacf0bc4526bd5e9aa983fd8d6c35625793e158';

/// See also [submitGatepassReport].
@ProviderFor(submitGatepassReport)
const submitGatepassReportProvider = SubmitGatepassReportFamily();

/// See also [submitGatepassReport].
class SubmitGatepassReportFamily
    extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [submitGatepassReport].
  const SubmitGatepassReportFamily();

  /// See also [submitGatepassReport].
  SubmitGatepassReportProvider call({
    required Map<String, dynamic> data,
  }) {
    return SubmitGatepassReportProvider(
      data: data,
    );
  }

  @override
  SubmitGatepassReportProvider getProviderOverride(
    covariant SubmitGatepassReportProvider provider,
  ) {
    return call(
      data: provider.data,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'submitGatepassReportProvider';
}

/// See also [submitGatepassReport].
class SubmitGatepassReportProvider
    extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [submitGatepassReport].
  SubmitGatepassReportProvider({
    required Map<String, dynamic> data,
  }) : this._internal(
          (ref) => submitGatepassReport(
            ref as SubmitGatepassReportRef,
            data: data,
          ),
          from: submitGatepassReportProvider,
          name: r'submitGatepassReportProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$submitGatepassReportHash,
          dependencies: SubmitGatepassReportFamily._dependencies,
          allTransitiveDependencies:
              SubmitGatepassReportFamily._allTransitiveDependencies,
          data: data,
        );

  SubmitGatepassReportProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.data,
  }) : super.internal();

  final Map<String, dynamic> data;

  @override
  Override overrideWith(
    FutureOr<Map<String, dynamic>> Function(SubmitGatepassReportRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SubmitGatepassReportProvider._internal(
        (ref) => create(ref as SubmitGatepassReportRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        data: data,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<String, dynamic>> createElement() {
    return _SubmitGatepassReportProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SubmitGatepassReportProvider && other.data == data;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, data.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SubmitGatepassReportRef
    on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `data` of this provider.
  Map<String, dynamic> get data;
}

class _SubmitGatepassReportProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with SubmitGatepassReportRef {
  _SubmitGatepassReportProviderElement(super.provider);

  @override
  Map<String, dynamic> get data =>
      (origin as SubmitGatepassReportProvider).data;
}

String _$ivrReportHash() => r'a4c30d36631f65caa0278d3412c898651f5e7d9d';

/// See also [ivrReport].
@ProviderFor(ivrReport)
const ivrReportProvider = IvrReportFamily();

/// See also [ivrReport].
class IvrReportFamily extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [ivrReport].
  const IvrReportFamily();

  /// See also [ivrReport].
  IvrReportProvider call({
    String? notes,
    String? ivrWeight,
    String? ivrBags,
    String? files,
    String? caseId,
  }) {
    return IvrReportProvider(
      notes: notes,
      ivrWeight: ivrWeight,
      ivrBags: ivrBags,
      files: files,
      caseId: caseId,
    );
  }

  @override
  IvrReportProvider getProviderOverride(
    covariant IvrReportProvider provider,
  ) {
    return call(
      notes: provider.notes,
      ivrWeight: provider.ivrWeight,
      ivrBags: provider.ivrBags,
      files: provider.files,
      caseId: provider.caseId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'ivrReportProvider';
}

/// See also [ivrReport].
class IvrReportProvider
    extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [ivrReport].
  IvrReportProvider({
    String? notes,
    String? ivrWeight,
    String? ivrBags,
    String? files,
    String? caseId,
  }) : this._internal(
          (ref) => ivrReport(
            ref as IvrReportRef,
            notes: notes,
            ivrWeight: ivrWeight,
            ivrBags: ivrBags,
            files: files,
            caseId: caseId,
          ),
          from: ivrReportProvider,
          name: r'ivrReportProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$ivrReportHash,
          dependencies: IvrReportFamily._dependencies,
          allTransitiveDependencies: IvrReportFamily._allTransitiveDependencies,
          notes: notes,
          ivrWeight: ivrWeight,
          ivrBags: ivrBags,
          files: files,
          caseId: caseId,
        );

  IvrReportProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.notes,
    required this.ivrWeight,
    required this.ivrBags,
    required this.files,
    required this.caseId,
  }) : super.internal();

  final String? notes;
  final String? ivrWeight;
  final String? ivrBags;
  final String? files;
  final String? caseId;

  @override
  Override overrideWith(
    FutureOr<Map<String, dynamic>> Function(IvrReportRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: IvrReportProvider._internal(
        (ref) => create(ref as IvrReportRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        notes: notes,
        ivrWeight: ivrWeight,
        ivrBags: ivrBags,
        files: files,
        caseId: caseId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<String, dynamic>> createElement() {
    return _IvrReportProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is IvrReportProvider &&
        other.notes == notes &&
        other.ivrWeight == ivrWeight &&
        other.ivrBags == ivrBags &&
        other.files == files &&
        other.caseId == caseId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, notes.hashCode);
    hash = _SystemHash.combine(hash, ivrWeight.hashCode);
    hash = _SystemHash.combine(hash, ivrBags.hashCode);
    hash = _SystemHash.combine(hash, files.hashCode);
    hash = _SystemHash.combine(hash, caseId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin IvrReportRef on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `notes` of this provider.
  String? get notes;

  /// The parameter `ivrWeight` of this provider.
  String? get ivrWeight;

  /// The parameter `ivrBags` of this provider.
  String? get ivrBags;

  /// The parameter `files` of this provider.
  String? get files;

  /// The parameter `caseId` of this provider.
  String? get caseId;
}

class _IvrReportProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with IvrReportRef {
  _IvrReportProviderElement(super.provider);

  @override
  String? get notes => (origin as IvrReportProvider).notes;
  @override
  String? get ivrWeight => (origin as IvrReportProvider).ivrWeight;
  @override
  String? get ivrBags => (origin as IvrReportProvider).ivrBags;
  @override
  String? get files => (origin as IvrReportProvider).files;
  @override
  String? get caseId => (origin as IvrReportProvider).caseId;
}

String _$ivrReportV1Hash() => r'fba6cfa9af16d5baa44a294fe34677959b5bb5f7';

/// See also [ivrReportV1].
@ProviderFor(ivrReportV1)
const ivrReportV1Provider = IvrReportV1Family();

/// See also [ivrReportV1].
class IvrReportV1Family extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [ivrReportV1].
  const IvrReportV1Family();

  /// See also [ivrReportV1].
  IvrReportV1Provider call({
    String? notes,
    String? ivrWeight,
    String? ivrBags,
    File? files,
    String? caseId,
  }) {
    return IvrReportV1Provider(
      notes: notes,
      ivrWeight: ivrWeight,
      ivrBags: ivrBags,
      files: files,
      caseId: caseId,
    );
  }

  @override
  IvrReportV1Provider getProviderOverride(
    covariant IvrReportV1Provider provider,
  ) {
    return call(
      notes: provider.notes,
      ivrWeight: provider.ivrWeight,
      ivrBags: provider.ivrBags,
      files: provider.files,
      caseId: provider.caseId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'ivrReportV1Provider';
}

/// See also [ivrReportV1].
class IvrReportV1Provider
    extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [ivrReportV1].
  IvrReportV1Provider({
    String? notes,
    String? ivrWeight,
    String? ivrBags,
    File? files,
    String? caseId,
  }) : this._internal(
          (ref) => ivrReportV1(
            ref as IvrReportV1Ref,
            notes: notes,
            ivrWeight: ivrWeight,
            ivrBags: ivrBags,
            files: files,
            caseId: caseId,
          ),
          from: ivrReportV1Provider,
          name: r'ivrReportV1Provider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$ivrReportV1Hash,
          dependencies: IvrReportV1Family._dependencies,
          allTransitiveDependencies:
              IvrReportV1Family._allTransitiveDependencies,
          notes: notes,
          ivrWeight: ivrWeight,
          ivrBags: ivrBags,
          files: files,
          caseId: caseId,
        );

  IvrReportV1Provider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.notes,
    required this.ivrWeight,
    required this.ivrBags,
    required this.files,
    required this.caseId,
  }) : super.internal();

  final String? notes;
  final String? ivrWeight;
  final String? ivrBags;
  final File? files;
  final String? caseId;

  @override
  Override overrideWith(
    FutureOr<Map<String, dynamic>> Function(IvrReportV1Ref provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: IvrReportV1Provider._internal(
        (ref) => create(ref as IvrReportV1Ref),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        notes: notes,
        ivrWeight: ivrWeight,
        ivrBags: ivrBags,
        files: files,
        caseId: caseId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<String, dynamic>> createElement() {
    return _IvrReportV1ProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is IvrReportV1Provider &&
        other.notes == notes &&
        other.ivrWeight == ivrWeight &&
        other.ivrBags == ivrBags &&
        other.files == files &&
        other.caseId == caseId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, notes.hashCode);
    hash = _SystemHash.combine(hash, ivrWeight.hashCode);
    hash = _SystemHash.combine(hash, ivrBags.hashCode);
    hash = _SystemHash.combine(hash, files.hashCode);
    hash = _SystemHash.combine(hash, caseId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin IvrReportV1Ref on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `notes` of this provider.
  String? get notes;

  /// The parameter `ivrWeight` of this provider.
  String? get ivrWeight;

  /// The parameter `ivrBags` of this provider.
  String? get ivrBags;

  /// The parameter `files` of this provider.
  File? get files;

  /// The parameter `caseId` of this provider.
  String? get caseId;
}

class _IvrReportV1ProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with IvrReportV1Ref {
  _IvrReportV1ProviderElement(super.provider);

  @override
  String? get notes => (origin as IvrReportV1Provider).notes;
  @override
  String? get ivrWeight => (origin as IvrReportV1Provider).ivrWeight;
  @override
  String? get ivrBags => (origin as IvrReportV1Provider).ivrBags;
  @override
  File? get files => (origin as IvrReportV1Provider).files;
  @override
  String? get caseId => (origin as IvrReportV1Provider).caseId;
}

String _$getGeneratedCaseIdUserListHash() =>
    r'fd11a7096557ad9d06041ee13f6601f746cdc014';

/// See also [getGeneratedCaseIdUserList].
@ProviderFor(getGeneratedCaseIdUserList)
final getGeneratedCaseIdUserListProvider =
    AutoDisposeStreamProvider<GenerateCaseIdUserModel>.internal(
  getGeneratedCaseIdUserList,
  name: r'getGeneratedCaseIdUserListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getGeneratedCaseIdUserListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetGeneratedCaseIdUserListRef
    = AutoDisposeStreamProviderRef<GenerateCaseIdUserModel>;
String _$getGeneratedCaseIdCommodityListHash() =>
    r'761146a1ead7935a782c7e45183b3b19c310a462';

/// See also [getGeneratedCaseIdCommodityList].
@ProviderFor(getGeneratedCaseIdCommodityList)
const getGeneratedCaseIdCommodityListProvider =
    GetGeneratedCaseIdCommodityListFamily();

/// See also [getGeneratedCaseIdCommodityList].
class GetGeneratedCaseIdCommodityListFamily
    extends Family<AsyncValue<GenerateCaseIdCommodityModel>> {
  /// See also [getGeneratedCaseIdCommodityList].
  const GetGeneratedCaseIdCommodityListFamily();

  /// See also [getGeneratedCaseIdCommodityList].
  GetGeneratedCaseIdCommodityListProvider call({
    String? userId,
  }) {
    return GetGeneratedCaseIdCommodityListProvider(
      userId: userId,
    );
  }

  @override
  GetGeneratedCaseIdCommodityListProvider getProviderOverride(
    covariant GetGeneratedCaseIdCommodityListProvider provider,
  ) {
    return call(
      userId: provider.userId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getGeneratedCaseIdCommodityListProvider';
}

/// See also [getGeneratedCaseIdCommodityList].
class GetGeneratedCaseIdCommodityListProvider
    extends AutoDisposeStreamProvider<GenerateCaseIdCommodityModel> {
  /// See also [getGeneratedCaseIdCommodityList].
  GetGeneratedCaseIdCommodityListProvider({
    String? userId,
  }) : this._internal(
          (ref) => getGeneratedCaseIdCommodityList(
            ref as GetGeneratedCaseIdCommodityListRef,
            userId: userId,
          ),
          from: getGeneratedCaseIdCommodityListProvider,
          name: r'getGeneratedCaseIdCommodityListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getGeneratedCaseIdCommodityListHash,
          dependencies: GetGeneratedCaseIdCommodityListFamily._dependencies,
          allTransitiveDependencies:
              GetGeneratedCaseIdCommodityListFamily._allTransitiveDependencies,
          userId: userId,
        );

  GetGeneratedCaseIdCommodityListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userId,
  }) : super.internal();

  final String? userId;

  @override
  Override overrideWith(
    Stream<GenerateCaseIdCommodityModel> Function(
            GetGeneratedCaseIdCommodityListRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetGeneratedCaseIdCommodityListProvider._internal(
        (ref) => create(ref as GetGeneratedCaseIdCommodityListRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userId: userId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<GenerateCaseIdCommodityModel>
      createElement() {
    return _GetGeneratedCaseIdCommodityListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetGeneratedCaseIdCommodityListProvider &&
        other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetGeneratedCaseIdCommodityListRef
    on AutoDisposeStreamProviderRef<GenerateCaseIdCommodityModel> {
  /// The parameter `userId` of this provider.
  String? get userId;
}

class _GetGeneratedCaseIdCommodityListProviderElement
    extends AutoDisposeStreamProviderElement<GenerateCaseIdCommodityModel>
    with GetGeneratedCaseIdCommodityListRef {
  _GetGeneratedCaseIdCommodityListProviderElement(super.provider);

  @override
  String? get userId =>
      (origin as GetGeneratedCaseIdCommodityListProvider).userId;
}

String _$getGeneratedCaseIdStackListHash() =>
    r'd39b47daed64387940a5c5bbd58aa00d15ff5be4';

/// See also [getGeneratedCaseIdStackList].
@ProviderFor(getGeneratedCaseIdStackList)
const getGeneratedCaseIdStackListProvider = GetGeneratedCaseIdStackListFamily();

/// See also [getGeneratedCaseIdStackList].
class GetGeneratedCaseIdStackListFamily
    extends Family<AsyncValue<GenerateCaseIdStackModel>> {
  /// See also [getGeneratedCaseIdStackList].
  const GetGeneratedCaseIdStackListFamily();

  /// See also [getGeneratedCaseIdStackList].
  GetGeneratedCaseIdStackListProvider call({
    String? userId,
    String? commodityId,
  }) {
    return GetGeneratedCaseIdStackListProvider(
      userId: userId,
      commodityId: commodityId,
    );
  }

  @override
  GetGeneratedCaseIdStackListProvider getProviderOverride(
    covariant GetGeneratedCaseIdStackListProvider provider,
  ) {
    return call(
      userId: provider.userId,
      commodityId: provider.commodityId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getGeneratedCaseIdStackListProvider';
}

/// See also [getGeneratedCaseIdStackList].
class GetGeneratedCaseIdStackListProvider
    extends AutoDisposeStreamProvider<GenerateCaseIdStackModel> {
  /// See also [getGeneratedCaseIdStackList].
  GetGeneratedCaseIdStackListProvider({
    String? userId,
    String? commodityId,
  }) : this._internal(
          (ref) => getGeneratedCaseIdStackList(
            ref as GetGeneratedCaseIdStackListRef,
            userId: userId,
            commodityId: commodityId,
          ),
          from: getGeneratedCaseIdStackListProvider,
          name: r'getGeneratedCaseIdStackListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getGeneratedCaseIdStackListHash,
          dependencies: GetGeneratedCaseIdStackListFamily._dependencies,
          allTransitiveDependencies:
              GetGeneratedCaseIdStackListFamily._allTransitiveDependencies,
          userId: userId,
          commodityId: commodityId,
        );

  GetGeneratedCaseIdStackListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userId,
    required this.commodityId,
  }) : super.internal();

  final String? userId;
  final String? commodityId;

  @override
  Override overrideWith(
    Stream<GenerateCaseIdStackModel> Function(
            GetGeneratedCaseIdStackListRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetGeneratedCaseIdStackListProvider._internal(
        (ref) => create(ref as GetGeneratedCaseIdStackListRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userId: userId,
        commodityId: commodityId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<GenerateCaseIdStackModel> createElement() {
    return _GetGeneratedCaseIdStackListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetGeneratedCaseIdStackListProvider &&
        other.userId == userId &&
        other.commodityId == commodityId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);
    hash = _SystemHash.combine(hash, commodityId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetGeneratedCaseIdStackListRef
    on AutoDisposeStreamProviderRef<GenerateCaseIdStackModel> {
  /// The parameter `userId` of this provider.
  String? get userId;

  /// The parameter `commodityId` of this provider.
  String? get commodityId;
}

class _GetGeneratedCaseIdStackListProviderElement
    extends AutoDisposeStreamProviderElement<GenerateCaseIdStackModel>
    with GetGeneratedCaseIdStackListRef {
  _GetGeneratedCaseIdStackListProviderElement(super.provider);

  @override
  String? get userId => (origin as GetGeneratedCaseIdStackListProvider).userId;
  @override
  String? get commodityId =>
      (origin as GetGeneratedCaseIdStackListProvider).commodityId;
}

String _$getGeneratedCaseIdContractorListHash() =>
    r'632b603663427f51dc914542fc09fbd51911f10d';

/// See also [getGeneratedCaseIdContractorList].
@ProviderFor(getGeneratedCaseIdContractorList)
final getGeneratedCaseIdContractorListProvider =
    AutoDisposeStreamProvider<GenerateCaseIdContractorModel>.internal(
  getGeneratedCaseIdContractorList,
  name: r'getGeneratedCaseIdContractorListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getGeneratedCaseIdContractorListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetGeneratedCaseIdContractorListRef
    = AutoDisposeStreamProviderRef<GenerateCaseIdContractorModel>;
String _$getGeneratedCaseIdContractorRateListHash() =>
    r'be94b0c3fef70d9d5354195dd46b72a1b5fd0e8a';

/// See also [getGeneratedCaseIdContractorRateList].
@ProviderFor(getGeneratedCaseIdContractorRateList)
const getGeneratedCaseIdContractorRateListProvider =
    GetGeneratedCaseIdContractorRateListFamily();

/// See also [getGeneratedCaseIdContractorRateList].
class GetGeneratedCaseIdContractorRateListFamily
    extends Family<AsyncValue<GenerateCaseIdContractorRateModel>> {
  /// See also [getGeneratedCaseIdContractorRateList].
  const GetGeneratedCaseIdContractorRateListFamily();

  /// See also [getGeneratedCaseIdContractorRateList].
  GetGeneratedCaseIdContractorRateListProvider call({
    String? commodityId,
    String? contractorId,
  }) {
    return GetGeneratedCaseIdContractorRateListProvider(
      commodityId: commodityId,
      contractorId: contractorId,
    );
  }

  @override
  GetGeneratedCaseIdContractorRateListProvider getProviderOverride(
    covariant GetGeneratedCaseIdContractorRateListProvider provider,
  ) {
    return call(
      commodityId: provider.commodityId,
      contractorId: provider.contractorId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getGeneratedCaseIdContractorRateListProvider';
}

/// See also [getGeneratedCaseIdContractorRateList].
class GetGeneratedCaseIdContractorRateListProvider
    extends AutoDisposeStreamProvider<GenerateCaseIdContractorRateModel> {
  /// See also [getGeneratedCaseIdContractorRateList].
  GetGeneratedCaseIdContractorRateListProvider({
    String? commodityId,
    String? contractorId,
  }) : this._internal(
          (ref) => getGeneratedCaseIdContractorRateList(
            ref as GetGeneratedCaseIdContractorRateListRef,
            commodityId: commodityId,
            contractorId: contractorId,
          ),
          from: getGeneratedCaseIdContractorRateListProvider,
          name: r'getGeneratedCaseIdContractorRateListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getGeneratedCaseIdContractorRateListHash,
          dependencies:
              GetGeneratedCaseIdContractorRateListFamily._dependencies,
          allTransitiveDependencies: GetGeneratedCaseIdContractorRateListFamily
              ._allTransitiveDependencies,
          commodityId: commodityId,
          contractorId: contractorId,
        );

  GetGeneratedCaseIdContractorRateListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.commodityId,
    required this.contractorId,
  }) : super.internal();

  final String? commodityId;
  final String? contractorId;

  @override
  Override overrideWith(
    Stream<GenerateCaseIdContractorRateModel> Function(
            GetGeneratedCaseIdContractorRateListRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetGeneratedCaseIdContractorRateListProvider._internal(
        (ref) => create(ref as GetGeneratedCaseIdContractorRateListRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        commodityId: commodityId,
        contractorId: contractorId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<GenerateCaseIdContractorRateModel>
      createElement() {
    return _GetGeneratedCaseIdContractorRateListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetGeneratedCaseIdContractorRateListProvider &&
        other.commodityId == commodityId &&
        other.contractorId == contractorId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, commodityId.hashCode);
    hash = _SystemHash.combine(hash, contractorId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetGeneratedCaseIdContractorRateListRef
    on AutoDisposeStreamProviderRef<GenerateCaseIdContractorRateModel> {
  /// The parameter `commodityId` of this provider.
  String? get commodityId;

  /// The parameter `contractorId` of this provider.
  String? get contractorId;
}

class _GetGeneratedCaseIdContractorRateListProviderElement
    extends AutoDisposeStreamProviderElement<GenerateCaseIdContractorRateModel>
    with GetGeneratedCaseIdContractorRateListRef {
  _GetGeneratedCaseIdContractorRateListProviderElement(super.provider);

  @override
  String? get commodityId =>
      (origin as GetGeneratedCaseIdContractorRateListProvider).commodityId;
  @override
  String? get contractorId =>
      (origin as GetGeneratedCaseIdContractorRateListProvider).contractorId;
}

String _$tripIdHash() => r'e05430cb947643c8db60e65b44d69e52ddc7854e';

/// See also [tripId].
@ProviderFor(tripId)
const tripIdProvider = TripIdFamily();

/// See also [tripId].
class TripIdFamily extends Family<AsyncValue<GenerateCaseIdTripIdModel>> {
  /// See also [tripId].
  const TripIdFamily();

  /// See also [tripId].
  TripIdProvider call({
    required String userId,
    required String commodityId,
  }) {
    return TripIdProvider(
      userId: userId,
      commodityId: commodityId,
    );
  }

  @override
  TripIdProvider getProviderOverride(
    covariant TripIdProvider provider,
  ) {
    return call(
      userId: provider.userId,
      commodityId: provider.commodityId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'tripIdProvider';
}

/// See also [tripId].
class TripIdProvider
    extends AutoDisposeStreamProvider<GenerateCaseIdTripIdModel> {
  /// See also [tripId].
  TripIdProvider({
    required String userId,
    required String commodityId,
  }) : this._internal(
          (ref) => tripId(
            ref as TripIdRef,
            userId: userId,
            commodityId: commodityId,
          ),
          from: tripIdProvider,
          name: r'tripIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$tripIdHash,
          dependencies: TripIdFamily._dependencies,
          allTransitiveDependencies: TripIdFamily._allTransitiveDependencies,
          userId: userId,
          commodityId: commodityId,
        );

  TripIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userId,
    required this.commodityId,
  }) : super.internal();

  final String userId;
  final String commodityId;

  @override
  Override overrideWith(
    Stream<GenerateCaseIdTripIdModel> Function(TripIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TripIdProvider._internal(
        (ref) => create(ref as TripIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userId: userId,
        commodityId: commodityId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<GenerateCaseIdTripIdModel> createElement() {
    return _TripIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TripIdProvider &&
        other.userId == userId &&
        other.commodityId == commodityId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);
    hash = _SystemHash.combine(hash, commodityId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TripIdRef on AutoDisposeStreamProviderRef<GenerateCaseIdTripIdModel> {
  /// The parameter `userId` of this provider.
  String get userId;

  /// The parameter `commodityId` of this provider.
  String get commodityId;
}

class _TripIdProviderElement
    extends AutoDisposeStreamProviderElement<GenerateCaseIdTripIdModel>
    with TripIdRef {
  _TripIdProviderElement(super.provider);

  @override
  String get userId => (origin as TripIdProvider).userId;
  @override
  String get commodityId => (origin as TripIdProvider).commodityId;
}

String _$tripIdDriverDetailsHash() =>
    r'a83176c5adc8492f6633a23ef53155211703117a';

/// See also [tripIdDriverDetails].
@ProviderFor(tripIdDriverDetails)
const tripIdDriverDetailsProvider = TripIdDriverDetailsFamily();

/// See also [tripIdDriverDetails].
class TripIdDriverDetailsFamily
    extends Family<AsyncValue<GenerateCaseIdDriverListModel>> {
  /// See also [tripIdDriverDetails].
  const TripIdDriverDetailsFamily();

  /// See also [tripIdDriverDetails].
  TripIdDriverDetailsProvider call({
    required String tripId,
  }) {
    return TripIdDriverDetailsProvider(
      tripId: tripId,
    );
  }

  @override
  TripIdDriverDetailsProvider getProviderOverride(
    covariant TripIdDriverDetailsProvider provider,
  ) {
    return call(
      tripId: provider.tripId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'tripIdDriverDetailsProvider';
}

/// See also [tripIdDriverDetails].
class TripIdDriverDetailsProvider
    extends AutoDisposeStreamProvider<GenerateCaseIdDriverListModel> {
  /// See also [tripIdDriverDetails].
  TripIdDriverDetailsProvider({
    required String tripId,
  }) : this._internal(
          (ref) => tripIdDriverDetails(
            ref as TripIdDriverDetailsRef,
            tripId: tripId,
          ),
          from: tripIdDriverDetailsProvider,
          name: r'tripIdDriverDetailsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$tripIdDriverDetailsHash,
          dependencies: TripIdDriverDetailsFamily._dependencies,
          allTransitiveDependencies:
              TripIdDriverDetailsFamily._allTransitiveDependencies,
          tripId: tripId,
        );

  TripIdDriverDetailsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.tripId,
  }) : super.internal();

  final String tripId;

  @override
  Override overrideWith(
    Stream<GenerateCaseIdDriverListModel> Function(
            TripIdDriverDetailsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TripIdDriverDetailsProvider._internal(
        (ref) => create(ref as TripIdDriverDetailsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        tripId: tripId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<GenerateCaseIdDriverListModel>
      createElement() {
    return _TripIdDriverDetailsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TripIdDriverDetailsProvider && other.tripId == tripId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, tripId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TripIdDriverDetailsRef
    on AutoDisposeStreamProviderRef<GenerateCaseIdDriverListModel> {
  /// The parameter `tripId` of this provider.
  String get tripId;
}

class _TripIdDriverDetailsProviderElement
    extends AutoDisposeStreamProviderElement<GenerateCaseIdDriverListModel>
    with TripIdDriverDetailsRef {
  _TripIdDriverDetailsProviderElement(super.provider);

  @override
  String get tripId => (origin as TripIdDriverDetailsProvider).tripId;
}

String _$generateCaseIdHash() => r'f0bcd3d61f2d315f173fc5100f5be35a975aa8f6';

/// See also [generateCaseId].
@ProviderFor(generateCaseId)
const generateCaseIdProvider = GenerateCaseIdFamily();

/// See also [generateCaseId].
class GenerateCaseIdFamily extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [generateCaseId].
  const GenerateCaseIdFamily();

  /// See also [generateCaseId].
  GenerateCaseIdProvider call({
    required Map<String, dynamic> params,
  }) {
    return GenerateCaseIdProvider(
      params: params,
    );
  }

  @override
  GenerateCaseIdProvider getProviderOverride(
    covariant GenerateCaseIdProvider provider,
  ) {
    return call(
      params: provider.params,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'generateCaseIdProvider';
}

/// See also [generateCaseId].
class GenerateCaseIdProvider
    extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [generateCaseId].
  GenerateCaseIdProvider({
    required Map<String, dynamic> params,
  }) : this._internal(
          (ref) => generateCaseId(
            ref as GenerateCaseIdRef,
            params: params,
          ),
          from: generateCaseIdProvider,
          name: r'generateCaseIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$generateCaseIdHash,
          dependencies: GenerateCaseIdFamily._dependencies,
          allTransitiveDependencies:
              GenerateCaseIdFamily._allTransitiveDependencies,
          params: params,
        );

  GenerateCaseIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.params,
  }) : super.internal();

  final Map<String, dynamic> params;

  @override
  Override overrideWith(
    FutureOr<Map<String, dynamic>> Function(GenerateCaseIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GenerateCaseIdProvider._internal(
        (ref) => create(ref as GenerateCaseIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        params: params,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<String, dynamic>> createElement() {
    return _GenerateCaseIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GenerateCaseIdProvider && other.params == params;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, params.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GenerateCaseIdRef on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `params` of this provider.
  Map<String, dynamic> get params;
}

class _GenerateCaseIdProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with GenerateCaseIdRef {
  _GenerateCaseIdProviderElement(super.provider);

  @override
  Map<String, dynamic> get params => (origin as GenerateCaseIdProvider).params;
}

String _$fetchFirstQualityDataHash() =>
    r'd4f80315b77c4573f9df240b20bc770b8668a656';

/// See also [fetchFirstQualityData].
@ProviderFor(fetchFirstQualityData)
const fetchFirstQualityDataProvider = FetchFirstQualityDataFamily();

/// See also [fetchFirstQualityData].
class FetchFirstQualityDataFamily
    extends Family<AsyncValue<GenerateCaseIdFirstQualityModel>> {
  /// See also [fetchFirstQualityData].
  const FetchFirstQualityDataFamily();

  /// See also [fetchFirstQualityData].
  FetchFirstQualityDataProvider call({
    required String caseId,
  }) {
    return FetchFirstQualityDataProvider(
      caseId: caseId,
    );
  }

  @override
  FetchFirstQualityDataProvider getProviderOverride(
    covariant FetchFirstQualityDataProvider provider,
  ) {
    return call(
      caseId: provider.caseId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'fetchFirstQualityDataProvider';
}

/// See also [fetchFirstQualityData].
class FetchFirstQualityDataProvider
    extends AutoDisposeStreamProvider<GenerateCaseIdFirstQualityModel> {
  /// See also [fetchFirstQualityData].
  FetchFirstQualityDataProvider({
    required String caseId,
  }) : this._internal(
          (ref) => fetchFirstQualityData(
            ref as FetchFirstQualityDataRef,
            caseId: caseId,
          ),
          from: fetchFirstQualityDataProvider,
          name: r'fetchFirstQualityDataProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchFirstQualityDataHash,
          dependencies: FetchFirstQualityDataFamily._dependencies,
          allTransitiveDependencies:
              FetchFirstQualityDataFamily._allTransitiveDependencies,
          caseId: caseId,
        );

  FetchFirstQualityDataProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.caseId,
  }) : super.internal();

  final String caseId;

  @override
  Override overrideWith(
    Stream<GenerateCaseIdFirstQualityModel> Function(
            FetchFirstQualityDataRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchFirstQualityDataProvider._internal(
        (ref) => create(ref as FetchFirstQualityDataRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        caseId: caseId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<GenerateCaseIdFirstQualityModel>
      createElement() {
    return _FetchFirstQualityDataProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchFirstQualityDataProvider && other.caseId == caseId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, caseId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FetchFirstQualityDataRef
    on AutoDisposeStreamProviderRef<GenerateCaseIdFirstQualityModel> {
  /// The parameter `caseId` of this provider.
  String get caseId;
}

class _FetchFirstQualityDataProviderElement
    extends AutoDisposeStreamProviderElement<GenerateCaseIdFirstQualityModel>
    with FetchFirstQualityDataRef {
  _FetchFirstQualityDataProviderElement(super.provider);

  @override
  String get caseId => (origin as FetchFirstQualityDataProvider).caseId;
}

String _$postCancelCaseIdRequestHash() =>
    r'4097293d23d8b92556ef0fb91d50740d9b9376a6';

/// See also [postCancelCaseIdRequest].
@ProviderFor(postCancelCaseIdRequest)
const postCancelCaseIdRequestProvider = PostCancelCaseIdRequestFamily();

/// See also [postCancelCaseIdRequest].
class PostCancelCaseIdRequestFamily
    extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [postCancelCaseIdRequest].
  const PostCancelCaseIdRequestFamily();

  /// See also [postCancelCaseIdRequest].
  PostCancelCaseIdRequestProvider call({
    String? caseId,
  }) {
    return PostCancelCaseIdRequestProvider(
      caseId: caseId,
    );
  }

  @override
  PostCancelCaseIdRequestProvider getProviderOverride(
    covariant PostCancelCaseIdRequestProvider provider,
  ) {
    return call(
      caseId: provider.caseId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'postCancelCaseIdRequestProvider';
}

/// See also [postCancelCaseIdRequest].
class PostCancelCaseIdRequestProvider
    extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [postCancelCaseIdRequest].
  PostCancelCaseIdRequestProvider({
    String? caseId,
  }) : this._internal(
          (ref) => postCancelCaseIdRequest(
            ref as PostCancelCaseIdRequestRef,
            caseId: caseId,
          ),
          from: postCancelCaseIdRequestProvider,
          name: r'postCancelCaseIdRequestProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$postCancelCaseIdRequestHash,
          dependencies: PostCancelCaseIdRequestFamily._dependencies,
          allTransitiveDependencies:
              PostCancelCaseIdRequestFamily._allTransitiveDependencies,
          caseId: caseId,
        );

  PostCancelCaseIdRequestProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.caseId,
  }) : super.internal();

  final String? caseId;

  @override
  Override overrideWith(
    FutureOr<Map<String, dynamic>> Function(PostCancelCaseIdRequestRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PostCancelCaseIdRequestProvider._internal(
        (ref) => create(ref as PostCancelCaseIdRequestRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        caseId: caseId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<String, dynamic>> createElement() {
    return _PostCancelCaseIdRequestProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PostCancelCaseIdRequestProvider && other.caseId == caseId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, caseId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PostCancelCaseIdRequestRef
    on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `caseId` of this provider.
  String? get caseId;
}

class _PostCancelCaseIdRequestProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with PostCancelCaseIdRequestRef {
  _PostCancelCaseIdRequestProviderElement(super.provider);

  @override
  String? get caseId => (origin as PostCancelCaseIdRequestProvider).caseId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
