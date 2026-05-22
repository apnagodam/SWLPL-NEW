// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ChrService.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$updateChrHash() => r'173b41901c07a28c8ded19763fd1bd4e38c938de';

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

/// See also [updateChr].
@ProviderFor(updateChr)
const updateChrProvider = UpdateChrFamily();

/// See also [updateChr].
class UpdateChrFamily extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [updateChr].
  const UpdateChrFamily();

  /// See also [updateChr].
  UpdateChrProvider call({
    String? terminalid,
    String? commodity,
    String? stackno,
    String? remark,
    List<Map<String, dynamic>>? parameter,
    String? live,
    File? image,
  }) {
    return UpdateChrProvider(
      terminalid: terminalid,
      commodity: commodity,
      stackno: stackno,
      remark: remark,
      parameter: parameter,
      live: live,
      image: image,
    );
  }

  @override
  UpdateChrProvider getProviderOverride(
    covariant UpdateChrProvider provider,
  ) {
    return call(
      terminalid: provider.terminalid,
      commodity: provider.commodity,
      stackno: provider.stackno,
      remark: provider.remark,
      parameter: provider.parameter,
      live: provider.live,
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
  String? get name => r'updateChrProvider';
}

/// See also [updateChr].
class UpdateChrProvider
    extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [updateChr].
  UpdateChrProvider({
    String? terminalid,
    String? commodity,
    String? stackno,
    String? remark,
    List<Map<String, dynamic>>? parameter,
    String? live,
    File? image,
  }) : this._internal(
          (ref) => updateChr(
            ref as UpdateChrRef,
            terminalid: terminalid,
            commodity: commodity,
            stackno: stackno,
            remark: remark,
            parameter: parameter,
            live: live,
            image: image,
          ),
          from: updateChrProvider,
          name: r'updateChrProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$updateChrHash,
          dependencies: UpdateChrFamily._dependencies,
          allTransitiveDependencies: UpdateChrFamily._allTransitiveDependencies,
          terminalid: terminalid,
          commodity: commodity,
          stackno: stackno,
          remark: remark,
          parameter: parameter,
          live: live,
          image: image,
        );

  UpdateChrProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.terminalid,
    required this.commodity,
    required this.stackno,
    required this.remark,
    required this.parameter,
    required this.live,
    required this.image,
  }) : super.internal();

  final String? terminalid;
  final String? commodity;
  final String? stackno;
  final String? remark;
  final List<Map<String, dynamic>>? parameter;
  final String? live;
  final File? image;

  @override
  Override overrideWith(
    FutureOr<Map<String, dynamic>> Function(UpdateChrRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UpdateChrProvider._internal(
        (ref) => create(ref as UpdateChrRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        terminalid: terminalid,
        commodity: commodity,
        stackno: stackno,
        remark: remark,
        parameter: parameter,
        live: live,
        image: image,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<String, dynamic>> createElement() {
    return _UpdateChrProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateChrProvider &&
        other.terminalid == terminalid &&
        other.commodity == commodity &&
        other.stackno == stackno &&
        other.remark == remark &&
        other.parameter == parameter &&
        other.live == live &&
        other.image == image;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, terminalid.hashCode);
    hash = _SystemHash.combine(hash, commodity.hashCode);
    hash = _SystemHash.combine(hash, stackno.hashCode);
    hash = _SystemHash.combine(hash, remark.hashCode);
    hash = _SystemHash.combine(hash, parameter.hashCode);
    hash = _SystemHash.combine(hash, live.hashCode);
    hash = _SystemHash.combine(hash, image.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UpdateChrRef on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `terminalid` of this provider.
  String? get terminalid;

  /// The parameter `commodity` of this provider.
  String? get commodity;

  /// The parameter `stackno` of this provider.
  String? get stackno;

  /// The parameter `remark` of this provider.
  String? get remark;

  /// The parameter `parameter` of this provider.
  List<Map<String, dynamic>>? get parameter;

  /// The parameter `live` of this provider.
  String? get live;

  /// The parameter `image` of this provider.
  File? get image;
}

class _UpdateChrProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with UpdateChrRef {
  _UpdateChrProviderElement(super.provider);

  @override
  String? get terminalid => (origin as UpdateChrProvider).terminalid;
  @override
  String? get commodity => (origin as UpdateChrProvider).commodity;
  @override
  String? get stackno => (origin as UpdateChrProvider).stackno;
  @override
  String? get remark => (origin as UpdateChrProvider).remark;
  @override
  List<Map<String, dynamic>>? get parameter =>
      (origin as UpdateChrProvider).parameter;
  @override
  String? get live => (origin as UpdateChrProvider).live;
  @override
  File? get image => (origin as UpdateChrProvider).image;
}

String _$chrListHash() => r'75a4e4ade6023f72791f2e3e5de4d469c6a0bb81';

/// See also [chrList].
@ProviderFor(chrList)
final chrListProvider = AutoDisposeStreamProvider<ChrCleaningModal>.internal(
  chrList,
  name: r'chrListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$chrListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ChrListRef = AutoDisposeStreamProviderRef<ChrCleaningModal>;
String _$chrQualityPerameterHash() =>
    r'f437fb3f1a794a0e4d37b78dc06b5ecf4de53847';

/// See also [chrQualityPerameter].
@ProviderFor(chrQualityPerameter)
const chrQualityPerameterProvider = ChrQualityPerameterFamily();

/// See also [chrQualityPerameter].
class ChrQualityPerameterFamily
    extends Family<AsyncValue<ChrQualityPerameterModal>> {
  /// See also [chrQualityPerameter].
  const ChrQualityPerameterFamily();

  /// See also [chrQualityPerameter].
  ChrQualityPerameterProvider call({
    required String chrid,
  }) {
    return ChrQualityPerameterProvider(
      chrid: chrid,
    );
  }

  @override
  ChrQualityPerameterProvider getProviderOverride(
    covariant ChrQualityPerameterProvider provider,
  ) {
    return call(
      chrid: provider.chrid,
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
  String? get name => r'chrQualityPerameterProvider';
}

/// See also [chrQualityPerameter].
class ChrQualityPerameterProvider
    extends AutoDisposeFutureProvider<ChrQualityPerameterModal> {
  /// See also [chrQualityPerameter].
  ChrQualityPerameterProvider({
    required String chrid,
  }) : this._internal(
          (ref) => chrQualityPerameter(
            ref as ChrQualityPerameterRef,
            chrid: chrid,
          ),
          from: chrQualityPerameterProvider,
          name: r'chrQualityPerameterProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$chrQualityPerameterHash,
          dependencies: ChrQualityPerameterFamily._dependencies,
          allTransitiveDependencies:
              ChrQualityPerameterFamily._allTransitiveDependencies,
          chrid: chrid,
        );

  ChrQualityPerameterProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.chrid,
  }) : super.internal();

  final String chrid;

  @override
  Override overrideWith(
    FutureOr<ChrQualityPerameterModal> Function(ChrQualityPerameterRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ChrQualityPerameterProvider._internal(
        (ref) => create(ref as ChrQualityPerameterRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        chrid: chrid,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<ChrQualityPerameterModal> createElement() {
    return _ChrQualityPerameterProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ChrQualityPerameterProvider && other.chrid == chrid;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, chrid.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ChrQualityPerameterRef
    on AutoDisposeFutureProviderRef<ChrQualityPerameterModal> {
  /// The parameter `chrid` of this provider.
  String get chrid;
}

class _ChrQualityPerameterProviderElement
    extends AutoDisposeFutureProviderElement<ChrQualityPerameterModal>
    with ChrQualityPerameterRef {
  _ChrQualityPerameterProviderElement(super.provider);

  @override
  String get chrid => (origin as ChrQualityPerameterProvider).chrid;
}

String _$allTerminalListHash() => r'c401363dd0c310ef7456de0e98c534984bb50dae';

/// See also [allTerminalList].
@ProviderFor(allTerminalList)
final allTerminalListProvider =
    AutoDisposeStreamProvider<AllterminalList>.internal(
  allTerminalList,
  name: r'allTerminalListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$allTerminalListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AllTerminalListRef = AutoDisposeStreamProviderRef<AllterminalList>;
String _$allStackListHash() => r'c59c63e94dcb635bc08fe816da41704e61986b63';

/// See also [allStackList].
@ProviderFor(allStackList)
const allStackListProvider = AllStackListFamily();

/// See also [allStackList].
class AllStackListFamily extends Family<AsyncValue<StackNumberListModal>> {
  /// See also [allStackList].
  const AllStackListFamily();

  /// See also [allStackList].
  AllStackListProvider call({
    required String id,
  }) {
    return AllStackListProvider(
      id: id,
    );
  }

  @override
  AllStackListProvider getProviderOverride(
    covariant AllStackListProvider provider,
  ) {
    return call(
      id: provider.id,
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
  String? get name => r'allStackListProvider';
}

/// See also [allStackList].
class AllStackListProvider
    extends AutoDisposeStreamProvider<StackNumberListModal> {
  /// See also [allStackList].
  AllStackListProvider({
    required String id,
  }) : this._internal(
          (ref) => allStackList(
            ref as AllStackListRef,
            id: id,
          ),
          from: allStackListProvider,
          name: r'allStackListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$allStackListHash,
          dependencies: AllStackListFamily._dependencies,
          allTransitiveDependencies:
              AllStackListFamily._allTransitiveDependencies,
          id: id,
        );

  AllStackListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    Stream<StackNumberListModal> Function(AllStackListRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AllStackListProvider._internal(
        (ref) => create(ref as AllStackListRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<StackNumberListModal> createElement() {
    return _AllStackListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AllStackListProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AllStackListRef on AutoDisposeStreamProviderRef<StackNumberListModal> {
  /// The parameter `id` of this provider.
  String get id;
}

class _AllStackListProviderElement
    extends AutoDisposeStreamProviderElement<StackNumberListModal>
    with AllStackListRef {
  _AllStackListProviderElement(super.provider);

  @override
  String get id => (origin as AllStackListProvider).id;
}

String _$stackWiseCommdityHash() => r'33288d1faa2aaeb4eb70df51b5de51b008aecb63';

/// See also [stackWiseCommdity].
@ProviderFor(stackWiseCommdity)
const stackWiseCommdityProvider = StackWiseCommdityFamily();

/// See also [stackWiseCommdity].
class StackWiseCommdityFamily
    extends Family<AsyncValue<StackWiseCommdityModal>> {
  /// See also [stackWiseCommdity].
  const StackWiseCommdityFamily();

  /// See also [stackWiseCommdity].
  StackWiseCommdityProvider call({
    required String id,
    required String stackNo,
  }) {
    return StackWiseCommdityProvider(
      id: id,
      stackNo: stackNo,
    );
  }

  @override
  StackWiseCommdityProvider getProviderOverride(
    covariant StackWiseCommdityProvider provider,
  ) {
    return call(
      id: provider.id,
      stackNo: provider.stackNo,
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
  String? get name => r'stackWiseCommdityProvider';
}

/// See also [stackWiseCommdity].
class StackWiseCommdityProvider
    extends AutoDisposeStreamProvider<StackWiseCommdityModal> {
  /// See also [stackWiseCommdity].
  StackWiseCommdityProvider({
    required String id,
    required String stackNo,
  }) : this._internal(
          (ref) => stackWiseCommdity(
            ref as StackWiseCommdityRef,
            id: id,
            stackNo: stackNo,
          ),
          from: stackWiseCommdityProvider,
          name: r'stackWiseCommdityProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$stackWiseCommdityHash,
          dependencies: StackWiseCommdityFamily._dependencies,
          allTransitiveDependencies:
              StackWiseCommdityFamily._allTransitiveDependencies,
          id: id,
          stackNo: stackNo,
        );

  StackWiseCommdityProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
    required this.stackNo,
  }) : super.internal();

  final String id;
  final String stackNo;

  @override
  Override overrideWith(
    Stream<StackWiseCommdityModal> Function(StackWiseCommdityRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: StackWiseCommdityProvider._internal(
        (ref) => create(ref as StackWiseCommdityRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
        stackNo: stackNo,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<StackWiseCommdityModal> createElement() {
    return _StackWiseCommdityProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is StackWiseCommdityProvider &&
        other.id == id &&
        other.stackNo == stackNo;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);
    hash = _SystemHash.combine(hash, stackNo.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin StackWiseCommdityRef
    on AutoDisposeStreamProviderRef<StackWiseCommdityModal> {
  /// The parameter `id` of this provider.
  String get id;

  /// The parameter `stackNo` of this provider.
  String get stackNo;
}

class _StackWiseCommdityProviderElement
    extends AutoDisposeStreamProviderElement<StackWiseCommdityModal>
    with StackWiseCommdityRef {
  _StackWiseCommdityProviderElement(super.provider);

  @override
  String get id => (origin as StackWiseCommdityProvider).id;
  @override
  String get stackNo => (origin as StackWiseCommdityProvider).stackNo;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
