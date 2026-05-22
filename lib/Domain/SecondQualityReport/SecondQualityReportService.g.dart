// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SecondQualityReportService.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$uploadSecondQualityReportHash() =>
    r'7eacbebda48f527f5e34c146e1b45477722bc4d3';

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

/// See also [uploadSecondQualityReport].
@ProviderFor(uploadSecondQualityReport)
const uploadSecondQualityReportProvider = UploadSecondQualityReportFamily();

/// See also [uploadSecondQualityReport].
class UploadSecondQualityReportFamily
    extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [uploadSecondQualityReport].
  const UploadSecondQualityReportFamily();

  /// See also [uploadSecondQualityReport].
  UploadSecondQualityReportProvider call({
    Secondqualityuploadmodel? data,
  }) {
    return UploadSecondQualityReportProvider(
      data: data,
    );
  }

  @override
  UploadSecondQualityReportProvider getProviderOverride(
    covariant UploadSecondQualityReportProvider provider,
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
  String? get name => r'uploadSecondQualityReportProvider';
}

/// See also [uploadSecondQualityReport].
class UploadSecondQualityReportProvider
    extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [uploadSecondQualityReport].
  UploadSecondQualityReportProvider({
    Secondqualityuploadmodel? data,
  }) : this._internal(
          (ref) => uploadSecondQualityReport(
            ref as UploadSecondQualityReportRef,
            data: data,
          ),
          from: uploadSecondQualityReportProvider,
          name: r'uploadSecondQualityReportProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$uploadSecondQualityReportHash,
          dependencies: UploadSecondQualityReportFamily._dependencies,
          allTransitiveDependencies:
              UploadSecondQualityReportFamily._allTransitiveDependencies,
          data: data,
        );

  UploadSecondQualityReportProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.data,
  }) : super.internal();

  final Secondqualityuploadmodel? data;

  @override
  Override overrideWith(
    FutureOr<Map<String, dynamic>> Function(
            UploadSecondQualityReportRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UploadSecondQualityReportProvider._internal(
        (ref) => create(ref as UploadSecondQualityReportRef),
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
    return _UploadSecondQualityReportProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UploadSecondQualityReportProvider && other.data == data;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, data.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UploadSecondQualityReportRef
    on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `data` of this provider.
  Secondqualityuploadmodel? get data;
}

class _UploadSecondQualityReportProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with UploadSecondQualityReportRef {
  _UploadSecondQualityReportProviderElement(super.provider);

  @override
  Secondqualityuploadmodel? get data =>
      (origin as UploadSecondQualityReportProvider).data;
}

String _$uploadSecondQualityReportV1Hash() =>
    r'73edcb5774bcedc087c3ebd2860c0dfb89e7aa84';

/// See also [uploadSecondQualityReportV1].
@ProviderFor(uploadSecondQualityReportV1)
const uploadSecondQualityReportV1Provider = UploadSecondQualityReportV1Family();

/// See also [uploadSecondQualityReportV1].
class UploadSecondQualityReportV1Family
    extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [uploadSecondQualityReportV1].
  const UploadSecondQualityReportV1Family();

  /// See also [uploadSecondQualityReportV1].
  UploadSecondQualityReportV1Provider call({
    String? caseId,
    File? reportFile,
    String? packagingType,
    String? infested,
    String? liveInsects,
    String? notes,
    String? inOut,
    String? extraClaim,
    String? aQuality,
    String? bQuality,
    String? cQuality,
    String? cutBags,
    String? sendToLab,
    File? sendToReportFile,
    List<Map<String, dynamic>>? commodityList,
  }) {
    return UploadSecondQualityReportV1Provider(
      caseId: caseId,
      reportFile: reportFile,
      packagingType: packagingType,
      infested: infested,
      liveInsects: liveInsects,
      notes: notes,
      inOut: inOut,
      extraClaim: extraClaim,
      aQuality: aQuality,
      bQuality: bQuality,
      cQuality: cQuality,
      cutBags: cutBags,
      sendToLab: sendToLab,
      sendToReportFile: sendToReportFile,
      commodityList: commodityList,
    );
  }

  @override
  UploadSecondQualityReportV1Provider getProviderOverride(
    covariant UploadSecondQualityReportV1Provider provider,
  ) {
    return call(
      caseId: provider.caseId,
      reportFile: provider.reportFile,
      packagingType: provider.packagingType,
      infested: provider.infested,
      liveInsects: provider.liveInsects,
      notes: provider.notes,
      inOut: provider.inOut,
      extraClaim: provider.extraClaim,
      aQuality: provider.aQuality,
      bQuality: provider.bQuality,
      cQuality: provider.cQuality,
      cutBags: provider.cutBags,
      sendToLab: provider.sendToLab,
      sendToReportFile: provider.sendToReportFile,
      commodityList: provider.commodityList,
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
  String? get name => r'uploadSecondQualityReportV1Provider';
}

/// See also [uploadSecondQualityReportV1].
class UploadSecondQualityReportV1Provider
    extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [uploadSecondQualityReportV1].
  UploadSecondQualityReportV1Provider({
    String? caseId,
    File? reportFile,
    String? packagingType,
    String? infested,
    String? liveInsects,
    String? notes,
    String? inOut,
    String? extraClaim,
    String? aQuality,
    String? bQuality,
    String? cQuality,
    String? cutBags,
    String? sendToLab,
    File? sendToReportFile,
    List<Map<String, dynamic>>? commodityList,
  }) : this._internal(
          (ref) => uploadSecondQualityReportV1(
            ref as UploadSecondQualityReportV1Ref,
            caseId: caseId,
            reportFile: reportFile,
            packagingType: packagingType,
            infested: infested,
            liveInsects: liveInsects,
            notes: notes,
            inOut: inOut,
            extraClaim: extraClaim,
            aQuality: aQuality,
            bQuality: bQuality,
            cQuality: cQuality,
            cutBags: cutBags,
            sendToLab: sendToLab,
            sendToReportFile: sendToReportFile,
            commodityList: commodityList,
          ),
          from: uploadSecondQualityReportV1Provider,
          name: r'uploadSecondQualityReportV1Provider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$uploadSecondQualityReportV1Hash,
          dependencies: UploadSecondQualityReportV1Family._dependencies,
          allTransitiveDependencies:
              UploadSecondQualityReportV1Family._allTransitiveDependencies,
          caseId: caseId,
          reportFile: reportFile,
          packagingType: packagingType,
          infested: infested,
          liveInsects: liveInsects,
          notes: notes,
          inOut: inOut,
          extraClaim: extraClaim,
          aQuality: aQuality,
          bQuality: bQuality,
          cQuality: cQuality,
          cutBags: cutBags,
          sendToLab: sendToLab,
          sendToReportFile: sendToReportFile,
          commodityList: commodityList,
        );

  UploadSecondQualityReportV1Provider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.caseId,
    required this.reportFile,
    required this.packagingType,
    required this.infested,
    required this.liveInsects,
    required this.notes,
    required this.inOut,
    required this.extraClaim,
    required this.aQuality,
    required this.bQuality,
    required this.cQuality,
    required this.cutBags,
    required this.sendToLab,
    required this.sendToReportFile,
    required this.commodityList,
  }) : super.internal();

  final String? caseId;
  final File? reportFile;
  final String? packagingType;
  final String? infested;
  final String? liveInsects;
  final String? notes;
  final String? inOut;
  final String? extraClaim;
  final String? aQuality;
  final String? bQuality;
  final String? cQuality;
  final String? cutBags;
  final String? sendToLab;
  final File? sendToReportFile;
  final List<Map<String, dynamic>>? commodityList;

  @override
  Override overrideWith(
    FutureOr<Map<String, dynamic>> Function(
            UploadSecondQualityReportV1Ref provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UploadSecondQualityReportV1Provider._internal(
        (ref) => create(ref as UploadSecondQualityReportV1Ref),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        caseId: caseId,
        reportFile: reportFile,
        packagingType: packagingType,
        infested: infested,
        liveInsects: liveInsects,
        notes: notes,
        inOut: inOut,
        extraClaim: extraClaim,
        aQuality: aQuality,
        bQuality: bQuality,
        cQuality: cQuality,
        cutBags: cutBags,
        sendToLab: sendToLab,
        sendToReportFile: sendToReportFile,
        commodityList: commodityList,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<String, dynamic>> createElement() {
    return _UploadSecondQualityReportV1ProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UploadSecondQualityReportV1Provider &&
        other.caseId == caseId &&
        other.reportFile == reportFile &&
        other.packagingType == packagingType &&
        other.infested == infested &&
        other.liveInsects == liveInsects &&
        other.notes == notes &&
        other.inOut == inOut &&
        other.extraClaim == extraClaim &&
        other.aQuality == aQuality &&
        other.bQuality == bQuality &&
        other.cQuality == cQuality &&
        other.cutBags == cutBags &&
        other.sendToLab == sendToLab &&
        other.sendToReportFile == sendToReportFile &&
        other.commodityList == commodityList;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, caseId.hashCode);
    hash = _SystemHash.combine(hash, reportFile.hashCode);
    hash = _SystemHash.combine(hash, packagingType.hashCode);
    hash = _SystemHash.combine(hash, infested.hashCode);
    hash = _SystemHash.combine(hash, liveInsects.hashCode);
    hash = _SystemHash.combine(hash, notes.hashCode);
    hash = _SystemHash.combine(hash, inOut.hashCode);
    hash = _SystemHash.combine(hash, extraClaim.hashCode);
    hash = _SystemHash.combine(hash, aQuality.hashCode);
    hash = _SystemHash.combine(hash, bQuality.hashCode);
    hash = _SystemHash.combine(hash, cQuality.hashCode);
    hash = _SystemHash.combine(hash, cutBags.hashCode);
    hash = _SystemHash.combine(hash, sendToLab.hashCode);
    hash = _SystemHash.combine(hash, sendToReportFile.hashCode);
    hash = _SystemHash.combine(hash, commodityList.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UploadSecondQualityReportV1Ref
    on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `caseId` of this provider.
  String? get caseId;

  /// The parameter `reportFile` of this provider.
  File? get reportFile;

  /// The parameter `packagingType` of this provider.
  String? get packagingType;

  /// The parameter `infested` of this provider.
  String? get infested;

  /// The parameter `liveInsects` of this provider.
  String? get liveInsects;

  /// The parameter `notes` of this provider.
  String? get notes;

  /// The parameter `inOut` of this provider.
  String? get inOut;

  /// The parameter `extraClaim` of this provider.
  String? get extraClaim;

  /// The parameter `aQuality` of this provider.
  String? get aQuality;

  /// The parameter `bQuality` of this provider.
  String? get bQuality;

  /// The parameter `cQuality` of this provider.
  String? get cQuality;

  /// The parameter `cutBags` of this provider.
  String? get cutBags;

  /// The parameter `sendToLab` of this provider.
  String? get sendToLab;

  /// The parameter `sendToReportFile` of this provider.
  File? get sendToReportFile;

  /// The parameter `commodityList` of this provider.
  List<Map<String, dynamic>>? get commodityList;
}

class _UploadSecondQualityReportV1ProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with UploadSecondQualityReportV1Ref {
  _UploadSecondQualityReportV1ProviderElement(super.provider);

  @override
  String? get caseId => (origin as UploadSecondQualityReportV1Provider).caseId;
  @override
  File? get reportFile =>
      (origin as UploadSecondQualityReportV1Provider).reportFile;
  @override
  String? get packagingType =>
      (origin as UploadSecondQualityReportV1Provider).packagingType;
  @override
  String? get infested =>
      (origin as UploadSecondQualityReportV1Provider).infested;
  @override
  String? get liveInsects =>
      (origin as UploadSecondQualityReportV1Provider).liveInsects;
  @override
  String? get notes => (origin as UploadSecondQualityReportV1Provider).notes;
  @override
  String? get inOut => (origin as UploadSecondQualityReportV1Provider).inOut;
  @override
  String? get extraClaim =>
      (origin as UploadSecondQualityReportV1Provider).extraClaim;
  @override
  String? get aQuality =>
      (origin as UploadSecondQualityReportV1Provider).aQuality;
  @override
  String? get bQuality =>
      (origin as UploadSecondQualityReportV1Provider).bQuality;
  @override
  String? get cQuality =>
      (origin as UploadSecondQualityReportV1Provider).cQuality;
  @override
  String? get cutBags =>
      (origin as UploadSecondQualityReportV1Provider).cutBags;
  @override
  String? get sendToLab =>
      (origin as UploadSecondQualityReportV1Provider).sendToLab;
  @override
  File? get sendToReportFile =>
      (origin as UploadSecondQualityReportV1Provider).sendToReportFile;
  @override
  List<Map<String, dynamic>>? get commodityList =>
      (origin as UploadSecondQualityReportV1Provider).commodityList;
}

String _$sQualityListHash() => r'ba2c2dc2ca7647b22924d128e4a6c15c59eada05';

/// See also [sQualityList].
@ProviderFor(sQualityList)
const sQualityListProvider = SQualityListFamily();

/// See also [sQualityList].
class SQualityListFamily
    extends Family<AsyncValue<sQuality.SQualityListingModel>> {
  /// See also [sQualityList].
  const SQualityListFamily();

  /// See also [sQualityList].
  SQualityListProvider call({
    String? inOut,
  }) {
    return SQualityListProvider(
      inOut: inOut,
    );
  }

  @override
  SQualityListProvider getProviderOverride(
    covariant SQualityListProvider provider,
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
  String? get name => r'sQualityListProvider';
}

/// See also [sQualityList].
class SQualityListProvider
    extends AutoDisposeStreamProvider<sQuality.SQualityListingModel> {
  /// See also [sQualityList].
  SQualityListProvider({
    String? inOut,
  }) : this._internal(
          (ref) => sQualityList(
            ref as SQualityListRef,
            inOut: inOut,
          ),
          from: sQualityListProvider,
          name: r'sQualityListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$sQualityListHash,
          dependencies: SQualityListFamily._dependencies,
          allTransitiveDependencies:
              SQualityListFamily._allTransitiveDependencies,
          inOut: inOut,
        );

  SQualityListProvider._internal(
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
    Stream<sQuality.SQualityListingModel> Function(SQualityListRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SQualityListProvider._internal(
        (ref) => create(ref as SQualityListRef),
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
  AutoDisposeStreamProviderElement<sQuality.SQualityListingModel>
      createElement() {
    return _SQualityListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SQualityListProvider && other.inOut == inOut;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, inOut.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SQualityListRef
    on AutoDisposeStreamProviderRef<sQuality.SQualityListingModel> {
  /// The parameter `inOut` of this provider.
  String? get inOut;
}

class _SQualityListProviderElement
    extends AutoDisposeStreamProviderElement<sQuality.SQualityListingModel>
    with SQualityListRef {
  _SQualityListProviderElement(super.provider);

  @override
  String? get inOut => (origin as SQualityListProvider).inOut;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
