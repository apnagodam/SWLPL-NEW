// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SanctionLimitService.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sanctionLimitListHash() => r'2cfab46e3e8a7e1159b63ea23337dcc48b404523';

/// See also [sanctionLimitList].
@ProviderFor(sanctionLimitList)
final sanctionLimitListProvider =
    AutoDisposeStreamProvider<SanctionlimitModal>.internal(
  sanctionLimitList,
  name: r'sanctionLimitListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$sanctionLimitListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SanctionLimitListRef = AutoDisposeStreamProviderRef<SanctionlimitModal>;
String _$sanctionLimitApproveHash() =>
    r'b599e81d0a133b9b5b22de17ce9a4b8ae2b7f9e1';

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

/// See also [sanctionLimitApprove].
@ProviderFor(sanctionLimitApprove)
const sanctionLimitApproveProvider = SanctionLimitApproveFamily();

/// See also [sanctionLimitApprove].
class SanctionLimitApproveFamily
    extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [sanctionLimitApprove].
  const SanctionLimitApproveFamily();

  /// See also [sanctionLimitApprove].
  SanctionLimitApproveProvider call({
    String? id,
    String? notes,
    String? amount,
  }) {
    return SanctionLimitApproveProvider(
      id: id,
      notes: notes,
      amount: amount,
    );
  }

  @override
  SanctionLimitApproveProvider getProviderOverride(
    covariant SanctionLimitApproveProvider provider,
  ) {
    return call(
      id: provider.id,
      notes: provider.notes,
      amount: provider.amount,
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
  String? get name => r'sanctionLimitApproveProvider';
}

/// See also [sanctionLimitApprove].
class SanctionLimitApproveProvider
    extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [sanctionLimitApprove].
  SanctionLimitApproveProvider({
    String? id,
    String? notes,
    String? amount,
  }) : this._internal(
          (ref) => sanctionLimitApprove(
            ref as SanctionLimitApproveRef,
            id: id,
            notes: notes,
            amount: amount,
          ),
          from: sanctionLimitApproveProvider,
          name: r'sanctionLimitApproveProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$sanctionLimitApproveHash,
          dependencies: SanctionLimitApproveFamily._dependencies,
          allTransitiveDependencies:
              SanctionLimitApproveFamily._allTransitiveDependencies,
          id: id,
          notes: notes,
          amount: amount,
        );

  SanctionLimitApproveProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
    required this.notes,
    required this.amount,
  }) : super.internal();

  final String? id;
  final String? notes;
  final String? amount;

  @override
  Override overrideWith(
    FutureOr<Map<String, dynamic>> Function(SanctionLimitApproveRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SanctionLimitApproveProvider._internal(
        (ref) => create(ref as SanctionLimitApproveRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
        notes: notes,
        amount: amount,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<String, dynamic>> createElement() {
    return _SanctionLimitApproveProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SanctionLimitApproveProvider &&
        other.id == id &&
        other.notes == notes &&
        other.amount == amount;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);
    hash = _SystemHash.combine(hash, notes.hashCode);
    hash = _SystemHash.combine(hash, amount.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SanctionLimitApproveRef
    on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `id` of this provider.
  String? get id;

  /// The parameter `notes` of this provider.
  String? get notes;

  /// The parameter `amount` of this provider.
  String? get amount;
}

class _SanctionLimitApproveProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with SanctionLimitApproveRef {
  _SanctionLimitApproveProviderElement(super.provider);

  @override
  String? get id => (origin as SanctionLimitApproveProvider).id;
  @override
  String? get notes => (origin as SanctionLimitApproveProvider).notes;
  @override
  String? get amount => (origin as SanctionLimitApproveProvider).amount;
}

String _$sanctionLimitRejectHash() =>
    r'796ca9ddf181c64e6a4e55d8b183c41d0f38ed67';

/// See also [sanctionLimitReject].
@ProviderFor(sanctionLimitReject)
const sanctionLimitRejectProvider = SanctionLimitRejectFamily();

/// See also [sanctionLimitReject].
class SanctionLimitRejectFamily
    extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [sanctionLimitReject].
  const SanctionLimitRejectFamily();

  /// See also [sanctionLimitReject].
  SanctionLimitRejectProvider call({
    String? id,
    String? notes,
    String? amount,
  }) {
    return SanctionLimitRejectProvider(
      id: id,
      notes: notes,
      amount: amount,
    );
  }

  @override
  SanctionLimitRejectProvider getProviderOverride(
    covariant SanctionLimitRejectProvider provider,
  ) {
    return call(
      id: provider.id,
      notes: provider.notes,
      amount: provider.amount,
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
  String? get name => r'sanctionLimitRejectProvider';
}

/// See also [sanctionLimitReject].
class SanctionLimitRejectProvider
    extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [sanctionLimitReject].
  SanctionLimitRejectProvider({
    String? id,
    String? notes,
    String? amount,
  }) : this._internal(
          (ref) => sanctionLimitReject(
            ref as SanctionLimitRejectRef,
            id: id,
            notes: notes,
            amount: amount,
          ),
          from: sanctionLimitRejectProvider,
          name: r'sanctionLimitRejectProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$sanctionLimitRejectHash,
          dependencies: SanctionLimitRejectFamily._dependencies,
          allTransitiveDependencies:
              SanctionLimitRejectFamily._allTransitiveDependencies,
          id: id,
          notes: notes,
          amount: amount,
        );

  SanctionLimitRejectProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
    required this.notes,
    required this.amount,
  }) : super.internal();

  final String? id;
  final String? notes;
  final String? amount;

  @override
  Override overrideWith(
    FutureOr<Map<String, dynamic>> Function(SanctionLimitRejectRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SanctionLimitRejectProvider._internal(
        (ref) => create(ref as SanctionLimitRejectRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
        notes: notes,
        amount: amount,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<String, dynamic>> createElement() {
    return _SanctionLimitRejectProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SanctionLimitRejectProvider &&
        other.id == id &&
        other.notes == notes &&
        other.amount == amount;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);
    hash = _SystemHash.combine(hash, notes.hashCode);
    hash = _SystemHash.combine(hash, amount.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SanctionLimitRejectRef
    on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `id` of this provider.
  String? get id;

  /// The parameter `notes` of this provider.
  String? get notes;

  /// The parameter `amount` of this provider.
  String? get amount;
}

class _SanctionLimitRejectProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with SanctionLimitRejectRef {
  _SanctionLimitRejectProviderElement(super.provider);

  @override
  String? get id => (origin as SanctionLimitRejectProvider).id;
  @override
  String? get notes => (origin as SanctionLimitRejectProvider).notes;
  @override
  String? get amount => (origin as SanctionLimitRejectProvider).amount;
}

String _$sancationLetterPdfHash() =>
    r'1aec2e6e615000d5a7807c635a1bc319f6b08d60';

/// See also [sancationLetterPdf].
@ProviderFor(sancationLetterPdf)
const sancationLetterPdfProvider = SancationLetterPdfFamily();

/// See also [sancationLetterPdf].
class SancationLetterPdfFamily
    extends Family<AsyncValue<SancationLetterPdfModal>> {
  /// See also [sancationLetterPdf].
  const SancationLetterPdfFamily();

  /// See also [sancationLetterPdf].
  SancationLetterPdfProvider call({
    required String id,
  }) {
    return SancationLetterPdfProvider(
      id: id,
    );
  }

  @override
  SancationLetterPdfProvider getProviderOverride(
    covariant SancationLetterPdfProvider provider,
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
  String? get name => r'sancationLetterPdfProvider';
}

/// See also [sancationLetterPdf].
class SancationLetterPdfProvider
    extends AutoDisposeFutureProvider<SancationLetterPdfModal> {
  /// See also [sancationLetterPdf].
  SancationLetterPdfProvider({
    required String id,
  }) : this._internal(
          (ref) => sancationLetterPdf(
            ref as SancationLetterPdfRef,
            id: id,
          ),
          from: sancationLetterPdfProvider,
          name: r'sancationLetterPdfProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$sancationLetterPdfHash,
          dependencies: SancationLetterPdfFamily._dependencies,
          allTransitiveDependencies:
              SancationLetterPdfFamily._allTransitiveDependencies,
          id: id,
        );

  SancationLetterPdfProvider._internal(
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
    FutureOr<SancationLetterPdfModal> Function(SancationLetterPdfRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SancationLetterPdfProvider._internal(
        (ref) => create(ref as SancationLetterPdfRef),
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
  AutoDisposeFutureProviderElement<SancationLetterPdfModal> createElement() {
    return _SancationLetterPdfProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SancationLetterPdfProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SancationLetterPdfRef
    on AutoDisposeFutureProviderRef<SancationLetterPdfModal> {
  /// The parameter `id` of this provider.
  String get id;
}

class _SancationLetterPdfProviderElement
    extends AutoDisposeFutureProviderElement<SancationLetterPdfModal>
    with SancationLetterPdfRef {
  _SancationLetterPdfProviderElement(super.provider);

  @override
  String get id => (origin as SancationLetterPdfProvider).id;
}

String _$smetowPdfHash() => r'ea8554b9e812367715abd8f1e0b09e7bfe55b0c4';

/// See also [smetowPdf].
@ProviderFor(smetowPdf)
const smetowPdfProvider = SmetowPdfFamily();

/// See also [smetowPdf].
class SmetowPdfFamily extends Family<AsyncValue<SmeTowPdfModal>> {
  /// See also [smetowPdf].
  const SmetowPdfFamily();

  /// See also [smetowPdf].
  SmetowPdfProvider call({
    required String id,
  }) {
    return SmetowPdfProvider(
      id: id,
    );
  }

  @override
  SmetowPdfProvider getProviderOverride(
    covariant SmetowPdfProvider provider,
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
  String? get name => r'smetowPdfProvider';
}

/// See also [smetowPdf].
class SmetowPdfProvider extends AutoDisposeFutureProvider<SmeTowPdfModal> {
  /// See also [smetowPdf].
  SmetowPdfProvider({
    required String id,
  }) : this._internal(
          (ref) => smetowPdf(
            ref as SmetowPdfRef,
            id: id,
          ),
          from: smetowPdfProvider,
          name: r'smetowPdfProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$smetowPdfHash,
          dependencies: SmetowPdfFamily._dependencies,
          allTransitiveDependencies: SmetowPdfFamily._allTransitiveDependencies,
          id: id,
        );

  SmetowPdfProvider._internal(
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
    FutureOr<SmeTowPdfModal> Function(SmetowPdfRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SmetowPdfProvider._internal(
        (ref) => create(ref as SmetowPdfRef),
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
  AutoDisposeFutureProviderElement<SmeTowPdfModal> createElement() {
    return _SmetowPdfProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SmetowPdfProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SmetowPdfRef on AutoDisposeFutureProviderRef<SmeTowPdfModal> {
  /// The parameter `id` of this provider.
  String get id;
}

class _SmetowPdfProviderElement
    extends AutoDisposeFutureProviderElement<SmeTowPdfModal> with SmetowPdfRef {
  _SmetowPdfProviderElement(super.provider);

  @override
  String get id => (origin as SmetowPdfProvider).id;
}

String _$sanctionLimitDocumentUpdateHash() =>
    r'f15cfa0ab82c471bb758b113233ca99980b97c45';

/// See also [sanctionLimitDocumentUpdate].
@ProviderFor(sanctionLimitDocumentUpdate)
const sanctionLimitDocumentUpdateProvider = SanctionLimitDocumentUpdateFamily();

/// See also [sanctionLimitDocumentUpdate].
class SanctionLimitDocumentUpdateFamily
    extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [sanctionLimitDocumentUpdate].
  const SanctionLimitDocumentUpdateFamily();

  /// See also [sanctionLimitDocumentUpdate].
  SanctionLimitDocumentUpdateProvider call({
    String? id,
    String? sabctionLetter,
    String? pda,
    String? pdc,
    String? agreement,
  }) {
    return SanctionLimitDocumentUpdateProvider(
      id: id,
      sabctionLetter: sabctionLetter,
      pda: pda,
      pdc: pdc,
      agreement: agreement,
    );
  }

  @override
  SanctionLimitDocumentUpdateProvider getProviderOverride(
    covariant SanctionLimitDocumentUpdateProvider provider,
  ) {
    return call(
      id: provider.id,
      sabctionLetter: provider.sabctionLetter,
      pda: provider.pda,
      pdc: provider.pdc,
      agreement: provider.agreement,
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
  String? get name => r'sanctionLimitDocumentUpdateProvider';
}

/// See also [sanctionLimitDocumentUpdate].
class SanctionLimitDocumentUpdateProvider
    extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [sanctionLimitDocumentUpdate].
  SanctionLimitDocumentUpdateProvider({
    String? id,
    String? sabctionLetter,
    String? pda,
    String? pdc,
    String? agreement,
  }) : this._internal(
          (ref) => sanctionLimitDocumentUpdate(
            ref as SanctionLimitDocumentUpdateRef,
            id: id,
            sabctionLetter: sabctionLetter,
            pda: pda,
            pdc: pdc,
            agreement: agreement,
          ),
          from: sanctionLimitDocumentUpdateProvider,
          name: r'sanctionLimitDocumentUpdateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$sanctionLimitDocumentUpdateHash,
          dependencies: SanctionLimitDocumentUpdateFamily._dependencies,
          allTransitiveDependencies:
              SanctionLimitDocumentUpdateFamily._allTransitiveDependencies,
          id: id,
          sabctionLetter: sabctionLetter,
          pda: pda,
          pdc: pdc,
          agreement: agreement,
        );

  SanctionLimitDocumentUpdateProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
    required this.sabctionLetter,
    required this.pda,
    required this.pdc,
    required this.agreement,
  }) : super.internal();

  final String? id;
  final String? sabctionLetter;
  final String? pda;
  final String? pdc;
  final String? agreement;

  @override
  Override overrideWith(
    FutureOr<Map<String, dynamic>> Function(
            SanctionLimitDocumentUpdateRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SanctionLimitDocumentUpdateProvider._internal(
        (ref) => create(ref as SanctionLimitDocumentUpdateRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
        sabctionLetter: sabctionLetter,
        pda: pda,
        pdc: pdc,
        agreement: agreement,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<String, dynamic>> createElement() {
    return _SanctionLimitDocumentUpdateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SanctionLimitDocumentUpdateProvider &&
        other.id == id &&
        other.sabctionLetter == sabctionLetter &&
        other.pda == pda &&
        other.pdc == pdc &&
        other.agreement == agreement;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);
    hash = _SystemHash.combine(hash, sabctionLetter.hashCode);
    hash = _SystemHash.combine(hash, pda.hashCode);
    hash = _SystemHash.combine(hash, pdc.hashCode);
    hash = _SystemHash.combine(hash, agreement.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SanctionLimitDocumentUpdateRef
    on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `id` of this provider.
  String? get id;

  /// The parameter `sabctionLetter` of this provider.
  String? get sabctionLetter;

  /// The parameter `pda` of this provider.
  String? get pda;

  /// The parameter `pdc` of this provider.
  String? get pdc;

  /// The parameter `agreement` of this provider.
  String? get agreement;
}

class _SanctionLimitDocumentUpdateProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with SanctionLimitDocumentUpdateRef {
  _SanctionLimitDocumentUpdateProviderElement(super.provider);

  @override
  String? get id => (origin as SanctionLimitDocumentUpdateProvider).id;
  @override
  String? get sabctionLetter =>
      (origin as SanctionLimitDocumentUpdateProvider).sabctionLetter;
  @override
  String? get pda => (origin as SanctionLimitDocumentUpdateProvider).pda;
  @override
  String? get pdc => (origin as SanctionLimitDocumentUpdateProvider).pdc;
  @override
  String? get agreement =>
      (origin as SanctionLimitDocumentUpdateProvider).agreement;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
