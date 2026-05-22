// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'widgets.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$createStampedImage2Hash() =>
    r'a861ca76148a060f90cf721259e78628bd2d69ed';

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

/// See also [createStampedImage2].
@ProviderFor(createStampedImage2)
const createStampedImage2Provider = CreateStampedImage2Family();

/// See also [createStampedImage2].
class CreateStampedImage2Family extends Family<AsyncValue<Uint8List?>> {
  /// See also [createStampedImage2].
  const CreateStampedImage2Family();

  /// See also [createStampedImage2].
  CreateStampedImage2Provider call({
    required Uint8List u8int,
  }) {
    return CreateStampedImage2Provider(
      u8int: u8int,
    );
  }

  @override
  CreateStampedImage2Provider getProviderOverride(
    covariant CreateStampedImage2Provider provider,
  ) {
    return call(
      u8int: provider.u8int,
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
  String? get name => r'createStampedImage2Provider';
}

/// See also [createStampedImage2].
class CreateStampedImage2Provider
    extends AutoDisposeFutureProvider<Uint8List?> {
  /// See also [createStampedImage2].
  CreateStampedImage2Provider({
    required Uint8List u8int,
  }) : this._internal(
          (ref) => createStampedImage2(
            ref as CreateStampedImage2Ref,
            u8int: u8int,
          ),
          from: createStampedImage2Provider,
          name: r'createStampedImage2Provider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$createStampedImage2Hash,
          dependencies: CreateStampedImage2Family._dependencies,
          allTransitiveDependencies:
              CreateStampedImage2Family._allTransitiveDependencies,
          u8int: u8int,
        );

  CreateStampedImage2Provider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.u8int,
  }) : super.internal();

  final Uint8List u8int;

  @override
  Override overrideWith(
    FutureOr<Uint8List?> Function(CreateStampedImage2Ref provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CreateStampedImage2Provider._internal(
        (ref) => create(ref as CreateStampedImage2Ref),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        u8int: u8int,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Uint8List?> createElement() {
    return _CreateStampedImage2ProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CreateStampedImage2Provider && other.u8int == u8int;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, u8int.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CreateStampedImage2Ref on AutoDisposeFutureProviderRef<Uint8List?> {
  /// The parameter `u8int` of this provider.
  Uint8List get u8int;
}

class _CreateStampedImage2ProviderElement
    extends AutoDisposeFutureProviderElement<Uint8List?>
    with CreateStampedImage2Ref {
  _CreateStampedImage2ProviderElement(super.provider);

  @override
  Uint8List get u8int => (origin as CreateStampedImage2Provider).u8int;
}

String _$stampedImageHash() => r'e9e1ebb614b89d147cb939d277d1729454d2fbb7';

/// See also [stampedImage].
@ProviderFor(stampedImage)
const stampedImageProvider = StampedImageFamily();

/// See also [stampedImage].
class StampedImageFamily extends Family<AsyncValue<Uint8List>> {
  /// See also [stampedImage].
  const StampedImageFamily();

  /// See also [stampedImage].
  StampedImageProvider call(
    Uint8List u8int,
  ) {
    return StampedImageProvider(
      u8int,
    );
  }

  @override
  StampedImageProvider getProviderOverride(
    covariant StampedImageProvider provider,
  ) {
    return call(
      provider.u8int,
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
  String? get name => r'stampedImageProvider';
}

/// See also [stampedImage].
class StampedImageProvider extends AutoDisposeStreamProvider<Uint8List> {
  /// See also [stampedImage].
  StampedImageProvider(
    Uint8List u8int,
  ) : this._internal(
          (ref) => stampedImage(
            ref as StampedImageRef,
            u8int,
          ),
          from: stampedImageProvider,
          name: r'stampedImageProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$stampedImageHash,
          dependencies: StampedImageFamily._dependencies,
          allTransitiveDependencies:
              StampedImageFamily._allTransitiveDependencies,
          u8int: u8int,
        );

  StampedImageProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.u8int,
  }) : super.internal();

  final Uint8List u8int;

  @override
  Override overrideWith(
    Stream<Uint8List> Function(StampedImageRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: StampedImageProvider._internal(
        (ref) => create(ref as StampedImageRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        u8int: u8int,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<Uint8List> createElement() {
    return _StampedImageProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is StampedImageProvider && other.u8int == u8int;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, u8int.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin StampedImageRef on AutoDisposeStreamProviderRef<Uint8List> {
  /// The parameter `u8int` of this provider.
  Uint8List get u8int;
}

class _StampedImageProviderElement
    extends AutoDisposeStreamProviderElement<Uint8List> with StampedImageRef {
  _StampedImageProviderElement(super.provider);

  @override
  Uint8List get u8int => (origin as StampedImageProvider).u8int;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
