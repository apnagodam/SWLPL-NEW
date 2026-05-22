// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SecondKantaParchiService.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$dharamKantaDetailsHash() =>
    r'b6416e70b3a032b763c2a8e9315b08011f4a43e6';

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

/// See also [dharamKantaDetails].
@ProviderFor(dharamKantaDetails)
const dharamKantaDetailsProvider = DharamKantaDetailsFamily();

/// See also [dharamKantaDetails].
class DharamKantaDetailsFamily extends Family<AsyncValue<DharamKantaModel>> {
  /// See also [dharamKantaDetails].
  const DharamKantaDetailsFamily();

  /// See also [dharamKantaDetails].
  DharamKantaDetailsProvider call({
    String? caseId,
    String? warehouseId,
  }) {
    return DharamKantaDetailsProvider(
      caseId: caseId,
      warehouseId: warehouseId,
    );
  }

  @override
  DharamKantaDetailsProvider getProviderOverride(
    covariant DharamKantaDetailsProvider provider,
  ) {
    return call(
      caseId: provider.caseId,
      warehouseId: provider.warehouseId,
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
  String? get name => r'dharamKantaDetailsProvider';
}

/// See also [dharamKantaDetails].
class DharamKantaDetailsProvider
    extends AutoDisposeFutureProvider<DharamKantaModel> {
  /// See also [dharamKantaDetails].
  DharamKantaDetailsProvider({
    String? caseId,
    String? warehouseId,
  }) : this._internal(
          (ref) => dharamKantaDetails(
            ref as DharamKantaDetailsRef,
            caseId: caseId,
            warehouseId: warehouseId,
          ),
          from: dharamKantaDetailsProvider,
          name: r'dharamKantaDetailsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$dharamKantaDetailsHash,
          dependencies: DharamKantaDetailsFamily._dependencies,
          allTransitiveDependencies:
              DharamKantaDetailsFamily._allTransitiveDependencies,
          caseId: caseId,
          warehouseId: warehouseId,
        );

  DharamKantaDetailsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.caseId,
    required this.warehouseId,
  }) : super.internal();

  final String? caseId;
  final String? warehouseId;

