// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PvService.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$postPvHash() => r'0a3c2d9536ac89fa39d0917647dc3662bdafe9f1';

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

/// See also [postPv].
@ProviderFor(postPv)
const postPvProvider = PostPvFamily();

/// See also [postPv].
class PostPvFamily extends Family<AsyncValue<BaseResponse>> {
  /// See also [postPv].
  const PostPvFamily();

  /// See also [postPv].
  PostPvProvider call({
    Pvmodel? pvModel,
  }) {
    return PostPvProvider(
      pvModel: pvModel,
    );
  }

  @override
  PostPvProvider getProviderOverride(
    covariant PostPvProvider provider,
  ) {
    return call(
      pvModel: provider.pvModel,
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
  String? get name => r'postPvProvider';
}

/// See also [postPv].
class PostPvProvider extends AutoDisposeFutureProvider<BaseResponse> {
  /// See also [postPv].
  PostPvProvider({
    Pvmodel? pvModel,
  }) : this._internal(
          (ref) => postPv(
            ref as PostPvRef,
            pvModel: pvModel,
          ),
          from: postPvProvider,
          name: r'postPvProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$postPvHash,
          dependencies: PostPvFamily._dependencies,
          allTransitiveDependencies: PostPvFamily._allTransitiveDependencies,
          pvModel: pvModel,
        );

  PostPvProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.pvModel,
  }) : super.internal();

  final Pvmodel? pvModel;

  @override
  Override overrideWith(
    FutureOr<BaseResponse> Function(PostPvRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PostPvProvider._internal(
        (ref) => create(ref as PostPvRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        pvModel: pvModel,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<BaseResponse> createElement() {
    return _PostPvProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PostPvProvider && other.pvModel == pvModel;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, pvModel.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PostPvRef on AutoDisposeFutureProviderRef<BaseResponse> {
  /// The parameter `pvModel` of this provider.
  Pvmodel? get pvModel;
}

class _PostPvProviderElement
    extends AutoDisposeFutureProviderElement<BaseResponse> with PostPvRef {
  _PostPvProviderElement(super.provider);

  @override
  Pvmodel? get pvModel => (origin as PostPvProvider).pvModel;
}

String _$pvTerminalsHash() => r'a432343d0f73b8f216d5cb05230dd6d96937266a';

/// See also [pvTerminals].
@ProviderFor(pvTerminals)
final pvTerminalsProvider = AutoDisposeStreamProvider<PvResponseModel>.internal(
  pvTerminals,
  name: r'pvTerminalsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$pvTerminalsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PvTerminalsRef = AutoDisposeStreamProviderRef<PvResponseModel>;
String _$pvStacksHash() => r'72529a4986fc32547c98210e87abd54bc3af94ee';

/// See also [pvStacks].
@ProviderFor(pvStacks)
const pvStacksProvider = PvStacksFamily();

/// See also [pvStacks].
class PvStacksFamily extends Family<AsyncValue<PvResponseModel>> {
  /// See also [pvStacks].
  const PvStacksFamily();

  /// See also [pvStacks].
  PvStacksProvider call({
    String? terminalId,
  }) {
    return PvStacksProvider(
      terminalId: terminalId,
    );
  }

  @override
  PvStacksProvider getProviderOverride(
    covariant PvStacksProvider provider,
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
  String? get name => r'pvStacksProvider';
}

/// See also [pvStacks].
class PvStacksProvider extends AutoDisposeStreamProvider<PvResponseModel> {
  /// See also [pvStacks].
  PvStacksProvider({
    String? terminalId,
  }) : this._internal(
          (ref) => pvStacks(
            ref as PvStacksRef,
            terminalId: terminalId,
          ),
          from: pvStacksProvider,
          name: r'pvStacksProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$pvStacksHash,
          dependencies: PvStacksFamily._dependencies,
          allTransitiveDependencies: PvStacksFamily._allTransitiveDependencies,
          terminalId: terminalId,
        );

  PvStacksProvider._internal(
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
    Stream<PvResponseModel> Function(PvStacksRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PvStacksProvider._internal(
        (ref) => create(ref as PvStacksRef),
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
  AutoDisposeStreamProviderElement<PvResponseModel> createElement() {
    return _PvStacksProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PvStacksProvider && other.terminalId == terminalId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, terminalId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PvStacksRef on AutoDisposeStreamProviderRef<PvResponseModel> {
  /// The parameter `terminalId` of this provider.
  String? get terminalId;
}

class _PvStacksProviderElement
    extends AutoDisposeStreamProviderElement<PvResponseModel> with PvStacksRef {
  _PvStacksProviderElement(super.provider);

  @override
  String? get terminalId => (origin as PvStacksProvider).terminalId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
