// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'WhsService.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$whsInTerminalDataHash() => r'63fd965636c2e4692a189df5c6f14af70639b860';

/// See also [whsInTerminalData].
@ProviderFor(whsInTerminalData)
final whsInTerminalDataProvider =
    AutoDisposeStreamProvider<WhsTerminalInModal>.internal(
  whsInTerminalData,
  name: r'whsInTerminalDataProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$whsInTerminalDataHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef WhsInTerminalDataRef = AutoDisposeStreamProviderRef<WhsTerminalInModal>;
String _$savewhsINDataHash() => r'c6ac816c5e8cc26fc551536cc27cfa80cbaa8778';

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

/// See also [savewhsINData].
@ProviderFor(savewhsINData)
const savewhsINDataProvider = SavewhsINDataFamily();

/// See also [savewhsINData].
class SavewhsINDataFamily extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [savewhsINData].
  const SavewhsINDataFamily();

  /// See also [savewhsINData].
  SavewhsINDataProvider call({
    String? getNo,
    String? lockMo,
    String? sealNo,
    File? image,
    String? shutterNo,
    String? remark,
  }) {
    return SavewhsINDataProvider(
      getNo: getNo,
      lockMo: lockMo,
      sealNo: sealNo,
      image: image,
      shutterNo: shutterNo,
      remark: remark,
    );
  }

  @override
  SavewhsINDataProvider getProviderOverride(
    covariant SavewhsINDataProvider provider,
  ) {
    return call(
      getNo: provider.getNo,
      lockMo: provider.lockMo,
      sealNo: provider.sealNo,
      image: provider.image,
      shutterNo: provider.shutterNo,
      remark: provider.remark,
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
  String? get name => r'savewhsINDataProvider';
}

/// See also [savewhsINData].
class SavewhsINDataProvider
    extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [savewhsINData].
  SavewhsINDataProvider({
    String? getNo,
    String? lockMo,
    String? sealNo,
    File? image,
    String? shutterNo,
    String? remark,
  }) : this._internal(
          (ref) => savewhsINData(
            ref as SavewhsINDataRef,
            getNo: getNo,
            lockMo: lockMo,
            sealNo: sealNo,
            image: image,
            shutterNo: shutterNo,
            remark: remark,
          ),
          from: savewhsINDataProvider,
          name: r'savewhsINDataProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$savewhsINDataHash,
          dependencies: SavewhsINDataFamily._dependencies,
          allTransitiveDependencies:
              SavewhsINDataFamily._allTransitiveDependencies,
          getNo: getNo,
          lockMo: lockMo,
          sealNo: sealNo,
          image: image,
          shutterNo: shutterNo,
          remark: remark,
        );

  SavewhsINDataProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.getNo,
    required this.lockMo,
    required this.sealNo,
    required this.image,
    required this.shutterNo,
    required this.remark,
  }) : super.internal();

  final String? getNo;
  final String? lockMo;
  final String? sealNo;
  final File? image;
  final String? shutterNo;
  final String? remark;

  @override
  Override overrideWith(
    FutureOr<Map<String, dynamic>> Function(SavewhsINDataRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SavewhsINDataProvider._internal(
        (ref) => create(ref as SavewhsINDataRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        getNo: getNo,
        lockMo: lockMo,
        sealNo: sealNo,
        image: image,
        shutterNo: shutterNo,
        remark: remark,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<String, dynamic>> createElement() {
    return _SavewhsINDataProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SavewhsINDataProvider &&
        other.getNo == getNo &&
        other.lockMo == lockMo &&
        other.sealNo == sealNo &&
        other.image == image &&
        other.shutterNo == shutterNo &&
        other.remark == remark;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, getNo.hashCode);
    hash = _SystemHash.combine(hash, lockMo.hashCode);
    hash = _SystemHash.combine(hash, sealNo.hashCode);
    hash = _SystemHash.combine(hash, image.hashCode);
    hash = _SystemHash.combine(hash, shutterNo.hashCode);
    hash = _SystemHash.combine(hash, remark.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SavewhsINDataRef on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `getNo` of this provider.
  String? get getNo;

  /// The parameter `lockMo` of this provider.
  String? get lockMo;

  /// The parameter `sealNo` of this provider.
  String? get sealNo;

  /// The parameter `image` of this provider.
  File? get image;

  /// The parameter `shutterNo` of this provider.
  String? get shutterNo;

  /// The parameter `remark` of this provider.
  String? get remark;
}

class _SavewhsINDataProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with SavewhsINDataRef {
  _SavewhsINDataProviderElement(super.provider);

  @override
  String? get getNo => (origin as SavewhsINDataProvider).getNo;
  @override
  String? get lockMo => (origin as SavewhsINDataProvider).lockMo;
  @override
  String? get sealNo => (origin as SavewhsINDataProvider).sealNo;
  @override
  File? get image => (origin as SavewhsINDataProvider).image;
  @override
  String? get shutterNo => (origin as SavewhsINDataProvider).shutterNo;
  @override
  String? get remark => (origin as SavewhsINDataProvider).remark;
}

String _$whsOutTerminalDataHash() =>
    r'9426f09fbadb8140d90a753f66eab98b2033dfc7';

/// See also [whsOutTerminalData].
@ProviderFor(whsOutTerminalData)
final whsOutTerminalDataProvider =
    AutoDisposeStreamProvider<WhsTerminalOutModal>.internal(
  whsOutTerminalData,
  name: r'whsOutTerminalDataProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$whsOutTerminalDataHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef WhsOutTerminalDataRef
    = AutoDisposeStreamProviderRef<WhsTerminalOutModal>;
String _$savewhsOutDataHash() => r'fe9c8b7cadc3787397cad03f500fcb6968d4c608';

/// See also [savewhsOutData].
@ProviderFor(savewhsOutData)
const savewhsOutDataProvider = SavewhsOutDataFamily();

/// See also [savewhsOutData].
class SavewhsOutDataFamily extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [savewhsOutData].
  const SavewhsOutDataFamily();

  /// See also [savewhsOutData].
  SavewhsOutDataProvider call({
    String? getNo,
    String? lockMo,
    String? sealNo,
    File? image,
    String? shutterNo,
    String? remark,
  }) {
    return SavewhsOutDataProvider(
      getNo: getNo,
      lockMo: lockMo,
      sealNo: sealNo,
      image: image,
      shutterNo: shutterNo,
      remark: remark,
    );
  }

  @override
  SavewhsOutDataProvider getProviderOverride(
    covariant SavewhsOutDataProvider provider,
  ) {
    return call(
      getNo: provider.getNo,
      lockMo: provider.lockMo,
      sealNo: provider.sealNo,
      image: provider.image,
      shutterNo: provider.shutterNo,
      remark: provider.remark,
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
  String? get name => r'savewhsOutDataProvider';
}

/// See also [savewhsOutData].
class SavewhsOutDataProvider
    extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [savewhsOutData].
  SavewhsOutDataProvider({
    String? getNo,
    String? lockMo,
    String? sealNo,
    File? image,
    String? shutterNo,
    String? remark,
  }) : this._internal(
          (ref) => savewhsOutData(
            ref as SavewhsOutDataRef,
            getNo: getNo,
            lockMo: lockMo,
            sealNo: sealNo,
            image: image,
            shutterNo: shutterNo,
            remark: remark,
          ),
          from: savewhsOutDataProvider,
          name: r'savewhsOutDataProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$savewhsOutDataHash,
          dependencies: SavewhsOutDataFamily._dependencies,
          allTransitiveDependencies:
              SavewhsOutDataFamily._allTransitiveDependencies,
          getNo: getNo,
          lockMo: lockMo,
          sealNo: sealNo,
          image: image,
          shutterNo: shutterNo,
          remark: remark,
        );

  SavewhsOutDataProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.getNo,
    required this.lockMo,
    required this.sealNo,
    required this.image,
    required this.shutterNo,
    required this.remark,
  }) : super.internal();

  final String? getNo;
  final String? lockMo;
  final String? sealNo;
  final File? image;
  final String? shutterNo;
  final String? remark;

  @override
  Override overrideWith(
    FutureOr<Map<String, dynamic>> Function(SavewhsOutDataRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SavewhsOutDataProvider._internal(
        (ref) => create(ref as SavewhsOutDataRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        getNo: getNo,
        lockMo: lockMo,
        sealNo: sealNo,
        image: image,
        shutterNo: shutterNo,
        remark: remark,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<String, dynamic>> createElement() {
    return _SavewhsOutDataProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SavewhsOutDataProvider &&
        other.getNo == getNo &&
        other.lockMo == lockMo &&
        other.sealNo == sealNo &&
        other.image == image &&
        other.shutterNo == shutterNo &&
        other.remark == remark;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, getNo.hashCode);
    hash = _SystemHash.combine(hash, lockMo.hashCode);
    hash = _SystemHash.combine(hash, sealNo.hashCode);
    hash = _SystemHash.combine(hash, image.hashCode);
    hash = _SystemHash.combine(hash, shutterNo.hashCode);
    hash = _SystemHash.combine(hash, remark.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SavewhsOutDataRef on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `getNo` of this provider.
  String? get getNo;

  /// The parameter `lockMo` of this provider.
  String? get lockMo;

  /// The parameter `sealNo` of this provider.
  String? get sealNo;

  /// The parameter `image` of this provider.
  File? get image;

  /// The parameter `shutterNo` of this provider.
  String? get shutterNo;

  /// The parameter `remark` of this provider.
  String? get remark;
}

class _SavewhsOutDataProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with SavewhsOutDataRef {
  _SavewhsOutDataProviderElement(super.provider);

  @override
  String? get getNo => (origin as SavewhsOutDataProvider).getNo;
  @override
  String? get lockMo => (origin as SavewhsOutDataProvider).lockMo;
  @override
  String? get sealNo => (origin as SavewhsOutDataProvider).sealNo;
  @override
  File? get image => (origin as SavewhsOutDataProvider).image;
  @override
  String? get shutterNo => (origin as SavewhsOutDataProvider).shutterNo;
  @override
  String? get remark => (origin as SavewhsOutDataProvider).remark;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
