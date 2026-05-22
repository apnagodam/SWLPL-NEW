// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'KantaParchiService.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$dharamKantasListHash() => r'a3a5d964581a485baf95a4d93a04c24d104da353';

/// See also [dharamKantasList].
@ProviderFor(dharamKantasList)
final dharamKantasListProvider =
    AutoDisposeStreamProvider<DharamKantaListingModel>.internal(
  dharamKantasList,
  name: r'dharamKantasListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$dharamKantasListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DharamKantasListRef
    = AutoDisposeStreamProviderRef<DharamKantaListingModel>;
String _$dharamKantaDetailsHash() =>
    r'995ec789c151fa489f48a9a1e89fcb00f8ce7531';

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
class DharamKantaDetailsFamily
    extends Family<AsyncValue<DharamKantaDetailsModel>> {
  /// See also [dharamKantaDetails].
  const DharamKantaDetailsFamily();

  /// See also [dharamKantaDetails].
  DharamKantaDetailsProvider call({
    String? warehouseId,
  }) {
    return DharamKantaDetailsProvider(
      warehouseId: warehouseId,
    );
  }

  @override
  DharamKantaDetailsProvider getProviderOverride(
    covariant DharamKantaDetailsProvider provider,
  ) {
    return call(
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
    extends AutoDisposeFutureProvider<DharamKantaDetailsModel> {
  /// See also [dharamKantaDetails].
  DharamKantaDetailsProvider({
    String? warehouseId,
  }) : this._internal(
          (ref) => dharamKantaDetails(
            ref as DharamKantaDetailsRef,
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
          warehouseId: warehouseId,
        );

  DharamKantaDetailsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.warehouseId,
  }) : super.internal();

  final String? warehouseId;

  @override
  Override overrideWith(
    FutureOr<DharamKantaDetailsModel> Function(DharamKantaDetailsRef provider)
        create,
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
        warehouseId: warehouseId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<DharamKantaDetailsModel> createElement() {
    return _DharamKantaDetailsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DharamKantaDetailsProvider &&
        other.warehouseId == warehouseId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, warehouseId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DharamKantaDetailsRef
    on AutoDisposeFutureProviderRef<DharamKantaDetailsModel> {
  /// The parameter `warehouseId` of this provider.
  String? get warehouseId;
}

class _DharamKantaDetailsProviderElement
    extends AutoDisposeFutureProviderElement<DharamKantaDetailsModel>
    with DharamKantaDetailsRef {
  _DharamKantaDetailsProviderElement(super.provider);

  @override
  String? get warehouseId => (origin as DharamKantaDetailsProvider).warehouseId;
}

String _$uploadFirstKantaParchiHash() =>
    r'c34df5ee577833e87a71926c6fd4d750a89dca88';

/// See also [uploadFirstKantaParchi].
@ProviderFor(uploadFirstKantaParchi)
const uploadFirstKantaParchiProvider = UploadFirstKantaParchiFamily();

/// See also [uploadFirstKantaParchi].
class UploadFirstKantaParchiFamily
    extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [uploadFirstKantaParchi].
  const UploadFirstKantaParchiFamily();

  /// See also [uploadFirstKantaParchi].
  UploadFirstKantaParchiProvider call({
    String? caseId,
    String? notes,
    String? kantaImage,
    String? truckImage,
    String? kantaId,
    String? kantaParchiNumber,
    String? oldKantaFile,
    String? oldKantaNumber,
    String? oldKantaLocation,
    String? oldKantaName,
    String? oldKantaWeight,
    String? noOfBags,
    String? netweight,
    String? tareWeight,
    String? grossWeight,
    String? inOutType,
  }) {
    return UploadFirstKantaParchiProvider(
      caseId: caseId,
      notes: notes,
      kantaImage: kantaImage,
      truckImage: truckImage,
      kantaId: kantaId,
      kantaParchiNumber: kantaParchiNumber,
      oldKantaFile: oldKantaFile,
      oldKantaNumber: oldKantaNumber,
      oldKantaLocation: oldKantaLocation,
      oldKantaName: oldKantaName,
      oldKantaWeight: oldKantaWeight,
      noOfBags: noOfBags,
      netweight: netweight,
      tareWeight: tareWeight,
      grossWeight: grossWeight,
      inOutType: inOutType,
    );
  }

  @override
  UploadFirstKantaParchiProvider getProviderOverride(
    covariant UploadFirstKantaParchiProvider provider,
  ) {
    return call(
      caseId: provider.caseId,
      notes: provider.notes,
      kantaImage: provider.kantaImage,
      truckImage: provider.truckImage,
      kantaId: provider.kantaId,
      kantaParchiNumber: provider.kantaParchiNumber,
      oldKantaFile: provider.oldKantaFile,
      oldKantaNumber: provider.oldKantaNumber,
      oldKantaLocation: provider.oldKantaLocation,
      oldKantaName: provider.oldKantaName,
      oldKantaWeight: provider.oldKantaWeight,
      noOfBags: provider.noOfBags,
      netweight: provider.netweight,
      tareWeight: provider.tareWeight,
      grossWeight: provider.grossWeight,
      inOutType: provider.inOutType,
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
  String? get name => r'uploadFirstKantaParchiProvider';
}

/// See also [uploadFirstKantaParchi].
class UploadFirstKantaParchiProvider
    extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [uploadFirstKantaParchi].
  UploadFirstKantaParchiProvider({
    String? caseId,
    String? notes,
    String? kantaImage,
    String? truckImage,
    String? kantaId,
    String? kantaParchiNumber,
    String? oldKantaFile,
    String? oldKantaNumber,
    String? oldKantaLocation,
    String? oldKantaName,
    String? oldKantaWeight,
    String? noOfBags,
    String? netweight,
    String? tareWeight,
    String? grossWeight,
    String? inOutType,
  }) : this._internal(
          (ref) => uploadFirstKantaParchi(
            ref as UploadFirstKantaParchiRef,
            caseId: caseId,
            notes: notes,
            kantaImage: kantaImage,
            truckImage: truckImage,
            kantaId: kantaId,
            kantaParchiNumber: kantaParchiNumber,
            oldKantaFile: oldKantaFile,
            oldKantaNumber: oldKantaNumber,
            oldKantaLocation: oldKantaLocation,
            oldKantaName: oldKantaName,
            oldKantaWeight: oldKantaWeight,
            noOfBags: noOfBags,
            netweight: netweight,
            tareWeight: tareWeight,
            grossWeight: grossWeight,
            inOutType: inOutType,
          ),
          from: uploadFirstKantaParchiProvider,
          name: r'uploadFirstKantaParchiProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$uploadFirstKantaParchiHash,
          dependencies: UploadFirstKantaParchiFamily._dependencies,
          allTransitiveDependencies:
              UploadFirstKantaParchiFamily._allTransitiveDependencies,
          caseId: caseId,
          notes: notes,
          kantaImage: kantaImage,
          truckImage: truckImage,
          kantaId: kantaId,
          kantaParchiNumber: kantaParchiNumber,
          oldKantaFile: oldKantaFile,
          oldKantaNumber: oldKantaNumber,
          oldKantaLocation: oldKantaLocation,
          oldKantaName: oldKantaName,
          oldKantaWeight: oldKantaWeight,
          noOfBags: noOfBags,
          netweight: netweight,
          tareWeight: tareWeight,
          grossWeight: grossWeight,
          inOutType: inOutType,
        );

  UploadFirstKantaParchiProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.caseId,
    required this.notes,
    required this.kantaImage,
    required this.truckImage,
    required this.kantaId,
    required this.kantaParchiNumber,
    required this.oldKantaFile,
    required this.oldKantaNumber,
    required this.oldKantaLocation,
    required this.oldKantaName,
    required this.oldKantaWeight,
    required this.noOfBags,
    required this.netweight,
    required this.tareWeight,
    required this.grossWeight,
    required this.inOutType,
  }) : super.internal();

  final String? caseId;
  final String? notes;
  final String? kantaImage;
  final String? truckImage;
  final String? kantaId;
  final String? kantaParchiNumber;
  final String? oldKantaFile;
  final String? oldKantaNumber;
  final String? oldKantaLocation;
  final String? oldKantaName;
  final String? oldKantaWeight;
  final String? noOfBags;
  final String? netweight;
  final String? tareWeight;
  final String? grossWeight;
  final String? inOutType;

  @override
  Override overrideWith(
    FutureOr<Map<String, dynamic>> Function(UploadFirstKantaParchiRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UploadFirstKantaParchiProvider._internal(
        (ref) => create(ref as UploadFirstKantaParchiRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        caseId: caseId,
        notes: notes,
        kantaImage: kantaImage,
        truckImage: truckImage,
        kantaId: kantaId,
        kantaParchiNumber: kantaParchiNumber,
        oldKantaFile: oldKantaFile,
        oldKantaNumber: oldKantaNumber,
        oldKantaLocation: oldKantaLocation,
        oldKantaName: oldKantaName,
        oldKantaWeight: oldKantaWeight,
        noOfBags: noOfBags,
        netweight: netweight,
        tareWeight: tareWeight,
        grossWeight: grossWeight,
        inOutType: inOutType,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<String, dynamic>> createElement() {
    return _UploadFirstKantaParchiProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UploadFirstKantaParchiProvider &&
        other.caseId == caseId &&
        other.notes == notes &&
        other.kantaImage == kantaImage &&
        other.truckImage == truckImage &&
        other.kantaId == kantaId &&
        other.kantaParchiNumber == kantaParchiNumber &&
        other.oldKantaFile == oldKantaFile &&
        other.oldKantaNumber == oldKantaNumber &&
        other.oldKantaLocation == oldKantaLocation &&
        other.oldKantaName == oldKantaName &&
        other.oldKantaWeight == oldKantaWeight &&
        other.noOfBags == noOfBags &&
        other.netweight == netweight &&
        other.tareWeight == tareWeight &&
        other.grossWeight == grossWeight &&
        other.inOutType == inOutType;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, caseId.hashCode);
    hash = _SystemHash.combine(hash, notes.hashCode);
    hash = _SystemHash.combine(hash, kantaImage.hashCode);
    hash = _SystemHash.combine(hash, truckImage.hashCode);
    hash = _SystemHash.combine(hash, kantaId.hashCode);
    hash = _SystemHash.combine(hash, kantaParchiNumber.hashCode);
    hash = _SystemHash.combine(hash, oldKantaFile.hashCode);
    hash = _SystemHash.combine(hash, oldKantaNumber.hashCode);
    hash = _SystemHash.combine(hash, oldKantaLocation.hashCode);
    hash = _SystemHash.combine(hash, oldKantaName.hashCode);
    hash = _SystemHash.combine(hash, oldKantaWeight.hashCode);
    hash = _SystemHash.combine(hash, noOfBags.hashCode);
    hash = _SystemHash.combine(hash, netweight.hashCode);
    hash = _SystemHash.combine(hash, tareWeight.hashCode);
    hash = _SystemHash.combine(hash, grossWeight.hashCode);
    hash = _SystemHash.combine(hash, inOutType.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UploadFirstKantaParchiRef
    on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `caseId` of this provider.
  String? get caseId;

  /// The parameter `notes` of this provider.
  String? get notes;

  /// The parameter `kantaImage` of this provider.
  String? get kantaImage;

  /// The parameter `truckImage` of this provider.
  String? get truckImage;

  /// The parameter `kantaId` of this provider.
  String? get kantaId;

  /// The parameter `kantaParchiNumber` of this provider.
  String? get kantaParchiNumber;

  /// The parameter `oldKantaFile` of this provider.
  String? get oldKantaFile;

  /// The parameter `oldKantaNumber` of this provider.
  String? get oldKantaNumber;

  /// The parameter `oldKantaLocation` of this provider.
  String? get oldKantaLocation;

  /// The parameter `oldKantaName` of this provider.
  String? get oldKantaName;

  /// The parameter `oldKantaWeight` of this provider.
  String? get oldKantaWeight;

  /// The parameter `noOfBags` of this provider.
  String? get noOfBags;

  /// The parameter `netweight` of this provider.
  String? get netweight;

  /// The parameter `tareWeight` of this provider.
  String? get tareWeight;

  /// The parameter `grossWeight` of this provider.
  String? get grossWeight;

  /// The parameter `inOutType` of this provider.
  String? get inOutType;
}

class _UploadFirstKantaParchiProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with UploadFirstKantaParchiRef {
  _UploadFirstKantaParchiProviderElement(super.provider);

  @override
  String? get caseId => (origin as UploadFirstKantaParchiProvider).caseId;
  @override
  String? get notes => (origin as UploadFirstKantaParchiProvider).notes;
  @override
  String? get kantaImage =>
      (origin as UploadFirstKantaParchiProvider).kantaImage;
  @override
  String? get truckImage =>
      (origin as UploadFirstKantaParchiProvider).truckImage;
  @override
  String? get kantaId => (origin as UploadFirstKantaParchiProvider).kantaId;
  @override
  String? get kantaParchiNumber =>
      (origin as UploadFirstKantaParchiProvider).kantaParchiNumber;
  @override
  String? get oldKantaFile =>
      (origin as UploadFirstKantaParchiProvider).oldKantaFile;
  @override
  String? get oldKantaNumber =>
      (origin as UploadFirstKantaParchiProvider).oldKantaNumber;
  @override
  String? get oldKantaLocation =>
      (origin as UploadFirstKantaParchiProvider).oldKantaLocation;
  @override
  String? get oldKantaName =>
      (origin as UploadFirstKantaParchiProvider).oldKantaName;
  @override
  String? get oldKantaWeight =>
      (origin as UploadFirstKantaParchiProvider).oldKantaWeight;
  @override
  String? get noOfBags => (origin as UploadFirstKantaParchiProvider).noOfBags;
  @override
  String? get netweight => (origin as UploadFirstKantaParchiProvider).netweight;
  @override
  String? get tareWeight =>
      (origin as UploadFirstKantaParchiProvider).tareWeight;
  @override
  String? get grossWeight =>
      (origin as UploadFirstKantaParchiProvider).grossWeight;
  @override
  String? get inOutType => (origin as UploadFirstKantaParchiProvider).inOutType;
}

String _$uploadFirstKantaParchiV1Hash() =>
    r'88fb1aef9c14db5e839a21306af6b29d61efef56';

/// See also [uploadFirstKantaParchiV1].
@ProviderFor(uploadFirstKantaParchiV1)
const uploadFirstKantaParchiV1Provider = UploadFirstKantaParchiV1Family();

/// See also [uploadFirstKantaParchiV1].
class UploadFirstKantaParchiV1Family
    extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [uploadFirstKantaParchiV1].
  const UploadFirstKantaParchiV1Family();

  /// See also [uploadFirstKantaParchiV1].
  UploadFirstKantaParchiV1Provider call({
    String? caseId,
    String? notes,
    String? kantaId,
    String? kantaParchiNumber,
    String? oldKantaNumber,
    String? oldKantaLocation,
    String? oldKantaName,
    String? oldKantaWeight,
    String? noOfBags,
    String? netweight,
    String? tareWeight,
    String? grossWeight,
    String? inOutType,
    List<Map<String, dynamic>>? commodityList,
    String? packagingType,
    String? liveInsects,
    File? qualityFile,
    File? oldKantaFile,
    File? kantaImage,
    File? truckImage,
  }) {
    return UploadFirstKantaParchiV1Provider(
      caseId: caseId,
      notes: notes,
      kantaId: kantaId,
      kantaParchiNumber: kantaParchiNumber,
      oldKantaNumber: oldKantaNumber,
      oldKantaLocation: oldKantaLocation,
      oldKantaName: oldKantaName,
      oldKantaWeight: oldKantaWeight,
      noOfBags: noOfBags,
      netweight: netweight,
      tareWeight: tareWeight,
      grossWeight: grossWeight,
      inOutType: inOutType,
      commodityList: commodityList,
      packagingType: packagingType,
      liveInsects: liveInsects,
      qualityFile: qualityFile,
      oldKantaFile: oldKantaFile,
      kantaImage: kantaImage,
      truckImage: truckImage,
    );
  }

  @override
  UploadFirstKantaParchiV1Provider getProviderOverride(
    covariant UploadFirstKantaParchiV1Provider provider,
  ) {
    return call(
      caseId: provider.caseId,
      notes: provider.notes,
      kantaId: provider.kantaId,
      kantaParchiNumber: provider.kantaParchiNumber,
      oldKantaNumber: provider.oldKantaNumber,
      oldKantaLocation: provider.oldKantaLocation,
      oldKantaName: provider.oldKantaName,
      oldKantaWeight: provider.oldKantaWeight,
      noOfBags: provider.noOfBags,
      netweight: provider.netweight,
      tareWeight: provider.tareWeight,
      grossWeight: provider.grossWeight,
      inOutType: provider.inOutType,
      commodityList: provider.commodityList,
      packagingType: provider.packagingType,
      liveInsects: provider.liveInsects,
      qualityFile: provider.qualityFile,
      oldKantaFile: provider.oldKantaFile,
      kantaImage: provider.kantaImage,
      truckImage: provider.truckImage,
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
  String? get name => r'uploadFirstKantaParchiV1Provider';
}

/// See also [uploadFirstKantaParchiV1].
class UploadFirstKantaParchiV1Provider
    extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [uploadFirstKantaParchiV1].
  UploadFirstKantaParchiV1Provider({
    String? caseId,
    String? notes,
    String? kantaId,
    String? kantaParchiNumber,
    String? oldKantaNumber,
    String? oldKantaLocation,
    String? oldKantaName,
    String? oldKantaWeight,
    String? noOfBags,
    String? netweight,
    String? tareWeight,
    String? grossWeight,
    String? inOutType,
    List<Map<String, dynamic>>? commodityList,
    String? packagingType,
    String? liveInsects,
    File? qualityFile,
    File? oldKantaFile,
    File? kantaImage,
    File? truckImage,
  }) : this._internal(
          (ref) => uploadFirstKantaParchiV1(
            ref as UploadFirstKantaParchiV1Ref,
            caseId: caseId,
            notes: notes,
            kantaId: kantaId,
            kantaParchiNumber: kantaParchiNumber,
            oldKantaNumber: oldKantaNumber,
            oldKantaLocation: oldKantaLocation,
            oldKantaName: oldKantaName,
            oldKantaWeight: oldKantaWeight,
            noOfBags: noOfBags,
            netweight: netweight,
            tareWeight: tareWeight,
            grossWeight: grossWeight,
            inOutType: inOutType,
            commodityList: commodityList,
            packagingType: packagingType,
            liveInsects: liveInsects,
            qualityFile: qualityFile,
            oldKantaFile: oldKantaFile,
            kantaImage: kantaImage,
            truckImage: truckImage,
          ),
          from: uploadFirstKantaParchiV1Provider,
          name: r'uploadFirstKantaParchiV1Provider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$uploadFirstKantaParchiV1Hash,
          dependencies: UploadFirstKantaParchiV1Family._dependencies,
          allTransitiveDependencies:
              UploadFirstKantaParchiV1Family._allTransitiveDependencies,
          caseId: caseId,
          notes: notes,
          kantaId: kantaId,
          kantaParchiNumber: kantaParchiNumber,
          oldKantaNumber: oldKantaNumber,
          oldKantaLocation: oldKantaLocation,
          oldKantaName: oldKantaName,
          oldKantaWeight: oldKantaWeight,
          noOfBags: noOfBags,
          netweight: netweight,
          tareWeight: tareWeight,
          grossWeight: grossWeight,
          inOutType: inOutType,
          commodityList: commodityList,
          packagingType: packagingType,
          liveInsects: liveInsects,
          qualityFile: qualityFile,
          oldKantaFile: oldKantaFile,
          kantaImage: kantaImage,
          truckImage: truckImage,
        );

  UploadFirstKantaParchiV1Provider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.caseId,
    required this.notes,
    required this.kantaId,
    required this.kantaParchiNumber,
    required this.oldKantaNumber,
    required this.oldKantaLocation,
    required this.oldKantaName,
    required this.oldKantaWeight,
    required this.noOfBags,
    required this.netweight,
    required this.tareWeight,
    required this.grossWeight,
    required this.inOutType,
    required this.commodityList,
    required this.packagingType,
    required this.liveInsects,
    required this.qualityFile,
    required this.oldKantaFile,
    required this.kantaImage,
    required this.truckImage,
  }) : super.internal();

  final String? caseId;
  final String? notes;
  final String? kantaId;
  final String? kantaParchiNumber;
  final String? oldKantaNumber;
  final String? oldKantaLocation;
  final String? oldKantaName;
  final String? oldKantaWeight;
  final String? noOfBags;
  final String? netweight;
  final String? tareWeight;
  final String? grossWeight;
  final String? inOutType;
  final List<Map<String, dynamic>>? commodityList;
  final String? packagingType;
  final String? liveInsects;
  final File? qualityFile;
  final File? oldKantaFile;
  final File? kantaImage;
  final File? truckImage;

  @override
  Override overrideWith(
    FutureOr<Map<String, dynamic>> Function(
            UploadFirstKantaParchiV1Ref provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UploadFirstKantaParchiV1Provider._internal(
        (ref) => create(ref as UploadFirstKantaParchiV1Ref),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        caseId: caseId,
        notes: notes,
        kantaId: kantaId,
        kantaParchiNumber: kantaParchiNumber,
        oldKantaNumber: oldKantaNumber,
        oldKantaLocation: oldKantaLocation,
        oldKantaName: oldKantaName,
        oldKantaWeight: oldKantaWeight,
        noOfBags: noOfBags,
        netweight: netweight,
        tareWeight: tareWeight,
        grossWeight: grossWeight,
        inOutType: inOutType,
        commodityList: commodityList,
        packagingType: packagingType,
        liveInsects: liveInsects,
        qualityFile: qualityFile,
        oldKantaFile: oldKantaFile,
        kantaImage: kantaImage,
        truckImage: truckImage,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<String, dynamic>> createElement() {
    return _UploadFirstKantaParchiV1ProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UploadFirstKantaParchiV1Provider &&
        other.caseId == caseId &&
        other.notes == notes &&
        other.kantaId == kantaId &&
        other.kantaParchiNumber == kantaParchiNumber &&
        other.oldKantaNumber == oldKantaNumber &&
        other.oldKantaLocation == oldKantaLocation &&
        other.oldKantaName == oldKantaName &&
        other.oldKantaWeight == oldKantaWeight &&
        other.noOfBags == noOfBags &&
        other.netweight == netweight &&
        other.tareWeight == tareWeight &&
        other.grossWeight == grossWeight &&
        other.inOutType == inOutType &&
        other.commodityList == commodityList &&
        other.packagingType == packagingType &&
        other.liveInsects == liveInsects &&
        other.qualityFile == qualityFile &&
        other.oldKantaFile == oldKantaFile &&
        other.kantaImage == kantaImage &&
        other.truckImage == truckImage;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, caseId.hashCode);
    hash = _SystemHash.combine(hash, notes.hashCode);
    hash = _SystemHash.combine(hash, kantaId.hashCode);
    hash = _SystemHash.combine(hash, kantaParchiNumber.hashCode);
    hash = _SystemHash.combine(hash, oldKantaNumber.hashCode);
    hash = _SystemHash.combine(hash, oldKantaLocation.hashCode);
    hash = _SystemHash.combine(hash, oldKantaName.hashCode);
    hash = _SystemHash.combine(hash, oldKantaWeight.hashCode);
    hash = _SystemHash.combine(hash, noOfBags.hashCode);
    hash = _SystemHash.combine(hash, netweight.hashCode);
    hash = _SystemHash.combine(hash, tareWeight.hashCode);
    hash = _SystemHash.combine(hash, grossWeight.hashCode);
    hash = _SystemHash.combine(hash, inOutType.hashCode);
    hash = _SystemHash.combine(hash, commodityList.hashCode);
    hash = _SystemHash.combine(hash, packagingType.hashCode);
    hash = _SystemHash.combine(hash, liveInsects.hashCode);
    hash = _SystemHash.combine(hash, qualityFile.hashCode);
    hash = _SystemHash.combine(hash, oldKantaFile.hashCode);
    hash = _SystemHash.combine(hash, kantaImage.hashCode);
    hash = _SystemHash.combine(hash, truckImage.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UploadFirstKantaParchiV1Ref
    on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `caseId` of this provider.
  String? get caseId;

  /// The parameter `notes` of this provider.
  String? get notes;

  /// The parameter `kantaId` of this provider.
  String? get kantaId;

  /// The parameter `kantaParchiNumber` of this provider.
  String? get kantaParchiNumber;

  /// The parameter `oldKantaNumber` of this provider.
  String? get oldKantaNumber;

  /// The parameter `oldKantaLocation` of this provider.
  String? get oldKantaLocation;

  /// The parameter `oldKantaName` of this provider.
  String? get oldKantaName;

  /// The parameter `oldKantaWeight` of this provider.
  String? get oldKantaWeight;

  /// The parameter `noOfBags` of this provider.
  String? get noOfBags;

  /// The parameter `netweight` of this provider.
  String? get netweight;

  /// The parameter `tareWeight` of this provider.
  String? get tareWeight;

  /// The parameter `grossWeight` of this provider.
  String? get grossWeight;

  /// The parameter `inOutType` of this provider.
  String? get inOutType;

  /// The parameter `commodityList` of this provider.
  List<Map<String, dynamic>>? get commodityList;

  /// The parameter `packagingType` of this provider.
  String? get packagingType;

  /// The parameter `liveInsects` of this provider.
  String? get liveInsects;

  /// The parameter `qualityFile` of this provider.
  File? get qualityFile;

  /// The parameter `oldKantaFile` of this provider.
  File? get oldKantaFile;

  /// The parameter `kantaImage` of this provider.
  File? get kantaImage;

  /// The parameter `truckImage` of this provider.
  File? get truckImage;
}

class _UploadFirstKantaParchiV1ProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with UploadFirstKantaParchiV1Ref {
  _UploadFirstKantaParchiV1ProviderElement(super.provider);

  @override
  String? get caseId => (origin as UploadFirstKantaParchiV1Provider).caseId;
  @override
  String? get notes => (origin as UploadFirstKantaParchiV1Provider).notes;
  @override
  String? get kantaId => (origin as UploadFirstKantaParchiV1Provider).kantaId;
  @override
  String? get kantaParchiNumber =>
      (origin as UploadFirstKantaParchiV1Provider).kantaParchiNumber;
  @override
  String? get oldKantaNumber =>
      (origin as UploadFirstKantaParchiV1Provider).oldKantaNumber;
  @override
  String? get oldKantaLocation =>
      (origin as UploadFirstKantaParchiV1Provider).oldKantaLocation;
  @override
  String? get oldKantaName =>
      (origin as UploadFirstKantaParchiV1Provider).oldKantaName;
  @override
  String? get oldKantaWeight =>
      (origin as UploadFirstKantaParchiV1Provider).oldKantaWeight;
  @override
  String? get noOfBags => (origin as UploadFirstKantaParchiV1Provider).noOfBags;
  @override
  String? get netweight =>
      (origin as UploadFirstKantaParchiV1Provider).netweight;
  @override
  String? get tareWeight =>
      (origin as UploadFirstKantaParchiV1Provider).tareWeight;
  @override
  String? get grossWeight =>
      (origin as UploadFirstKantaParchiV1Provider).grossWeight;
  @override
  String? get inOutType =>
      (origin as UploadFirstKantaParchiV1Provider).inOutType;
  @override
  List<Map<String, dynamic>>? get commodityList =>
      (origin as UploadFirstKantaParchiV1Provider).commodityList;
  @override
  String? get packagingType =>
      (origin as UploadFirstKantaParchiV1Provider).packagingType;
  @override
  String? get liveInsects =>
      (origin as UploadFirstKantaParchiV1Provider).liveInsects;
  @override
  File? get qualityFile =>
      (origin as UploadFirstKantaParchiV1Provider).qualityFile;
  @override
  File? get oldKantaFile =>
      (origin as UploadFirstKantaParchiV1Provider).oldKantaFile;
  @override
  File? get kantaImage =>
      (origin as UploadFirstKantaParchiV1Provider).kantaImage;
  @override
  File? get truckImage =>
      (origin as UploadFirstKantaParchiV1Provider).truckImage;
}

String _$fKantaParchiListHash() => r'b42ecf31078681493bf644dabfcca92ba4810176';

/// See also [fKantaParchiList].
@ProviderFor(fKantaParchiList)
const fKantaParchiListProvider = FKantaParchiListFamily();

/// See also [fKantaParchiList].
class FKantaParchiListFamily extends Family<AsyncValue<FKantaParchiListModel>> {
  /// See also [fKantaParchiList].
  const FKantaParchiListFamily();

  /// See also [fKantaParchiList].
  FKantaParchiListProvider call({
    String? inOut,
  }) {
    return FKantaParchiListProvider(
      inOut: inOut,
    );
  }

  @override
  FKantaParchiListProvider getProviderOverride(
    covariant FKantaParchiListProvider provider,
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
  String? get name => r'fKantaParchiListProvider';
}

/// See also [fKantaParchiList].
class FKantaParchiListProvider
    extends AutoDisposeStreamProvider<FKantaParchiListModel> {
  /// See also [fKantaParchiList].
  FKantaParchiListProvider({
    String? inOut,
  }) : this._internal(
          (ref) => fKantaParchiList(
            ref as FKantaParchiListRef,
            inOut: inOut,
          ),
          from: fKantaParchiListProvider,
          name: r'fKantaParchiListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fKantaParchiListHash,
          dependencies: FKantaParchiListFamily._dependencies,
          allTransitiveDependencies:
              FKantaParchiListFamily._allTransitiveDependencies,
          inOut: inOut,
        );

  FKantaParchiListProvider._internal(
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
    Stream<FKantaParchiListModel> Function(FKantaParchiListRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FKantaParchiListProvider._internal(
        (ref) => create(ref as FKantaParchiListRef),
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
  AutoDisposeStreamProviderElement<FKantaParchiListModel> createElement() {
    return _FKantaParchiListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FKantaParchiListProvider && other.inOut == inOut;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, inOut.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FKantaParchiListRef
    on AutoDisposeStreamProviderRef<FKantaParchiListModel> {
  /// The parameter `inOut` of this provider.
  String? get inOut;
}

class _FKantaParchiListProviderElement
    extends AutoDisposeStreamProviderElement<FKantaParchiListModel>
    with FKantaParchiListRef {
  _FKantaParchiListProviderElement(super.provider);

  @override
  String? get inOut => (origin as FKantaParchiListProvider).inOut;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
