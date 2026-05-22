// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CleaningService.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$cleaningListHash() => r'fb60801153b1d062a65b03fc5238a7abaa8d2260';

/// See also [cleaningList].
@ProviderFor(cleaningList)
final cleaningListProvider = AutoDisposeStreamProvider<CleaningModal>.internal(
  cleaningList,
  name: r'cleaningListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$cleaningListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CleaningListRef = AutoDisposeStreamProviderRef<CleaningModal>;
String _$updateCleaningHash() => r'779eea89cf4ab291bfd0057ae56a3e7461c8a5e1';

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

/// See also [updateCleaning].
@ProviderFor(updateCleaning)
const updateCleaningProvider = UpdateCleaningFamily();

/// See also [updateCleaning].
class UpdateCleaningFamily extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [updateCleaning].
  const UpdateCleaningFamily();

  /// See also [updateCleaning].
  UpdateCleaningProvider call({
    String? terminal,
    String? date,
    File? image,
    String? remark,
  }) {
    return UpdateCleaningProvider(
      terminal: terminal,
      date: date,
      image: image,
      remark: remark,
    );
  }

  @override
  UpdateCleaningProvider getProviderOverride(
    covariant UpdateCleaningProvider provider,
  ) {
    return call(
      terminal: provider.terminal,
      date: provider.date,
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
  String? get name => r'updateCleaningProvider';
}

/// See also [updateCleaning].
class UpdateCleaningProvider
    extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [updateCleaning].
  UpdateCleaningProvider({
    String? terminal,
    String? date,
    File? image,
    String? remark,
  }) : this._internal(
          (ref) => updateCleaning(
            ref as UpdateCleaningRef,
            terminal: terminal,
            date: date,
            image: image,
            remark: remark,
          ),
          from: updateCleaningProvider,
          name: r'updateCleaningProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$updateCleaningHash,
          dependencies: UpdateCleaningFamily._dependencies,
          allTransitiveDependencies:
              UpdateCleaningFamily._allTransitiveDependencies,
          terminal: terminal,
          date: date,
          image: image,
          remark: remark,
        );

  UpdateCleaningProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.terminal,
    required this.date,
    required this.image,
    required this.remark,
  }) : super.internal();

  final String? terminal;
  final String? date;
  final File? image;
  final String? remark;

  @override
  Override overrideWith(
    FutureOr<Map<String, dynamic>> Function(UpdateCleaningRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UpdateCleaningProvider._internal(
        (ref) => create(ref as UpdateCleaningRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        terminal: terminal,
        date: date,
        image: image,
        remark: remark,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<String, dynamic>> createElement() {
    return _UpdateCleaningProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateCleaningProvider &&
        other.terminal == terminal &&
        other.date == date &&
        other.image == image &&
        other.remark == remark;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, terminal.hashCode);
    hash = _SystemHash.combine(hash, date.hashCode);
    hash = _SystemHash.combine(hash, image.hashCode);
    hash = _SystemHash.combine(hash, remark.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UpdateCleaningRef on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `terminal` of this provider.
  String? get terminal;

  /// The parameter `date` of this provider.
  String? get date;

  /// The parameter `image` of this provider.
  File? get image;

  /// The parameter `remark` of this provider.
  String? get remark;
}

class _UpdateCleaningProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with UpdateCleaningRef {
  _UpdateCleaningProviderElement(super.provider);

  @override
  String? get terminal => (origin as UpdateCleaningProvider).terminal;
  @override
  String? get date => (origin as UpdateCleaningProvider).date;
  @override
  File? get image => (origin as UpdateCleaningProvider).image;
  @override
  String? get remark => (origin as UpdateCleaningProvider).remark;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
