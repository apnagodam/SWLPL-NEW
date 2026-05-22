// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AdvanceService.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$requestAdvanceHash() => r'5f66cb42bf2b21f833fcb562ea0c2529109da794';

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

/// See also [requestAdvance].
@ProviderFor(requestAdvance)
const requestAdvanceProvider = RequestAdvanceFamily();

/// See also [requestAdvance].
class RequestAdvanceFamily extends Family<AsyncValue<BaseResponse>> {
  /// See also [requestAdvance].
  const RequestAdvanceFamily();

  /// See also [requestAdvance].
  RequestAdvanceProvider call({
    String? requestedAmount,
    String? notes,
    String? approverId,
  }) {
    return RequestAdvanceProvider(
      requestedAmount: requestedAmount,
      notes: notes,
      approverId: approverId,
    );
  }

  @override
  RequestAdvanceProvider getProviderOverride(
    covariant RequestAdvanceProvider provider,
  ) {
    return call(
      requestedAmount: provider.requestedAmount,
      notes: provider.notes,
      approverId: provider.approverId,
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
  String? get name => r'requestAdvanceProvider';
}

/// See also [requestAdvance].
class RequestAdvanceProvider extends AutoDisposeFutureProvider<BaseResponse> {
  /// See also [requestAdvance].
  RequestAdvanceProvider({
    String? requestedAmount,
    String? notes,
    String? approverId,
  }) : this._internal(
          (ref) => requestAdvance(
            ref as RequestAdvanceRef,
            requestedAmount: requestedAmount,
            notes: notes,
            approverId: approverId,
          ),
          from: requestAdvanceProvider,
          name: r'requestAdvanceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$requestAdvanceHash,
          dependencies: RequestAdvanceFamily._dependencies,
          allTransitiveDependencies:
              RequestAdvanceFamily._allTransitiveDependencies,
          requestedAmount: requestedAmount,
          notes: notes,
          approverId: approverId,
        );

  RequestAdvanceProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.requestedAmount,
    required this.notes,
    required this.approverId,
  }) : super.internal();

  final String? requestedAmount;
  final String? notes;
  final String? approverId;

