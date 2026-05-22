// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'QualityCalculatorService.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$qualityParametersHash() => r'f38d327cab5cb98bcdc680e34d25b7c9c78e3c16';

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

/// See also [qualityParameters].
@ProviderFor(qualityParameters)
const qualityParametersProvider = QualityParametersFamily();

/// See also [qualityParameters].
class QualityParametersFamily extends Family<AsyncValue<QualityParamsModel>> {
  /// See also [qualityParameters].
  const QualityParametersFamily();

  /// See also [qualityParameters].
  QualityParametersProvider call({
    required String stateCode,
    required String districtId,
    required String commodityId,
  }) {
    return QualityParametersProvider(
      stateCode: stateCode,
      districtId: districtId,
      commodityId: commodityId,
    );
  }

  @override
  QualityParametersProvider getProviderOverride(
    covariant QualityParametersProvider provider,
  ) {
    return call(
      stateCode: provider.stateCode,
      districtId: provider.districtId,
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
  String? get name => r'qualityParametersProvider';
}

/// See also [qualityParameters].
class QualityParametersProvider
    extends AutoDisposeStreamProvider<QualityParamsModel> {
  /// See also [qualityParameters].
  QualityParametersProvider({
    required String stateCode,
    required String districtId,
    required String commodityId,
  }) : this._internal(
          (ref) => qualityParameters(
            ref as QualityParametersRef,
            stateCode: stateCode,
            districtId: districtId,
            commodityId: commodityId,
          ),
          from: qualityParametersProvider,
          name: r'qualityParametersProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$qualityParametersHash,
          dependencies: QualityParametersFamily._dependencies,
          allTransitiveDependencies:
              QualityParametersFamily._allTransitiveDependencies,
          stateCode: stateCode,
          districtId: districtId,
          commodityId: commodityId,
        );

  QualityParametersProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.stateCode,
    required this.districtId,
    required this.commodityId,
  }) : super.internal();

  final String stateCode;
  final String districtId;
  final String commodityId;

  @override
  Override overrideWith(
    Stream<QualityParamsModel> Function(QualityParametersRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: QualityParametersProvider._internal(
        (ref) => create(ref as QualityParametersRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        stateCode: stateCode,
        districtId: districtId,
        commodityId: commodityId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<QualityParamsModel> createElement() {
    return _QualityParametersProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is QualityParametersProvider &&
        other.stateCode == stateCode &&
        other.districtId == districtId &&
        other.commodityId == commodityId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, stateCode.hashCode);
    hash = _SystemHash.combine(hash, districtId.hashCode);
    hash = _SystemHash.combine(hash, commodityId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin QualityParametersRef on AutoDisposeStreamProviderRef<QualityParamsModel> {
  /// The parameter `stateCode` of this provider.
  String get stateCode;

  /// The parameter `districtId` of this provider.
  String get districtId;

  /// The parameter `commodityId` of this provider.
  String get commodityId;
}

class _QualityParametersProviderElement
    extends AutoDisposeStreamProviderElement<QualityParamsModel>
    with QualityParametersRef {
  _QualityParametersProviderElement(super.provider);

  @override
  String get stateCode => (origin as QualityParametersProvider).stateCode;
  @override
  String get districtId => (origin as QualityParametersProvider).districtId;
  @override
  String get commodityId => (origin as QualityParametersProvider).commodityId;
}

String _$calculateQualityPriceHash() =>
    r'ac82173bf34bcc548aa4ebe95f5c65c9745962b7';

/// See also [calculateQualityPrice].
@ProviderFor(calculateQualityPrice)
const calculateQualityPriceProvider = CalculateQualityPriceFamily();

/// See also [calculateQualityPrice].
class CalculateQualityPriceFamily
    extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [calculateQualityPrice].
  const CalculateQualityPriceFamily();

  /// See also [calculateQualityPrice].
  CalculateQualityPriceProvider call({
    required Map<String, dynamic> data,
  }) {
    return CalculateQualityPriceProvider(
      data: data,
    );
  }

  @override
  CalculateQualityPriceProvider getProviderOverride(
    covariant CalculateQualityPriceProvider provider,
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
  String? get name => r'calculateQualityPriceProvider';
}

/// See also [calculateQualityPrice].
class CalculateQualityPriceProvider
    extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [calculateQualityPrice].
  CalculateQualityPriceProvider({
    required Map<String, dynamic> data,
  }) : this._internal(
          (ref) => calculateQualityPrice(
            ref as CalculateQualityPriceRef,
            data: data,
          ),
          from: calculateQualityPriceProvider,
          name: r'calculateQualityPriceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$calculateQualityPriceHash,
          dependencies: CalculateQualityPriceFamily._dependencies,
          allTransitiveDependencies:
              CalculateQualityPriceFamily._allTransitiveDependencies,
          data: data,
        );

  CalculateQualityPriceProvider._internal(
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
    FutureOr<Map<String, dynamic>> Function(CalculateQualityPriceRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CalculateQualityPriceProvider._internal(
        (ref) => create(ref as CalculateQualityPriceRef),
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
    return _CalculateQualityPriceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CalculateQualityPriceProvider && other.data == data;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, data.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CalculateQualityPriceRef
    on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `data` of this provider.
  Map<String, dynamic> get data;
}

class _CalculateQualityPriceProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with CalculateQualityPriceRef {
  _CalculateQualityPriceProviderElement(super.provider);

  @override
  Map<String, dynamic> get data =>
      (origin as CalculateQualityPriceProvider).data;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
