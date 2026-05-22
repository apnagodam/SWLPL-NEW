// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DispleasedService.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$displeasedUsersHash() => r'a8ceb76c948ec97598a638e6d01163fbf5e0ec5f';

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

/// See also [displeasedUsers].
@ProviderFor(displeasedUsers)
const displeasedUsersProvider = DispleasedUsersFamily();

/// See also [displeasedUsers].
class DispleasedUsersFamily
    extends Family<AsyncValue<DispleasedTerminalModel>> {
  /// See also [displeasedUsers].
  const DispleasedUsersFamily();

  /// See also [displeasedUsers].
  DispleasedUsersProvider call({
    String? terminalId,
  }) {
    return DispleasedUsersProvider(
      terminalId: terminalId,
    );
  }

  @override
  DispleasedUsersProvider getProviderOverride(
    covariant DispleasedUsersProvider provider,
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
  String? get name => r'displeasedUsersProvider';
}

/// See also [displeasedUsers].
class DispleasedUsersProvider
    extends AutoDisposeStreamProvider<DispleasedTerminalModel> {
  /// See also [displeasedUsers].
  DispleasedUsersProvider({
    String? terminalId,
  }) : this._internal(
          (ref) => displeasedUsers(
            ref as DispleasedUsersRef,
            terminalId: terminalId,
          ),
          from: displeasedUsersProvider,
          name: r'displeasedUsersProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$displeasedUsersHash,
          dependencies: DispleasedUsersFamily._dependencies,
          allTransitiveDependencies:
              DispleasedUsersFamily._allTransitiveDependencies,
          terminalId: terminalId,
        );

  DispleasedUsersProvider._internal(
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
    Stream<DispleasedTerminalModel> Function(DispleasedUsersRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DispleasedUsersProvider._internal(
        (ref) => create(ref as DispleasedUsersRef),
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
  AutoDisposeStreamProviderElement<DispleasedTerminalModel> createElement() {
    return _DispleasedUsersProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DispleasedUsersProvider && other.terminalId == terminalId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, terminalId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DispleasedUsersRef
    on AutoDisposeStreamProviderRef<DispleasedTerminalModel> {
  /// The parameter `terminalId` of this provider.
  String? get terminalId;
}

class _DispleasedUsersProviderElement
    extends AutoDisposeStreamProviderElement<DispleasedTerminalModel>
    with DispleasedUsersRef {
  _DispleasedUsersProviderElement(super.provider);

  @override
  String? get terminalId => (origin as DispleasedUsersProvider).terminalId;
}

String _$displeasedCommoditiesHash() =>
    r'ee429f36c478a701b0fbd7ec402b51991d9a2cb2';

/// See also [displeasedCommodities].
@ProviderFor(displeasedCommodities)
const displeasedCommoditiesProvider = DispleasedCommoditiesFamily();

/// See also [displeasedCommodities].
class DispleasedCommoditiesFamily
    extends Family<AsyncValue<DispleasedCommodityModel>> {
  /// See also [displeasedCommodities].
  const DispleasedCommoditiesFamily();

  /// See also [displeasedCommodities].
  DispleasedCommoditiesProvider call({
    String? terminalId,
    String? userId,
  }) {
    return DispleasedCommoditiesProvider(
      terminalId: terminalId,
      userId: userId,
    );
  }

  @override
  DispleasedCommoditiesProvider getProviderOverride(
    covariant DispleasedCommoditiesProvider provider,
  ) {
    return call(
      terminalId: provider.terminalId,
      userId: provider.userId,
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
  String? get name => r'displeasedCommoditiesProvider';
}

/// See also [displeasedCommodities].
class DispleasedCommoditiesProvider
    extends AutoDisposeStreamProvider<DispleasedCommodityModel> {
  /// See also [displeasedCommodities].
  DispleasedCommoditiesProvider({
    String? terminalId,
    String? userId,
  }) : this._internal(
          (ref) => displeasedCommodities(
            ref as DispleasedCommoditiesRef,
            terminalId: terminalId,
            userId: userId,
          ),
          from: displeasedCommoditiesProvider,
          name: r'displeasedCommoditiesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$displeasedCommoditiesHash,
          dependencies: DispleasedCommoditiesFamily._dependencies,
          allTransitiveDependencies:
              DispleasedCommoditiesFamily._allTransitiveDependencies,
          terminalId: terminalId,
          userId: userId,
        );

  DispleasedCommoditiesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.terminalId,
    required this.userId,
  }) : super.internal();

  final String? terminalId;
  final String? userId;

  @override
  Override overrideWith(
    Stream<DispleasedCommodityModel> Function(DispleasedCommoditiesRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DispleasedCommoditiesProvider._internal(
        (ref) => create(ref as DispleasedCommoditiesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        terminalId: terminalId,
        userId: userId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<DispleasedCommodityModel> createElement() {
    return _DispleasedCommoditiesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DispleasedCommoditiesProvider &&
        other.terminalId == terminalId &&
        other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, terminalId.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DispleasedCommoditiesRef
    on AutoDisposeStreamProviderRef<DispleasedCommodityModel> {
  /// The parameter `terminalId` of this provider.
  String? get terminalId;

  /// The parameter `userId` of this provider.
  String? get userId;
}

class _DispleasedCommoditiesProviderElement
    extends AutoDisposeStreamProviderElement<DispleasedCommodityModel>
    with DispleasedCommoditiesRef {
  _DispleasedCommoditiesProviderElement(super.provider);

  @override
  String? get terminalId =>
      (origin as DispleasedCommoditiesProvider).terminalId;
  @override
  String? get userId => (origin as DispleasedCommoditiesProvider).userId;
}

String _$displeasedStacksHash() => r'053d692cc52cbcc167311ceeead9ff45259f78fa';

/// See also [displeasedStacks].
@ProviderFor(displeasedStacks)
const displeasedStacksProvider = DispleasedStacksFamily();

/// See also [displeasedStacks].
class DispleasedStacksFamily extends Family<AsyncValue<DispleasedStackModel>> {
  /// See also [displeasedStacks].
  const DispleasedStacksFamily();

  /// See also [displeasedStacks].
  DispleasedStacksProvider call({
    String? terminalId,
    String? userId,
    String? commodityId,
  }) {
    return DispleasedStacksProvider(
      terminalId: terminalId,
      userId: userId,
      commodityId: commodityId,
    );
  }

  @override
  DispleasedStacksProvider getProviderOverride(
    covariant DispleasedStacksProvider provider,
  ) {
    return call(
      terminalId: provider.terminalId,
      userId: provider.userId,
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
  String? get name => r'displeasedStacksProvider';
}

/// See also [displeasedStacks].
class DispleasedStacksProvider
    extends AutoDisposeStreamProvider<DispleasedStackModel> {
  /// See also [displeasedStacks].
  DispleasedStacksProvider({
    String? terminalId,
    String? userId,
    String? commodityId,
  }) : this._internal(
          (ref) => displeasedStacks(
            ref as DispleasedStacksRef,
            terminalId: terminalId,
            userId: userId,
            commodityId: commodityId,
          ),
          from: displeasedStacksProvider,
          name: r'displeasedStacksProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$displeasedStacksHash,
          dependencies: DispleasedStacksFamily._dependencies,
          allTransitiveDependencies:
              DispleasedStacksFamily._allTransitiveDependencies,
          terminalId: terminalId,
          userId: userId,
          commodityId: commodityId,
        );

  DispleasedStacksProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.terminalId,
    required this.userId,
    required this.commodityId,
  }) : super.internal();

  final String? terminalId;
  final String? userId;
  final String? commodityId;

  @override
  Override overrideWith(
    Stream<DispleasedStackModel> Function(DispleasedStacksRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DispleasedStacksProvider._internal(
        (ref) => create(ref as DispleasedStacksRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        terminalId: terminalId,
        userId: userId,
        commodityId: commodityId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<DispleasedStackModel> createElement() {
    return _DispleasedStacksProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DispleasedStacksProvider &&
        other.terminalId == terminalId &&
        other.userId == userId &&
        other.commodityId == commodityId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, terminalId.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);
    hash = _SystemHash.combine(hash, commodityId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DispleasedStacksRef
    on AutoDisposeStreamProviderRef<DispleasedStackModel> {
  /// The parameter `terminalId` of this provider.
  String? get terminalId;

  /// The parameter `userId` of this provider.
  String? get userId;

  /// The parameter `commodityId` of this provider.
  String? get commodityId;
}

class _DispleasedStacksProviderElement
    extends AutoDisposeStreamProviderElement<DispleasedStackModel>
    with DispleasedStacksRef {
  _DispleasedStacksProviderElement(super.provider);

  @override
  String? get terminalId => (origin as DispleasedStacksProvider).terminalId;
  @override
  String? get userId => (origin as DispleasedStacksProvider).userId;
  @override
  String? get commodityId => (origin as DispleasedStacksProvider).commodityId;
}

String _$terminalsHash() => r'58778d1fbf67ab460b0d8eace9200597684ecd53';

/// See also [terminals].
@ProviderFor(terminals)
final terminalsProvider = AutoDisposeStreamProvider<TerminalsModel>.internal(
  terminals,
  name: r'terminalsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$terminalsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TerminalsRef = AutoDisposeStreamProviderRef<TerminalsModel>;
String _$approverListHash() => r'36dc8fc014c441b1f7bbe824918237af4402db50';

/// See also [approverList].
@ProviderFor(approverList)
final approverListProvider = AutoDisposeStreamProvider<ApproverModel>.internal(
  approverList,
  name: r'approverListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$approverListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ApproverListRef = AutoDisposeStreamProviderRef<ApproverModel>;
String _$displeasedRequestHash() => r'57450fe779f0eea6dcdc2c10a5d65662864c71ab';

/// See also [displeasedRequest].
@ProviderFor(displeasedRequest)
const displeasedRequestProvider = DispleasedRequestFamily();

/// See also [displeasedRequest].
class DispleasedRequestFamily extends Family<AsyncValue<BaseResponse>> {
  /// See also [displeasedRequest].
  const DispleasedRequestFamily();

  /// See also [displeasedRequest].
  DispleasedRequestProvider call({
    String? userId,
    String? terminalId,
    String? commodityId,
    String? stackid,
    String? quantity,
    String? bags,
    String? image,
    String? approvedBy,
    String? notes,
  }) {
    return DispleasedRequestProvider(
      userId: userId,
      terminalId: terminalId,
      commodityId: commodityId,
      stackid: stackid,
      quantity: quantity,
      bags: bags,
      image: image,
      approvedBy: approvedBy,
      notes: notes,
    );
  }

  @override
  DispleasedRequestProvider getProviderOverride(
    covariant DispleasedRequestProvider provider,
  ) {
    return call(
      userId: provider.userId,
      terminalId: provider.terminalId,
      commodityId: provider.commodityId,
      stackid: provider.stackid,
      quantity: provider.quantity,
      bags: provider.bags,
      image: provider.image,
      approvedBy: provider.approvedBy,
      notes: provider.notes,
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
  String? get name => r'displeasedRequestProvider';
}

/// See also [displeasedRequest].
class DispleasedRequestProvider
    extends AutoDisposeFutureProvider<BaseResponse> {
  /// See also [displeasedRequest].
  DispleasedRequestProvider({
    String? userId,
    String? terminalId,
    String? commodityId,
    String? stackid,
    String? quantity,
    String? bags,
    String? image,
    String? approvedBy,
    String? notes,
  }) : this._internal(
          (ref) => displeasedRequest(
            ref as DispleasedRequestRef,
            userId: userId,
            terminalId: terminalId,
            commodityId: commodityId,
            stackid: stackid,
            quantity: quantity,
            bags: bags,
            image: image,
            approvedBy: approvedBy,
            notes: notes,
          ),
          from: displeasedRequestProvider,
          name: r'displeasedRequestProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$displeasedRequestHash,
          dependencies: DispleasedRequestFamily._dependencies,
          allTransitiveDependencies:
              DispleasedRequestFamily._allTransitiveDependencies,
          userId: userId,
          terminalId: terminalId,
          commodityId: commodityId,
          stackid: stackid,
          quantity: quantity,
          bags: bags,
          image: image,
          approvedBy: approvedBy,
          notes: notes,
        );

  DispleasedRequestProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userId,
    required this.terminalId,
    required this.commodityId,
    required this.stackid,
    required this.quantity,
    required this.bags,
    required this.image,
    required this.approvedBy,
    required this.notes,
  }) : super.internal();

  final String? userId;
  final String? terminalId;
  final String? commodityId;
  final String? stackid;
  final String? quantity;
  final String? bags;
  final String? image;
  final String? approvedBy;
  final String? notes;

  @override
  Override overrideWith(
    FutureOr<BaseResponse> Function(DispleasedRequestRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DispleasedRequestProvider._internal(
        (ref) => create(ref as DispleasedRequestRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userId: userId,
        terminalId: terminalId,
        commodityId: commodityId,
        stackid: stackid,
        quantity: quantity,
        bags: bags,
        image: image,
        approvedBy: approvedBy,
        notes: notes,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<BaseResponse> createElement() {
    return _DispleasedRequestProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DispleasedRequestProvider &&
        other.userId == userId &&
        other.terminalId == terminalId &&
        other.commodityId == commodityId &&
        other.stackid == stackid &&
        other.quantity == quantity &&
        other.bags == bags &&
        other.image == image &&
        other.approvedBy == approvedBy &&
        other.notes == notes;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);
    hash = _SystemHash.combine(hash, terminalId.hashCode);
    hash = _SystemHash.combine(hash, commodityId.hashCode);
    hash = _SystemHash.combine(hash, stackid.hashCode);
    hash = _SystemHash.combine(hash, quantity.hashCode);
    hash = _SystemHash.combine(hash, bags.hashCode);
    hash = _SystemHash.combine(hash, image.hashCode);
    hash = _SystemHash.combine(hash, approvedBy.hashCode);
    hash = _SystemHash.combine(hash, notes.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DispleasedRequestRef on AutoDisposeFutureProviderRef<BaseResponse> {
  /// The parameter `userId` of this provider.
  String? get userId;

  /// The parameter `terminalId` of this provider.
  String? get terminalId;

  /// The parameter `commodityId` of this provider.
  String? get commodityId;

  /// The parameter `stackid` of this provider.
  String? get stackid;

  /// The parameter `quantity` of this provider.
  String? get quantity;

  /// The parameter `bags` of this provider.
  String? get bags;

  /// The parameter `image` of this provider.
  String? get image;

  /// The parameter `approvedBy` of this provider.
  String? get approvedBy;

  /// The parameter `notes` of this provider.
  String? get notes;
}

class _DispleasedRequestProviderElement
    extends AutoDisposeFutureProviderElement<BaseResponse>
    with DispleasedRequestRef {
  _DispleasedRequestProviderElement(super.provider);

  @override
  String? get userId => (origin as DispleasedRequestProvider).userId;
  @override
  String? get terminalId => (origin as DispleasedRequestProvider).terminalId;
  @override
  String? get commodityId => (origin as DispleasedRequestProvider).commodityId;
  @override
  String? get stackid => (origin as DispleasedRequestProvider).stackid;
  @override
  String? get quantity => (origin as DispleasedRequestProvider).quantity;
  @override
  String? get bags => (origin as DispleasedRequestProvider).bags;
  @override
  String? get image => (origin as DispleasedRequestProvider).image;
  @override
  String? get approvedBy => (origin as DispleasedRequestProvider).approvedBy;
  @override
  String? get notes => (origin as DispleasedRequestProvider).notes;
}

String _$displedgeRequestListHash() =>
    r'443aec6772493a4f4da54cb5c85549cb5a83baa2';

/// See also [displedgeRequestList].
@ProviderFor(displedgeRequestList)
final displedgeRequestListProvider =
    AutoDisposeStreamProvider<DispledgeRequestList>.internal(
  displedgeRequestList,
  name: r'displedgeRequestListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$displedgeRequestListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DispledgeRequestListRef
    = AutoDisposeStreamProviderRef<DispledgeRequestList>;
String _$displeaseRejectRequestHash() =>
    r'bff9bae66fd90152a5a37d1106c7c730c7f999f1';

/// See also [displeaseRejectRequest].
@ProviderFor(displeaseRejectRequest)
const displeaseRejectRequestProvider = DispleaseRejectRequestFamily();

/// See also [displeaseRejectRequest].
class DispleaseRejectRequestFamily
    extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [displeaseRejectRequest].
  const DispleaseRejectRequestFamily();

  /// See also [displeaseRejectRequest].
  DispleaseRejectRequestProvider call({
    String? id,
    String? notes,
  }) {
    return DispleaseRejectRequestProvider(
      id: id,
      notes: notes,
    );
  }

  @override
  DispleaseRejectRequestProvider getProviderOverride(
    covariant DispleaseRejectRequestProvider provider,
  ) {
    return call(
      id: provider.id,
      notes: provider.notes,
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
  String? get name => r'displeaseRejectRequestProvider';
}

/// See also [displeaseRejectRequest].
class DispleaseRejectRequestProvider
    extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [displeaseRejectRequest].
  DispleaseRejectRequestProvider({
    String? id,
    String? notes,
  }) : this._internal(
          (ref) => displeaseRejectRequest(
            ref as DispleaseRejectRequestRef,
            id: id,
            notes: notes,
          ),
          from: displeaseRejectRequestProvider,
          name: r'displeaseRejectRequestProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$displeaseRejectRequestHash,
          dependencies: DispleaseRejectRequestFamily._dependencies,
          allTransitiveDependencies:
              DispleaseRejectRequestFamily._allTransitiveDependencies,
          id: id,
          notes: notes,
        );

  DispleaseRejectRequestProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
    required this.notes,
  }) : super.internal();

  final String? id;
  final String? notes;

  @override
  Override overrideWith(
    FutureOr<Map<String, dynamic>> Function(DispleaseRejectRequestRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DispleaseRejectRequestProvider._internal(
        (ref) => create(ref as DispleaseRejectRequestRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
        notes: notes,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<String, dynamic>> createElement() {
    return _DispleaseRejectRequestProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DispleaseRejectRequestProvider &&
        other.id == id &&
        other.notes == notes;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);
    hash = _SystemHash.combine(hash, notes.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DispleaseRejectRequestRef
    on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `id` of this provider.
  String? get id;

  /// The parameter `notes` of this provider.
  String? get notes;
}

class _DispleaseRejectRequestProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with DispleaseRejectRequestRef {
  _DispleaseRejectRequestProviderElement(super.provider);

  @override
  String? get id => (origin as DispleaseRejectRequestProvider).id;
  @override
  String? get notes => (origin as DispleaseRejectRequestProvider).notes;
}

String _$displedgeApprovalRequestHash() =>
    r'e3556e79b78c3624a7274fb0287c30e4c67dcedb';

///Displedge Approval Requests
///
/// Copied from [displedgeApprovalRequest].
@ProviderFor(displedgeApprovalRequest)
final displedgeApprovalRequestProvider =
    AutoDisposeStreamProvider<DispledgeApprovalRequestModal>.internal(
  displedgeApprovalRequest,
  name: r'displedgeApprovalRequestProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$displedgeApprovalRequestHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DispledgeApprovalRequestRef
    = AutoDisposeStreamProviderRef<DispledgeApprovalRequestModal>;
String _$displeaseRejectedHash() => r'fa5b3ca4dfd71d83de5c76fc3186797a74bc07f8';

/// See also [displeaseRejected].
@ProviderFor(displeaseRejected)
const displeaseRejectedProvider = DispleaseRejectedFamily();

/// See also [displeaseRejected].
class DispleaseRejectedFamily extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [displeaseRejected].
  const DispleaseRejectedFamily();

  /// See also [displeaseRejected].
  DispleaseRejectedProvider call({
    String? id,
    String? notes,
  }) {
    return DispleaseRejectedProvider(
      id: id,
      notes: notes,
    );
  }

  @override
  DispleaseRejectedProvider getProviderOverride(
    covariant DispleaseRejectedProvider provider,
  ) {
    return call(
      id: provider.id,
      notes: provider.notes,
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
  String? get name => r'displeaseRejectedProvider';
}

/// See also [displeaseRejected].
class DispleaseRejectedProvider
    extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [displeaseRejected].
  DispleaseRejectedProvider({
    String? id,
    String? notes,
  }) : this._internal(
          (ref) => displeaseRejected(
            ref as DispleaseRejectedRef,
            id: id,
            notes: notes,
          ),
          from: displeaseRejectedProvider,
          name: r'displeaseRejectedProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$displeaseRejectedHash,
          dependencies: DispleaseRejectedFamily._dependencies,
          allTransitiveDependencies:
              DispleaseRejectedFamily._allTransitiveDependencies,
          id: id,
          notes: notes,
        );

  DispleaseRejectedProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
    required this.notes,
  }) : super.internal();

  final String? id;
  final String? notes;

  @override
  Override overrideWith(
    FutureOr<Map<String, dynamic>> Function(DispleaseRejectedRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DispleaseRejectedProvider._internal(
        (ref) => create(ref as DispleaseRejectedRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
        notes: notes,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<String, dynamic>> createElement() {
    return _DispleaseRejectedProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DispleaseRejectedProvider &&
        other.id == id &&
        other.notes == notes;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);
    hash = _SystemHash.combine(hash, notes.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DispleaseRejectedRef
    on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `id` of this provider.
  String? get id;

  /// The parameter `notes` of this provider.
  String? get notes;
}

class _DispleaseRejectedProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with DispleaseRejectedRef {
  _DispleaseRejectedProviderElement(super.provider);

  @override
  String? get id => (origin as DispleaseRejectedProvider).id;
  @override
  String? get notes => (origin as DispleaseRejectedProvider).notes;
}

String _$displeaseApproveHash() => r'e29e65f85b6aebe843ca806acba9facd1551fce9';

/// See also [displeaseApprove].
@ProviderFor(displeaseApprove)
const displeaseApproveProvider = DispleaseApproveFamily();

/// See also [displeaseApprove].
class DispleaseApproveFamily extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [displeaseApprove].
  const DispleaseApproveFamily();

  /// See also [displeaseApprove].
  DispleaseApproveProvider call({
    String? id,
    String? notes,
  }) {
    return DispleaseApproveProvider(
      id: id,
      notes: notes,
    );
  }

  @override
  DispleaseApproveProvider getProviderOverride(
    covariant DispleaseApproveProvider provider,
  ) {
    return call(
      id: provider.id,
      notes: provider.notes,
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
  String? get name => r'displeaseApproveProvider';
}

/// See also [displeaseApprove].
class DispleaseApproveProvider
    extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [displeaseApprove].
  DispleaseApproveProvider({
    String? id,
    String? notes,
  }) : this._internal(
          (ref) => displeaseApprove(
            ref as DispleaseApproveRef,
            id: id,
            notes: notes,
          ),
          from: displeaseApproveProvider,
          name: r'displeaseApproveProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$displeaseApproveHash,
          dependencies: DispleaseApproveFamily._dependencies,
          allTransitiveDependencies:
              DispleaseApproveFamily._allTransitiveDependencies,
          id: id,
          notes: notes,
        );

  DispleaseApproveProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
    required this.notes,
  }) : super.internal();

  final String? id;
  final String? notes;

  @override
  Override overrideWith(
    FutureOr<Map<String, dynamic>> Function(DispleaseApproveRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DispleaseApproveProvider._internal(
        (ref) => create(ref as DispleaseApproveRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
        notes: notes,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<String, dynamic>> createElement() {
    return _DispleaseApproveProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DispleaseApproveProvider &&
        other.id == id &&
        other.notes == notes;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);
    hash = _SystemHash.combine(hash, notes.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DispleaseApproveRef
    on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `id` of this provider.
  String? get id;

  /// The parameter `notes` of this provider.
  String? get notes;
}

class _DispleaseApproveProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with DispleaseApproveRef {
  _DispleaseApproveProviderElement(super.provider);

  @override
  String? get id => (origin as DispleaseApproveProvider).id;
  @override
  String? get notes => (origin as DispleaseApproveProvider).notes;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