  @override
  Override overrideWith(
    FutureOr<BaseResponse> Function(RequestAdvanceRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RequestAdvanceProvider._internal(
        (ref) => create(ref as RequestAdvanceRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        requestedAmount: requestedAmount,
        notes: notes,
        approverId: approverId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<BaseResponse> createElement() {
    return _RequestAdvanceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RequestAdvanceProvider &&
        other.requestedAmount == requestedAmount &&
        other.notes == notes &&
        other.approverId == approverId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, requestedAmount.hashCode);
    hash = _SystemHash.combine(hash, notes.hashCode);
    hash = _SystemHash.combine(hash, approverId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin RequestAdvanceRef on AutoDisposeFutureProviderRef<BaseResponse> {
  /// The parameter `requestedAmount` of this provider.
  String? get requestedAmount;

  /// The parameter `notes` of this provider.
  String? get notes;

  /// The parameter `approverId` of this provider.
  String? get approverId;
}

class _RequestAdvanceProviderElement
    extends AutoDisposeFutureProviderElement<BaseResponse>
    with RequestAdvanceRef {
  _RequestAdvanceProviderElement(super.provider);

  @override
  String? get requestedAmount =>
      (origin as RequestAdvanceProvider).requestedAmount;
  @override
  String? get notes => (origin as RequestAdvanceProvider).notes;
  @override
  String? get approverId => (origin as RequestAdvanceProvider).approverId;
}

String _$advancesListHash() => r'b7ba4ae65510d5570b2548e44cb6825e800fe1e2';

/// See also [advancesList].
@ProviderFor(advancesList)
final advancesListProvider =
    AutoDisposeStreamProvider<AdvanceListingModel>.internal(
  advancesList,
  name: r'advancesListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$advancesListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AdvancesListRef = AutoDisposeStreamProviderRef<AdvanceListingModel>;
String _$advanceApproverHash() => r'fc4a08f8034ee8313a0530afa9999de20f10bcbe';

/// See also [advanceApprover].
@ProviderFor(advanceApprover)
final advanceApproverProvider =
    AutoDisposeStreamProvider<AdvanceApproverData>.internal(
  advanceApprover,
  name: r'advanceApproverProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$advanceApproverHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AdvanceApproverRef = AutoDisposeStreamProviderRef<AdvanceApproverData>;
String _$withdrawRequestsHash() => r'c1d7a28281d339848e753d262dd2096ba1be6cc0';

/// See also [withdrawRequests].
@ProviderFor(withdrawRequests)
final withdrawRequestsProvider =
    AutoDisposeStreamProvider<WithdrawRequestsModel>.internal(
  withdrawRequests,
  name: r'withdrawRequestsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$withdrawRequestsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef WithdrawRequestsRef
    = AutoDisposeStreamProviderRef<WithdrawRequestsModel>;
String _$approveWithdrawRequestHash() =>
    r'10b54c32213ca7f830486c9c3da75e6581caed3a';

/// See also [approveWithdrawRequest].
@ProviderFor(approveWithdrawRequest)
const approveWithdrawRequestProvider = ApproveWithdrawRequestFamily();

/// See also [approveWithdrawRequest].
class ApproveWithdrawRequestFamily
    extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [approveWithdrawRequest].
  const ApproveWithdrawRequestFamily();

  /// See also [approveWithdrawRequest].
  ApproveWithdrawRequestProvider call({
    String? id,
    String? notes,
    String? amount,
  }) {
    return ApproveWithdrawRequestProvider(
      id: id,
      notes: notes,
      amount: amount,
    );
  }

  @override
  ApproveWithdrawRequestProvider getProviderOverride(
    covariant ApproveWithdrawRequestProvider provider,
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
  String? get name => r'approveWithdrawRequestProvider';
}

/// See also [approveWithdrawRequest].
class ApproveWithdrawRequestProvider
    extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [approveWithdrawRequest].
  ApproveWithdrawRequestProvider({
    String? id,
    String? notes,
    String? amount,
  }) : this._internal(
          (ref) => approveWithdrawRequest(
            ref as ApproveWithdrawRequestRef,
            id: id,
            notes: notes,
            amount: amount,
          ),
          from: approveWithdrawRequestProvider,
          name: r'approveWithdrawRequestProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$approveWithdrawRequestHash,
          dependencies: ApproveWithdrawRequestFamily._dependencies,
          allTransitiveDependencies:
              ApproveWithdrawRequestFamily._allTransitiveDependencies,
          id: id,
          notes: notes,
          amount: amount,
        );

  ApproveWithdrawRequestProvider._internal(
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
    FutureOr<Map<String, dynamic>> Function(ApproveWithdrawRequestRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ApproveWithdrawRequestProvider._internal(
        (ref) => create(ref as ApproveWithdrawRequestRef),
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
    return _ApproveWithdrawRequestProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ApproveWithdrawRequestProvider &&
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

mixin ApproveWithdrawRequestRef
    on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `id` of this provider.
  String? get id;

  /// The parameter `notes` of this provider.
  String? get notes;

  /// The parameter `amount` of this provider.
  String? get amount;
}

class _ApproveWithdrawRequestProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with ApproveWithdrawRequestRef {
  _ApproveWithdrawRequestProviderElement(super.provider);

  @override
  String? get id => (origin as ApproveWithdrawRequestProvider).id;
  @override
  String? get notes => (origin as ApproveWithdrawRequestProvider).notes;
  @override
  String? get amount => (origin as ApproveWithdrawRequestProvider).amount;
}

String _$rejectWithdrawRequestHash() =>
    r'85ec6c30ac7d8b6214b045835626c251bd8d7c32';

/// See also [rejectWithdrawRequest].
@ProviderFor(rejectWithdrawRequest)
const rejectWithdrawRequestProvider = RejectWithdrawRequestFamily();

/// See also [rejectWithdrawRequest].
class RejectWithdrawRequestFamily
    extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [rejectWithdrawRequest].
  const RejectWithdrawRequestFamily();

  /// See also [rejectWithdrawRequest].
  RejectWithdrawRequestProvider call({
    String? id,
    String? notes,
    String? amount,
  }) {
    return RejectWithdrawRequestProvider(
      id: id,
      notes: notes,
      amount: amount,
    );
  }

  @override
  RejectWithdrawRequestProvider getProviderOverride(
    covariant RejectWithdrawRequestProvider provider,
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
  String? get name => r'rejectWithdrawRequestProvider';
}

/// See also [rejectWithdrawRequest].
class RejectWithdrawRequestProvider
    extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [rejectWithdrawRequest].
  RejectWithdrawRequestProvider({
    String? id,
    String? notes,
    String? amount,
  }) : this._internal(
          (ref) => rejectWithdrawRequest(
            ref as RejectWithdrawRequestRef,
            id: id,
            notes: notes,
            amount: amount,
          ),
          from: rejectWithdrawRequestProvider,
          name: r'rejectWithdrawRequestProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$rejectWithdrawRequestHash,
          dependencies: RejectWithdrawRequestFamily._dependencies,
          allTransitiveDependencies:
              RejectWithdrawRequestFamily._allTransitiveDependencies,
          id: id,
          notes: notes,
          amount: amount,
        );

  RejectWithdrawRequestProvider._internal(
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
    FutureOr<Map<String, dynamic>> Function(RejectWithdrawRequestRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RejectWithdrawRequestProvider._internal(
        (ref) => create(ref as RejectWithdrawRequestRef),
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
    return _RejectWithdrawRequestProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RejectWithdrawRequestProvider &&
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

mixin RejectWithdrawRequestRef
    on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `id` of this provider.
  String? get id;

  /// The parameter `notes` of this provider.
  String? get notes;

  /// The parameter `amount` of this provider.
  String? get amount;
}

class _RejectWithdrawRequestProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with RejectWithdrawRequestRef {
  _RejectWithdrawRequestProviderElement(super.provider);

  @override
  String? get id => (origin as RejectWithdrawRequestProvider).id;
  @override
  String? get notes => (origin as RejectWithdrawRequestProvider).notes;
  @override
  String? get amount => (origin as RejectWithdrawRequestProvider).amount;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
