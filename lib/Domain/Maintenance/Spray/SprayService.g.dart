// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SprayService.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$updateSprayHash() => r'd85851f7351479d32804a70077193829ab7f1b3d';

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

/// See also [updateSpray].
@ProviderFor(updateSpray)
const updateSprayProvider = UpdateSprayFamily();

/// See also [updateSpray].
class UpdateSprayFamily extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [updateSpray].
  const UpdateSprayFamily();

  /// See also [updateSpray].
  UpdateSprayProvider call({
    String? terminal,
    String? chemical,
    String? dose,
    File? image,
    String? date,
    String? remark,
  }) {
    return UpdateSprayProvider(
      terminal: terminal,
      chemical: chemical,
      dose: dose,
      image: image,
      date: date,
      remark: remark,
    );
  }

  @override
  UpdateSprayProvider getProviderOverride(
    covariant UpdateSprayProvider provider,
  ) {
    return call(
      terminal: provider.terminal,
      chemical: provider.chemical,
      dose: provider.dose,
      image: provider.image,
      date: provider.date,
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
  String? get name => r'updateSprayProvider';
}

/// See also [updateSpray].
class UpdateSprayProvider
    extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [updateSpray].
  UpdateSprayProvider({
    String? terminal,
    String? chemical,
    String? dose,
    File? image,
    String? date,
    String? remark,
  }) : this._internal(
          (ref) => updateSpray(
            ref as UpdateSprayRef,
            terminal: terminal,
            chemical: chemical,
            dose: dose,
            image: image,
            date: date,
            remark: remark,
          ),
          from: updateSprayProvider,
          name: r'updateSprayProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$updateSprayHash,
          dependencies: UpdateSprayFamily._dependencies,
          allTransitiveDependencies:
              UpdateSprayFamily._allTransitiveDependencies,
          terminal: terminal,
          chemical: chemical,
          dose: dose,
          image: image,
          date: date,
          remark: remark,
        );

  UpdateSprayProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.terminal,
    required this.chemical,
    required this.dose,
    required this.image,
    required this.date,
    required this.remark,
  }) : super.internal();

  final String? terminal;
  final String? chemical;
  final String? dose;
  final File? image;
  final String? date;
  final String? remark;

  @override
  Override overrideWith(
    FutureOr<Map<String, dynamic>> Function(UpdateSprayRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UpdateSprayProvider._internal(
        (ref) => create(ref as UpdateSprayRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        terminal: terminal,
        chemical: chemical,
        dose: dose,
        image: image,
        date: date,
        remark: remark,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<String, dynamic>> createElement() {
    return _UpdateSprayProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateSprayProvider &&
        other.terminal == terminal &&
        other.chemical == chemical &&
        other.dose == dose &&
        other.image == image &&
        other.date == date &&
        other.remark == remark;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, terminal.hashCode);
    hash = _SystemHash.combine(hash, chemical.hashCode);
    hash = _SystemHash.combine(hash, dose.hashCode);
    hash = _SystemHash.combine(hash, image.hashCode);
    hash = _SystemHash.combine(hash, date.hashCode);
    hash = _SystemHash.combine(hash, remark.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UpdateSprayRef on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `terminal` of this provider.
  String? get terminal;

  /// The parameter `chemical` of this provider.
  String? get chemical;

  /// The parameter `dose` of this provider.
  String? get dose;

  /// The parameter `image` of this provider.
  File? get image;

  /// The parameter `date` of this provider.
  String? get date;

  /// The parameter `remark` of this provider.
  String? get remark;
}

class _UpdateSprayProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with UpdateSprayRef {
  _UpdateSprayProviderElement(super.provider);

  @override
  String? get terminal => (origin as UpdateSprayProvider).terminal;
  @override
  String? get chemical => (origin as UpdateSprayProvider).chemical;
  @override
  String? get dose => (origin as UpdateSprayProvider).dose;
  @override
  File? get image => (origin as UpdateSprayProvider).image;
  @override
  String? get date => (origin as UpdateSprayProvider).date;
  @override
  String? get remark => (origin as UpdateSprayProvider).remark;
}

String _$sprayListHash() => r'ed1bb5c4110b441c9f5c6b59d1a46da4cb46d8e0';

/// See also [sprayList].
@ProviderFor(sprayList)
final sprayListProvider =
    AutoDisposeStreamProvider<SprayCleaningModal>.internal(
  sprayList,
  name: r'sprayListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$sprayListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SprayListRef = AutoDisposeStreamProviderRef<SprayCleaningModal>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
