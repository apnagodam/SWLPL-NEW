// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'WalletService.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$walletStatementHash() => r'89ca5bec87f7cdc00d529d7ef38e6e8564d2915b';

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

/// See also [walletStatement].
@ProviderFor(walletStatement)
const walletStatementProvider = WalletStatementFamily();

/// See also [walletStatement].
class WalletStatementFamily
    extends Family<AsyncValue<EmployeeWalletStatementModel>> {
  /// See also [walletStatement].
  const WalletStatementFamily();

  /// See also [walletStatement].
  WalletStatementProvider call({
    String? fromDate,
    String? toDate,
  }) {
    return WalletStatementProvider(
      fromDate: fromDate,
      toDate: toDate,
    );
  }

  @override
  WalletStatementProvider getProviderOverride(
    covariant WalletStatementProvider provider,
  ) {
    return call(
      fromDate: provider.fromDate,
      toDate: provider.toDate,
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
  String? get name => r'walletStatementProvider';
}

/// See also [walletStatement].
class WalletStatementProvider
    extends AutoDisposeStreamProvider<EmployeeWalletStatementModel> {
  /// See also [walletStatement].
  WalletStatementProvider({
    String? fromDate,
    String? toDate,
  }) : this._internal(
          (ref) => walletStatement(
            ref as WalletStatementRef,
            fromDate: fromDate,
            toDate: toDate,
          ),
          from: walletStatementProvider,
          name: r'walletStatementProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$walletStatementHash,
          dependencies: WalletStatementFamily._dependencies,
          allTransitiveDependencies:
              WalletStatementFamily._allTransitiveDependencies,
          fromDate: fromDate,
          toDate: toDate,
        );

  WalletStatementProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.fromDate,
    required this.toDate,
  }) : super.internal();

  final String? fromDate;
  final String? toDate;

  @override
  Override overrideWith(
    Stream<EmployeeWalletStatementModel> Function(WalletStatementRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WalletStatementProvider._internal(
        (ref) => create(ref as WalletStatementRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        fromDate: fromDate,
        toDate: toDate,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<EmployeeWalletStatementModel>
      createElement() {
    return _WalletStatementProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WalletStatementProvider &&
        other.fromDate == fromDate &&
        other.toDate == toDate;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, fromDate.hashCode);
    hash = _SystemHash.combine(hash, toDate.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin WalletStatementRef
    on AutoDisposeStreamProviderRef<EmployeeWalletStatementModel> {
  /// The parameter `fromDate` of this provider.
  String? get fromDate;

  /// The parameter `toDate` of this provider.
  String? get toDate;
}

class _WalletStatementProviderElement
    extends AutoDisposeStreamProviderElement<EmployeeWalletStatementModel>
    with WalletStatementRef {
  _WalletStatementProviderElement(super.provider);

  @override
  String? get fromDate => (origin as WalletStatementProvider).fromDate;
  @override
  String? get toDate => (origin as WalletStatementProvider).toDate;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
