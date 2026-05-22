// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'FirstQualityReportService.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$commodityParamsHash() => r'ef7cb5efed55e563bdc047a590f48d2b3a88be45';

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

/// See also [commodityParams].
@ProviderFor(commodityParams)
const commodityParamsProvider = CommodityParamsFamily();

/// See also [commodityParams].
class CommodityParamsFamily extends Family<AsyncValue<QualityParametersModel>> {
  /// See also [commodityParams].
  const CommodityParamsFamily();

  /// See also [commodityParams].
  CommodityParamsProvider call({
    String? caseId,
  }) {
    return CommodityParamsProvider(
      caseId: caseId,
    );
  }

  @override
  CommodityParamsProvider getProviderOverride(
    covariant CommodityParamsProvider provider,
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
  String? get name => r'commodityParamsProvider';
}

/// See also [commodityParams].
class CommodityParamsProvider
    extends AutoDisposeFutureProvider<QualityParametersModel> {
  /// See also [commodityParams].
  CommodityParamsProvider({
    String? caseId,
  }) : this._internal(
          (ref) => commodityParams(
            ref as CommodityParamsRef,
            caseId: caseId,
          ),
          from: commodityParamsProvider,
          name: r'commodityParamsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$commodityParamsHash,
          dependencies: CommodityParamsFamily._dependencies,
          allTransitiveDependencies:
              CommodityParamsFamily._allTransitiveDependencies,
          caseId: caseId,
        );

  CommodityParamsProvider._internal(
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
    FutureOr<QualityParametersModel> Function(CommodityParamsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CommodityParamsProvider._internal(
        (ref) => create(ref as CommodityParamsRef),
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
  AutoDisposeFutureProviderElement<QualityParametersModel> createElement() {
    return _CommodityParamsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CommodityParamsProvider && other.caseId == caseId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, caseId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CommodityParamsRef
    on AutoDisposeFutureProviderRef<QualityParametersModel> {
  /// The parameter `caseId` of this provider.
  String? get caseId;
}

class _CommodityParamsProviderElement
    extends AutoDisposeFutureProviderElement<QualityParametersModel>
    with CommodityParamsRef {
  _CommodityParamsProviderElement(super.provider);

  @override
  String? get caseId => (origin as CommodityParamsProvider).caseId;
}

String _$uploadFirstQualityReportHash() =>
    r'1bce6b8a708147bb5611e38138d8c63d65855322';

/// See also [uploadFirstQualityReport].
@ProviderFor(uploadFirstQualityReport)
const uploadFirstQualityReportProvider = UploadFirstQualityReportFamily();

/// See also [uploadFirstQualityReport].
class UploadFirstQualityReportFamily
    extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [uploadFirstQualityReport].
  const UploadFirstQualityReportFamily();

  /// See also [uploadFirstQualityReport].
  UploadFirstQualityReportProvider call({
    required QualityUploadModel data,
  }) {
    return UploadFirstQualityReportProvider(
      data: data,
    );
  }

  @override
  UploadFirstQualityReportProvider getProviderOverride(
    covariant UploadFirstQualityReportProvider provider,
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
  String? get name => r'uploadFirstQualityReportProvider';
}

/// See also [uploadFirstQualityReport].
class UploadFirstQualityReportProvider
    extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [uploadFirstQualityReport].
  UploadFirstQualityReportProvider({
    required QualityUploadModel data,
  }) : this._internal(
          (ref) => uploadFirstQualityReport(
            ref as UploadFirstQualityReportRef,
            data: data,
          ),
          from: uploadFirstQualityReportProvider,
          name: r'uploadFirstQualityReportProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$uploadFirstQualityReportHash,
          dependencies: UploadFirstQualityReportFamily._dependencies,
          allTransitiveDependencies:
              UploadFirstQualityReportFamily._allTransitiveDependencies,
          data: data,
        );

  UploadFirstQualityReportProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.data,
  }) : super.internal();

  final QualityUploadModel data;

  @override
  Override overrideWith(
    FutureOr<Map<String, dynamic>> Function(
            UploadFirstQualityReportRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UploadFirstQualityReportProvider._internal(
        (ref) => create(ref as UploadFirstQualityReportRef),
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
    return _UploadFirstQualityReportProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UploadFirstQualityReportProvider && other.data == data;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, data.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UploadFirstQualityReportRef
    on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `data` of this provider.
  QualityUploadModel get data;
}

class _UploadFirstQualityReportProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with UploadFirstQualityReportRef {
  _UploadFirstQualityReportProviderElement(super.provider);

  @override
  QualityUploadModel get data =>
      (origin as UploadFirstQualityReportProvider).data;
}

String _$uploadFirstQualityReportV1Hash() =>
    r'55920f2dba77b2b664588e48130e19ae582dbf9c';

/// See also [uploadFirstQualityReportV1].
@ProviderFor(uploadFirstQualityReportV1)
const uploadFirstQualityReportV1Provider = UploadFirstQualityReportV1Family();

/// See also [uploadFirstQualityReportV1].
class UploadFirstQualityReportV1Family
    extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [uploadFirstQualityReportV1].
  const UploadFirstQualityReportV1Family();

  /// See also [uploadFirstQualityReportV1].
  UploadFirstQualityReportV1Provider call({
    required String caseId,
    required String packagingType,
    required String infested,
    required String liveInsects,
    required String notes,
    required String inOut,
    required List<Map<String, dynamic>> commodityList,
    File? image,
  }) {
    return UploadFirstQualityReportV1Provider(
      caseId: caseId,
      packagingType: packagingType,
      infested: infested,
      liveInsects: liveInsects,
      notes: notes,
      inOut: inOut,
      commodityList: commodityList,
      image: image,
    );
  }

  @override
  UploadFirstQualityReportV1Provider getProviderOverride(
    covariant UploadFirstQualityReportV1Provider provider,
  ) {
    return call(
      caseId: provider.caseId,
      packagingType: provider.packagingType,
      infested: provider.infested,
      liveInsects: provider.liveInsects,
      notes: provider.notes,
      inOut: provider.inOut,
      commodityList: provider.commodityList,
      image: provider.image,
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
  String? get name => r'uploadFirstQualityReportV1Provider';
}

/// See also [uploadFirstQualityReportV1].
class UploadFirstQualityReportV1Provider
    extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [uploadFirstQualityReportV1].
  UploadFirstQualityReportV1Provider({
    required String caseId,
    required String packagingType,
    required String infested,
    required String liveInsects,
    required String notes,
    required String inOut,
    required List<Map<String, dynamic>> commodityList,
    File? image,
  }) : this._internal(
          (ref) => uploadFirstQualityReportV1(
            ref as UploadFirstQualityReportV1Ref,
            caseId: caseId,
            packagingType: packagingType,
            infested: infested,
            liveInsects: liveInsects,
            notes: notes,
            inOut: inOut,
            commodityList: commodityList,
            image: image,
          ),
          from: uploadFirstQualityReportV1Provider,
          name: r'uploadFirstQualityReportV1Provider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$uploadFirstQualityReportV1Hash,
          dependencies: UploadFirstQualityReportV1Family._dependencies,
          allTransitiveDependencies:
              UploadFirstQualityReportV1Family._allTransitiveDependencies,
          caseId: caseId,
          packagingType: packagingType,
          infested: infested,
          liveInsects: liveInsects,
          notes: notes,
          inOut: inOut,
          commodityList: commodityList,
          image: image,
        );

  UploadFirstQualityReportV1Provider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.caseId,
    required this.packagingType,
    required this.infested,
    required this.liveInsects,
    required this.notes,
    required this.inOut,
    required this.commodityList,
    required this.image,
  }) : super.internal();

  final String caseId;
  final String packagingType;
  final String infested;
  final String liveInsects;
  final String notes;
  final String inOut;
  final List<Map<String, dynamic>> commodityList;
  final File? image;

  @override
  Override overrideWith(
    FutureOr<Map<String, dynamic>> Function(
            UploadFirstQualityReportV1Ref provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UploadFirstQualityReportV1Provider._internal(
        (ref) => create(ref as UploadFirstQualityReportV1Ref),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        caseId: caseId,
        packagingType: packagingType,
        infested: infested,
        liveInsects: liveInsects,
        notes: notes,
        inOut: inOut,
        commodityList: commodityList,
        image: image,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<String, dynamic>> createElement() {
    return _UploadFirstQualityReportV1ProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UploadFirstQualityReportV1Provider &&
        other.caseId == caseId &&
        other.packagingType == packagingType &&
        other.infested == infested &&
        other.liveInsects == liveInsects &&
        other.notes == notes &&
        other.inOut == inOut &&
        other.commodityList == commodityList &&
        other.image == image;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, caseId.hashCode);
    hash = _SystemHash.combine(hash, packagingType.hashCode);
    hash = _SystemHash.combine(hash, infested.hashCode);
    hash = _SystemHash.combine(hash, liveInsects.hashCode);
    hash = _SystemHash.combine(hash, notes.hashCode);
    hash = _SystemHash.combine(hash, inOut.hashCode);
    hash = _SystemHash.combine(hash, commodityList.hashCode);
    hash = _SystemHash.combine(hash, image.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UploadFirstQualityReportV1Ref
    on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `caseId` of this provider.
  String get caseId;

  /// The parameter `packagingType` of this provider.
  String get packagingType;

  /// The parameter `infested` of this provider.
  String get infested;

  /// The parameter `liveInsects` of this provider.
  String get liveInsects;

  /// The parameter `notes` of this provider.
  String get notes;

  /// The parameter `inOut` of this provider.
  String get inOut;

  /// The parameter `commodityList` of this provider.
  List<Map<String, dynamic>> get commodityList;

  /// The parameter `image` of this provider.
  File? get image;
}

class _UploadFirstQualityReportV1ProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with UploadFirstQualityReportV1Ref {
  _UploadFirstQualityReportV1ProviderElement(super.provider);

  @override
  String get caseId => (origin as UploadFirstQualityReportV1Provider).caseId;
  @override
  String get packagingType =>
      (origin as UploadFirstQualityReportV1Provider).packagingType;
  @override
  String get infested =>
      (origin as UploadFirstQualityReportV1Provider).infested;
  @override
  String get liveInsects =>
      (origin as UploadFirstQualityReportV1Provider).liveInsects;
  @override
  String get notes => (origin as UploadFirstQualityReportV1Provider).notes;
  @override
  String get inOut => (origin as UploadFirstQualityReportV1Provider).inOut;
  @override
  List<Map<String, dynamic>> get commodityList =>
      (origin as UploadFirstQualityReportV1Provider).commodityList;
  @override
  File? get image => (origin as UploadFirstQualityReportV1Provider).image;
}

String _$firstQualityListHash() => r'e030314df3d167f15daa6299d0aae0ff54f70746';

/// See also [firstQualityList].
@ProviderFor(firstQualityList)
final firstQualityListProvider =
    AutoDisposeStreamProvider<FQualityListModel>.internal(
  firstQualityList,
  name: r'firstQualityListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$firstQualityListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FirstQualityListRef = AutoDisposeStreamProviderRef<FQualityListModel>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
