// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AuditService.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$addNeighbourHash() => r'9ae26fb58c41675444a940210c5dfa73a32d0cc6';

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

/// See also [addNeighbour].
@ProviderFor(addNeighbour)
const addNeighbourProvider = AddNeighbourFamily();

/// See also [addNeighbour].
class AddNeighbourFamily extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [addNeighbour].
  const AddNeighbourFamily();

  /// See also [addNeighbour].
  AddNeighbourProvider call({
    Addneighbourrequestmodel? model,
  }) {
    return AddNeighbourProvider(
      model: model,
    );
  }

  @override
  AddNeighbourProvider getProviderOverride(
    covariant AddNeighbourProvider provider,
  ) {
    return call(
      model: provider.model,
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
  String? get name => r'addNeighbourProvider';
}

/// See also [addNeighbour].
class AddNeighbourProvider
    extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [addNeighbour].
  AddNeighbourProvider({
    Addneighbourrequestmodel? model,
  }) : this._internal(
          (ref) => addNeighbour(
            ref as AddNeighbourRef,
            model: model,
          ),
          from: addNeighbourProvider,
          name: r'addNeighbourProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$addNeighbourHash,
          dependencies: AddNeighbourFamily._dependencies,
          allTransitiveDependencies:
              AddNeighbourFamily._allTransitiveDependencies,
          model: model,
        );

  AddNeighbourProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.model,
  }) : super.internal();

  final Addneighbourrequestmodel? model;

  @override
  Override overrideWith(
    FutureOr<Map<String, dynamic>> Function(AddNeighbourRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AddNeighbourProvider._internal(
        (ref) => create(ref as AddNeighbourRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        model: model,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<String, dynamic>> createElement() {
    return _AddNeighbourProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AddNeighbourProvider && other.model == model;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, model.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AddNeighbourRef on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `model` of this provider.
  Addneighbourrequestmodel? get model;
}

class _AddNeighbourProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with AddNeighbourRef {
  _AddNeighbourProviderElement(super.provider);

  @override
  Addneighbourrequestmodel? get model => (origin as AddNeighbourProvider).model;
}

String _$auditStacksHash() => r'ea7a8ae308858589a03af89876bc0e41b2f33eda';

/// See also [auditStacks].
@ProviderFor(auditStacks)
const auditStacksProvider = AuditStacksFamily();

/// See also [auditStacks].
class AuditStacksFamily extends Family<AsyncValue<AuditStackModel>> {
  /// See also [auditStacks].
  const AuditStacksFamily();

  /// See also [auditStacks].
  AuditStacksProvider call({
    required String? terminalId,
  }) {
    return AuditStacksProvider(
      terminalId: terminalId,
    );
  }

  @override
  AuditStacksProvider getProviderOverride(
    covariant AuditStacksProvider provider,
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
  String? get name => r'auditStacksProvider';
}

/// See also [auditStacks].
class AuditStacksProvider extends AutoDisposeStreamProvider<AuditStackModel> {
  /// See also [auditStacks].
  AuditStacksProvider({
    required String? terminalId,
  }) : this._internal(
          (ref) => auditStacks(
            ref as AuditStacksRef,
            terminalId: terminalId,
          ),
          from: auditStacksProvider,
          name: r'auditStacksProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$auditStacksHash,
          dependencies: AuditStacksFamily._dependencies,
          allTransitiveDependencies:
              AuditStacksFamily._allTransitiveDependencies,
          terminalId: terminalId,
        );

  AuditStacksProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.terminalId,
  }) : super.internal();

  final String? terminalId;

  @override
  Override overrideWith(
    Stream<AuditStackModel> Function(AuditStacksRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AuditStacksProvider._internal(
        (ref) => create(ref as AuditStacksRef),
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
  AutoDisposeStreamProviderElement<AuditStackModel> createElement() {
    return _AuditStacksProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AuditStacksProvider && other.terminalId == terminalId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, terminalId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AuditStacksRef on AutoDisposeStreamProviderRef<AuditStackModel> {
  /// The parameter `terminalId` of this provider.
  String? get terminalId;
}

class _AuditStacksProviderElement
    extends AutoDisposeStreamProviderElement<AuditStackModel>
    with AuditStacksRef {
  _AuditStacksProviderElement(super.provider);

  @override
  String? get terminalId => (origin as AuditStacksProvider).terminalId;
}

String _$completeauditHash() => r'041e3b965abe9ec640e5acc1ef4075ba3e607c04';

/// See also [completeaudit].
@ProviderFor(completeaudit)
final completeauditProvider = AutoDisposeStreamProvider<AuditModal>.internal(
  completeaudit,
  name: r'completeauditProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$completeauditHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CompleteauditRef = AutoDisposeStreamProviderRef<AuditModal>;
String _$activeAuditHash() => r'71eafa952d1347f1fbe63a46a2c03d112e686838';

/// See also [activeAudit].
@ProviderFor(activeAudit)
final activeAuditProvider =
    AutoDisposeStreamProvider<ActiveAuditModal>.internal(
  activeAudit,
  name: r'activeAuditProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$activeAuditHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ActiveAuditRef = AutoDisposeStreamProviderRef<ActiveAuditModal>;
String _$auditQualityParamsHash() =>
    r'63f1df582e33541c0f5590a6f4cde14f4eaa939d';

/// See also [auditQualityParams].
@ProviderFor(auditQualityParams)
const auditQualityParamsProvider = AuditQualityParamsFamily();

/// See also [auditQualityParams].
class AuditQualityParamsFamily extends Family<AsyncValue<AuditQualityModel>> {
  /// See also [auditQualityParams].
  const AuditQualityParamsFamily();

  /// See also [auditQualityParams].
  AuditQualityParamsProvider call({
    required String? commodityId,
  }) {
    return AuditQualityParamsProvider(
      commodityId: commodityId,
    );
  }

  @override
  AuditQualityParamsProvider getProviderOverride(
    covariant AuditQualityParamsProvider provider,
  ) {
    return call(
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
  String? get name => r'auditQualityParamsProvider';
}

/// See also [auditQualityParams].
class AuditQualityParamsProvider
    extends AutoDisposeStreamProvider<AuditQualityModel> {
  /// See also [auditQualityParams].
  AuditQualityParamsProvider({
    required String? commodityId,
  }) : this._internal(
          (ref) => auditQualityParams(
            ref as AuditQualityParamsRef,
            commodityId: commodityId,
          ),
          from: auditQualityParamsProvider,
          name: r'auditQualityParamsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$auditQualityParamsHash,
          dependencies: AuditQualityParamsFamily._dependencies,
          allTransitiveDependencies:
              AuditQualityParamsFamily._allTransitiveDependencies,
          commodityId: commodityId,
        );

  AuditQualityParamsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.commodityId,
  }) : super.internal();

  final String? commodityId;

  @override
  Override overrideWith(
    Stream<AuditQualityModel> Function(AuditQualityParamsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AuditQualityParamsProvider._internal(
        (ref) => create(ref as AuditQualityParamsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        commodityId: commodityId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<AuditQualityModel> createElement() {
    return _AuditQualityParamsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AuditQualityParamsProvider &&
        other.commodityId == commodityId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, commodityId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AuditQualityParamsRef on AutoDisposeStreamProviderRef<AuditQualityModel> {
  /// The parameter `commodityId` of this provider.
  String? get commodityId;
}

class _AuditQualityParamsProviderElement
    extends AutoDisposeStreamProviderElement<AuditQualityModel>
    with AuditQualityParamsRef {
  _AuditQualityParamsProviderElement(super.provider);

  @override
  String? get commodityId => (origin as AuditQualityParamsProvider).commodityId;
}

String _$postAuditQualityHash() => r'8e18b401dfb79eac481d8d906d264e6d1fa65aa1';

/// See also [postAuditQuality].
@ProviderFor(postAuditQuality)
const postAuditQualityProvider = PostAuditQualityFamily();

/// See also [postAuditQuality].
class PostAuditQualityFamily extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [postAuditQuality].
  const PostAuditQualityFamily();

  /// See also [postAuditQuality].
  PostAuditQualityProvider call({
    required AuditQvRequestModel model,
  }) {
    return PostAuditQualityProvider(
      model: model,
    );
  }

  @override
  PostAuditQualityProvider getProviderOverride(
    covariant PostAuditQualityProvider provider,
  ) {
    return call(
      model: provider.model,
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
  String? get name => r'postAuditQualityProvider';
}

/// See also [postAuditQuality].
class PostAuditQualityProvider
    extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [postAuditQuality].
  PostAuditQualityProvider({
    required AuditQvRequestModel model,
  }) : this._internal(
          (ref) => postAuditQuality(
            ref as PostAuditQualityRef,
            model: model,
          ),
          from: postAuditQualityProvider,
          name: r'postAuditQualityProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$postAuditQualityHash,
          dependencies: PostAuditQualityFamily._dependencies,
          allTransitiveDependencies:
              PostAuditQualityFamily._allTransitiveDependencies,
          model: model,
        );

  PostAuditQualityProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.model,
  }) : super.internal();

  final AuditQvRequestModel model;

  @override
  Override overrideWith(
    FutureOr<Map<String, dynamic>> Function(PostAuditQualityRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PostAuditQualityProvider._internal(
        (ref) => create(ref as PostAuditQualityRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        model: model,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<String, dynamic>> createElement() {
    return _PostAuditQualityProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PostAuditQualityProvider && other.model == model;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, model.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PostAuditQualityRef
    on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `model` of this provider.
  AuditQvRequestModel get model;
}

class _PostAuditQualityProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with PostAuditQualityRef {
  _PostAuditQualityProviderElement(super.provider);

  @override
  AuditQvRequestModel get model => (origin as PostAuditQualityProvider).model;
}

String _$postAuditPvHash() => r'cb24d8a2a5b90a927af8ab91150bef137f57b83a';

/// See also [postAuditPv].
@ProviderFor(postAuditPv)
const postAuditPvProvider = PostAuditPvFamily();

/// See also [postAuditPv].
class PostAuditPvFamily extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [postAuditPv].
  const PostAuditPvFamily();

  /// See also [postAuditPv].
  PostAuditPvProvider call({
    required Pvmodel model,
  }) {
    return PostAuditPvProvider(
      model: model,
    );
  }

  @override
  PostAuditPvProvider getProviderOverride(
    covariant PostAuditPvProvider provider,
  ) {
    return call(
      model: provider.model,
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
  String? get name => r'postAuditPvProvider';
}

/// See also [postAuditPv].
class PostAuditPvProvider
    extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [postAuditPv].
  PostAuditPvProvider({
    required Pvmodel model,
  }) : this._internal(
          (ref) => postAuditPv(
            ref as PostAuditPvRef,
            model: model,
          ),
          from: postAuditPvProvider,
          name: r'postAuditPvProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$postAuditPvHash,
          dependencies: PostAuditPvFamily._dependencies,
          allTransitiveDependencies:
              PostAuditPvFamily._allTransitiveDependencies,
          model: model,
        );

  PostAuditPvProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.model,
  }) : super.internal();

  final Pvmodel model;

  @override
  Override overrideWith(
    FutureOr<Map<String, dynamic>> Function(PostAuditPvRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PostAuditPvProvider._internal(
        (ref) => create(ref as PostAuditPvRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        model: model,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<String, dynamic>> createElement() {
    return _PostAuditPvProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PostAuditPvProvider && other.model == model;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, model.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PostAuditPvRef on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `model` of this provider.
  Pvmodel get model;
}

class _PostAuditPvProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with PostAuditPvRef {
  _PostAuditPvProviderElement(super.provider);

  @override
  Pvmodel get model => (origin as PostAuditPvProvider).model;
}

String _$cancelAuditHash() => r'de19b3875c77626abc626a2aa8bf48bc7dbe51b3';

/// See also [cancelAudit].
@ProviderFor(cancelAudit)
const cancelAuditProvider = CancelAuditFamily();

/// See also [cancelAudit].
class CancelAuditFamily extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [cancelAudit].
  const CancelAuditFamily();

  /// See also [cancelAudit].
  CancelAuditProvider call({
    String? id,
    String? remark,
  }) {
    return CancelAuditProvider(
      id: id,
      remark: remark,
    );
  }

  @override
  CancelAuditProvider getProviderOverride(
    covariant CancelAuditProvider provider,
  ) {
    return call(
      id: provider.id,
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
  String? get name => r'cancelAuditProvider';
}

/// See also [cancelAudit].
class CancelAuditProvider
    extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [cancelAudit].
  CancelAuditProvider({
    String? id,
    String? remark,
  }) : this._internal(
          (ref) => cancelAudit(
            ref as CancelAuditRef,
            id: id,
            remark: remark,
          ),
          from: cancelAuditProvider,
          name: r'cancelAuditProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$cancelAuditHash,
          dependencies: CancelAuditFamily._dependencies,
          allTransitiveDependencies:
              CancelAuditFamily._allTransitiveDependencies,
          id: id,
          remark: remark,
        );

  CancelAuditProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
    required this.remark,
  }) : super.internal();

  final String? id;
  final String? remark;

  @override
  Override overrideWith(
    FutureOr<Map<String, dynamic>> Function(CancelAuditRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CancelAuditProvider._internal(
        (ref) => create(ref as CancelAuditRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
        remark: remark,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<String, dynamic>> createElement() {
    return _CancelAuditProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CancelAuditProvider &&
        other.id == id &&
        other.remark == remark;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);
    hash = _SystemHash.combine(hash, remark.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CancelAuditRef on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `id` of this provider.
  String? get id;

  /// The parameter `remark` of this provider.
  String? get remark;
}

class _CancelAuditProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with CancelAuditRef {
  _CancelAuditProviderElement(super.provider);

  @override
  String? get id => (origin as CancelAuditProvider).id;
  @override
  String? get remark => (origin as CancelAuditProvider).remark;
}

String _$endAuditHash() => r'beddc9ae5dd3a52d7d01a5d589d654c000ddc976';

/// See also [endAudit].
@ProviderFor(endAudit)
const endAuditProvider = EndAuditFamily();

/// See also [endAudit].
class EndAuditFamily extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [endAudit].
  const EndAuditFamily();

  /// See also [endAudit].
  EndAuditProvider call({
    String? id,
  }) {
    return EndAuditProvider(
      id: id,
    );
  }

  @override
  EndAuditProvider getProviderOverride(
    covariant EndAuditProvider provider,
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
  String? get name => r'endAuditProvider';
}

/// See also [endAudit].
class EndAuditProvider extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [endAudit].
  EndAuditProvider({
    String? id,
  }) : this._internal(
          (ref) => endAudit(
            ref as EndAuditRef,
            id: id,
          ),
          from: endAuditProvider,
          name: r'endAuditProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$endAuditHash,
          dependencies: EndAuditFamily._dependencies,
          allTransitiveDependencies: EndAuditFamily._allTransitiveDependencies,
          id: id,
        );

  EndAuditProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String? id;

  @override
  Override overrideWith(
    FutureOr<Map<String, dynamic>> Function(EndAuditRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: EndAuditProvider._internal(
        (ref) => create(ref as EndAuditRef),
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
  AutoDisposeFutureProviderElement<Map<String, dynamic>> createElement() {
    return _EndAuditProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is EndAuditProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin EndAuditRef on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `id` of this provider.
  String? get id;
}

class _EndAuditProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with EndAuditRef {
  _EndAuditProviderElement(super.provider);

  @override
  String? get id => (origin as EndAuditProvider).id;
}

String _$stackAuditHash() => r'50f384971b4b1877480f59fa7d8a81cc306090f3';

/// See also [stackAudit].
@ProviderFor(stackAudit)
final stackAuditProvider = AutoDisposeStreamProvider<StackAuditModal>.internal(
  stackAudit,
  name: r'stackAuditProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$stackAuditHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef StackAuditRef = AutoDisposeStreamProviderRef<StackAuditModal>;
String _$showStackAuditHash() => r'afbcd141c95ec03a1c6fe45ca4a2640741158107';

/// See also [showStackAudit].
@ProviderFor(showStackAudit)
const showStackAuditProvider = ShowStackAuditFamily();

/// See also [showStackAudit].
class ShowStackAuditFamily extends Family<AsyncValue<ShowStackAuditModal>> {
  /// See also [showStackAudit].
  const ShowStackAuditFamily();

  /// See also [showStackAudit].
  ShowStackAuditProvider call({
    required String? Id,
  }) {
    return ShowStackAuditProvider(
      Id: Id,
    );
  }

  @override
  ShowStackAuditProvider getProviderOverride(
    covariant ShowStackAuditProvider provider,
  ) {
    return call(
      Id: provider.Id,
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
  String? get name => r'showStackAuditProvider';
}

/// See also [showStackAudit].
class ShowStackAuditProvider
    extends AutoDisposeStreamProvider<ShowStackAuditModal> {
  /// See also [showStackAudit].
  ShowStackAuditProvider({
    required String? Id,
  }) : this._internal(
          (ref) => showStackAudit(
            ref as ShowStackAuditRef,
            Id: Id,
          ),
          from: showStackAuditProvider,
          name: r'showStackAuditProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$showStackAuditHash,
          dependencies: ShowStackAuditFamily._dependencies,
          allTransitiveDependencies:
              ShowStackAuditFamily._allTransitiveDependencies,
          Id: Id,
        );

  ShowStackAuditProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.Id,
  }) : super.internal();

  final String? Id;

  @override
  Override overrideWith(
    Stream<ShowStackAuditModal> Function(ShowStackAuditRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ShowStackAuditProvider._internal(
        (ref) => create(ref as ShowStackAuditRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        Id: Id,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<ShowStackAuditModal> createElement() {
    return _ShowStackAuditProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ShowStackAuditProvider && other.Id == Id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, Id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ShowStackAuditRef on AutoDisposeStreamProviderRef<ShowStackAuditModal> {
  /// The parameter `Id` of this provider.
  String? get Id;
}

class _ShowStackAuditProviderElement
    extends AutoDisposeStreamProviderElement<ShowStackAuditModal>
    with ShowStackAuditRef {
  _ShowStackAuditProviderElement(super.provider);

  @override
  String? get Id => (origin as ShowStackAuditProvider).Id;
}

String _$showQualityStacksHash() => r'd4269109520c3dfa37a24efcc6d5f3211cbf2477';

/// See also [showQualityStacks].
@ProviderFor(showQualityStacks)
const showQualityStacksProvider = ShowQualityStacksFamily();

/// See also [showQualityStacks].
class ShowQualityStacksFamily extends Family<AsyncValue<ShowStackAuditModal>> {
  /// See also [showQualityStacks].
  const ShowQualityStacksFamily();

  /// See also [showQualityStacks].
  ShowQualityStacksProvider call({
    required String? auditId,
  }) {
    return ShowQualityStacksProvider(
      auditId: auditId,
    );
  }

  @override
  ShowQualityStacksProvider getProviderOverride(
    covariant ShowQualityStacksProvider provider,
  ) {
    return call(
      auditId: provider.auditId,
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
  String? get name => r'showQualityStacksProvider';
}

/// See also [showQualityStacks].
class ShowQualityStacksProvider
    extends AutoDisposeStreamProvider<ShowStackAuditModal> {
  /// See also [showQualityStacks].
  ShowQualityStacksProvider({
    required String? auditId,
  }) : this._internal(
          (ref) => showQualityStacks(
            ref as ShowQualityStacksRef,
            auditId: auditId,
          ),
          from: showQualityStacksProvider,
          name: r'showQualityStacksProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$showQualityStacksHash,
          dependencies: ShowQualityStacksFamily._dependencies,
          allTransitiveDependencies:
              ShowQualityStacksFamily._allTransitiveDependencies,
          auditId: auditId,
        );

  ShowQualityStacksProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.auditId,
  }) : super.internal();

  final String? auditId;

  @override
  Override overrideWith(
    Stream<ShowStackAuditModal> Function(ShowQualityStacksRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ShowQualityStacksProvider._internal(
        (ref) => create(ref as ShowQualityStacksRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        auditId: auditId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<ShowStackAuditModal> createElement() {
    return _ShowQualityStacksProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ShowQualityStacksProvider && other.auditId == auditId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, auditId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ShowQualityStacksRef
    on AutoDisposeStreamProviderRef<ShowStackAuditModal> {
  /// The parameter `auditId` of this provider.
  String? get auditId;
}

class _ShowQualityStacksProviderElement
    extends AutoDisposeStreamProviderElement<ShowStackAuditModal>
    with ShowQualityStacksRef {
  _ShowQualityStacksProviderElement(super.provider);

  @override
  String? get auditId => (origin as ShowQualityStacksProvider).auditId;
}

String _$commdityAuditQualityHash() =>
    r'7cd5978618ffea7f17c5c259601975391706fa30';

/// See also [commdityAuditQuality].
@ProviderFor(commdityAuditQuality)
const commdityAuditQualityProvider = CommdityAuditQualityFamily();

/// See also [commdityAuditQuality].
class CommdityAuditQualityFamily
    extends Family<AsyncValue<CommdityAuditModal>> {
  /// See also [commdityAuditQuality].
  const CommdityAuditQualityFamily();

  /// See also [commdityAuditQuality].
  CommdityAuditQualityProvider call({
    required String? id,
    required String? stackNo,
  }) {
    return CommdityAuditQualityProvider(
      id: id,
      stackNo: stackNo,
    );
  }

  @override
  CommdityAuditQualityProvider getProviderOverride(
    covariant CommdityAuditQualityProvider provider,
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
  String? get name => r'commdityAuditQualityProvider';
}

/// See also [commdityAuditQuality].
class CommdityAuditQualityProvider
    extends AutoDisposeStreamProvider<CommdityAuditModal> {
  /// See also [commdityAuditQuality].
  CommdityAuditQualityProvider({
    required String? id,
    required String? stackNo,
  }) : this._internal(
          (ref) => commdityAuditQuality(
            ref as CommdityAuditQualityRef,
            id: id,
            stackNo: stackNo,
          ),
          from: commdityAuditQualityProvider,
          name: r'commdityAuditQualityProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$commdityAuditQualityHash,
          dependencies: CommdityAuditQualityFamily._dependencies,
          allTransitiveDependencies:
              CommdityAuditQualityFamily._allTransitiveDependencies,
          id: id,
          stackNo: stackNo,
        );

  CommdityAuditQualityProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
    required this.stackNo,
  }) : super.internal();

  final String? id;
  final String? stackNo;

  @override
  Override overrideWith(
    Stream<CommdityAuditModal> Function(CommdityAuditQualityRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CommdityAuditQualityProvider._internal(
        (ref) => create(ref as CommdityAuditQualityRef),
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
  AutoDisposeStreamProviderElement<CommdityAuditModal> createElement() {
    return _CommdityAuditQualityProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CommdityAuditQualityProvider &&
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

mixin CommdityAuditQualityRef
    on AutoDisposeStreamProviderRef<CommdityAuditModal> {
  /// The parameter `id` of this provider.
  String? get id;

  /// The parameter `stackNo` of this provider.
  String? get stackNo;
}

class _CommdityAuditQualityProviderElement
    extends AutoDisposeStreamProviderElement<CommdityAuditModal>
    with CommdityAuditQualityRef {
  _CommdityAuditQualityProviderElement(super.provider);

  @override
  String? get id => (origin as CommdityAuditQualityProvider).id;
  @override
  String? get stackNo => (origin as CommdityAuditQualityProvider).stackNo;
}

String _$commdityParametersHash() =>
    r'4597961eb4f14c90cf6c67e1f164ea65897bd173';

/// See also [commdityParameters].
@ProviderFor(commdityParameters)
const commdityParametersProvider = CommdityParametersFamily();

/// See also [commdityParameters].
class CommdityParametersFamily
    extends Family<AsyncValue<CommdityParametersModal>> {
  /// See also [commdityParameters].
  const CommdityParametersFamily();

  /// See also [commdityParameters].
  CommdityParametersProvider call({
    required String? id,
  }) {
    return CommdityParametersProvider(
      id: id,
    );
  }

  @override
  CommdityParametersProvider getProviderOverride(
    covariant CommdityParametersProvider provider,
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
  String? get name => r'commdityParametersProvider';
}

/// See also [commdityParameters].
class CommdityParametersProvider
    extends AutoDisposeStreamProvider<CommdityParametersModal> {
  /// See also [commdityParameters].
  CommdityParametersProvider({
    required String? id,
  }) : this._internal(
          (ref) => commdityParameters(
            ref as CommdityParametersRef,
            id: id,
          ),
          from: commdityParametersProvider,
          name: r'commdityParametersProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$commdityParametersHash,
          dependencies: CommdityParametersFamily._dependencies,
          allTransitiveDependencies:
              CommdityParametersFamily._allTransitiveDependencies,
          id: id,
        );

  CommdityParametersProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String? id;

  @override
  Override overrideWith(
    Stream<CommdityParametersModal> Function(CommdityParametersRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CommdityParametersProvider._internal(
        (ref) => create(ref as CommdityParametersRef),
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
  AutoDisposeStreamProviderElement<CommdityParametersModal> createElement() {
    return _CommdityParametersProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CommdityParametersProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CommdityParametersRef
    on AutoDisposeStreamProviderRef<CommdityParametersModal> {
  /// The parameter `id` of this provider.
  String? get id;
}

class _CommdityParametersProviderElement
    extends AutoDisposeStreamProviderElement<CommdityParametersModal>
    with CommdityParametersRef {
  _CommdityParametersProviderElement(super.provider);

  @override
  String? get id => (origin as CommdityParametersProvider).id;
}

String _$auditQualityUpdateHash() =>
    r'52a3a353a73c8e70a5528edb70c0164929773a68';

/// See also [auditQualityUpdate].
@ProviderFor(auditQualityUpdate)
const auditQualityUpdateProvider = AuditQualityUpdateFamily();

/// See also [auditQualityUpdate].
class AuditQualityUpdateFamily
    extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [auditQualityUpdate].
  const AuditQualityUpdateFamily();

  /// See also [auditQualityUpdate].
  AuditQualityUpdateProvider call({
    required AuditQualityRequestModel model,
  }) {
    return AuditQualityUpdateProvider(
      model: model,
    );
  }

  @override
  AuditQualityUpdateProvider getProviderOverride(
    covariant AuditQualityUpdateProvider provider,
  ) {
    return call(
      model: provider.model,
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
  String? get name => r'auditQualityUpdateProvider';
}

/// See also [auditQualityUpdate].
class AuditQualityUpdateProvider
    extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [auditQualityUpdate].
  AuditQualityUpdateProvider({
    required AuditQualityRequestModel model,
  }) : this._internal(
          (ref) => auditQualityUpdate(
            ref as AuditQualityUpdateRef,
            model: model,
          ),
          from: auditQualityUpdateProvider,
          name: r'auditQualityUpdateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$auditQualityUpdateHash,
          dependencies: AuditQualityUpdateFamily._dependencies,
          allTransitiveDependencies:
              AuditQualityUpdateFamily._allTransitiveDependencies,
          model: model,
        );

  AuditQualityUpdateProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.model,
  }) : super.internal();

  final AuditQualityRequestModel model;

  @override
  Override overrideWith(
    FutureOr<Map<String, dynamic>> Function(AuditQualityUpdateRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AuditQualityUpdateProvider._internal(
        (ref) => create(ref as AuditQualityUpdateRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        model: model,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<String, dynamic>> createElement() {
    return _AuditQualityUpdateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AuditQualityUpdateProvider && other.model == model;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, model.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AuditQualityUpdateRef
    on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `model` of this provider.
  AuditQualityRequestModel get model;
}

class _AuditQualityUpdateProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with AuditQualityUpdateRef {
  _AuditQualityUpdateProviderElement(super.provider);

  @override
  AuditQualityRequestModel get model =>
      (origin as AuditQualityUpdateProvider).model;
}

String _$postPVStackAuditHash() => r'8bdbe565b2b17e345dfadcee73f526749ffca010';

/// See also [postPVStackAudit].
@ProviderFor(postPVStackAudit)
const postPVStackAuditProvider = PostPVStackAuditFamily();

/// See also [postPVStackAudit].
class PostPVStackAuditFamily extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [postPVStackAudit].
  const PostPVStackAuditFamily();

  /// See also [postPVStackAudit].
  PostPVStackAuditProvider call({
    required Pvmodel model,
  }) {
    return PostPVStackAuditProvider(
      model: model,
    );
  }

  @override
  PostPVStackAuditProvider getProviderOverride(
    covariant PostPVStackAuditProvider provider,
  ) {
    return call(
      model: provider.model,
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
  String? get name => r'postPVStackAuditProvider';
}

/// See also [postPVStackAudit].
class PostPVStackAuditProvider
    extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [postPVStackAudit].
  PostPVStackAuditProvider({
    required Pvmodel model,
  }) : this._internal(
          (ref) => postPVStackAudit(
            ref as PostPVStackAuditRef,
            model: model,
          ),
          from: postPVStackAuditProvider,
          name: r'postPVStackAuditProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$postPVStackAuditHash,
          dependencies: PostPVStackAuditFamily._dependencies,
          allTransitiveDependencies:
              PostPVStackAuditFamily._allTransitiveDependencies,
          model: model,
        );

  PostPVStackAuditProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.model,
  }) : super.internal();

  final Pvmodel model;

  @override
  Override overrideWith(
    FutureOr<Map<String, dynamic>> Function(PostPVStackAuditRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PostPVStackAuditProvider._internal(
        (ref) => create(ref as PostPVStackAuditRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        model: model,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<String, dynamic>> createElement() {
    return _PostPVStackAuditProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PostPVStackAuditProvider && other.model == model;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, model.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PostPVStackAuditRef
    on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `model` of this provider.
  Pvmodel get model;
}

class _PostPVStackAuditProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with PostPVStackAuditRef {
  _PostPVStackAuditProviderElement(super.provider);

  @override
  Pvmodel get model => (origin as PostPVStackAuditProvider).model;
}

String _$postStackQualityAuditHash() =>
    r'95c9b82e9f666e79a85ffa63eda66a62b949e0cd';

/// See also [postStackQualityAudit].
@ProviderFor(postStackQualityAudit)
const postStackQualityAuditProvider = PostStackQualityAuditFamily();

/// See also [postStackQualityAudit].
class PostStackQualityAuditFamily
    extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [postStackQualityAudit].
  const PostStackQualityAuditFamily();

  /// See also [postStackQualityAudit].
  PostStackQualityAuditProvider call({
    required StackSaveSummaryModal model,
  }) {
    return PostStackQualityAuditProvider(
      model: model,
    );
  }

  @override
  PostStackQualityAuditProvider getProviderOverride(
    covariant PostStackQualityAuditProvider provider,
  ) {
    return call(
      model: provider.model,
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
  String? get name => r'postStackQualityAuditProvider';
}

/// See also [postStackQualityAudit].
class PostStackQualityAuditProvider
    extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [postStackQualityAudit].
  PostStackQualityAuditProvider({
    required StackSaveSummaryModal model,
  }) : this._internal(
          (ref) => postStackQualityAudit(
            ref as PostStackQualityAuditRef,
            model: model,
          ),
          from: postStackQualityAuditProvider,
          name: r'postStackQualityAuditProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$postStackQualityAuditHash,
          dependencies: PostStackQualityAuditFamily._dependencies,
          allTransitiveDependencies:
              PostStackQualityAuditFamily._allTransitiveDependencies,
          model: model,
        );

  PostStackQualityAuditProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.model,
  }) : super.internal();

  final StackSaveSummaryModal model;

  @override
  Override overrideWith(
    FutureOr<Map<String, dynamic>> Function(PostStackQualityAuditRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PostStackQualityAuditProvider._internal(
        (ref) => create(ref as PostStackQualityAuditRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        model: model,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<String, dynamic>> createElement() {
    return _PostStackQualityAuditProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PostStackQualityAuditProvider && other.model == model;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, model.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PostStackQualityAuditRef
    on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `model` of this provider.
  StackSaveSummaryModal get model;
}

class _PostStackQualityAuditProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with PostStackQualityAuditRef {
  _PostStackQualityAuditProviderElement(super.provider);

  @override
  StackSaveSummaryModal get model =>
      (origin as PostStackQualityAuditProvider).model;
}

String _$getStackAuditListHash() => r'7a66b05c69db2ec658d2c2778adfd8378a8b158e';

/// See also [getStackAuditList].
@ProviderFor(getStackAuditList)
final getStackAuditListProvider =
    AutoDisposeStreamProvider<StackAuditListmodal>.internal(
  getStackAuditList,
  name: r'getStackAuditListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getStackAuditListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetStackAuditListRef
    = AutoDisposeStreamProviderRef<StackAuditListmodal>;
String _$getAuditStackEditBagHash() =>
    r'bb1177a381994f5732c30b9ada356a33a9531943';

/// See also [getAuditStackEditBag].
@ProviderFor(getAuditStackEditBag)
const getAuditStackEditBagProvider = GetAuditStackEditBagFamily();

/// See also [getAuditStackEditBag].
class GetAuditStackEditBagFamily
    extends Family<AsyncValue<AuditStackbagEditModal>> {
  /// See also [getAuditStackEditBag].
  const GetAuditStackEditBagFamily();

  /// See also [getAuditStackEditBag].
  GetAuditStackEditBagProvider call({
    required String? id,
  }) {
    return GetAuditStackEditBagProvider(
      id: id,
    );
  }

  @override
  GetAuditStackEditBagProvider getProviderOverride(
    covariant GetAuditStackEditBagProvider provider,
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
  String? get name => r'getAuditStackEditBagProvider';
}

/// See also [getAuditStackEditBag].
class GetAuditStackEditBagProvider
    extends AutoDisposeStreamProvider<AuditStackbagEditModal> {
  /// See also [getAuditStackEditBag].
  GetAuditStackEditBagProvider({
    required String? id,
  }) : this._internal(
          (ref) => getAuditStackEditBag(
            ref as GetAuditStackEditBagRef,
            id: id,
          ),
          from: getAuditStackEditBagProvider,
          name: r'getAuditStackEditBagProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getAuditStackEditBagHash,
          dependencies: GetAuditStackEditBagFamily._dependencies,
          allTransitiveDependencies:
              GetAuditStackEditBagFamily._allTransitiveDependencies,
          id: id,
        );

  GetAuditStackEditBagProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String? id;

  @override
  Override overrideWith(
    Stream<AuditStackbagEditModal> Function(GetAuditStackEditBagRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetAuditStackEditBagProvider._internal(
        (ref) => create(ref as GetAuditStackEditBagRef),
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
  AutoDisposeStreamProviderElement<AuditStackbagEditModal> createElement() {
    return _GetAuditStackEditBagProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetAuditStackEditBagProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetAuditStackEditBagRef
    on AutoDisposeStreamProviderRef<AuditStackbagEditModal> {
  /// The parameter `id` of this provider.
  String? get id;
}

class _GetAuditStackEditBagProviderElement
    extends AutoDisposeStreamProviderElement<AuditStackbagEditModal>
    with GetAuditStackEditBagRef {
  _GetAuditStackEditBagProviderElement(super.provider);

  @override
  String? get id => (origin as GetAuditStackEditBagProvider).id;
}

String _$getAuditStackListHash() => r'9299955ff629c0409bd31b0ff19ac38e29eeaf05';

/// See also [getAuditStackList].
@ProviderFor(getAuditStackList)
const getAuditStackListProvider = GetAuditStackListFamily();

/// See also [getAuditStackList].
class GetAuditStackListFamily extends Family<AsyncValue<AuditStackListModal>> {
  /// See also [getAuditStackList].
  const GetAuditStackListFamily();

  /// See also [getAuditStackList].
  GetAuditStackListProvider call({
    required String? id,
  }) {
    return GetAuditStackListProvider(
      id: id,
    );
  }

  @override
  GetAuditStackListProvider getProviderOverride(
    covariant GetAuditStackListProvider provider,
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
  String? get name => r'getAuditStackListProvider';
}

/// See also [getAuditStackList].
class GetAuditStackListProvider
    extends AutoDisposeStreamProvider<AuditStackListModal> {
  /// See also [getAuditStackList].
  GetAuditStackListProvider({
    required String? id,
  }) : this._internal(
          (ref) => getAuditStackList(
            ref as GetAuditStackListRef,
            id: id,
          ),
          from: getAuditStackListProvider,
          name: r'getAuditStackListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getAuditStackListHash,
          dependencies: GetAuditStackListFamily._dependencies,
          allTransitiveDependencies:
              GetAuditStackListFamily._allTransitiveDependencies,
          id: id,
        );

  GetAuditStackListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String? id;

  @override
  Override overrideWith(
    Stream<AuditStackListModal> Function(GetAuditStackListRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetAuditStackListProvider._internal(
        (ref) => create(ref as GetAuditStackListRef),
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
  AutoDisposeStreamProviderElement<AuditStackListModal> createElement() {
    return _GetAuditStackListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetAuditStackListProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetAuditStackListRef
    on AutoDisposeStreamProviderRef<AuditStackListModal> {
  /// The parameter `id` of this provider.
  String? get id;
}

class _GetAuditStackListProviderElement
    extends AutoDisposeStreamProviderElement<AuditStackListModal>
    with GetAuditStackListRef {
  _GetAuditStackListProviderElement(super.provider);

  @override
  String? get id => (origin as GetAuditStackListProvider).id;
}

String _$getStartAuditHash() => r'b053b392d97cce2216c37aac52694ab095251758';

/// See also [getStartAudit].
@ProviderFor(getStartAudit)
final getStartAuditProvider =
    AutoDisposeStreamProvider<AuditStartModal>.internal(
  getStartAudit,
  name: r'getStartAuditProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getStartAuditHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetStartAuditRef = AutoDisposeStreamProviderRef<AuditStartModal>;
String _$postStartAuditStackHash() =>
    r'96113c4691a8aa4f9a6ba1120cbcc4028d7358c7';

/// See also [postStartAuditStack].
@ProviderFor(postStartAuditStack)
const postStartAuditStackProvider = PostStartAuditStackFamily();

/// See also [postStartAuditStack].
class PostStartAuditStackFamily
    extends Family<AsyncValue<UpdateStartAuditStackModal>> {
  /// See also [postStartAuditStack].
  const PostStartAuditStackFamily();

  /// See also [postStartAuditStack].
  PostStartAuditStackProvider call({
    required String? terminalId,
  }) {
    return PostStartAuditStackProvider(
      terminalId: terminalId,
    );
  }

  @override
  PostStartAuditStackProvider getProviderOverride(
    covariant PostStartAuditStackProvider provider,
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
  String? get name => r'postStartAuditStackProvider';
}

/// See also [postStartAuditStack].
class PostStartAuditStackProvider
    extends AutoDisposeStreamProvider<UpdateStartAuditStackModal> {
  /// See also [postStartAuditStack].
  PostStartAuditStackProvider({
    required String? terminalId,
  }) : this._internal(
          (ref) => postStartAuditStack(
            ref as PostStartAuditStackRef,
            terminalId: terminalId,
          ),
          from: postStartAuditStackProvider,
          name: r'postStartAuditStackProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$postStartAuditStackHash,
          dependencies: PostStartAuditStackFamily._dependencies,
          allTransitiveDependencies:
              PostStartAuditStackFamily._allTransitiveDependencies,
          terminalId: terminalId,
        );

  PostStartAuditStackProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.terminalId,
  }) : super.internal();

  final String? terminalId;

  @override
  Override overrideWith(
    Stream<UpdateStartAuditStackModal> Function(PostStartAuditStackRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PostStartAuditStackProvider._internal(
        (ref) => create(ref as PostStartAuditStackRef),
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
  AutoDisposeStreamProviderElement<UpdateStartAuditStackModal> createElement() {
    return _PostStartAuditStackProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PostStartAuditStackProvider &&
        other.terminalId == terminalId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, terminalId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PostStartAuditStackRef
    on AutoDisposeStreamProviderRef<UpdateStartAuditStackModal> {
  /// The parameter `terminalId` of this provider.
  String? get terminalId;
}

class _PostStartAuditStackProviderElement
    extends AutoDisposeStreamProviderElement<UpdateStartAuditStackModal>
    with PostStartAuditStackRef {
  _PostStartAuditStackProviderElement(super.provider);

  @override
  String? get terminalId => (origin as PostStartAuditStackProvider).terminalId;
}

String _$postCCTVAuditHash() => r'acb9f9ece62c302571c964981f38384c6039b725';

/// See also [postCCTVAudit].
@ProviderFor(postCCTVAudit)
const postCCTVAuditProvider = PostCCTVAuditFamily();

/// See also [postCCTVAudit].
class PostCCTVAuditFamily extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [postCCTVAudit].
  const PostCCTVAuditFamily();

  /// See also [postCCTVAudit].
  PostCCTVAuditProvider call({
    required CctvAuditModal model,
  }) {
    return PostCCTVAuditProvider(
      model: model,
    );
  }

  @override
  PostCCTVAuditProvider getProviderOverride(
    covariant PostCCTVAuditProvider provider,
  ) {
    return call(
      model: provider.model,
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
  String? get name => r'postCCTVAuditProvider';
}

/// See also [postCCTVAudit].
class PostCCTVAuditProvider
    extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [postCCTVAudit].
  PostCCTVAuditProvider({
    required CctvAuditModal model,
  }) : this._internal(
          (ref) => postCCTVAudit(
            ref as PostCCTVAuditRef,
            model: model,
          ),
          from: postCCTVAuditProvider,
          name: r'postCCTVAuditProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$postCCTVAuditHash,
          dependencies: PostCCTVAuditFamily._dependencies,
          allTransitiveDependencies:
              PostCCTVAuditFamily._allTransitiveDependencies,
          model: model,
        );

  PostCCTVAuditProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.model,
  }) : super.internal();

  final CctvAuditModal model;

  @override
  Override overrideWith(
    FutureOr<Map<String, dynamic>> Function(PostCCTVAuditRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PostCCTVAuditProvider._internal(
        (ref) => create(ref as PostCCTVAuditRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        model: model,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<String, dynamic>> createElement() {
    return _PostCCTVAuditProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PostCCTVAuditProvider && other.model == model;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, model.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PostCCTVAuditRef on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `model` of this provider.
  CctvAuditModal get model;
}

class _PostCCTVAuditProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with PostCCTVAuditRef {
  _PostCCTVAuditProviderElement(super.provider);

  @override
  CctvAuditModal get model => (origin as PostCCTVAuditProvider).model;
}

String _$postLockAndKeyHash() => r'6ac5ab95ac9b08bb842d21694554283fc763fb41';

/// See also [postLockAndKey].
@ProviderFor(postLockAndKey)
const postLockAndKeyProvider = PostLockAndKeyFamily();

/// See also [postLockAndKey].
class PostLockAndKeyFamily extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [postLockAndKey].
  const PostLockAndKeyFamily();

  /// See also [postLockAndKey].
  PostLockAndKeyProvider call({
    required LockAndKeyModal model,
  }) {
    return PostLockAndKeyProvider(
      model: model,
    );
  }

  @override
  PostLockAndKeyProvider getProviderOverride(
    covariant PostLockAndKeyProvider provider,
  ) {
    return call(
      model: provider.model,
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
  String? get name => r'postLockAndKeyProvider';
}

/// See also [postLockAndKey].
class PostLockAndKeyProvider
    extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [postLockAndKey].
  PostLockAndKeyProvider({
    required LockAndKeyModal model,
  }) : this._internal(
          (ref) => postLockAndKey(
            ref as PostLockAndKeyRef,
            model: model,
          ),
          from: postLockAndKeyProvider,
          name: r'postLockAndKeyProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$postLockAndKeyHash,
          dependencies: PostLockAndKeyFamily._dependencies,
          allTransitiveDependencies:
              PostLockAndKeyFamily._allTransitiveDependencies,
          model: model,
        );

  PostLockAndKeyProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.model,
  }) : super.internal();

  final LockAndKeyModal model;

  @override
  Override overrideWith(
    FutureOr<Map<String, dynamic>> Function(PostLockAndKeyRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PostLockAndKeyProvider._internal(
        (ref) => create(ref as PostLockAndKeyRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        model: model,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<String, dynamic>> createElement() {
    return _PostLockAndKeyProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PostLockAndKeyProvider && other.model == model;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, model.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PostLockAndKeyRef on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `model` of this provider.
  LockAndKeyModal get model;
}

class _PostLockAndKeyProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with PostLockAndKeyRef {
  _PostLockAndKeyProviderElement(super.provider);

  @override
  LockAndKeyModal get model => (origin as PostLockAndKeyProvider).model;
}

String _$postFumigationUpdateHash() =>
    r'2ae3def5c886ada4b8854406b0571543a7f9db49';

/// See also [postFumigationUpdate].
@ProviderFor(postFumigationUpdate)
const postFumigationUpdateProvider = PostFumigationUpdateFamily();

/// See also [postFumigationUpdate].
class PostFumigationUpdateFamily
    extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [postFumigationUpdate].
  const PostFumigationUpdateFamily();

  /// See also [postFumigationUpdate].
  PostFumigationUpdateProvider call({
    required FumigatonAuditModal model,
  }) {
    return PostFumigationUpdateProvider(
      model: model,
    );
  }

  @override
  PostFumigationUpdateProvider getProviderOverride(
    covariant PostFumigationUpdateProvider provider,
  ) {
    return call(
      model: provider.model,
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
  String? get name => r'postFumigationUpdateProvider';
}

/// See also [postFumigationUpdate].
class PostFumigationUpdateProvider
    extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [postFumigationUpdate].
  PostFumigationUpdateProvider({
    required FumigatonAuditModal model,
  }) : this._internal(
          (ref) => postFumigationUpdate(
            ref as PostFumigationUpdateRef,
            model: model,
          ),
          from: postFumigationUpdateProvider,
          name: r'postFumigationUpdateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$postFumigationUpdateHash,
          dependencies: PostFumigationUpdateFamily._dependencies,
          allTransitiveDependencies:
              PostFumigationUpdateFamily._allTransitiveDependencies,
          model: model,
        );

  PostFumigationUpdateProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.model,
  }) : super.internal();

  final FumigatonAuditModal model;

  @override
  Override overrideWith(
    FutureOr<Map<String, dynamic>> Function(PostFumigationUpdateRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PostFumigationUpdateProvider._internal(
        (ref) => create(ref as PostFumigationUpdateRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        model: model,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<String, dynamic>> createElement() {
    return _PostFumigationUpdateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PostFumigationUpdateProvider && other.model == model;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, model.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PostFumigationUpdateRef
    on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `model` of this provider.
  FumigatonAuditModal get model;
}

class _PostFumigationUpdateProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with PostFumigationUpdateRef {
  _PostFumigationUpdateProviderElement(super.provider);

  @override
  FumigatonAuditModal get model =>
      (origin as PostFumigationUpdateProvider).model;
}

String _$getAssetsAuditHash() => r'2d2a6795f71ef7c5356f4d81c88b5eed43786775';

/// See also [getAssetsAudit].
@ProviderFor(getAssetsAudit)
const getAssetsAuditProvider = GetAssetsAuditFamily();

/// See also [getAssetsAudit].
class GetAssetsAuditFamily extends Family<AsyncValue<AssetsModal>> {
  /// See also [getAssetsAudit].
  const GetAssetsAuditFamily();

  /// See also [getAssetsAudit].
  GetAssetsAuditProvider call({
    required String? id,
  }) {
    return GetAssetsAuditProvider(
      id: id,
    );
  }

  @override
  GetAssetsAuditProvider getProviderOverride(
    covariant GetAssetsAuditProvider provider,
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
  String? get name => r'getAssetsAuditProvider';
}

/// See also [getAssetsAudit].
class GetAssetsAuditProvider extends AutoDisposeStreamProvider<AssetsModal> {
  /// See also [getAssetsAudit].
  GetAssetsAuditProvider({
    required String? id,
  }) : this._internal(
          (ref) => getAssetsAudit(
            ref as GetAssetsAuditRef,
            id: id,
          ),
          from: getAssetsAuditProvider,
          name: r'getAssetsAuditProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getAssetsAuditHash,
          dependencies: GetAssetsAuditFamily._dependencies,
          allTransitiveDependencies:
              GetAssetsAuditFamily._allTransitiveDependencies,
          id: id,
        );

  GetAssetsAuditProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String? id;

  @override
  Override overrideWith(
    Stream<AssetsModal> Function(GetAssetsAuditRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetAssetsAuditProvider._internal(
        (ref) => create(ref as GetAssetsAuditRef),
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
  AutoDisposeStreamProviderElement<AssetsModal> createElement() {
    return _GetAssetsAuditProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetAssetsAuditProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetAssetsAuditRef on AutoDisposeStreamProviderRef<AssetsModal> {
  /// The parameter `id` of this provider.
  String? get id;
}

class _GetAssetsAuditProviderElement
    extends AutoDisposeStreamProviderElement<AssetsModal>
    with GetAssetsAuditRef {
  _GetAssetsAuditProviderElement(super.provider);

  @override
  String? get id => (origin as GetAssetsAuditProvider).id;
}

String _$postAssetsUpdateHash() => r'52d1a3b3210abdfd556e68366e221ce0202132a6';

/// See also [postAssetsUpdate].
@ProviderFor(postAssetsUpdate)
const postAssetsUpdateProvider = PostAssetsUpdateFamily();

/// See also [postAssetsUpdate].
class PostAssetsUpdateFamily extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [postAssetsUpdate].
  const PostAssetsUpdateFamily();

  /// See also [postAssetsUpdate].
  PostAssetsUpdateProvider call({
    required AssetsUpdateModal model,
  }) {
    return PostAssetsUpdateProvider(
      model: model,
    );
  }

  @override
  PostAssetsUpdateProvider getProviderOverride(
    covariant PostAssetsUpdateProvider provider,
  ) {
    return call(
      model: provider.model,
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
  String? get name => r'postAssetsUpdateProvider';
}

/// See also [postAssetsUpdate].
class PostAssetsUpdateProvider
    extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [postAssetsUpdate].
  PostAssetsUpdateProvider({
    required AssetsUpdateModal model,
  }) : this._internal(
          (ref) => postAssetsUpdate(
            ref as PostAssetsUpdateRef,
            model: model,
          ),
          from: postAssetsUpdateProvider,
          name: r'postAssetsUpdateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$postAssetsUpdateHash,
          dependencies: PostAssetsUpdateFamily._dependencies,
          allTransitiveDependencies:
              PostAssetsUpdateFamily._allTransitiveDependencies,
          model: model,
        );

  PostAssetsUpdateProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.model,
  }) : super.internal();

  final AssetsUpdateModal model;

  @override
  Override overrideWith(
    FutureOr<Map<String, dynamic>> Function(PostAssetsUpdateRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PostAssetsUpdateProvider._internal(
        (ref) => create(ref as PostAssetsUpdateRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        model: model,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<String, dynamic>> createElement() {
    return _PostAssetsUpdateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PostAssetsUpdateProvider && other.model == model;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, model.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PostAssetsUpdateRef
    on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `model` of this provider.
  AssetsUpdateModal get model;
}

class _PostAssetsUpdateProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with PostAssetsUpdateRef {
  _PostAssetsUpdateProviderElement(super.provider);

  @override
  AssetsUpdateModal get model => (origin as PostAssetsUpdateProvider).model;
}

String _$physicalAuditEditHash() => r'f558c28890b6f7148a85bf286503c2b80a006a5b';

/// See also [physicalAuditEdit].
@ProviderFor(physicalAuditEdit)
const physicalAuditEditProvider = PhysicalAuditEditFamily();

/// See also [physicalAuditEdit].
class PhysicalAuditEditFamily
    extends Family<AsyncValue<PhysicalAuditEditModal>> {
  /// See also [physicalAuditEdit].
  const PhysicalAuditEditFamily();

  /// See also [physicalAuditEdit].
  PhysicalAuditEditProvider call({
    required String? Id,
  }) {
    return PhysicalAuditEditProvider(
      Id: Id,
    );
  }

  @override
  PhysicalAuditEditProvider getProviderOverride(
    covariant PhysicalAuditEditProvider provider,
  ) {
    return call(
      Id: provider.Id,
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
  String? get name => r'physicalAuditEditProvider';
}

/// See also [physicalAuditEdit].
class PhysicalAuditEditProvider
    extends AutoDisposeStreamProvider<PhysicalAuditEditModal> {
  /// See also [physicalAuditEdit].
  PhysicalAuditEditProvider({
    required String? Id,
  }) : this._internal(
          (ref) => physicalAuditEdit(
            ref as PhysicalAuditEditRef,
            Id: Id,
          ),
          from: physicalAuditEditProvider,
          name: r'physicalAuditEditProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$physicalAuditEditHash,
          dependencies: PhysicalAuditEditFamily._dependencies,
          allTransitiveDependencies:
              PhysicalAuditEditFamily._allTransitiveDependencies,
          Id: Id,
        );

  PhysicalAuditEditProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.Id,
  }) : super.internal();

  final String? Id;

  @override
  Override overrideWith(
    Stream<PhysicalAuditEditModal> Function(PhysicalAuditEditRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PhysicalAuditEditProvider._internal(
        (ref) => create(ref as PhysicalAuditEditRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        Id: Id,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<PhysicalAuditEditModal> createElement() {
    return _PhysicalAuditEditProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PhysicalAuditEditProvider && other.Id == Id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, Id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PhysicalAuditEditRef
    on AutoDisposeStreamProviderRef<PhysicalAuditEditModal> {
  /// The parameter `Id` of this provider.
  String? get Id;
}

class _PhysicalAuditEditProviderElement
    extends AutoDisposeStreamProviderElement<PhysicalAuditEditModal>
    with PhysicalAuditEditRef {
  _PhysicalAuditEditProviderElement(super.provider);

  @override
  String? get Id => (origin as PhysicalAuditEditProvider).Id;
}

String _$updatePhisicalAuditHash() =>
    r'561a552cbcf04278a3bc3b11083301c9247b34ff';

/// See also [updatePhisicalAudit].
@ProviderFor(updatePhisicalAudit)
const updatePhisicalAuditProvider = UpdatePhisicalAuditFamily();

/// See also [updatePhisicalAudit].
class UpdatePhisicalAuditFamily
    extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [updatePhisicalAudit].
  const UpdatePhisicalAuditFamily();

  /// See also [updatePhisicalAudit].
  UpdatePhisicalAuditProvider call({
    required PhysicalAuditUpdateModal model,
  }) {
    return UpdatePhisicalAuditProvider(
      model: model,
    );
  }

  @override
  UpdatePhisicalAuditProvider getProviderOverride(
    covariant UpdatePhisicalAuditProvider provider,
  ) {
    return call(
      model: provider.model,
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
  String? get name => r'updatePhisicalAuditProvider';
}

/// See also [updatePhisicalAudit].
class UpdatePhisicalAuditProvider
    extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [updatePhisicalAudit].
  UpdatePhisicalAuditProvider({
    required PhysicalAuditUpdateModal model,
  }) : this._internal(
          (ref) => updatePhisicalAudit(
            ref as UpdatePhisicalAuditRef,
            model: model,
          ),
          from: updatePhisicalAuditProvider,
          name: r'updatePhisicalAuditProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$updatePhisicalAuditHash,
          dependencies: UpdatePhisicalAuditFamily._dependencies,
          allTransitiveDependencies:
              UpdatePhisicalAuditFamily._allTransitiveDependencies,
          model: model,
        );

  UpdatePhisicalAuditProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.model,
  }) : super.internal();

  final PhysicalAuditUpdateModal model;

  @override
  Override overrideWith(
    FutureOr<Map<String, dynamic>> Function(UpdatePhisicalAuditRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UpdatePhisicalAuditProvider._internal(
        (ref) => create(ref as UpdatePhisicalAuditRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        model: model,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<String, dynamic>> createElement() {
    return _UpdatePhisicalAuditProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdatePhisicalAuditProvider && other.model == model;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, model.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UpdatePhisicalAuditRef
    on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `model` of this provider.
  PhysicalAuditUpdateModal get model;
}

class _UpdatePhisicalAuditProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with UpdatePhisicalAuditRef {
  _UpdatePhisicalAuditProviderElement(super.provider);

  @override
  PhysicalAuditUpdateModal get model =>
      (origin as UpdatePhisicalAuditProvider).model;
}

String _$stackQualityEditHash() => r'290a7acf1057e373528d049f688db5dff8328823';

///Work Panding
///
/// Copied from [stackQualityEdit].
@ProviderFor(stackQualityEdit)
const stackQualityEditProvider = StackQualityEditFamily();

///Work Panding
///
/// Copied from [stackQualityEdit].
class StackQualityEditFamily extends Family<AsyncValue<StackQualityModal>> {
  ///Work Panding
  ///
  /// Copied from [stackQualityEdit].
  const StackQualityEditFamily();

  ///Work Panding
  ///
  /// Copied from [stackQualityEdit].
  StackQualityEditProvider call({
    required String? Id,
    required String? stackno,
  }) {
    return StackQualityEditProvider(
      Id: Id,
      stackno: stackno,
    );
  }

  @override
  StackQualityEditProvider getProviderOverride(
    covariant StackQualityEditProvider provider,
  ) {
    return call(
      Id: provider.Id,
      stackno: provider.stackno,
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
  String? get name => r'stackQualityEditProvider';
}

///Work Panding
///
/// Copied from [stackQualityEdit].
class StackQualityEditProvider
    extends AutoDisposeStreamProvider<StackQualityModal> {
  ///Work Panding
  ///
  /// Copied from [stackQualityEdit].
  StackQualityEditProvider({
    required String? Id,
    required String? stackno,
  }) : this._internal(
          (ref) => stackQualityEdit(
            ref as StackQualityEditRef,
            Id: Id,
            stackno: stackno,
          ),
          from: stackQualityEditProvider,
          name: r'stackQualityEditProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$stackQualityEditHash,
          dependencies: StackQualityEditFamily._dependencies,
          allTransitiveDependencies:
              StackQualityEditFamily._allTransitiveDependencies,
          Id: Id,
          stackno: stackno,
        );

  StackQualityEditProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.Id,
    required this.stackno,
  }) : super.internal();

  final String? Id;
  final String? stackno;

  @override
  Override overrideWith(
    Stream<StackQualityModal> Function(StackQualityEditRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: StackQualityEditProvider._internal(
        (ref) => create(ref as StackQualityEditRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        Id: Id,
        stackno: stackno,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<StackQualityModal> createElement() {
    return _StackQualityEditProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is StackQualityEditProvider &&
        other.Id == Id &&
        other.stackno == stackno;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, Id.hashCode);
    hash = _SystemHash.combine(hash, stackno.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin StackQualityEditRef on AutoDisposeStreamProviderRef<StackQualityModal> {
  /// The parameter `Id` of this provider.
  String? get Id;

  /// The parameter `stackno` of this provider.
  String? get stackno;
}

class _StackQualityEditProviderElement
    extends AutoDisposeStreamProviderElement<StackQualityModal>
    with StackQualityEditRef {
  _StackQualityEditProviderElement(super.provider);

  @override
  String? get Id => (origin as StackQualityEditProvider).Id;
  @override
  String? get stackno => (origin as StackQualityEditProvider).stackno;
}

String _$qualityStackHash() => r'5b40a960ab64089df2d6b3f0a0482bb5f38760e5';

//////////
///
/// Copied from [qualityStack].
@ProviderFor(qualityStack)
const qualityStackProvider = QualityStackFamily();

//////////
///
/// Copied from [qualityStack].
class QualityStackFamily extends Family<AsyncValue<StackNumberMOdal>> {
  //////////
  ///
  /// Copied from [qualityStack].
  const QualityStackFamily();

  //////////
  ///
  /// Copied from [qualityStack].
  QualityStackProvider call({
    required String? Id,
  }) {
    return QualityStackProvider(
      Id: Id,
    );
  }

  @override
  QualityStackProvider getProviderOverride(
    covariant QualityStackProvider provider,
  ) {
    return call(
      Id: provider.Id,
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
  String? get name => r'qualityStackProvider';
}

//////////
///
/// Copied from [qualityStack].
class QualityStackProvider extends AutoDisposeStreamProvider<StackNumberMOdal> {
  //////////
  ///
  /// Copied from [qualityStack].
  QualityStackProvider({
    required String? Id,
  }) : this._internal(
          (ref) => qualityStack(
            ref as QualityStackRef,
            Id: Id,
          ),
          from: qualityStackProvider,
          name: r'qualityStackProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$qualityStackHash,
          dependencies: QualityStackFamily._dependencies,
          allTransitiveDependencies:
              QualityStackFamily._allTransitiveDependencies,
          Id: Id,
        );

  QualityStackProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.Id,
  }) : super.internal();

  final String? Id;

  @override
  Override overrideWith(
    Stream<StackNumberMOdal> Function(QualityStackRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: QualityStackProvider._internal(
        (ref) => create(ref as QualityStackRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        Id: Id,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<StackNumberMOdal> createElement() {
    return _QualityStackProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is QualityStackProvider && other.Id == Id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, Id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin QualityStackRef on AutoDisposeStreamProviderRef<StackNumberMOdal> {
  /// The parameter `Id` of this provider.
  String? get Id;
}

class _QualityStackProviderElement
    extends AutoDisposeStreamProviderElement<StackNumberMOdal>
    with QualityStackRef {
  _QualityStackProviderElement(super.provider);

  @override
  String? get Id => (origin as QualityStackProvider).Id;
}

String _$cctvAuditEditHash() => r'2db0e916bfafd3025e0e94658c51ad47b59117bd';

////complete
///
/// Copied from [cctvAuditEdit].
@ProviderFor(cctvAuditEdit)
const cctvAuditEditProvider = CctvAuditEditFamily();

////complete
///
/// Copied from [cctvAuditEdit].
class CctvAuditEditFamily extends Family<AsyncValue<CctvAuditEditModal>> {
  ////complete
  ///
  /// Copied from [cctvAuditEdit].
  const CctvAuditEditFamily();

  ////complete
  ///
  /// Copied from [cctvAuditEdit].
  CctvAuditEditProvider call({
    required String? Id,
  }) {
    return CctvAuditEditProvider(
      Id: Id,
    );
  }

  @override
  CctvAuditEditProvider getProviderOverride(
    covariant CctvAuditEditProvider provider,
  ) {
    return call(
      Id: provider.Id,
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
  String? get name => r'cctvAuditEditProvider';
}

////complete
///
/// Copied from [cctvAuditEdit].
class CctvAuditEditProvider
    extends AutoDisposeStreamProvider<CctvAuditEditModal> {
  ////complete
  ///
  /// Copied from [cctvAuditEdit].
  CctvAuditEditProvider({
    required String? Id,
  }) : this._internal(
          (ref) => cctvAuditEdit(
            ref as CctvAuditEditRef,
            Id: Id,
          ),
          from: cctvAuditEditProvider,
          name: r'cctvAuditEditProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$cctvAuditEditHash,
          dependencies: CctvAuditEditFamily._dependencies,
          allTransitiveDependencies:
              CctvAuditEditFamily._allTransitiveDependencies,
          Id: Id,
        );

  CctvAuditEditProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.Id,
  }) : super.internal();

  final String? Id;

  @override
  Override overrideWith(
    Stream<CctvAuditEditModal> Function(CctvAuditEditRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CctvAuditEditProvider._internal(
        (ref) => create(ref as CctvAuditEditRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        Id: Id,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<CctvAuditEditModal> createElement() {
    return _CctvAuditEditProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CctvAuditEditProvider && other.Id == Id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, Id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CctvAuditEditRef on AutoDisposeStreamProviderRef<CctvAuditEditModal> {
  /// The parameter `Id` of this provider.
  String? get Id;
}

class _CctvAuditEditProviderElement
    extends AutoDisposeStreamProviderElement<CctvAuditEditModal>
    with CctvAuditEditRef {
  _CctvAuditEditProviderElement(super.provider);

  @override
  String? get Id => (origin as CctvAuditEditProvider).Id;
}

String _$updateCctvEditHash() => r'e7a742ad5a9db8ff89fce96654e239ec31b60dde';

/// See also [updateCctvEdit].
@ProviderFor(updateCctvEdit)
const updateCctvEditProvider = UpdateCctvEditFamily();

/// See also [updateCctvEdit].
class UpdateCctvEditFamily extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [updateCctvEdit].
  const UpdateCctvEditFamily();

  /// See also [updateCctvEdit].
  UpdateCctvEditProvider call({
    required CctvUpdateModal model,
  }) {
    return UpdateCctvEditProvider(
      model: model,
    );
  }

  @override
  UpdateCctvEditProvider getProviderOverride(
    covariant UpdateCctvEditProvider provider,
  ) {
    return call(
      model: provider.model,
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
  String? get name => r'updateCctvEditProvider';
}

/// See also [updateCctvEdit].
class UpdateCctvEditProvider
    extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [updateCctvEdit].
  UpdateCctvEditProvider({
    required CctvUpdateModal model,
  }) : this._internal(
          (ref) => updateCctvEdit(
            ref as UpdateCctvEditRef,
            model: model,
          ),
          from: updateCctvEditProvider,
          name: r'updateCctvEditProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$updateCctvEditHash,
          dependencies: UpdateCctvEditFamily._dependencies,
          allTransitiveDependencies:
              UpdateCctvEditFamily._allTransitiveDependencies,
          model: model,
        );

  UpdateCctvEditProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.model,
  }) : super.internal();

  final CctvUpdateModal model;

  @override
  Override overrideWith(
    FutureOr<Map<String, dynamic>> Function(UpdateCctvEditRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UpdateCctvEditProvider._internal(
        (ref) => create(ref as UpdateCctvEditRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        model: model,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<String, dynamic>> createElement() {
    return _UpdateCctvEditProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateCctvEditProvider && other.model == model;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, model.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UpdateCctvEditRef on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `model` of this provider.
  CctvUpdateModal get model;
}

class _UpdateCctvEditProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with UpdateCctvEditRef {
  _UpdateCctvEditProviderElement(super.provider);

  @override
  CctvUpdateModal get model => (origin as UpdateCctvEditProvider).model;
}

String _$lockKeyAuditEditHash() => r'361ee481f572239420cda5650c63c52615867fbe';

////////
///
/// Copied from [lockKeyAuditEdit].
@ProviderFor(lockKeyAuditEdit)
const lockKeyAuditEditProvider = LockKeyAuditEditFamily();

////////
///
/// Copied from [lockKeyAuditEdit].
class LockKeyAuditEditFamily extends Family<AsyncValue<EditLockAndKeyModal>> {
  ////////
  ///
  /// Copied from [lockKeyAuditEdit].
  const LockKeyAuditEditFamily();

  ////////
  ///
  /// Copied from [lockKeyAuditEdit].
  LockKeyAuditEditProvider call({
    required String? Id,
  }) {
    return LockKeyAuditEditProvider(
      Id: Id,
    );
  }

  @override
  LockKeyAuditEditProvider getProviderOverride(
    covariant LockKeyAuditEditProvider provider,
  ) {
    return call(
      Id: provider.Id,
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
  String? get name => r'lockKeyAuditEditProvider';
}

////////
///
/// Copied from [lockKeyAuditEdit].
class LockKeyAuditEditProvider
    extends AutoDisposeStreamProvider<EditLockAndKeyModal> {
  ////////
  ///
  /// Copied from [lockKeyAuditEdit].
  LockKeyAuditEditProvider({
    required String? Id,
  }) : this._internal(
          (ref) => lockKeyAuditEdit(
            ref as LockKeyAuditEditRef,
            Id: Id,
          ),
          from: lockKeyAuditEditProvider,
          name: r'lockKeyAuditEditProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$lockKeyAuditEditHash,
          dependencies: LockKeyAuditEditFamily._dependencies,
          allTransitiveDependencies:
              LockKeyAuditEditFamily._allTransitiveDependencies,
          Id: Id,
        );

  LockKeyAuditEditProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.Id,
  }) : super.internal();

  final String? Id;

  @override
  Override overrideWith(
    Stream<EditLockAndKeyModal> Function(LockKeyAuditEditRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: LockKeyAuditEditProvider._internal(
        (ref) => create(ref as LockKeyAuditEditRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        Id: Id,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<EditLockAndKeyModal> createElement() {
    return _LockKeyAuditEditProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LockKeyAuditEditProvider && other.Id == Id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, Id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin LockKeyAuditEditRef on AutoDisposeStreamProviderRef<EditLockAndKeyModal> {
  /// The parameter `Id` of this provider.
  String? get Id;
}

class _LockKeyAuditEditProviderElement
    extends AutoDisposeStreamProviderElement<EditLockAndKeyModal>
    with LockKeyAuditEditRef {
  _LockKeyAuditEditProviderElement(super.provider);

  @override
  String? get Id => (origin as LockKeyAuditEditProvider).Id;
}

String _$fumigationListHash() => r'80684e77a2533e6b389a7a206f1d356d8f39cc4c';

//////
///
/// Copied from [fumigationList].
@ProviderFor(fumigationList)
const fumigationListProvider = FumigationListFamily();

//////
///
/// Copied from [fumigationList].
class FumigationListFamily extends Family<AsyncValue<FumigationListingModel>> {
  //////
  ///
  /// Copied from [fumigationList].
  const FumigationListFamily();

  //////
  ///
  /// Copied from [fumigationList].
  FumigationListProvider call({
    required String auditId,
  }) {
    return FumigationListProvider(
      auditId: auditId,
    );
  }

  @override
  FumigationListProvider getProviderOverride(
    covariant FumigationListProvider provider,
  ) {
    return call(
      auditId: provider.auditId,
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
  String? get name => r'fumigationListProvider';
}

//////
///
/// Copied from [fumigationList].
class FumigationListProvider
    extends AutoDisposeFutureProvider<FumigationListingModel> {
  //////
  ///
  /// Copied from [fumigationList].
  FumigationListProvider({
    required String auditId,
  }) : this._internal(
          (ref) => fumigationList(
            ref as FumigationListRef,
            auditId: auditId,
          ),
          from: fumigationListProvider,
          name: r'fumigationListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fumigationListHash,
          dependencies: FumigationListFamily._dependencies,
          allTransitiveDependencies:
              FumigationListFamily._allTransitiveDependencies,
          auditId: auditId,
        );

  FumigationListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.auditId,
  }) : super.internal();

  final String auditId;

  @override
  Override overrideWith(
    FutureOr<FumigationListingModel> Function(FumigationListRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FumigationListProvider._internal(
        (ref) => create(ref as FumigationListRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        auditId: auditId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<FumigationListingModel> createElement() {
    return _FumigationListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FumigationListProvider && other.auditId == auditId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, auditId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FumigationListRef
    on AutoDisposeFutureProviderRef<FumigationListingModel> {
  /// The parameter `auditId` of this provider.
  String get auditId;
}

class _FumigationListProviderElement
    extends AutoDisposeFutureProviderElement<FumigationListingModel>
    with FumigationListRef {
  _FumigationListProviderElement(super.provider);

  @override
  String get auditId => (origin as FumigationListProvider).auditId;
}

String _$updateFumigationHash() => r'8179b6f2d93be80c226ecf873243918c6583a278';

/// See also [updateFumigation].
@ProviderFor(updateFumigation)
const updateFumigationProvider = UpdateFumigationFamily();

/// See also [updateFumigation].
class UpdateFumigationFamily extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [updateFumigation].
  const UpdateFumigationFamily();

  /// See also [updateFumigation].
  UpdateFumigationProvider call({
    required FumigatiomUpdateEditModal model,
  }) {
    return UpdateFumigationProvider(
      model: model,
    );
  }

  @override
  UpdateFumigationProvider getProviderOverride(
    covariant UpdateFumigationProvider provider,
  ) {
    return call(
      model: provider.model,
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
  String? get name => r'updateFumigationProvider';
}

/// See also [updateFumigation].
class UpdateFumigationProvider
    extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [updateFumigation].
  UpdateFumigationProvider({
    required FumigatiomUpdateEditModal model,
  }) : this._internal(
          (ref) => updateFumigation(
            ref as UpdateFumigationRef,
            model: model,
          ),
          from: updateFumigationProvider,
          name: r'updateFumigationProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$updateFumigationHash,
          dependencies: UpdateFumigationFamily._dependencies,
          allTransitiveDependencies:
              UpdateFumigationFamily._allTransitiveDependencies,
          model: model,
        );

  UpdateFumigationProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.model,
  }) : super.internal();

  final FumigatiomUpdateEditModal model;

  @override
  Override overrideWith(
    FutureOr<Map<String, dynamic>> Function(UpdateFumigationRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UpdateFumigationProvider._internal(
        (ref) => create(ref as UpdateFumigationRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        model: model,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<String, dynamic>> createElement() {
    return _UpdateFumigationProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateFumigationProvider && other.model == model;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, model.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UpdateFumigationRef
    on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `model` of this provider.
  FumigatiomUpdateEditModal get model;
}

class _UpdateFumigationProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with UpdateFumigationRef {
  _UpdateFumigationProviderElement(super.provider);

  @override
  FumigatiomUpdateEditModal get model =>
      (origin as UpdateFumigationProvider).model;
}

String _$stackQualityUpdateHash() =>
    r'b6e4952898d8884cb883b034317613a017b1077a';

/// See also [stackQualityUpdate].
@ProviderFor(stackQualityUpdate)
const stackQualityUpdateProvider = StackQualityUpdateFamily();

/// See also [stackQualityUpdate].
class StackQualityUpdateFamily
    extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [stackQualityUpdate].
  const StackQualityUpdateFamily();

  /// See also [stackQualityUpdate].
  StackQualityUpdateProvider call({
    required StackQualityRequestModel model,
  }) {
    return StackQualityUpdateProvider(
      model: model,
    );
  }

  @override
  StackQualityUpdateProvider getProviderOverride(
    covariant StackQualityUpdateProvider provider,
  ) {
    return call(
      model: provider.model,
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
  String? get name => r'stackQualityUpdateProvider';
}

/// See also [stackQualityUpdate].
class StackQualityUpdateProvider
    extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [stackQualityUpdate].
  StackQualityUpdateProvider({
    required StackQualityRequestModel model,
  }) : this._internal(
          (ref) => stackQualityUpdate(
            ref as StackQualityUpdateRef,
            model: model,
          ),
          from: stackQualityUpdateProvider,
          name: r'stackQualityUpdateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$stackQualityUpdateHash,
          dependencies: StackQualityUpdateFamily._dependencies,
          allTransitiveDependencies:
              StackQualityUpdateFamily._allTransitiveDependencies,
          model: model,
        );

  StackQualityUpdateProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.model,
  }) : super.internal();

  final StackQualityRequestModel model;

  @override
  Override overrideWith(
    FutureOr<Map<String, dynamic>> Function(StackQualityUpdateRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: StackQualityUpdateProvider._internal(
        (ref) => create(ref as StackQualityUpdateRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        model: model,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<String, dynamic>> createElement() {
    return _StackQualityUpdateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is StackQualityUpdateProvider && other.model == model;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, model.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin StackQualityUpdateRef
    on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `model` of this provider.
  StackQualityRequestModel get model;
}

class _StackQualityUpdateProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with StackQualityUpdateRef {
  _StackQualityUpdateProviderElement(super.provider);

  @override
  StackQualityRequestModel get model =>
      (origin as StackQualityUpdateProvider).model;
}

String _$editAssetsHash() => r'31b35fd79ed728c830ae2538841a03efd125fa67';

/// See also [editAssets].
@ProviderFor(editAssets)
const editAssetsProvider = EditAssetsFamily();

/// See also [editAssets].
class EditAssetsFamily extends Family<AsyncValue<AssetsEditModal>> {
  /// See also [editAssets].
  const EditAssetsFamily();

  /// See also [editAssets].
  EditAssetsProvider call({
    required String auditId,
  }) {
    return EditAssetsProvider(
      auditId: auditId,
    );
  }

  @override
  EditAssetsProvider getProviderOverride(
    covariant EditAssetsProvider provider,
  ) {
    return call(
      auditId: provider.auditId,
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
  String? get name => r'editAssetsProvider';
}

/// See also [editAssets].
class EditAssetsProvider extends AutoDisposeFutureProvider<AssetsEditModal> {
  /// See also [editAssets].
  EditAssetsProvider({
    required String auditId,
  }) : this._internal(
          (ref) => editAssets(
            ref as EditAssetsRef,
            auditId: auditId,
          ),
          from: editAssetsProvider,
          name: r'editAssetsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$editAssetsHash,
          dependencies: EditAssetsFamily._dependencies,
          allTransitiveDependencies:
              EditAssetsFamily._allTransitiveDependencies,
          auditId: auditId,
        );

  EditAssetsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.auditId,
  }) : super.internal();

  final String auditId;

  @override
  Override overrideWith(
    FutureOr<AssetsEditModal> Function(EditAssetsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: EditAssetsProvider._internal(
        (ref) => create(ref as EditAssetsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        auditId: auditId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<AssetsEditModal> createElement() {
    return _EditAssetsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is EditAssetsProvider && other.auditId == auditId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, auditId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin EditAssetsRef on AutoDisposeFutureProviderRef<AssetsEditModal> {
  /// The parameter `auditId` of this provider.
  String get auditId;
}

class _EditAssetsProviderElement
    extends AutoDisposeFutureProviderElement<AssetsEditModal>
    with EditAssetsRef {
  _EditAssetsProviderElement(super.provider);

  @override
  String get auditId => (origin as EditAssetsProvider).auditId;
}

String _$assetsEditUpdateHash() => r'2d61d2a9b163910033956b756f953b6cdf5269d4';

/// See also [assetsEditUpdate].
@ProviderFor(assetsEditUpdate)
const assetsEditUpdateProvider = AssetsEditUpdateFamily();

/// See also [assetsEditUpdate].
class AssetsEditUpdateFamily extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [assetsEditUpdate].
  const AssetsEditUpdateFamily();

  /// See also [assetsEditUpdate].
  AssetsEditUpdateProvider call({
    required AssetsUpdateRequestModel model,
  }) {
    return AssetsEditUpdateProvider(
      model: model,
    );
  }

  @override
  AssetsEditUpdateProvider getProviderOverride(
    covariant AssetsEditUpdateProvider provider,
  ) {
    return call(
      model: provider.model,
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
  String? get name => r'assetsEditUpdateProvider';
}

/// See also [assetsEditUpdate].
class AssetsEditUpdateProvider
    extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [assetsEditUpdate].
  AssetsEditUpdateProvider({
    required AssetsUpdateRequestModel model,
  }) : this._internal(
          (ref) => assetsEditUpdate(
            ref as AssetsEditUpdateRef,
            model: model,
          ),
          from: assetsEditUpdateProvider,
          name: r'assetsEditUpdateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$assetsEditUpdateHash,
          dependencies: AssetsEditUpdateFamily._dependencies,
          allTransitiveDependencies:
              AssetsEditUpdateFamily._allTransitiveDependencies,
          model: model,
        );

  AssetsEditUpdateProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.model,
  }) : super.internal();

  final AssetsUpdateRequestModel model;

  @override
  Override overrideWith(
    FutureOr<Map<String, dynamic>> Function(AssetsEditUpdateRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AssetsEditUpdateProvider._internal(
        (ref) => create(ref as AssetsEditUpdateRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        model: model,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<String, dynamic>> createElement() {
    return _AssetsEditUpdateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AssetsEditUpdateProvider && other.model == model;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, model.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AssetsEditUpdateRef
    on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `model` of this provider.
  AssetsUpdateRequestModel get model;
}

class _AssetsEditUpdateProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with AssetsEditUpdateRef {
  _AssetsEditUpdateProviderElement(super.provider);

  @override
  AssetsUpdateRequestModel get model =>
      (origin as AssetsEditUpdateProvider).model;
}

String _$stackEditListHash() => r'daf69a328a6ef4af18a78cf22890b1e5912b6d60';

/// See also [stackEditList].
@ProviderFor(stackEditList)
const stackEditListProvider = StackEditListFamily();

/// See also [stackEditList].
class StackEditListFamily extends Family<AsyncValue<StackEditListModal>> {
  /// See also [stackEditList].
  const StackEditListFamily();

  /// See also [stackEditList].
  StackEditListProvider call({
    required String auditId,
  }) {
    return StackEditListProvider(
      auditId: auditId,
    );
  }

  @override
  StackEditListProvider getProviderOverride(
    covariant StackEditListProvider provider,
  ) {
    return call(
      auditId: provider.auditId,
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
  String? get name => r'stackEditListProvider';
}

/// See also [stackEditList].
class StackEditListProvider
    extends AutoDisposeFutureProvider<StackEditListModal> {
  /// See also [stackEditList].
  StackEditListProvider({
    required String auditId,
  }) : this._internal(
          (ref) => stackEditList(
            ref as StackEditListRef,
            auditId: auditId,
          ),
          from: stackEditListProvider,
          name: r'stackEditListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$stackEditListHash,
          dependencies: StackEditListFamily._dependencies,
          allTransitiveDependencies:
              StackEditListFamily._allTransitiveDependencies,
          auditId: auditId,
        );

  StackEditListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.auditId,
  }) : super.internal();

  final String auditId;

  @override
  Override overrideWith(
    FutureOr<StackEditListModal> Function(StackEditListRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: StackEditListProvider._internal(
        (ref) => create(ref as StackEditListRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        auditId: auditId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<StackEditListModal> createElement() {
    return _StackEditListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is StackEditListProvider && other.auditId == auditId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, auditId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin StackEditListRef on AutoDisposeFutureProviderRef<StackEditListModal> {
  /// The parameter `auditId` of this provider.
  String get auditId;
}

class _StackEditListProviderElement
    extends AutoDisposeFutureProviderElement<StackEditListModal>
    with StackEditListRef {
  _StackEditListProviderElement(super.provider);

  @override
  String get auditId => (origin as StackEditListProvider).auditId;
}

String _$cctvPdfCreateHash() => r'5febac11bac23923025f36f5b994f70caa93e466';

/// See also [cctvPdfCreate].
@ProviderFor(cctvPdfCreate)
const cctvPdfCreateProvider = CctvPdfCreateFamily();

/// See also [cctvPdfCreate].
class CctvPdfCreateFamily extends Family<AsyncValue<CctvPdfCreatemodal>> {
  /// See also [cctvPdfCreate].
  const CctvPdfCreateFamily();

  /// See also [cctvPdfCreate].
  CctvPdfCreateProvider call({
    required String auditId,
  }) {
    return CctvPdfCreateProvider(
      auditId: auditId,
    );
  }

  @override
  CctvPdfCreateProvider getProviderOverride(
    covariant CctvPdfCreateProvider provider,
  ) {
    return call(
      auditId: provider.auditId,
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
  String? get name => r'cctvPdfCreateProvider';
}

/// See also [cctvPdfCreate].
class CctvPdfCreateProvider
    extends AutoDisposeFutureProvider<CctvPdfCreatemodal> {
  /// See also [cctvPdfCreate].
  CctvPdfCreateProvider({
    required String auditId,
  }) : this._internal(
          (ref) => cctvPdfCreate(
            ref as CctvPdfCreateRef,
            auditId: auditId,
          ),
          from: cctvPdfCreateProvider,
          name: r'cctvPdfCreateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$cctvPdfCreateHash,
          dependencies: CctvPdfCreateFamily._dependencies,
          allTransitiveDependencies:
              CctvPdfCreateFamily._allTransitiveDependencies,
          auditId: auditId,
        );

  CctvPdfCreateProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.auditId,
  }) : super.internal();

  final String auditId;

  @override
  Override overrideWith(
    FutureOr<CctvPdfCreatemodal> Function(CctvPdfCreateRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CctvPdfCreateProvider._internal(
        (ref) => create(ref as CctvPdfCreateRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        auditId: auditId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<CctvPdfCreatemodal> createElement() {
    return _CctvPdfCreateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CctvPdfCreateProvider && other.auditId == auditId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, auditId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CctvPdfCreateRef on AutoDisposeFutureProviderRef<CctvPdfCreatemodal> {
  /// The parameter `auditId` of this provider.
  String get auditId;
}

class _CctvPdfCreateProviderElement
    extends AutoDisposeFutureProviderElement<CctvPdfCreatemodal>
    with CctvPdfCreateRef {
  _CctvPdfCreateProviderElement(super.provider);

  @override
  String get auditId => (origin as CctvPdfCreateProvider).auditId;
}

String _$lockKeyPdfCreateHash() => r'243146d7a4459ac4ed42973f435baa92e8d6b0a2';

/// See also [lockKeyPdfCreate].
@ProviderFor(lockKeyPdfCreate)
const lockKeyPdfCreateProvider = LockKeyPdfCreateFamily();

/// See also [lockKeyPdfCreate].
class LockKeyPdfCreateFamily extends Family<AsyncValue<LockKeyPdfCreatemodal>> {
  /// See also [lockKeyPdfCreate].
  const LockKeyPdfCreateFamily();

  /// See also [lockKeyPdfCreate].
  LockKeyPdfCreateProvider call({
    required String auditId,
  }) {
    return LockKeyPdfCreateProvider(
      auditId: auditId,
    );
  }

  @override
  LockKeyPdfCreateProvider getProviderOverride(
    covariant LockKeyPdfCreateProvider provider,
  ) {
    return call(
      auditId: provider.auditId,
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
  String? get name => r'lockKeyPdfCreateProvider';
}

/// See also [lockKeyPdfCreate].
class LockKeyPdfCreateProvider
    extends AutoDisposeFutureProvider<LockKeyPdfCreatemodal> {
  /// See also [lockKeyPdfCreate].
  LockKeyPdfCreateProvider({
    required String auditId,
  }) : this._internal(
          (ref) => lockKeyPdfCreate(
            ref as LockKeyPdfCreateRef,
            auditId: auditId,
          ),
          from: lockKeyPdfCreateProvider,
          name: r'lockKeyPdfCreateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$lockKeyPdfCreateHash,
          dependencies: LockKeyPdfCreateFamily._dependencies,
          allTransitiveDependencies:
              LockKeyPdfCreateFamily._allTransitiveDependencies,
          auditId: auditId,
        );

  LockKeyPdfCreateProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.auditId,
  }) : super.internal();

  final String auditId;

  @override
  Override overrideWith(
    FutureOr<LockKeyPdfCreatemodal> Function(LockKeyPdfCreateRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: LockKeyPdfCreateProvider._internal(
        (ref) => create(ref as LockKeyPdfCreateRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        auditId: auditId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<LockKeyPdfCreatemodal> createElement() {
    return _LockKeyPdfCreateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LockKeyPdfCreateProvider && other.auditId == auditId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, auditId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin LockKeyPdfCreateRef
    on AutoDisposeFutureProviderRef<LockKeyPdfCreatemodal> {
  /// The parameter `auditId` of this provider.
  String get auditId;
}

class _LockKeyPdfCreateProviderElement
    extends AutoDisposeFutureProviderElement<LockKeyPdfCreatemodal>
    with LockKeyPdfCreateRef {
  _LockKeyPdfCreateProviderElement(super.provider);

  @override
  String get auditId => (origin as LockKeyPdfCreateProvider).auditId;
}

String _$stackQualityPdfCreateHash() =>
    r'a7e34039c97fccfb533e2d295913a80f2d8c09f3';

/// See also [stackQualityPdfCreate].
@ProviderFor(stackQualityPdfCreate)
const stackQualityPdfCreateProvider = StackQualityPdfCreateFamily();

/// See also [stackQualityPdfCreate].
class StackQualityPdfCreateFamily
    extends Family<AsyncValue<StackQualityPdfCreatemodal>> {
  /// See also [stackQualityPdfCreate].
  const StackQualityPdfCreateFamily();

  /// See also [stackQualityPdfCreate].
  StackQualityPdfCreateProvider call({
    required String auditId,
  }) {
    return StackQualityPdfCreateProvider(
      auditId: auditId,
    );
  }

  @override
  StackQualityPdfCreateProvider getProviderOverride(
    covariant StackQualityPdfCreateProvider provider,
  ) {
    return call(
      auditId: provider.auditId,
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
  String? get name => r'stackQualityPdfCreateProvider';
}

/// See also [stackQualityPdfCreate].
class StackQualityPdfCreateProvider
    extends AutoDisposeFutureProvider<StackQualityPdfCreatemodal> {
  /// See also [stackQualityPdfCreate].
  StackQualityPdfCreateProvider({
    required String auditId,
  }) : this._internal(
          (ref) => stackQualityPdfCreate(
            ref as StackQualityPdfCreateRef,
            auditId: auditId,
          ),
          from: stackQualityPdfCreateProvider,
          name: r'stackQualityPdfCreateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$stackQualityPdfCreateHash,
          dependencies: StackQualityPdfCreateFamily._dependencies,
          allTransitiveDependencies:
              StackQualityPdfCreateFamily._allTransitiveDependencies,
          auditId: auditId,
        );

  StackQualityPdfCreateProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.auditId,
  }) : super.internal();

  final String auditId;

  @override
  Override overrideWith(
    FutureOr<StackQualityPdfCreatemodal> Function(
            StackQualityPdfCreateRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: StackQualityPdfCreateProvider._internal(
        (ref) => create(ref as StackQualityPdfCreateRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        auditId: auditId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<StackQualityPdfCreatemodal> createElement() {
    return _StackQualityPdfCreateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is StackQualityPdfCreateProvider && other.auditId == auditId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, auditId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin StackQualityPdfCreateRef
    on AutoDisposeFutureProviderRef<StackQualityPdfCreatemodal> {
  /// The parameter `auditId` of this provider.
  String get auditId;
}

class _StackQualityPdfCreateProviderElement
    extends AutoDisposeFutureProviderElement<StackQualityPdfCreatemodal>
    with StackQualityPdfCreateRef {
  _StackQualityPdfCreateProviderElement(super.provider);

  @override
  String get auditId => (origin as StackQualityPdfCreateProvider).auditId;
}

String _$assetsPdfCreateHash() => r'7624032951fcd8ef5386d17975659a0481ae220e';

/// See also [assetsPdfCreate].
@ProviderFor(assetsPdfCreate)
const assetsPdfCreateProvider = AssetsPdfCreateFamily();

/// See also [assetsPdfCreate].
class AssetsPdfCreateFamily extends Family<AsyncValue<AssetsPdfCreatemodal>> {
  /// See also [assetsPdfCreate].
  const AssetsPdfCreateFamily();

  /// See also [assetsPdfCreate].
  AssetsPdfCreateProvider call({
    required String auditId,
  }) {
    return AssetsPdfCreateProvider(
      auditId: auditId,
    );
  }

  @override
  AssetsPdfCreateProvider getProviderOverride(
    covariant AssetsPdfCreateProvider provider,
  ) {
    return call(
      auditId: provider.auditId,
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
  String? get name => r'assetsPdfCreateProvider';
}

/// See also [assetsPdfCreate].
class AssetsPdfCreateProvider
    extends AutoDisposeFutureProvider<AssetsPdfCreatemodal> {
  /// See also [assetsPdfCreate].
  AssetsPdfCreateProvider({
    required String auditId,
  }) : this._internal(
          (ref) => assetsPdfCreate(
            ref as AssetsPdfCreateRef,
            auditId: auditId,
          ),
          from: assetsPdfCreateProvider,
          name: r'assetsPdfCreateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$assetsPdfCreateHash,
          dependencies: AssetsPdfCreateFamily._dependencies,
          allTransitiveDependencies:
              AssetsPdfCreateFamily._allTransitiveDependencies,
          auditId: auditId,
        );

  AssetsPdfCreateProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.auditId,
  }) : super.internal();

  final String auditId;

  @override
  Override overrideWith(
    FutureOr<AssetsPdfCreatemodal> Function(AssetsPdfCreateRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AssetsPdfCreateProvider._internal(
        (ref) => create(ref as AssetsPdfCreateRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        auditId: auditId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<AssetsPdfCreatemodal> createElement() {
    return _AssetsPdfCreateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AssetsPdfCreateProvider && other.auditId == auditId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, auditId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AssetsPdfCreateRef on AutoDisposeFutureProviderRef<AssetsPdfCreatemodal> {
  /// The parameter `auditId` of this provider.
  String get auditId;
}

class _AssetsPdfCreateProviderElement
    extends AutoDisposeFutureProviderElement<AssetsPdfCreatemodal>
    with AssetsPdfCreateRef {
  _AssetsPdfCreateProviderElement(super.provider);

  @override
  String get auditId => (origin as AssetsPdfCreateProvider).auditId;
}

String _$stackPhycialPdfCreateHash() =>
    r'b61b33078636ad515524b5801a8083da8e189bdb';

/// See also [stackPhycialPdfCreate].
@ProviderFor(stackPhycialPdfCreate)
const stackPhycialPdfCreateProvider = StackPhycialPdfCreateFamily();

/// See also [stackPhycialPdfCreate].
class StackPhycialPdfCreateFamily
    extends Family<AsyncValue<StackPhycialPdfCreatemodal>> {
  /// See also [stackPhycialPdfCreate].
  const StackPhycialPdfCreateFamily();

  /// See also [stackPhycialPdfCreate].
  StackPhycialPdfCreateProvider call({
    required String auditId,
  }) {
    return StackPhycialPdfCreateProvider(
      auditId: auditId,
    );
  }

  @override
  StackPhycialPdfCreateProvider getProviderOverride(
    covariant StackPhycialPdfCreateProvider provider,
  ) {
    return call(
      auditId: provider.auditId,
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
  String? get name => r'stackPhycialPdfCreateProvider';
}

/// See also [stackPhycialPdfCreate].
class StackPhycialPdfCreateProvider
    extends AutoDisposeFutureProvider<StackPhycialPdfCreatemodal> {
  /// See also [stackPhycialPdfCreate].
  StackPhycialPdfCreateProvider({
    required String auditId,
  }) : this._internal(
          (ref) => stackPhycialPdfCreate(
            ref as StackPhycialPdfCreateRef,
            auditId: auditId,
          ),
          from: stackPhycialPdfCreateProvider,
          name: r'stackPhycialPdfCreateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$stackPhycialPdfCreateHash,
          dependencies: StackPhycialPdfCreateFamily._dependencies,
          allTransitiveDependencies:
              StackPhycialPdfCreateFamily._allTransitiveDependencies,
          auditId: auditId,
        );

  StackPhycialPdfCreateProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.auditId,
  }) : super.internal();

  final String auditId;

  @override
  Override overrideWith(
    FutureOr<StackPhycialPdfCreatemodal> Function(
            StackPhycialPdfCreateRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: StackPhycialPdfCreateProvider._internal(
        (ref) => create(ref as StackPhycialPdfCreateRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        auditId: auditId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<StackPhycialPdfCreatemodal> createElement() {
    return _StackPhycialPdfCreateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is StackPhycialPdfCreateProvider && other.auditId == auditId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, auditId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin StackPhycialPdfCreateRef
    on AutoDisposeFutureProviderRef<StackPhycialPdfCreatemodal> {
  /// The parameter `auditId` of this provider.
  String get auditId;
}

class _StackPhycialPdfCreateProviderElement
    extends AutoDisposeFutureProviderElement<StackPhycialPdfCreatemodal>
    with StackPhycialPdfCreateRef {
  _StackPhycialPdfCreateProviderElement(super.provider);

  @override
  String get auditId => (origin as StackPhycialPdfCreateProvider).auditId;
}

String _$fumigationPdfCreateHash() =>
    r'66aefb41bce4c6e84ee63efb567e654bc0a8b13e';

/// See also [fumigationPdfCreate].
@ProviderFor(fumigationPdfCreate)
const fumigationPdfCreateProvider = FumigationPdfCreateFamily();

/// See also [fumigationPdfCreate].
class FumigationPdfCreateFamily
    extends Family<AsyncValue<FumigationPdfCreatemodal>> {
  /// See also [fumigationPdfCreate].
  const FumigationPdfCreateFamily();

  /// See also [fumigationPdfCreate].
  FumigationPdfCreateProvider call({
    required String auditId,
  }) {
    return FumigationPdfCreateProvider(
      auditId: auditId,
    );
  }

  @override
  FumigationPdfCreateProvider getProviderOverride(
    covariant FumigationPdfCreateProvider provider,
  ) {
    return call(
      auditId: provider.auditId,
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
  String? get name => r'fumigationPdfCreateProvider';
}

/// See also [fumigationPdfCreate].
class FumigationPdfCreateProvider
    extends AutoDisposeFutureProvider<FumigationPdfCreatemodal> {
  /// See also [fumigationPdfCreate].
  FumigationPdfCreateProvider({
    required String auditId,
  }) : this._internal(
          (ref) => fumigationPdfCreate(
            ref as FumigationPdfCreateRef,
            auditId: auditId,
          ),
          from: fumigationPdfCreateProvider,
          name: r'fumigationPdfCreateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fumigationPdfCreateHash,
          dependencies: FumigationPdfCreateFamily._dependencies,
          allTransitiveDependencies:
              FumigationPdfCreateFamily._allTransitiveDependencies,
          auditId: auditId,
        );

  FumigationPdfCreateProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.auditId,
  }) : super.internal();

  final String auditId;

  @override
  Override overrideWith(
    FutureOr<FumigationPdfCreatemodal> Function(FumigationPdfCreateRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FumigationPdfCreateProvider._internal(
        (ref) => create(ref as FumigationPdfCreateRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        auditId: auditId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<FumigationPdfCreatemodal> createElement() {
    return _FumigationPdfCreateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FumigationPdfCreateProvider && other.auditId == auditId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, auditId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FumigationPdfCreateRef
    on AutoDisposeFutureProviderRef<FumigationPdfCreatemodal> {
  /// The parameter `auditId` of this provider.
  String get auditId;
}

class _FumigationPdfCreateProviderElement
    extends AutoDisposeFutureProviderElement<FumigationPdfCreatemodal>
    with FumigationPdfCreateRef {
  _FumigationPdfCreateProviderElement(super.provider);

  @override
  String get auditId => (origin as FumigationPdfCreateProvider).auditId;
}

String _$mainPagePdfCreateHash() => r'dedde06b08c9b90a988ef34e0632af5d6c2ad272';

/// See also [mainPagePdfCreate].
@ProviderFor(mainPagePdfCreate)
const mainPagePdfCreateProvider = MainPagePdfCreateFamily();

/// See also [mainPagePdfCreate].
class MainPagePdfCreateFamily extends Family<AsyncValue<MainPagePdfModal>> {
  /// See also [mainPagePdfCreate].
  const MainPagePdfCreateFamily();

  /// See also [mainPagePdfCreate].
  MainPagePdfCreateProvider call({
    required String auditId,
  }) {
    return MainPagePdfCreateProvider(
      auditId: auditId,
    );
  }

  @override
  MainPagePdfCreateProvider getProviderOverride(
    covariant MainPagePdfCreateProvider provider,
  ) {
    return call(
      auditId: provider.auditId,
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
  String? get name => r'mainPagePdfCreateProvider';
}

/// See also [mainPagePdfCreate].
class MainPagePdfCreateProvider
    extends AutoDisposeFutureProvider<MainPagePdfModal> {
  /// See also [mainPagePdfCreate].
  MainPagePdfCreateProvider({
    required String auditId,
  }) : this._internal(
          (ref) => mainPagePdfCreate(
            ref as MainPagePdfCreateRef,
            auditId: auditId,
          ),
          from: mainPagePdfCreateProvider,
          name: r'mainPagePdfCreateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$mainPagePdfCreateHash,
          dependencies: MainPagePdfCreateFamily._dependencies,
          allTransitiveDependencies:
              MainPagePdfCreateFamily._allTransitiveDependencies,
          auditId: auditId,
        );

  MainPagePdfCreateProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.auditId,
  }) : super.internal();

  final String auditId;

  @override
  Override overrideWith(
    FutureOr<MainPagePdfModal> Function(MainPagePdfCreateRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: MainPagePdfCreateProvider._internal(
        (ref) => create(ref as MainPagePdfCreateRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        auditId: auditId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<MainPagePdfModal> createElement() {
    return _MainPagePdfCreateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MainPagePdfCreateProvider && other.auditId == auditId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, auditId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin MainPagePdfCreateRef on AutoDisposeFutureProviderRef<MainPagePdfModal> {
  /// The parameter `auditId` of this provider.
  String get auditId;
}

class _MainPagePdfCreateProviderElement
    extends AutoDisposeFutureProviderElement<MainPagePdfModal>
    with MainPagePdfCreateRef {
  _MainPagePdfCreateProviderElement(super.provider);

  @override
  String get auditId => (origin as MainPagePdfCreateProvider).auditId;
}

String _$postAuditPdfHash() => r'6db7d105961e947b7619c80c83f64e387fb461ad';

/// See also [postAuditPdf].
@ProviderFor(postAuditPdf)
const postAuditPdfProvider = PostAuditPdfFamily();

/// See also [postAuditPdf].
class PostAuditPdfFamily extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [postAuditPdf].
  const PostAuditPdfFamily();

  /// See also [postAuditPdf].
  PostAuditPdfProvider call({
    String? auditId,
    String? remark,
    File? file,
  }) {
    return PostAuditPdfProvider(
      auditId: auditId,
      remark: remark,
      file: file,
    );
  }

  @override
  PostAuditPdfProvider getProviderOverride(
    covariant PostAuditPdfProvider provider,
  ) {
    return call(
      auditId: provider.auditId,
      remark: provider.remark,
      file: provider.file,
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
  String? get name => r'postAuditPdfProvider';
}

/// See also [postAuditPdf].
class PostAuditPdfProvider
    extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [postAuditPdf].
  PostAuditPdfProvider({
    String? auditId,
    String? remark,
    File? file,
  }) : this._internal(
          (ref) => postAuditPdf(
            ref as PostAuditPdfRef,
            auditId: auditId,
            remark: remark,
            file: file,
          ),
          from: postAuditPdfProvider,
          name: r'postAuditPdfProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$postAuditPdfHash,
          dependencies: PostAuditPdfFamily._dependencies,
          allTransitiveDependencies:
              PostAuditPdfFamily._allTransitiveDependencies,
          auditId: auditId,
          remark: remark,
          file: file,
        );

  PostAuditPdfProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.auditId,
    required this.remark,
    required this.file,
  }) : super.internal();

  final String? auditId;
  final String? remark;
  final File? file;

  @override
  Override overrideWith(
    FutureOr<Map<String, dynamic>> Function(PostAuditPdfRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PostAuditPdfProvider._internal(
        (ref) => create(ref as PostAuditPdfRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        auditId: auditId,
        remark: remark,
        file: file,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<String, dynamic>> createElement() {
    return _PostAuditPdfProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PostAuditPdfProvider &&
        other.auditId == auditId &&
        other.remark == remark &&
        other.file == file;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, auditId.hashCode);
    hash = _SystemHash.combine(hash, remark.hashCode);
    hash = _SystemHash.combine(hash, file.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PostAuditPdfRef on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `auditId` of this provider.
  String? get auditId;

  /// The parameter `remark` of this provider.
  String? get remark;

  /// The parameter `file` of this provider.
  File? get file;
}

class _PostAuditPdfProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with PostAuditPdfRef {
  _PostAuditPdfProviderElement(super.provider);

  @override
  String? get auditId => (origin as PostAuditPdfProvider).auditId;
  @override
  String? get remark => (origin as PostAuditPdfProvider).remark;
  @override
  File? get file => (origin as PostAuditPdfProvider).file;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
