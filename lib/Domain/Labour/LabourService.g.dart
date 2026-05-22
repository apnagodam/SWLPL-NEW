// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LabourService.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$labourContractorHash() => r'd0ad8e0ecb3bf4249828dc3430f547d95606eb88';

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

/// See also [labourContractor].
@ProviderFor(labourContractor)
const labourContractorProvider = LabourContractorFamily();

/// See also [labourContractor].
class LabourContractorFamily extends Family<AsyncValue<LabourContractorModel>> {
  /// See also [labourContractor].
  const LabourContractorFamily();

  /// See also [labourContractor].
  LabourContractorProvider call({
    String? terminalId,
    String? commodityId,
  }) {
    return LabourContractorProvider(
      terminalId: terminalId,
      commodityId: commodityId,
    );
  }

  @override
  LabourContractorProvider getProviderOverride(
    covariant LabourContractorProvider provider,
  ) {
    return call(
      terminalId: provider.terminalId,
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
  String? get name => r'labourContractorProvider';
}

/// See also [labourContractor].
class LabourContractorProvider
    extends AutoDisposeFutureProvider<LabourContractorModel> {
  /// See also [labourContractor].
  LabourContractorProvider({
    String? terminalId,
    String? commodityId,
  }) : this._internal(
          (ref) => labourContractor(
            ref as LabourContractorRef,
            terminalId: terminalId,
            commodityId: commodityId,
          ),
          from: labourContractorProvider,
          name: r'labourContractorProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$labourContractorHash,
          dependencies: LabourContractorFamily._dependencies,
          allTransitiveDependencies:
              LabourContractorFamily._allTransitiveDependencies,
          terminalId: terminalId,
          commodityId: commodityId,
        );

  LabourContractorProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.terminalId,
    required this.commodityId,
  }) : super.internal();

  final String? terminalId;
  final String? commodityId;