  @override
  Override overrideWith(
    FutureOr<DharamKantaModel> Function(DharamKantaDetailsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DharamKantaDetailsProvider._internal(
        (ref) => create(ref as DharamKantaDetailsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        caseId: caseId,
        warehouseId: warehouseId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<DharamKantaModel> createElement() {
    return _DharamKantaDetailsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DharamKantaDetailsProvider &&
        other.caseId == caseId &&
        other.warehouseId == warehouseId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, caseId.hashCode);
    hash = _SystemHash.combine(hash, warehouseId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DharamKantaDetailsRef on AutoDisposeFutureProviderRef<DharamKantaModel> {
  /// The parameter `caseId` of this provider.
  String? get caseId;

  /// The parameter `warehouseId` of this provider.
  String? get warehouseId;
}

class _DharamKantaDetailsProviderElement
    extends AutoDisposeFutureProviderElement<DharamKantaModel>
    with DharamKantaDetailsRef {
  _DharamKantaDetailsProviderElement(super.provider);

  @override
  String? get caseId => (origin as DharamKantaDetailsProvider).caseId;
  @override
  String? get warehouseId => (origin as DharamKantaDetailsProvider).warehouseId;
}

String _$secondKantaparchiListHash() =>
    r'ae092b50778945d686128087d37bb1177db5f1dd';

/// See also [secondKantaparchiList].
@ProviderFor(secondKantaparchiList)
const secondKantaparchiListProvider = SecondKantaparchiListFamily();

/// See also [secondKantaparchiList].
class SecondKantaparchiListFamily
    extends Family<AsyncValue<SecondKantaparchiListModel>> {
  /// See also [secondKantaparchiList].
  const SecondKantaparchiListFamily();

  /// See also [secondKantaparchiList].
  SecondKantaparchiListProvider call({
    String? inOut,
  }) {
    return SecondKantaparchiListProvider(
      inOut: inOut,
    );
  }

  @override
  SecondKantaparchiListProvider getProviderOverride(
    covariant SecondKantaparchiListProvider provider,
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
  String? get name => r'secondKantaparchiListProvider';
}

/// See also [secondKantaparchiList].
class SecondKantaparchiListProvider
    extends AutoDisposeStreamProvider<SecondKantaparchiListModel> {
  /// See also [secondKantaparchiList].
  SecondKantaparchiListProvider({
    String? inOut,
  }) : this._internal(
          (ref) => secondKantaparchiList(
            ref as SecondKantaparchiListRef,
            inOut: inOut,
          ),
          from: secondKantaparchiListProvider,
          name: r'secondKantaparchiListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$secondKantaparchiListHash,
          dependencies: SecondKantaparchiListFamily._dependencies,
          allTransitiveDependencies:
              SecondKantaparchiListFamily._allTransitiveDependencies,
          inOut: inOut,
        );

  SecondKantaparchiListProvider._internal(
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
    Stream<SecondKantaparchiListModel> Function(
            SecondKantaparchiListRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SecondKantaparchiListProvider._internal(
        (ref) => create(ref as SecondKantaparchiListRef),
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
  AutoDisposeStreamProviderElement<SecondKantaparchiListModel> createElement() {
    return _SecondKantaparchiListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SecondKantaparchiListProvider && other.inOut == inOut;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, inOut.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SecondKantaparchiListRef
    on AutoDisposeStreamProviderRef<SecondKantaparchiListModel> {
  /// The parameter `inOut` of this provider.
  String? get inOut;
}

class _SecondKantaparchiListProviderElement
    extends AutoDisposeStreamProviderElement<SecondKantaparchiListModel>
    with SecondKantaparchiListRef {
  _SecondKantaparchiListProviderElement(super.provider);

  @override
  String? get inOut => (origin as SecondKantaparchiListProvider).inOut;
}

String _$uploadSecondKantaParchiV1Hash() =>
    r'266371be9c472f2866d65f551298ed6a7582fe3b';

/// See also [uploadSecondKantaParchiV1].
@ProviderFor(uploadSecondKantaParchiV1)
const uploadSecondKantaParchiV1Provider = UploadSecondKantaParchiV1Family();

/// See also [uploadSecondKantaParchiV1].
class UploadSecondKantaParchiV1Family extends Family<AsyncValue<BaseResponse>> {
  /// See also [uploadSecondKantaParchiV1].
  const UploadSecondKantaParchiV1Family();

  /// See also [uploadSecondKantaParchiV1].
  UploadSecondKantaParchiV1Provider call({
    String? caseId,
    String? notes,
    File? kantaParchiFile,
    File? truckFile,
    String? noOfBags,
    String? weight,
    String? avgWeight,
    String? oldWeight,
    String? displeasedBages,
    String? kantaId,
    String? kantaName,
    String? kantaParchiNumber,
    String? truckFacility,
    String? bagsFacility,
    String? inOut,
  }) {
    return UploadSecondKantaParchiV1Provider(
      caseId: caseId,
      notes: notes,
      kantaParchiFile: kantaParchiFile,
      truckFile: truckFile,
      noOfBags: noOfBags,
      weight: weight,
      avgWeight: avgWeight,
      oldWeight: oldWeight,
      displeasedBages: displeasedBages,
      kantaId: kantaId,
      kantaName: kantaName,
      kantaParchiNumber: kantaParchiNumber,
      truckFacility: truckFacility,
      bagsFacility: bagsFacility,
      inOut: inOut,
    );
  }

  @override
  UploadSecondKantaParchiV1Provider getProviderOverride(
    covariant UploadSecondKantaParchiV1Provider provider,
  ) {
    return call(
      caseId: provider.caseId,
      notes: provider.notes,
      kantaParchiFile: provider.kantaParchiFile,
      truckFile: provider.truckFile,
      noOfBags: provider.noOfBags,
      weight: provider.weight,
      avgWeight: provider.avgWeight,
      oldWeight: provider.oldWeight,
      displeasedBages: provider.displeasedBages,
      kantaId: provider.kantaId,
      kantaName: provider.kantaName,
      kantaParchiNumber: provider.kantaParchiNumber,
      truckFacility: provider.truckFacility,
      bagsFacility: provider.bagsFacility,
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
  String? get name => r'uploadSecondKantaParchiV1Provider';
}

/// See also [uploadSecondKantaParchiV1].
class UploadSecondKantaParchiV1Provider
    extends AutoDisposeFutureProvider<BaseResponse> {
  /// See also [uploadSecondKantaParchiV1].
  UploadSecondKantaParchiV1Provider({
    String? caseId,
    String? notes,
    File? kantaParchiFile,
    File? truckFile,
    String? noOfBags,
    String? weight,
    String? avgWeight,
    String? oldWeight,
    String? displeasedBages,
    String? kantaId,
    String? kantaName,
    String? kantaParchiNumber,
    String? truckFacility,
    String? bagsFacility,
    String? inOut,
  }) : this._internal(
          (ref) => uploadSecondKantaParchiV1(
            ref as UploadSecondKantaParchiV1Ref,
            caseId: caseId,
            notes: notes,
            kantaParchiFile: kantaParchiFile,
            truckFile: truckFile,
            noOfBags: noOfBags,
            weight: weight,
            avgWeight: avgWeight,
            oldWeight: oldWeight,
            displeasedBages: displeasedBages,
            kantaId: kantaId,
            kantaName: kantaName,
            kantaParchiNumber: kantaParchiNumber,
            truckFacility: truckFacility,
            bagsFacility: bagsFacility,
            inOut: inOut,
          ),
          from: uploadSecondKantaParchiV1Provider,
          name: r'uploadSecondKantaParchiV1Provider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$uploadSecondKantaParchiV1Hash,
          dependencies: UploadSecondKantaParchiV1Family._dependencies,
          allTransitiveDependencies:
              UploadSecondKantaParchiV1Family._allTransitiveDependencies,
          caseId: caseId,
          notes: notes,
          kantaParchiFile: kantaParchiFile,
          truckFile: truckFile,
          noOfBags: noOfBags,
          weight: weight,
          avgWeight: avgWeight,
          oldWeight: oldWeight,
          displeasedBages: displeasedBages,
          kantaId: kantaId,
          kantaName: kantaName,
          kantaParchiNumber: kantaParchiNumber,
          truckFacility: truckFacility,
          bagsFacility: bagsFacility,
          inOut: inOut,
        );

  UploadSecondKantaParchiV1Provider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.caseId,
    required this.notes,
    required this.kantaParchiFile,
    required this.truckFile,
    required this.noOfBags,
    required this.weight,
    required this.avgWeight,
    required this.oldWeight,
    required this.displeasedBages,
    required this.kantaId,
    required this.kantaName,
    required this.kantaParchiNumber,
    required this.truckFacility,
    required this.bagsFacility,
    required this.inOut,
  }) : super.internal();

  final String? caseId;
  final String? notes;
  final File? kantaParchiFile;
  final File? truckFile;
  final String? noOfBags;
  final String? weight;
  final String? avgWeight;
  final String? oldWeight;
  final String? displeasedBages;
  final String? kantaId;
  final String? kantaName;
  final String? kantaParchiNumber;
  final String? truckFacility;
  final String? bagsFacility;
  final String? inOut;

  @override
  Override overrideWith(
    FutureOr<BaseResponse> Function(UploadSecondKantaParchiV1Ref provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UploadSecondKantaParchiV1Provider._internal(
        (ref) => create(ref as UploadSecondKantaParchiV1Ref),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        caseId: caseId,
        notes: notes,
        kantaParchiFile: kantaParchiFile,
        truckFile: truckFile,
        noOfBags: noOfBags,
        weight: weight,
        avgWeight: avgWeight,
        oldWeight: oldWeight,
        displeasedBages: displeasedBages,
        kantaId: kantaId,
        kantaName: kantaName,
        kantaParchiNumber: kantaParchiNumber,
        truckFacility: truckFacility,
        bagsFacility: bagsFacility,
        inOut: inOut,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<BaseResponse> createElement() {
    return _UploadSecondKantaParchiV1ProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UploadSecondKantaParchiV1Provider &&
        other.caseId == caseId &&
        other.notes == notes &&
        other.kantaParchiFile == kantaParchiFile &&
        other.truckFile == truckFile &&
        other.noOfBags == noOfBags &&
        other.weight == weight &&
        other.avgWeight == avgWeight &&
        other.oldWeight == oldWeight &&
        other.displeasedBages == displeasedBages &&
        other.kantaId == kantaId &&
        other.kantaName == kantaName &&
        other.kantaParchiNumber == kantaParchiNumber &&
        other.truckFacility == truckFacility &&
        other.bagsFacility == bagsFacility &&
        other.inOut == inOut;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, caseId.hashCode);
    hash = _SystemHash.combine(hash, notes.hashCode);
    hash = _SystemHash.combine(hash, kantaParchiFile.hashCode);
    hash = _SystemHash.combine(hash, truckFile.hashCode);
    hash = _SystemHash.combine(hash, noOfBags.hashCode);
    hash = _SystemHash.combine(hash, weight.hashCode);
    hash = _SystemHash.combine(hash, avgWeight.hashCode);
    hash = _SystemHash.combine(hash, oldWeight.hashCode);
    hash = _SystemHash.combine(hash, displeasedBages.hashCode);
    hash = _SystemHash.combine(hash, kantaId.hashCode);
    hash = _SystemHash.combine(hash, kantaName.hashCode);
    hash = _SystemHash.combine(hash, kantaParchiNumber.hashCode);
    hash = _SystemHash.combine(hash, truckFacility.hashCode);
    hash = _SystemHash.combine(hash, bagsFacility.hashCode);
    hash = _SystemHash.combine(hash, inOut.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UploadSecondKantaParchiV1Ref
    on AutoDisposeFutureProviderRef<BaseResponse> {
  /// The parameter `caseId` of this provider.
  String? get caseId;

  /// The parameter `notes` of this provider.
  String? get notes;

  /// The parameter `kantaParchiFile` of this provider.
  File? get kantaParchiFile;

  /// The parameter `truckFile` of this provider.
  File? get truckFile;

  /// The parameter `noOfBags` of this provider.
  String? get noOfBags;

  /// The parameter `weight` of this provider.
  String? get weight;

  /// The parameter `avgWeight` of this provider.
  String? get avgWeight;

  /// The parameter `oldWeight` of this provider.
  String? get oldWeight;

  /// The parameter `displeasedBages` of this provider.
  String? get displeasedBages;

  /// The parameter `kantaId` of this provider.
  String? get kantaId;

  /// The parameter `kantaName` of this provider.
  String? get kantaName;

  /// The parameter `kantaParchiNumber` of this provider.
  String? get kantaParchiNumber;

  /// The parameter `truckFacility` of this provider.
  String? get truckFacility;

  /// The parameter `bagsFacility` of this provider.
  String? get bagsFacility;

  /// The parameter `inOut` of this provider.
  String? get inOut;
}

class _UploadSecondKantaParchiV1ProviderElement
    extends AutoDisposeFutureProviderElement<BaseResponse>
    with UploadSecondKantaParchiV1Ref {
  _UploadSecondKantaParchiV1ProviderElement(super.provider);

  @override
  String? get caseId => (origin as UploadSecondKantaParchiV1Provider).caseId;
  @override
  String? get notes => (origin as UploadSecondKantaParchiV1Provider).notes;
  @override
  File? get kantaParchiFile =>
      (origin as UploadSecondKantaParchiV1Provider).kantaParchiFile;
  @override
  File? get truckFile =>
      (origin as UploadSecondKantaParchiV1Provider).truckFile;
  @override
  String? get noOfBags =>
      (origin as UploadSecondKantaParchiV1Provider).noOfBags;
  @override
  String? get weight => (origin as UploadSecondKantaParchiV1Provider).weight;
  @override
  String? get avgWeight =>
      (origin as UploadSecondKantaParchiV1Provider).avgWeight;
  @override
  String? get oldWeight =>
      (origin as UploadSecondKantaParchiV1Provider).oldWeight;
  @override
  String? get displeasedBages =>
      (origin as UploadSecondKantaParchiV1Provider).displeasedBages;
  @override
  String? get kantaId => (origin as UploadSecondKantaParchiV1Provider).kantaId;
  @override
  String? get kantaName =>
      (origin as UploadSecondKantaParchiV1Provider).kantaName;
  @override
  String? get kantaParchiNumber =>
      (origin as UploadSecondKantaParchiV1Provider).kantaParchiNumber;
  @override
  String? get truckFacility =>
      (origin as UploadSecondKantaParchiV1Provider).truckFacility;
  @override
  String? get bagsFacility =>
      (origin as UploadSecondKantaParchiV1Provider).bagsFacility;
  @override
  String? get inOut => (origin as UploadSecondKantaParchiV1Provider).inOut;
}

String _$uploadSecondKantaParchiHash() =>
    r'd35ae40049b9eeb70bc9d88592b1aaefd0934e9a';

/// See also [uploadSecondKantaParchi].
@ProviderFor(uploadSecondKantaParchi)
const uploadSecondKantaParchiProvider = UploadSecondKantaParchiFamily();

/// See also [uploadSecondKantaParchi].
class UploadSecondKantaParchiFamily extends Family<AsyncValue<BaseResponse>> {
  /// See also [uploadSecondKantaParchi].
  const UploadSecondKantaParchiFamily();

  /// See also [uploadSecondKantaParchi].
  UploadSecondKantaParchiProvider call({
    String? caseId,
    String? notes,
    String? kantaParchiFile,
    String? truckFile,
    String? noOfBags,
    String? weight,
    String? avgWeight,
    String? oldWeight,
    String? displeasedBages,
    String? kantaId,
    String? kantaName,
    String? kantaParchiNumber,
    String? truckFacility,
    String? bagsFacility,
    String? inOut,
  }) {
    return UploadSecondKantaParchiProvider(
      caseId: caseId,
      notes: notes,
      kantaParchiFile: kantaParchiFile,
      truckFile: truckFile,
      noOfBags: noOfBags,
      weight: weight,
      avgWeight: avgWeight,
      oldWeight: oldWeight,
      displeasedBages: displeasedBages,
      kantaId: kantaId,
      kantaName: kantaName,
      kantaParchiNumber: kantaParchiNumber,
      truckFacility: truckFacility,
      bagsFacility: bagsFacility,
      inOut: inOut,
    );
  }

  @override
  UploadSecondKantaParchiProvider getProviderOverride(
    covariant UploadSecondKantaParchiProvider provider,
  ) {
    return call(
      caseId: provider.caseId,
      notes: provider.notes,
      kantaParchiFile: provider.kantaParchiFile,
      truckFile: provider.truckFile,
      noOfBags: provider.noOfBags,
      weight: provider.weight,
      avgWeight: provider.avgWeight,
      oldWeight: provider.oldWeight,
      displeasedBages: provider.displeasedBages,
      kantaId: provider.kantaId,
      kantaName: provider.kantaName,
      kantaParchiNumber: provider.kantaParchiNumber,
      truckFacility: provider.truckFacility,
      bagsFacility: provider.bagsFacility,
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
  String? get name => r'uploadSecondKantaParchiProvider';
}

/// See also [uploadSecondKantaParchi].
class UploadSecondKantaParchiProvider
    extends AutoDisposeFutureProvider<BaseResponse> {
  /// See also [uploadSecondKantaParchi].
  UploadSecondKantaParchiProvider({
    String? caseId,
    String? notes,
    String? kantaParchiFile,
    String? truckFile,
    String? noOfBags,
    String? weight,
    String? avgWeight,
    String? oldWeight,
    String? displeasedBages,
    String? kantaId,
    String? kantaName,
    String? kantaParchiNumber,
    String? truckFacility,
    String? bagsFacility,
    String? inOut,
  }) : this._internal(
          (ref) => uploadSecondKantaParchi(
            ref as UploadSecondKantaParchiRef,
            caseId: caseId,
            notes: notes,
            kantaParchiFile: kantaParchiFile,
            truckFile: truckFile,
            noOfBags: noOfBags,
            weight: weight,
            avgWeight: avgWeight,
            oldWeight: oldWeight,
            displeasedBages: displeasedBages,
            kantaId: kantaId,
            kantaName: kantaName,
            kantaParchiNumber: kantaParchiNumber,
            truckFacility: truckFacility,
            bagsFacility: bagsFacility,
            inOut: inOut,
          ),
          from: uploadSecondKantaParchiProvider,
          name: r'uploadSecondKantaParchiProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$uploadSecondKantaParchiHash,
          dependencies: UploadSecondKantaParchiFamily._dependencies,
          allTransitiveDependencies:
              UploadSecondKantaParchiFamily._allTransitiveDependencies,
          caseId: caseId,
          notes: notes,
          kantaParchiFile: kantaParchiFile,
          truckFile: truckFile,
          noOfBags: noOfBags,
          weight: weight,
          avgWeight: avgWeight,
          oldWeight: oldWeight,
          displeasedBages: displeasedBages,
          kantaId: kantaId,
          kantaName: kantaName,
          kantaParchiNumber: kantaParchiNumber,
          truckFacility: truckFacility,
          bagsFacility: bagsFacility,
          inOut: inOut,
        );

  UploadSecondKantaParchiProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.caseId,
    required this.notes,
    required this.kantaParchiFile,
    required this.truckFile,
    required this.noOfBags,
    required this.weight,
    required this.avgWeight,
    required this.oldWeight,
    required this.displeasedBages,
    required this.kantaId,
    required this.kantaName,
    required this.kantaParchiNumber,
    required this.truckFacility,
    required this.bagsFacility,
    required this.inOut,
  }) : super.internal();

  final String? caseId;
  final String? notes;
  final String? kantaParchiFile;
  final String? truckFile;
  final String? noOfBags;
  final String? weight;
  final String? avgWeight;
  final String? oldWeight;
  final String? displeasedBages;
  final String? kantaId;
  final String? kantaName;
  final String? kantaParchiNumber;
  final String? truckFacility;
  final String? bagsFacility;
  final String? inOut;

  @override
  Override overrideWith(
    FutureOr<BaseResponse> Function(UploadSecondKantaParchiRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UploadSecondKantaParchiProvider._internal(
        (ref) => create(ref as UploadSecondKantaParchiRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        caseId: caseId,
        notes: notes,
        kantaParchiFile: kantaParchiFile,
        truckFile: truckFile,
        noOfBags: noOfBags,
        weight: weight,
        avgWeight: avgWeight,
        oldWeight: oldWeight,
        displeasedBages: displeasedBages,
        kantaId: kantaId,
        kantaName: kantaName,
        kantaParchiNumber: kantaParchiNumber,
        truckFacility: truckFacility,
        bagsFacility: bagsFacility,
        inOut: inOut,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<BaseResponse> createElement() {
    return _UploadSecondKantaParchiProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UploadSecondKantaParchiProvider &&
        other.caseId == caseId &&
        other.notes == notes &&
        other.kantaParchiFile == kantaParchiFile &&
        other.truckFile == truckFile &&
        other.noOfBags == noOfBags &&
        other.weight == weight &&
        other.avgWeight == avgWeight &&
        other.oldWeight == oldWeight &&
        other.displeasedBages == displeasedBages &&
        other.kantaId == kantaId &&
        other.kantaName == kantaName &&
        other.kantaParchiNumber == kantaParchiNumber &&
        other.truckFacility == truckFacility &&
        other.bagsFacility == bagsFacility &&
        other.inOut == inOut;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, caseId.hashCode);
    hash = _SystemHash.combine(hash, notes.hashCode);
    hash = _SystemHash.combine(hash, kantaParchiFile.hashCode);
    hash = _SystemHash.combine(hash, truckFile.hashCode);
    hash = _SystemHash.combine(hash, noOfBags.hashCode);
    hash = _SystemHash.combine(hash, weight.hashCode);
    hash = _SystemHash.combine(hash, avgWeight.hashCode);
    hash = _SystemHash.combine(hash, oldWeight.hashCode);
    hash = _SystemHash.combine(hash, displeasedBages.hashCode);
    hash = _SystemHash.combine(hash, kantaId.hashCode);
    hash = _SystemHash.combine(hash, kantaName.hashCode);
    hash = _SystemHash.combine(hash, kantaParchiNumber.hashCode);
    hash = _SystemHash.combine(hash, truckFacility.hashCode);
    hash = _SystemHash.combine(hash, bagsFacility.hashCode);
    hash = _SystemHash.combine(hash, inOut.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UploadSecondKantaParchiRef on AutoDisposeFutureProviderRef<BaseResponse> {
  /// The parameter `caseId` of this provider.
  String? get caseId;

  /// The parameter `notes` of this provider.
  String? get notes;

  /// The parameter `kantaParchiFile` of this provider.
  String? get kantaParchiFile;

  /// The parameter `truckFile` of this provider.
  String? get truckFile;

  /// The parameter `noOfBags` of this provider.
  String? get noOfBags;

  /// The parameter `weight` of this provider.
  String? get weight;

  /// The parameter `avgWeight` of this provider.
  String? get avgWeight;

  /// The parameter `oldWeight` of this provider.
  String? get oldWeight;

  /// The parameter `displeasedBages` of this provider.
  String? get displeasedBages;

  /// The parameter `kantaId` of this provider.
  String? get kantaId;

  /// The parameter `kantaName` of this provider.
  String? get kantaName;

  /// The parameter `kantaParchiNumber` of this provider.
  String? get kantaParchiNumber;

  /// The parameter `truckFacility` of this provider.
  String? get truckFacility;

  /// The parameter `bagsFacility` of this provider.
  String? get bagsFacility;

  /// The parameter `inOut` of this provider.
  String? get inOut;
}

class _UploadSecondKantaParchiProviderElement
    extends AutoDisposeFutureProviderElement<BaseResponse>
    with UploadSecondKantaParchiRef {
  _UploadSecondKantaParchiProviderElement(super.provider);

  @override
  String? get caseId => (origin as UploadSecondKantaParchiProvider).caseId;
  @override
  String? get notes => (origin as UploadSecondKantaParchiProvider).notes;
  @override
  String? get kantaParchiFile =>
      (origin as UploadSecondKantaParchiProvider).kantaParchiFile;
  @override
  String? get truckFile =>
      (origin as UploadSecondKantaParchiProvider).truckFile;
  @override
  String? get noOfBags => (origin as UploadSecondKantaParchiProvider).noOfBags;
  @override
  String? get weight => (origin as UploadSecondKantaParchiProvider).weight;
  @override
  String? get avgWeight =>
      (origin as UploadSecondKantaParchiProvider).avgWeight;
  @override
  String? get oldWeight =>
      (origin as UploadSecondKantaParchiProvider).oldWeight;
  @override
  String? get displeasedBages =>
      (origin as UploadSecondKantaParchiProvider).displeasedBages;
  @override
  String? get kantaId => (origin as UploadSecondKantaParchiProvider).kantaId;
  @override
  String? get kantaName =>
      (origin as UploadSecondKantaParchiProvider).kantaName;
  @override
  String? get kantaParchiNumber =>
      (origin as UploadSecondKantaParchiProvider).kantaParchiNumber;
  @override
  String? get truckFacility =>
      (origin as UploadSecondKantaParchiProvider).truckFacility;
  @override
  String? get bagsFacility =>
      (origin as UploadSecondKantaParchiProvider).bagsFacility;
  @override
  String? get inOut => (origin as UploadSecondKantaParchiProvider).inOut;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
