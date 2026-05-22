// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GuardService.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$guardTerminalsHash() => r'c97049bec22347e3397e65bfaa964213cd490c67';

/// See also [guardTerminals].
@ProviderFor(guardTerminals)
final guardTerminalsProvider =
    AutoDisposeStreamProvider<GuardTerminalListModel>.internal(
  guardTerminals,
  name: r'guardTerminalsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$guardTerminalsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GuardTerminalsRef
    = AutoDisposeStreamProviderRef<GuardTerminalListModel>;
String _$shutterAndLockHash() => r'd6f2a4b031ee3c2d3f66da152afbbacf85a94660';

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

/// See also [shutterAndLock].
@ProviderFor(shutterAndLock)
const shutterAndLockProvider = ShutterAndLockFamily();

/// See also [shutterAndLock].
class ShutterAndLockFamily
    extends Family<AsyncValue<GuardShutterAndLockListModel>> {
  /// See also [shutterAndLock].
  const ShutterAndLockFamily();

  /// See also [shutterAndLock].
  ShutterAndLockProvider call({
    required String terminalId,
  }) {
    return ShutterAndLockProvider(
      terminalId: terminalId,
    );
  }

  @override
  ShutterAndLockProvider getProviderOverride(
    covariant ShutterAndLockProvider provider,
  ) {
    return call(
      terminalId: provider.terminalId,
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
  String? get name => r'shutterAndLockProvider';
}

/// See also [shutterAndLock].
class ShutterAndLockProvider
    extends AutoDisposeStreamProvider<GuardShutterAndLockListModel> {
  /// See also [shutterAndLock].
  ShutterAndLockProvider({
    required String terminalId,
  }) : this._internal(
          (ref) => shutterAndLock(
            ref as ShutterAndLockRef,
            terminalId: terminalId,
          ),
          from: shutterAndLockProvider,
          name: r'shutterAndLockProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$shutterAndLockHash,
          dependencies: ShutterAndLockFamily._dependencies,
          allTransitiveDependencies:
              ShutterAndLockFamily._allTransitiveDependencies,
          terminalId: terminalId,
        );

  ShutterAndLockProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.terminalId,
  }) : super.internal();

  final String terminalId;

  @override
  Override overrideWith(
    Stream<GuardShutterAndLockListModel> Function(ShutterAndLockRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ShutterAndLockProvider._internal(
        (ref) => create(ref as ShutterAndLockRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        terminalId: terminalId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<GuardShutterAndLockListModel>
      createElement() {
    return _ShutterAndLockProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ShutterAndLockProvider && other.terminalId == terminalId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, terminalId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ShutterAndLockRef
    on AutoDisposeStreamProviderRef<GuardShutterAndLockListModel> {
  /// The parameter `terminalId` of this provider.
  String get terminalId;
}

class _ShutterAndLockProviderElement
    extends AutoDisposeStreamProviderElement<GuardShutterAndLockListModel>
    with ShutterAndLockRef {
  _ShutterAndLockProviderElement(super.provider);

  @override
  String get terminalId => (origin as ShutterAndLockProvider).terminalId;
}

String _$shutterAndLockOutHash() => r'f8b506e2dacb3f0d66b42b124ca7f6ddfb8f6b57';

/// See also [shutterAndLockOut].
@ProviderFor(shutterAndLockOut)
const shutterAndLockOutProvider = ShutterAndLockOutFamily();

/// See also [shutterAndLockOut].
class ShutterAndLockOutFamily
    extends Family<AsyncValue<GuardShutterAndLockListModel>> {
  /// See also [shutterAndLockOut].
  const ShutterAndLockOutFamily();

  /// See also [shutterAndLockOut].
  ShutterAndLockOutProvider call({
    required String terminalId,
  }) {
    return ShutterAndLockOutProvider(
      terminalId: terminalId,
    );
  }

  @override
  ShutterAndLockOutProvider getProviderOverride(
    covariant ShutterAndLockOutProvider provider,
  ) {
    return call(
      terminalId: provider.terminalId,
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
  String? get name => r'shutterAndLockOutProvider';
}

/// See also [shutterAndLockOut].
class ShutterAndLockOutProvider
    extends AutoDisposeStreamProvider<GuardShutterAndLockListModel> {
  /// See also [shutterAndLockOut].
  ShutterAndLockOutProvider({
    required String terminalId,
  }) : this._internal(
          (ref) => shutterAndLockOut(
            ref as ShutterAndLockOutRef,
            terminalId: terminalId,
          ),
          from: shutterAndLockOutProvider,
          name: r'shutterAndLockOutProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$shutterAndLockOutHash,
          dependencies: ShutterAndLockOutFamily._dependencies,
          allTransitiveDependencies:
              ShutterAndLockOutFamily._allTransitiveDependencies,
          terminalId: terminalId,
        );

  ShutterAndLockOutProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.terminalId,
  }) : super.internal();

  final String terminalId;

  @override
  Override overrideWith(
    Stream<GuardShutterAndLockListModel> Function(ShutterAndLockOutRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ShutterAndLockOutProvider._internal(
        (ref) => create(ref as ShutterAndLockOutRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        terminalId: terminalId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<GuardShutterAndLockListModel>
      createElement() {
    return _ShutterAndLockOutProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ShutterAndLockOutProvider && other.terminalId == terminalId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, terminalId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ShutterAndLockOutRef
    on AutoDisposeStreamProviderRef<GuardShutterAndLockListModel> {
  /// The parameter `terminalId` of this provider.
  String get terminalId;
}

class _ShutterAndLockOutProviderElement
    extends AutoDisposeStreamProviderElement<GuardShutterAndLockListModel>
    with ShutterAndLockOutRef {
  _ShutterAndLockOutProviderElement(super.provider);

  @override
  String get terminalId => (origin as ShutterAndLockOutProvider).terminalId;
}

String _$saveINDataHash() => r'0667793cd77615a68c8131b66fbce9dca08ca0ca';

/// See also [saveINData].
@ProviderFor(saveINData)
const saveINDataProvider = SaveINDataFamily();

/// See also [saveINData].
class SaveINDataFamily extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [saveINData].
  const SaveINDataFamily();

  /// See also [saveINData].
  SaveINDataProvider call({
    String? terminalId,
    String? gateNo,
    String? shutterNo,
    String? sealNo,
    File? image,
    String? remark,
  }) {
    return SaveINDataProvider(
      terminalId: terminalId,
      gateNo: gateNo,
      shutterNo: shutterNo,
      sealNo: sealNo,
      image: image,
      remark: remark,
    );
  }

  @override
  SaveINDataProvider getProviderOverride(
    covariant SaveINDataProvider provider,
  ) {
    return call(
      terminalId: provider.terminalId,
      gateNo: provider.gateNo,
      shutterNo: provider.shutterNo,
      sealNo: provider.sealNo,
      image: provider.image,
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
  String? get name => r'saveINDataProvider';
}

/// See also [saveINData].
class SaveINDataProvider
    extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [saveINData].
  SaveINDataProvider({
    String? terminalId,
    String? gateNo,
    String? shutterNo,
    String? sealNo,
    File? image,
    String? remark,
  }) : this._internal(
          (ref) => saveINData(
            ref as SaveINDataRef,
            terminalId: terminalId,
            gateNo: gateNo,
            shutterNo: shutterNo,
            sealNo: sealNo,
            image: image,
            remark: remark,
          ),
          from: saveINDataProvider,
          name: r'saveINDataProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$saveINDataHash,
          dependencies: SaveINDataFamily._dependencies,
          allTransitiveDependencies:
              SaveINDataFamily._allTransitiveDependencies,
          terminalId: terminalId,
          gateNo: gateNo,
          shutterNo: shutterNo,
          sealNo: sealNo,
          image: image,
          remark: remark,
        );

  SaveINDataProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.terminalId,
    required this.gateNo,
    required this.shutterNo,
    required this.sealNo,
    required this.image,
    required this.remark,
  }) : super.internal();

  final String? terminalId;
  final String? gateNo;
  final String? shutterNo;
  final String? sealNo;
  final File? image;
  final String? remark;

  @override
  Override overrideWith(
    FutureOr<Map<String, dynamic>> Function(SaveINDataRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SaveINDataProvider._internal(
        (ref) => create(ref as SaveINDataRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        terminalId: terminalId,
        gateNo: gateNo,
        shutterNo: shutterNo,
        sealNo: sealNo,
        image: image,
        remark: remark,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<String, dynamic>> createElement() {
    return _SaveINDataProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SaveINDataProvider &&
        other.terminalId == terminalId &&
        other.gateNo == gateNo &&
        other.shutterNo == shutterNo &&
        other.sealNo == sealNo &&
        other.image == image &&
        other.remark == remark;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, terminalId.hashCode);
    hash = _SystemHash.combine(hash, gateNo.hashCode);
    hash = _SystemHash.combine(hash, shutterNo.hashCode);
    hash = _SystemHash.combine(hash, sealNo.hashCode);
    hash = _SystemHash.combine(hash, image.hashCode);
    hash = _SystemHash.combine(hash, remark.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SaveINDataRef on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `terminalId` of this provider.
  String? get terminalId;

  /// The parameter `gateNo` of this provider.
  String? get gateNo;

  /// The parameter `shutterNo` of this provider.
  String? get shutterNo;

  /// The parameter `sealNo` of this provider.
  String? get sealNo;

  /// The parameter `image` of this provider.
  File? get image;

  /// The parameter `remark` of this provider.
  String? get remark;
}

class _SaveINDataProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with SaveINDataRef {
  _SaveINDataProviderElement(super.provider);

  @override
  String? get terminalId => (origin as SaveINDataProvider).terminalId;
  @override
  String? get gateNo => (origin as SaveINDataProvider).gateNo;
  @override
  String? get shutterNo => (origin as SaveINDataProvider).shutterNo;
  @override
  String? get sealNo => (origin as SaveINDataProvider).sealNo;
  @override
  File? get image => (origin as SaveINDataProvider).image;
  @override
  String? get remark => (origin as SaveINDataProvider).remark;
}

String _$saveOUTDataHash() => r'80b7df1b0ba1fcfedea570cd38ea64287ac7fe53';

/// See also [saveOUTData].
@ProviderFor(saveOUTData)
const saveOUTDataProvider = SaveOUTDataFamily();

/// See also [saveOUTData].
class SaveOUTDataFamily extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [saveOUTData].
  const SaveOUTDataFamily();

  /// See also [saveOUTData].
  SaveOUTDataProvider call({
    String? terminalId,
    String? gateNo,
    String? shutterNo,
    String? sealNo,
    File? image,
    String? remark,
  }) {
    return SaveOUTDataProvider(
      terminalId: terminalId,
      gateNo: gateNo,
      shutterNo: shutterNo,
      sealNo: sealNo,
      image: image,
      remark: remark,
    );
  }

  @override
  SaveOUTDataProvider getProviderOverride(
    covariant SaveOUTDataProvider provider,
  ) {
    return call(
      terminalId: provider.terminalId,
      gateNo: provider.gateNo,
      shutterNo: provider.shutterNo,
      sealNo: provider.sealNo,
      image: provider.image,
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
  String? get name => r'saveOUTDataProvider';
}

/// See also [saveOUTData].
class SaveOUTDataProvider
    extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [saveOUTData].
  SaveOUTDataProvider({
    String? terminalId,
    String? gateNo,
    String? shutterNo,
    String? sealNo,
    File? image,
    String? remark,
  }) : this._internal(
          (ref) => saveOUTData(
            ref as SaveOUTDataRef,
            terminalId: terminalId,
            gateNo: gateNo,
            shutterNo: shutterNo,
            sealNo: sealNo,
            image: image,
            remark: remark,
          ),
          from: saveOUTDataProvider,
          name: r'saveOUTDataProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$saveOUTDataHash,
          dependencies: SaveOUTDataFamily._dependencies,
          allTransitiveDependencies:
              SaveOUTDataFamily._allTransitiveDependencies,
          terminalId: terminalId,
          gateNo: gateNo,
          shutterNo: shutterNo,
          sealNo: sealNo,
          image: image,
          remark: remark,
        );

  SaveOUTDataProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.terminalId,
    required this.gateNo,
    required this.shutterNo,
    required this.sealNo,
    required this.image,
    required this.remark,
  }) : super.internal();

  final String? terminalId;
  final String? gateNo;
  final String? shutterNo;
  final String? sealNo;
  final File? image;
  final String? remark;

  @override
  Override overrideWith(
    FutureOr<Map<String, dynamic>> Function(SaveOUTDataRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SaveOUTDataProvider._internal(
        (ref) => create(ref as SaveOUTDataRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        terminalId: terminalId,
        gateNo: gateNo,
        shutterNo: shutterNo,
        sealNo: sealNo,
        image: image,
        remark: remark,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<String, dynamic>> createElement() {
    return _SaveOUTDataProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SaveOUTDataProvider &&
        other.terminalId == terminalId &&
        other.gateNo == gateNo &&
        other.shutterNo == shutterNo &&
        other.sealNo == sealNo &&
        other.image == image &&
        other.remark == remark;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, terminalId.hashCode);
    hash = _SystemHash.combine(hash, gateNo.hashCode);
    hash = _SystemHash.combine(hash, shutterNo.hashCode);
    hash = _SystemHash.combine(hash, sealNo.hashCode);
    hash = _SystemHash.combine(hash, image.hashCode);
    hash = _SystemHash.combine(hash, remark.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SaveOUTDataRef on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `terminalId` of this provider.
  String? get terminalId;

  /// The parameter `gateNo` of this provider.
  String? get gateNo;

  /// The parameter `shutterNo` of this provider.
  String? get shutterNo;

  /// The parameter `sealNo` of this provider.
  String? get sealNo;

  /// The parameter `image` of this provider.
  File? get image;

  /// The parameter `remark` of this provider.
  String? get remark;
}

class _SaveOUTDataProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with SaveOUTDataRef {
  _SaveOUTDataProviderElement(super.provider);

  @override
  String? get terminalId => (origin as SaveOUTDataProvider).terminalId;
  @override
  String? get gateNo => (origin as SaveOUTDataProvider).gateNo;
  @override
  String? get shutterNo => (origin as SaveOUTDataProvider).shutterNo;
  @override
  String? get sealNo => (origin as SaveOUTDataProvider).sealNo;
  @override
  File? get image => (origin as SaveOUTDataProvider).image;
  @override
  String? get remark => (origin as SaveOUTDataProvider).remark;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
