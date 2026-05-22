// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GeocodingService.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getAddressHash() => r'8ed5f6c4ccfa00a9c9d3e1f9873f6d58b6de9c97';

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

/// See also [getAddress].
@ProviderFor(getAddress)
const getAddressProvider = GetAddressFamily();

/// See also [getAddress].
class GetAddressFamily extends Family<AsyncValue<GeocodingModel>> {
  /// See also [getAddress].
  const GetAddressFamily();

  /// See also [getAddress].
  GetAddressProvider call({
    String? latLng,
  }) {
    return GetAddressProvider(
      latLng: latLng,
    );
  }

  @override
  GetAddressProvider getProviderOverride(
    covariant GetAddressProvider provider,
  ) {
    return call(
      latLng: provider.latLng,
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
  String? get name => r'getAddressProvider';
}

/// See also [getAddress].
class GetAddressProvider extends AutoDisposeFutureProvider<GeocodingModel> {
  /// See also [getAddress].
  GetAddressProvider({
    String? latLng,
  }) : this._internal(
          (ref) => getAddress(
            ref as GetAddressRef,
            latLng: latLng,
          ),
          from: getAddressProvider,
          name: r'getAddressProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getAddressHash,
          dependencies: GetAddressFamily._dependencies,
          allTransitiveDependencies:
              GetAddressFamily._allTransitiveDependencies,
          latLng: latLng,
        );

  GetAddressProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.latLng,
  }) : super.internal();

  final String? latLng;

  @override
  Override overrideWith(
    FutureOr<GeocodingModel> Function(GetAddressRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetAddressProvider._internal(
        (ref) => create(ref as GetAddressRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        latLng: latLng,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<GeocodingModel> createElement() {
    return _GetAddressProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetAddressProvider && other.latLng == latLng;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, latLng.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetAddressRef on AutoDisposeFutureProviderRef<GeocodingModel> {
  /// The parameter `latLng` of this provider.
  String? get latLng;
}

class _GetAddressProviderElement
    extends AutoDisposeFutureProviderElement<GeocodingModel>
    with GetAddressRef {
  _GetAddressProviderElement(super.provider);

  @override
  String? get latLng => (origin as GetAddressProvider).latLng;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