  @override
  Override overrideWith(
    FutureOr<LabourContractorModel> Function(LabourContractorRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: LabourContractorProvider._internal(
        (ref) => create(ref as LabourContractorRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        terminalId: terminalId,
        commodityId: commodityId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<LabourContractorModel> createElement() {
    return _LabourContractorProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LabourContractorProvider &&
        other.terminalId == terminalId &&
        other.commodityId == commodityId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, terminalId.hashCode);
    hash = _SystemHash.combine(hash, commodityId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin LabourContractorRef
    on AutoDisposeFutureProviderRef<LabourContractorModel> {
  /// The parameter `terminalId` of this provider.
  String? get terminalId;

  /// The parameter `commodityId` of this provider.
  String? get commodityId;
}

class _LabourContractorProviderElement
    extends AutoDisposeFutureProviderElement<LabourContractorModel>
    with LabourContractorRef {
  _LabourContractorProviderElement(super.provider);

  @override
  String? get terminalId => (origin as LabourContractorProvider).terminalId;
  @override
  String? get commodityId => (origin as LabourContractorProvider).commodityId;
}

String _$labourContractorV1Hash() =>
    r'2e24232663aa49912c51a1c2fcdb06eef3491f3b';

/// See also [labourContractorV1].
@ProviderFor(labourContractorV1)
const labourContractorV1Provider = LabourContractorV1Family();

/// See also [labourContractorV1].
class LabourContractorV1Family
    extends Family<AsyncValue<LabourContractorV1Model>> {
  /// See also [labourContractorV1].
  const LabourContractorV1Family();

  /// See also [labourContractorV1].
  LabourContractorV1Provider call({
    String? terminalId,
    String? commodityId,
  }) {
    return LabourContractorV1Provider(
      terminalId: terminalId,
      commodityId: commodityId,
    );
  }

  @override
  LabourContractorV1Provider getProviderOverride(
    covariant LabourContractorV1Provider provider,
  ) {
    return call(
      terminalId: provider.terminalId,
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
  String? get name => r'labourContractorV1Provider';
}

/// See also [labourContractorV1].
class LabourContractorV1Provider
    extends AutoDisposeFutureProvider<LabourContractorV1Model> {
  /// See also [labourContractorV1].
  LabourContractorV1Provider({
    String? terminalId,
    String? commodityId,
  }) : this._internal(
          (ref) => labourContractorV1(
            ref as LabourContractorV1Ref,
            terminalId: terminalId,
            commodityId: commodityId,
          ),
          from: labourContractorV1Provider,
          name: r'labourContractorV1Provider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$labourContractorV1Hash,
          dependencies: LabourContractorV1Family._dependencies,
          allTransitiveDependencies:
              LabourContractorV1Family._allTransitiveDependencies,
          terminalId: terminalId,
          commodityId: commodityId,
        );

  LabourContractorV1Provider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.terminalId,
    required this.commodityId,
  }) : super.internal();

  final String? terminalId;
  final String? commodityId;

  @override
  Override overrideWith(
    FutureOr<LabourContractorV1Model> Function(LabourContractorV1Ref provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: LabourContractorV1Provider._internal(
        (ref) => create(ref as LabourContractorV1Ref),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        terminalId: terminalId,
        commodityId: commodityId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<LabourContractorV1Model> createElement() {
    return _LabourContractorV1ProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LabourContractorV1Provider &&
        other.terminalId == terminalId &&
        other.commodityId == commodityId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, terminalId.hashCode);
    hash = _SystemHash.combine(hash, commodityId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin LabourContractorV1Ref
    on AutoDisposeFutureProviderRef<LabourContractorV1Model> {
  /// The parameter `terminalId` of this provider.
  String? get terminalId;

  /// The parameter `commodityId` of this provider.
  String? get commodityId;
}

class _LabourContractorV1ProviderElement
    extends AutoDisposeFutureProviderElement<LabourContractorV1Model>
    with LabourContractorV1Ref {
  _LabourContractorV1ProviderElement(super.provider);

  @override
  String? get terminalId => (origin as LabourContractorV1Provider).terminalId;
  @override
  String? get commodityId => (origin as LabourContractorV1Provider).commodityId;
}

String _$labourContractorRateHash() =>
    r'1fc00fd79e6ccec5d128827c975554f333b353f7';

/// See also [labourContractorRate].
@ProviderFor(labourContractorRate)
const labourContractorRateProvider = LabourContractorRateFamily();

/// See also [labourContractorRate].
class LabourContractorRateFamily
    extends Family<AsyncValue<LabourContractorRateModel>> {
  /// See also [labourContractorRate].
  const LabourContractorRateFamily();

  /// See also [labourContractorRate].
  LabourContractorRateProvider call({
    String? contractorId,
    String? commodityId,
  }) {
    return LabourContractorRateProvider(
      contractorId: contractorId,
      commodityId: commodityId,
    );
  }

  @override
  LabourContractorRateProvider getProviderOverride(
    covariant LabourContractorRateProvider provider,
  ) {
    return call(
      contractorId: provider.contractorId,
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
  String? get name => r'labourContractorRateProvider';
}

/// See also [labourContractorRate].
class LabourContractorRateProvider
    extends AutoDisposeFutureProvider<LabourContractorRateModel> {
  /// See also [labourContractorRate].
  LabourContractorRateProvider({
    String? contractorId,
    String? commodityId,
  }) : this._internal(
          (ref) => labourContractorRate(
            ref as LabourContractorRateRef,
            contractorId: contractorId,
            commodityId: commodityId,
          ),
          from: labourContractorRateProvider,
          name: r'labourContractorRateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$labourContractorRateHash,
          dependencies: LabourContractorRateFamily._dependencies,
          allTransitiveDependencies:
              LabourContractorRateFamily._allTransitiveDependencies,
          contractorId: contractorId,
          commodityId: commodityId,
        );

  LabourContractorRateProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.contractorId,
    required this.commodityId,
  }) : super.internal();

  final String? contractorId;
  final String? commodityId;

  @override
  Override overrideWith(
    FutureOr<LabourContractorRateModel> Function(
            LabourContractorRateRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: LabourContractorRateProvider._internal(
        (ref) => create(ref as LabourContractorRateRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        contractorId: contractorId,
        commodityId: commodityId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<LabourContractorRateModel> createElement() {
    return _LabourContractorRateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LabourContractorRateProvider &&
        other.contractorId == contractorId &&
        other.commodityId == commodityId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, contractorId.hashCode);
    hash = _SystemHash.combine(hash, commodityId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin LabourContractorRateRef
    on AutoDisposeFutureProviderRef<LabourContractorRateModel> {
  /// The parameter `contractorId` of this provider.
  String? get contractorId;

  /// The parameter `commodityId` of this provider.
  String? get commodityId;
}

class _LabourContractorRateProviderElement
    extends AutoDisposeFutureProviderElement<LabourContractorRateModel>
    with LabourContractorRateRef {
  _LabourContractorRateProviderElement(super.provider);

  @override
  String? get contractorId =>
      (origin as LabourContractorRateProvider).contractorId;
  @override
  String? get commodityId =>
      (origin as LabourContractorRateProvider).commodityId;
}

String _$labourListHash() => r'51f1dab6fab6fc50141701492c4cb2e84957d288';

/// See also [labourList].
@ProviderFor(labourList)
const labourListProvider = LabourListFamily();

/// See also [labourList].
class LabourListFamily extends Family<AsyncValue<LabourBookListModel>> {
  /// See also [labourList].
  const LabourListFamily();

  /// See also [labourList].
  LabourListProvider call({
    String? inOut,
  }) {
    return LabourListProvider(
      inOut: inOut,
    );
  }

  @override
  LabourListProvider getProviderOverride(
    covariant LabourListProvider provider,
  ) {
    return call(
      inOut: provider.inOut,
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
  String? get name => r'labourListProvider';
}

/// See also [labourList].
class LabourListProvider
    extends AutoDisposeStreamProvider<LabourBookListModel> {
  /// See also [labourList].
  LabourListProvider({
    String? inOut,
  }) : this._internal(
          (ref) => labourList(
            ref as LabourListRef,
            inOut: inOut,
          ),
          from: labourListProvider,
          name: r'labourListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$labourListHash,
          dependencies: LabourListFamily._dependencies,
          allTransitiveDependencies:
              LabourListFamily._allTransitiveDependencies,
          inOut: inOut,
        );

  LabourListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.inOut,
  }) : super.internal();

  final String? inOut;

  @override
  Override overrideWith(
    Stream<LabourBookListModel> Function(LabourListRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: LabourListProvider._internal(
        (ref) => create(ref as LabourListRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        inOut: inOut,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<LabourBookListModel> createElement() {
    return _LabourListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LabourListProvider && other.inOut == inOut;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, inOut.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin LabourListRef on AutoDisposeStreamProviderRef<LabourBookListModel> {
  /// The parameter `inOut` of this provider.
  String? get inOut;
}

class _LabourListProviderElement
    extends AutoDisposeStreamProviderElement<LabourBookListModel>
    with LabourListRef {
  _LabourListProviderElement(super.provider);

  @override
  String? get inOut => (origin as LabourListProvider).inOut;
}

String _$uploadLabourHash() => r'51ce577061ea5d3e231626dc3b39c9249a235ecc';

/// See also [uploadLabour].
@ProviderFor(uploadLabour)
const uploadLabourProvider = UploadLabourFamily();

/// See also [uploadLabour].
class UploadLabourFamily extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [uploadLabour].
  const UploadLabourFamily();

  /// See also [uploadLabour].
  UploadLabourProvider call({
    String? caseId = '',
    String? contractorId = '',
    String? contractorName = '',
    String? contractorPhone = '',
    String? labourRate = '',
    String? notes = '',
  }) {
    return UploadLabourProvider(
      caseId: caseId,
      contractorId: contractorId,
      contractorName: contractorName,
      contractorPhone: contractorPhone,
      labourRate: labourRate,
      notes: notes,
    );
  }

  @override
  UploadLabourProvider getProviderOverride(
    covariant UploadLabourProvider provider,
  ) {
    return call(
      caseId: provider.caseId,
      contractorId: provider.contractorId,
      contractorName: provider.contractorName,
      contractorPhone: provider.contractorPhone,
      labourRate: provider.labourRate,
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
  String? get name => r'uploadLabourProvider';
}

/// See also [uploadLabour].
class UploadLabourProvider
    extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [uploadLabour].
  UploadLabourProvider({
    String? caseId = '',
    String? contractorId = '',
    String? contractorName = '',
    String? contractorPhone = '',
    String? labourRate = '',
    String? notes = '',
  }) : this._internal(
          (ref) => uploadLabour(
            ref as UploadLabourRef,
            caseId: caseId,
            contractorId: contractorId,
            contractorName: contractorName,
            contractorPhone: contractorPhone,
            labourRate: labourRate,
            notes: notes,
          ),
          from: uploadLabourProvider,
          name: r'uploadLabourProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$uploadLabourHash,
          dependencies: UploadLabourFamily._dependencies,
          allTransitiveDependencies:
              UploadLabourFamily._allTransitiveDependencies,
          caseId: caseId,
          contractorId: contractorId,
          contractorName: contractorName,
          contractorPhone: contractorPhone,
          labourRate: labourRate,
          notes: notes,
        );

  UploadLabourProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.caseId,
    required this.contractorId,
    required this.contractorName,
    required this.contractorPhone,
    required this.labourRate,
    required this.notes,
  }) : super.internal();

  final String? caseId;
  final String? contractorId;
  final String? contractorName;
  final String? contractorPhone;
  final String? labourRate;
  final String? notes;

  @override
  Override overrideWith(
    FutureOr<Map<String, dynamic>> Function(UploadLabourRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UploadLabourProvider._internal(
        (ref) => create(ref as UploadLabourRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        caseId: caseId,
        contractorId: contractorId,
        contractorName: contractorName,
        contractorPhone: contractorPhone,
        labourRate: labourRate,
        notes: notes,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<String, dynamic>> createElement() {
    return _UploadLabourProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UploadLabourProvider &&
        other.caseId == caseId &&
        other.contractorId == contractorId &&
        other.contractorName == contractorName &&
        other.contractorPhone == contractorPhone &&
        other.labourRate == labourRate &&
        other.notes == notes;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, caseId.hashCode);
    hash = _SystemHash.combine(hash, contractorId.hashCode);
    hash = _SystemHash.combine(hash, contractorName.hashCode);
    hash = _SystemHash.combine(hash, contractorPhone.hashCode);
    hash = _SystemHash.combine(hash, labourRate.hashCode);
    hash = _SystemHash.combine(hash, notes.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UploadLabourRef on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `caseId` of this provider.
  String? get caseId;

  /// The parameter `contractorId` of this provider.
  String? get contractorId;

  /// The parameter `contractorName` of this provider.
  String? get contractorName;

  /// The parameter `contractorPhone` of this provider.
  String? get contractorPhone;

  /// The parameter `labourRate` of this provider.
  String? get labourRate;

  /// The parameter `notes` of this provider.
  String? get notes;
}

class _UploadLabourProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with UploadLabourRef {
  _UploadLabourProviderElement(super.provider);

  @override
  String? get caseId => (origin as UploadLabourProvider).caseId;
  @override
  String? get contractorId => (origin as UploadLabourProvider).contractorId;
  @override
  String? get contractorName => (origin as UploadLabourProvider).contractorName;
  @override
  String? get contractorPhone =>
      (origin as UploadLabourProvider).contractorPhone;
  @override
  String? get labourRate => (origin as UploadLabourProvider).labourRate;
  @override
  String? get notes => (origin as UploadLabourProvider).notes;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
