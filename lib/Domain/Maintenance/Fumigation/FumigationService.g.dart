// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'FumigationService.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fumigationUpdateHash() => r'6fdbf505af44514fff3606a4d559b8091fe2765c';

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

/// See also [fumigationUpdate].
@ProviderFor(fumigationUpdate)
const fumigationUpdateProvider = FumigationUpdateFamily();

/// See also [fumigationUpdate].
class FumigationUpdateFamily extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [fumigationUpdate].
  const FumigationUpdateFamily();

  /// See also [fumigationUpdate].
  FumigationUpdateProvider call({
    String? terminalid,
    String? commodity,
    String? stackno,
    File? image,
    String? remark,
    String? fumiagency,
    String? dose,
    String? date,
  }) {
    return FumigationUpdateProvider(
      terminalid: terminalid,
      commodity: commodity,
      stackno: stackno,
      image: image,
      remark: remark,
      fumiagency: fumiagency,
      dose: dose,
      date: date,
    );
  }

  @override
  FumigationUpdateProvider getProviderOverride(
    covariant FumigationUpdateProvider provider,
  ) {
    return call(
      terminalid: provider.terminalid,
      commodity: provider.commodity,
      stackno: provider.stackno,
      image: provider.image,
      remark: provider.remark,
      fumiagency: provider.fumiagency,
      dose: provider.dose,
      date: provider.date,
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
  String? get name => r'fumigationUpdateProvider';
}

/// See also [fumigationUpdate].
class FumigationUpdateProvider
    extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [fumigationUpdate].
  FumigationUpdateProvider({
    String? terminalid,
    String? commodity,
    String? stackno,
    File? image,
    String? remark,
    String? fumiagency,
    String? dose,
    String? date,
  }) : this._internal(
          (ref) => fumigationUpdate(
            ref as FumigationUpdateRef,
            terminalid: terminalid,
            commodity: commodity,
            stackno: stackno,
            image: image,
            remark: remark,
            fumiagency: fumiagency,
            dose: dose,
            date: date,
          ),
          from: fumigationUpdateProvider,
          name: r'fumigationUpdateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fumigationUpdateHash,
          dependencies: FumigationUpdateFamily._dependencies,
          allTransitiveDependencies:
              FumigationUpdateFamily._allTransitiveDependencies,
          terminalid: terminalid,
          commodity: commodity,
          stackno: stackno,
          image: image,
          remark: remark,
          fumiagency: fumiagency,
          dose: dose,
          date: date,
        );

  FumigationUpdateProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.terminalid,
    required this.commodity,
    required this.stackno,
    required this.image,
    required this.remark,
    required this.fumiagency,
    required this.dose,
    required this.date,
  }) : super.internal();

  final String? terminalid;
  final String? commodity;
  final String? stackno;
  final File? image;
  final String? remark;
  final String? fumiagency;
  final String? dose;
  final String? date;

  @override
  Override overrideWith(
    FutureOr<Map<String, dynamic>> Function(FumigationUpdateRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FumigationUpdateProvider._internal(
        (ref) => create(ref as FumigationUpdateRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        terminalid: terminalid,
        commodity: commodity,
        stackno: stackno,
        image: image,
        remark: remark,
        fumiagency: fumiagency,
        dose: dose,
        date: date,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<String, dynamic>> createElement() {
    return _FumigationUpdateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FumigationUpdateProvider &&
        other.terminalid == terminalid &&
        other.commodity == commodity &&
        other.stackno == stackno &&
        other.image == image &&
        other.remark == remark &&
        other.fumiagency == fumiagency &&
        other.dose == dose &&
        other.date == date;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, terminalid.hashCode);
    hash = _SystemHash.combine(hash, commodity.hashCode);
    hash = _SystemHash.combine(hash, stackno.hashCode);
    hash = _SystemHash.combine(hash, image.hashCode);
    hash = _SystemHash.combine(hash, remark.hashCode);
    hash = _SystemHash.combine(hash, fumiagency.hashCode);
    hash = _SystemHash.combine(hash, dose.hashCode);
    hash = _SystemHash.combine(hash, date.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FumigationUpdateRef
    on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `terminalid` of this provider.
  String? get terminalid;

  /// The parameter `commodity` of this provider.
  String? get commodity;

  /// The parameter `stackno` of this provider.
  String? get stackno;

  /// The parameter `image` of this provider.
  File? get image;

  /// The parameter `remark` of this provider.
  String? get remark;

  /// The parameter `fumiagency` of this provider.
  String? get fumiagency;

  /// The parameter `dose` of this provider.
  String? get dose;

  /// The parameter `date` of this provider.
  String? get date;
}

class _FumigationUpdateProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with FumigationUpdateRef {
  _FumigationUpdateProviderElement(super.provider);

  @override
  String? get terminalid => (origin as FumigationUpdateProvider).terminalid;
  @override
  String? get commodity => (origin as FumigationUpdateProvider).commodity;
  @override
  String? get stackno => (origin as FumigationUpdateProvider).stackno;
  @override
  File? get image => (origin as FumigationUpdateProvider).image;
  @override
  String? get remark => (origin as FumigationUpdateProvider).remark;
  @override
  String? get fumiagency => (origin as FumigationUpdateProvider).fumiagency;
  @override
  String? get dose => (origin as FumigationUpdateProvider).dose;
  @override
  String? get date => (origin as FumigationUpdateProvider).date;
}

String _$updateDegasHash() => r'213b980dfaaf6f423a9cc37659b59ded776d41b8';

/// See also [updateDegas].
@ProviderFor(updateDegas)
const updateDegasProvider = UpdateDegasFamily();

/// See also [updateDegas].
class UpdateDegasFamily extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [updateDegas].
  const UpdateDegasFamily();

  /// See also [updateDegas].
  UpdateDegasProvider call({
    String? id,
  }) {
    return UpdateDegasProvider(
      id: id,
    );
  }

  @override
  UpdateDegasProvider getProviderOverride(
    covariant UpdateDegasProvider provider,
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
  String? get name => r'updateDegasProvider';
}

/// See also [updateDegas].
class UpdateDegasProvider
    extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [updateDegas].
  UpdateDegasProvider({
    String? id,
  }) : this._internal(
          (ref) => updateDegas(
            ref as UpdateDegasRef,
            id: id,
          ),
          from: updateDegasProvider,
          name: r'updateDegasProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$updateDegasHash,
          dependencies: UpdateDegasFamily._dependencies,
          allTransitiveDependencies:
              UpdateDegasFamily._allTransitiveDependencies,
          id: id,
        );

  UpdateDegasProvider._internal(
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
    FutureOr<Map<String, dynamic>> Function(UpdateDegasRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UpdateDegasProvider._internal(
        (ref) => create(ref as UpdateDegasRef),
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
    return _UpdateDegasProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateDegasProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UpdateDegasRef on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `id` of this provider.
  String? get id;
}

class _UpdateDegasProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with UpdateDegasRef {
  _UpdateDegasProviderElement(super.provider);

  @override
  String? get id => (origin as UpdateDegasProvider).id;
}

String _$fumigationListHash() => r'6b6e9cc19a338a0b195332139137df5bb33926e4';

/// See also [fumigationList].
@ProviderFor(fumigationList)
final fumigationListProvider =
    AutoDisposeStreamProvider<FumigationListModel>.internal(
  fumigationList,
  name: r'fumigationListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fumigationListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FumigationListRef = AutoDisposeStreamProviderRef<FumigationListModel>;
String _$fumigationAgencyHash() => r'68df81a3f8d8cf0e6e9f03fd02af77cbade9899f';

/// See also [fumigationAgency].
@ProviderFor(fumigationAgency)
final fumigationAgencyProvider =
    AutoDisposeStreamProvider<FumigationAgencyModal>.internal(
  fumigationAgency,
  name: r'fumigationAgencyProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fumigationAgencyHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FumigationAgencyRef
    = AutoDisposeStreamProviderRef<FumigationAgencyModal>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
