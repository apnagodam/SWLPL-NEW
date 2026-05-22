// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ConveyanceService.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$approvedByHash() => r'304863caf551a5f27d075370107907bdd76f818a';

/// See also [approvedBy].
@ProviderFor(approvedBy)
final approvedByProvider = AutoDisposeStreamProvider<LevelWiseModel>.internal(
  approvedBy,
  name: r'approvedByProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$approvedByHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ApprovedByRef = AutoDisposeStreamProviderRef<LevelWiseModel>;
String _$voucherListHash() => r'3fc45de0a9e1762a51f47bacab87cff9d22e6b2a';

/// See also [voucherList].
@ProviderFor(voucherList)
final voucherListProvider =
    AutoDisposeStreamProvider<VoucherListModel>.internal(
  voucherList,
  name: r'voucherListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$voucherListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef VoucherListRef = AutoDisposeStreamProviderRef<VoucherListModel>;
String _$postConveyanceHash() => r'bd13279f1c1ab6ba8a3a7695b41cec9a39c9d728';

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

/// See also [postConveyance].
@ProviderFor(postConveyance)
const postConveyanceProvider = PostConveyanceFamily();

/// See also [postConveyance].
class PostConveyanceFamily extends Family<AsyncValue<BaseResponse>> {
  /// See also [postConveyance].
  const PostConveyanceFamily();

  /// See also [postConveyance].
  PostConveyanceProvider call({
    String? date,
    String? startImage,
    String? endImage,
    String? vehicleNumber,
    String? fromPlace,
    String? toPlace,
    String? startReading,
    String? endReading,
    String? kms,
    String? charges,
    String? location,
    String? otherExpense,
    String? total,
    String? purpose,
    String? approvedBy,
    String? conveyance,
    String? terminalId,
    String? otherChargeImage,
  }) {
    return PostConveyanceProvider(
      date: date,
      startImage: startImage,
      endImage: endImage,
      vehicleNumber: vehicleNumber,
      fromPlace: fromPlace,
      toPlace: toPlace,
      startReading: startReading,
      endReading: endReading,
      kms: kms,
      charges: charges,
      location: location,
      otherExpense: otherExpense,
      total: total,
      purpose: purpose,
      approvedBy: approvedBy,
      conveyance: conveyance,
      terminalId: terminalId,
      otherChargeImage: otherChargeImage,
    );
  }

  @override
  PostConveyanceProvider getProviderOverride(
    covariant PostConveyanceProvider provider,
  ) {
    return call(
      date: provider.date,
      startImage: provider.startImage,
      endImage: provider.endImage,
      vehicleNumber: provider.vehicleNumber,
      fromPlace: provider.fromPlace,
      toPlace: provider.toPlace,
      startReading: provider.startReading,
      endReading: provider.endReading,
      kms: provider.kms,
      charges: provider.charges,
      location: provider.location,
      otherExpense: provider.otherExpense,
      total: provider.total,
      purpose: provider.purpose,
      approvedBy: provider.approvedBy,
      conveyance: provider.conveyance,
      terminalId: provider.terminalId,
      otherChargeImage: provider.otherChargeImage,
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
  String? get name => r'postConveyanceProvider';
}

/// See also [postConveyance].
class PostConveyanceProvider extends AutoDisposeFutureProvider<BaseResponse> {
  /// See also [postConveyance].
  PostConveyanceProvider({
    String? date,
    String? startImage,
    String? endImage,
    String? vehicleNumber,
    String? fromPlace,
    String? toPlace,
    String? startReading,
    String? endReading,
    String? kms,
    String? charges,
    String? location,
    String? otherExpense,
    String? total,
    String? purpose,
    String? approvedBy,
    String? conveyance,
    String? terminalId,
    String? otherChargeImage,
  }) : this._internal(
          (ref) => postConveyance(
            ref as PostConveyanceRef,
            date: date,
            startImage: startImage,
            endImage: endImage,
            vehicleNumber: vehicleNumber,
            fromPlace: fromPlace,
            toPlace: toPlace,
            startReading: startReading,
            endReading: endReading,
            kms: kms,
            charges: charges,
            location: location,
            otherExpense: otherExpense,
            total: total,
            purpose: purpose,
            approvedBy: approvedBy,
            conveyance: conveyance,
            terminalId: terminalId,
            otherChargeImage: otherChargeImage,
          ),
          from: postConveyanceProvider,
          name: r'postConveyanceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$postConveyanceHash,
          dependencies: PostConveyanceFamily._dependencies,
          allTransitiveDependencies:
              PostConveyanceFamily._allTransitiveDependencies,
          date: date,
          startImage: startImage,
          endImage: endImage,
          vehicleNumber: vehicleNumber,
          fromPlace: fromPlace,
          toPlace: toPlace,
          startReading: startReading,
          endReading: endReading,
          kms: kms,
          charges: charges,
          location: location,
          otherExpense: otherExpense,
          total: total,
          purpose: purpose,
          approvedBy: approvedBy,
          conveyance: conveyance,
          terminalId: terminalId,
          otherChargeImage: otherChargeImage,
        );

  PostConveyanceProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.date,
    required this.startImage,
    required this.endImage,
    required this.vehicleNumber,
    required this.fromPlace,
    required this.toPlace,
    required this.startReading,
    required this.endReading,
    required this.kms,
    required this.charges,
    required this.location,
    required this.otherExpense,
    required this.total,
    required this.purpose,
    required this.approvedBy,
    required this.conveyance,
    required this.terminalId,
    required this.otherChargeImage,
  }) : super.internal();

  final String? date;
  final String? startImage;
  final String? endImage;
  final String? vehicleNumber;
  final String? fromPlace;
  final String? toPlace;
  final String? startReading;
  final String? endReading;
  final String? kms;
  final String? charges;
  final String? location;
  final String? otherExpense;
  final String? total;
  final String? purpose;
  final String? approvedBy;
  final String? conveyance;
  final String? terminalId;
  final String? otherChargeImage;

  @override
  Override overrideWith(
    FutureOr<BaseResponse> Function(PostConveyanceRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PostConveyanceProvider._internal(
        (ref) => create(ref as PostConveyanceRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        date: date,
        startImage: startImage,
        endImage: endImage,
        vehicleNumber: vehicleNumber,
        fromPlace: fromPlace,
        toPlace: toPlace,
        startReading: startReading,
        endReading: endReading,
        kms: kms,
        charges: charges,
        location: location,
        otherExpense: otherExpense,
        total: total,
        purpose: purpose,
        approvedBy: approvedBy,
        conveyance: conveyance,
        terminalId: terminalId,
        otherChargeImage: otherChargeImage,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<BaseResponse> createElement() {
    return _PostConveyanceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PostConveyanceProvider &&
        other.date == date &&
        other.startImage == startImage &&
        other.endImage == endImage &&
        other.vehicleNumber == vehicleNumber &&
        other.fromPlace == fromPlace &&
        other.toPlace == toPlace &&
        other.startReading == startReading &&
        other.endReading == endReading &&
        other.kms == kms &&
        other.charges == charges &&
        other.location == location &&
        other.otherExpense == otherExpense &&
        other.total == total &&
        other.purpose == purpose &&
        other.approvedBy == approvedBy &&
        other.conveyance == conveyance &&
        other.terminalId == terminalId &&
        other.otherChargeImage == otherChargeImage;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, date.hashCode);
    hash = _SystemHash.combine(hash, startImage.hashCode);
    hash = _SystemHash.combine(hash, endImage.hashCode);
    hash = _SystemHash.combine(hash, vehicleNumber.hashCode);
    hash = _SystemHash.combine(hash, fromPlace.hashCode);
    hash = _SystemHash.combine(hash, toPlace.hashCode);
    hash = _SystemHash.combine(hash, startReading.hashCode);
    hash = _SystemHash.combine(hash, endReading.hashCode);
    hash = _SystemHash.combine(hash, kms.hashCode);
    hash = _SystemHash.combine(hash, charges.hashCode);
    hash = _SystemHash.combine(hash, location.hashCode);
    hash = _SystemHash.combine(hash, otherExpense.hashCode);
    hash = _SystemHash.combine(hash, total.hashCode);
    hash = _SystemHash.combine(hash, purpose.hashCode);
    hash = _SystemHash.combine(hash, approvedBy.hashCode);
    hash = _SystemHash.combine(hash, conveyance.hashCode);
    hash = _SystemHash.combine(hash, terminalId.hashCode);
    hash = _SystemHash.combine(hash, otherChargeImage.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PostConveyanceRef on AutoDisposeFutureProviderRef<BaseResponse> {
  /// The parameter `date` of this provider.
  String? get date;

  /// The parameter `startImage` of this provider.
  String? get startImage;

  /// The parameter `endImage` of this provider.
  String? get endImage;

  /// The parameter `vehicleNumber` of this provider.
  String? get vehicleNumber;

  /// The parameter `fromPlace` of this provider.
  String? get fromPlace;

  /// The parameter `toPlace` of this provider.
  String? get toPlace;

  /// The parameter `startReading` of this provider.
  String? get startReading;

  /// The parameter `endReading` of this provider.
  String? get endReading;

  /// The parameter `kms` of this provider.
  String? get kms;

  /// The parameter `charges` of this provider.
  String? get charges;

  /// The parameter `location` of this provider.
  String? get location;

  /// The parameter `otherExpense` of this provider.
  String? get otherExpense;

  /// The parameter `total` of this provider.
  String? get total;

  /// The parameter `purpose` of this provider.
  String? get purpose;

  /// The parameter `approvedBy` of this provider.
  String? get approvedBy;

  /// The parameter `conveyance` of this provider.
  String? get conveyance;

  /// The parameter `terminalId` of this provider.
  String? get terminalId;

  /// The parameter `otherChargeImage` of this provider.
  String? get otherChargeImage;
}

class _PostConveyanceProviderElement
    extends AutoDisposeFutureProviderElement<BaseResponse>
    with PostConveyanceRef {
  _PostConveyanceProviderElement(super.provider);

  @override
  String? get date => (origin as PostConveyanceProvider).date;
  @override
  String? get startImage => (origin as PostConveyanceProvider).startImage;
  @override
  String? get endImage => (origin as PostConveyanceProvider).endImage;
  @override
  String? get vehicleNumber => (origin as PostConveyanceProvider).vehicleNumber;
  @override
  String? get fromPlace => (origin as PostConveyanceProvider).fromPlace;
  @override
  String? get toPlace => (origin as PostConveyanceProvider).toPlace;
  @override
  String? get startReading => (origin as PostConveyanceProvider).startReading;
  @override
  String? get endReading => (origin as PostConveyanceProvider).endReading;
  @override
  String? get kms => (origin as PostConveyanceProvider).kms;
  @override
  String? get charges => (origin as PostConveyanceProvider).charges;
  @override
  String? get location => (origin as PostConveyanceProvider).location;
  @override
  String? get otherExpense => (origin as PostConveyanceProvider).otherExpense;
  @override
  String? get total => (origin as PostConveyanceProvider).total;
  @override
  String? get purpose => (origin as PostConveyanceProvider).purpose;
  @override
  String? get approvedBy => (origin as PostConveyanceProvider).approvedBy;
  @override
  String? get conveyance => (origin as PostConveyanceProvider).conveyance;
  @override
  String? get terminalId => (origin as PostConveyanceProvider).terminalId;
  @override
  String? get otherChargeImage =>
      (origin as PostConveyanceProvider).otherChargeImage;
}

String _$cancelVouncherRequestHash() =>
    r'66f548581e0144a31a89fab64491f014e1c1c84d';

/// See also [cancelVouncherRequest].
@ProviderFor(cancelVouncherRequest)
const cancelVouncherRequestProvider = CancelVouncherRequestFamily();

/// See also [cancelVouncherRequest].
class CancelVouncherRequestFamily extends Family<AsyncValue<BaseResponse>> {
  /// See also [cancelVouncherRequest].
  const CancelVouncherRequestFamily();

  /// See also [cancelVouncherRequest].
  CancelVouncherRequestProvider call({
    String? conveyanceId,
  }) {
    return CancelVouncherRequestProvider(
      conveyanceId: conveyanceId,
    );
  }

  @override
  CancelVouncherRequestProvider getProviderOverride(
    covariant CancelVouncherRequestProvider provider,
  ) {
    return call(
      conveyanceId: provider.conveyanceId,
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
  String? get name => r'cancelVouncherRequestProvider';
}

/// See also [cancelVouncherRequest].
class CancelVouncherRequestProvider
    extends AutoDisposeFutureProvider<BaseResponse> {
  /// See also [cancelVouncherRequest].
  CancelVouncherRequestProvider({
    String? conveyanceId,
  }) : this._internal(
          (ref) => cancelVouncherRequest(
            ref as CancelVouncherRequestRef,
            conveyanceId: conveyanceId,
          ),
          from: cancelVouncherRequestProvider,
          name: r'cancelVouncherRequestProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$cancelVouncherRequestHash,
          dependencies: CancelVouncherRequestFamily._dependencies,
          allTransitiveDependencies:
              CancelVouncherRequestFamily._allTransitiveDependencies,
          conveyanceId: conveyanceId,
        );

  CancelVouncherRequestProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.conveyanceId,
  }) : super.internal();

  final String? conveyanceId;

  @override
  Override overrideWith(
    FutureOr<BaseResponse> Function(CancelVouncherRequestRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CancelVouncherRequestProvider._internal(
        (ref) => create(ref as CancelVouncherRequestRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        conveyanceId: conveyanceId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<BaseResponse> createElement() {
    return _CancelVouncherRequestProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CancelVouncherRequestProvider &&
        other.conveyanceId == conveyanceId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, conveyanceId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CancelVouncherRequestRef on AutoDisposeFutureProviderRef<BaseResponse> {
  /// The parameter `conveyanceId` of this provider.
  String? get conveyanceId;
}

class _CancelVouncherRequestProviderElement
    extends AutoDisposeFutureProviderElement<BaseResponse>
    with CancelVouncherRequestRef {
  _CancelVouncherRequestProviderElement(super.provider);

  @override
  String? get conveyanceId =>
      (origin as CancelVouncherRequestProvider).conveyanceId;
}

String _$voucherApprovalListHash() =>
    r'd32b6b4628b1874f6f38e8804e274217d54b6b98';

/// See also [voucherApprovalList].
@ProviderFor(voucherApprovalList)
final voucherApprovalListProvider =
    AutoDisposeStreamProvider<VoucherApprovalModel>.internal(
  voucherApprovalList,
  name: r'voucherApprovalListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$voucherApprovalListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef VoucherApprovalListRef
    = AutoDisposeStreamProviderRef<VoucherApprovalModel>;
String _$verifyVoucherRequestHash() =>
    r'fc93dd480ae1c9e4eab84b49b0955e7d8936fde7';

/// See also [verifyVoucherRequest].
@ProviderFor(verifyVoucherRequest)
const verifyVoucherRequestProvider = VerifyVoucherRequestFamily();

/// See also [verifyVoucherRequest].
class VerifyVoucherRequestFamily extends Family<AsyncValue<BaseResponse>> {
  /// See also [verifyVoucherRequest].
  const VerifyVoucherRequestFamily();

  /// See also [verifyVoucherRequest].
  VerifyVoucherRequestProvider call({
    String? conveyanceId,
    String? purpose,
    String? finalAmount,
  }) {
    return VerifyVoucherRequestProvider(
      conveyanceId: conveyanceId,
      purpose: purpose,
      finalAmount: finalAmount,
    );
  }

  @override
  VerifyVoucherRequestProvider getProviderOverride(
    covariant VerifyVoucherRequestProvider provider,
  ) {
    return call(
      conveyanceId: provider.conveyanceId,
      purpose: provider.purpose,
      finalAmount: provider.finalAmount,
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
  String? get name => r'verifyVoucherRequestProvider';
}

/// See also [verifyVoucherRequest].
class VerifyVoucherRequestProvider
    extends AutoDisposeFutureProvider<BaseResponse> {
  /// See also [verifyVoucherRequest].
  VerifyVoucherRequestProvider({
    String? conveyanceId,
    String? purpose,
    String? finalAmount,
  }) : this._internal(
          (ref) => verifyVoucherRequest(
            ref as VerifyVoucherRequestRef,
            conveyanceId: conveyanceId,
            purpose: purpose,
            finalAmount: finalAmount,
          ),
          from: verifyVoucherRequestProvider,
          name: r'verifyVoucherRequestProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$verifyVoucherRequestHash,
          dependencies: VerifyVoucherRequestFamily._dependencies,
          allTransitiveDependencies:
              VerifyVoucherRequestFamily._allTransitiveDependencies,
          conveyanceId: conveyanceId,
          purpose: purpose,
          finalAmount: finalAmount,
        );

  VerifyVoucherRequestProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.conveyanceId,
    required this.purpose,
    required this.finalAmount,
  }) : super.internal();

  final String? conveyanceId;
  final String? purpose;
  final String? finalAmount;

  @override
  Override overrideWith(
    FutureOr<BaseResponse> Function(VerifyVoucherRequestRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: VerifyVoucherRequestProvider._internal(
        (ref) => create(ref as VerifyVoucherRequestRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        conveyanceId: conveyanceId,
        purpose: purpose,
        finalAmount: finalAmount,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<BaseResponse> createElement() {
    return _VerifyVoucherRequestProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is VerifyVoucherRequestProvider &&
        other.conveyanceId == conveyanceId &&
        other.purpose == purpose &&
        other.finalAmount == finalAmount;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, conveyanceId.hashCode);
    hash = _SystemHash.combine(hash, purpose.hashCode);
    hash = _SystemHash.combine(hash, finalAmount.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin VerifyVoucherRequestRef on AutoDisposeFutureProviderRef<BaseResponse> {
  /// The parameter `conveyanceId` of this provider.
  String? get conveyanceId;

  /// The parameter `purpose` of this provider.
  String? get purpose;

  /// The parameter `finalAmount` of this provider.
  String? get finalAmount;
}

class _VerifyVoucherRequestProviderElement
    extends AutoDisposeFutureProviderElement<BaseResponse>
    with VerifyVoucherRequestRef {
  _VerifyVoucherRequestProviderElement(super.provider);

  @override
  String? get conveyanceId =>
      (origin as VerifyVoucherRequestProvider).conveyanceId;
  @override
  String? get purpose => (origin as VerifyVoucherRequestProvider).purpose;
  @override
  String? get finalAmount =>
      (origin as VerifyVoucherRequestProvider).finalAmount;
}

String _$rejectVoucherRequestHash() =>
    r'c4f169546148b8ccff5a9bb59207ec70895fe06b';

/// See also [rejectVoucherRequest].
@ProviderFor(rejectVoucherRequest)
const rejectVoucherRequestProvider = RejectVoucherRequestFamily();

/// See also [rejectVoucherRequest].
class RejectVoucherRequestFamily extends Family<AsyncValue<BaseResponse>> {
  /// See also [rejectVoucherRequest].
  const RejectVoucherRequestFamily();

  /// See also [rejectVoucherRequest].
  RejectVoucherRequestProvider call({
    String? conveyanceId,
    String? purpose,
  }) {
    return RejectVoucherRequestProvider(
      conveyanceId: conveyanceId,
      purpose: purpose,
    );
  }

  @override
  RejectVoucherRequestProvider getProviderOverride(
    covariant RejectVoucherRequestProvider provider,
  ) {
    return call(
      conveyanceId: provider.conveyanceId,
      purpose: provider.purpose,
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
  String? get name => r'rejectVoucherRequestProvider';
}

/// See also [rejectVoucherRequest].
class RejectVoucherRequestProvider
    extends AutoDisposeFutureProvider<BaseResponse> {
  /// See also [rejectVoucherRequest].
  RejectVoucherRequestProvider({
    String? conveyanceId,
    String? purpose,
  }) : this._internal(
          (ref) => rejectVoucherRequest(
            ref as RejectVoucherRequestRef,
            conveyanceId: conveyanceId,
            purpose: purpose,
          ),
          from: rejectVoucherRequestProvider,
          name: r'rejectVoucherRequestProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$rejectVoucherRequestHash,
          dependencies: RejectVoucherRequestFamily._dependencies,
          allTransitiveDependencies:
              RejectVoucherRequestFamily._allTransitiveDependencies,
          conveyanceId: conveyanceId,
          purpose: purpose,
        );

  RejectVoucherRequestProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.conveyanceId,
    required this.purpose,
  }) : super.internal();

  final String? conveyanceId;
  final String? purpose;

  @override
  Override overrideWith(
    FutureOr<BaseResponse> Function(RejectVoucherRequestRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RejectVoucherRequestProvider._internal(
        (ref) => create(ref as RejectVoucherRequestRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        conveyanceId: conveyanceId,
        purpose: purpose,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<BaseResponse> createElement() {
    return _RejectVoucherRequestProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RejectVoucherRequestProvider &&
        other.conveyanceId == conveyanceId &&
        other.purpose == purpose;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, conveyanceId.hashCode);
    hash = _SystemHash.combine(hash, purpose.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin RejectVoucherRequestRef on AutoDisposeFutureProviderRef<BaseResponse> {
  /// The parameter `conveyanceId` of this provider.
  String? get conveyanceId;

  /// The parameter `purpose` of this provider.
  String? get purpose;
}

class _RejectVoucherRequestProviderElement
    extends AutoDisposeFutureProviderElement<BaseResponse>
    with RejectVoucherRequestRef {
  _RejectVoucherRequestProviderElement(super.provider);

  @override
  String? get conveyanceId =>
      (origin as RejectVoucherRequestProvider).conveyanceId;
  @override
  String? get purpose => (origin as RejectVoucherRequestProvider).purpose;
}

String _$venderVoucherListHash() => r'0c2a5c37b500f67fe6b70a3b9a391951f9e7bb45';

/// See also [venderVoucherList].
@ProviderFor(venderVoucherList)
final venderVoucherListProvider =
    AutoDisposeStreamProvider<VendorVoucherListModal>.internal(
  venderVoucherList,
  name: r'venderVoucherListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$venderVoucherListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef VenderVoucherListRef
    = AutoDisposeStreamProviderRef<VendorVoucherListModal>;
String _$venderVoucherRejectHash() =>
    r'84a38b5ece0c91083e5df7fd07363b3324459c62';

/// See also [venderVoucherReject].
@ProviderFor(venderVoucherReject)
const venderVoucherRejectProvider = VenderVoucherRejectFamily();

/// See also [venderVoucherReject].
class VenderVoucherRejectFamily
    extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [venderVoucherReject].
  const VenderVoucherRejectFamily();

  /// See also [venderVoucherReject].
  VenderVoucherRejectProvider call({
    String? id,
  }) {
    return VenderVoucherRejectProvider(
      id: id,
    );
  }

  @override
  VenderVoucherRejectProvider getProviderOverride(
    covariant VenderVoucherRejectProvider provider,
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
  String? get name => r'venderVoucherRejectProvider';
}

/// See also [venderVoucherReject].
class VenderVoucherRejectProvider
    extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [venderVoucherReject].
  VenderVoucherRejectProvider({
    String? id,
  }) : this._internal(
          (ref) => venderVoucherReject(
            ref as VenderVoucherRejectRef,
            id: id,
          ),
          from: venderVoucherRejectProvider,
          name: r'venderVoucherRejectProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$venderVoucherRejectHash,
          dependencies: VenderVoucherRejectFamily._dependencies,
          allTransitiveDependencies:
              VenderVoucherRejectFamily._allTransitiveDependencies,
          id: id,
        );

  VenderVoucherRejectProvider._internal(
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
    FutureOr<Map<String, dynamic>> Function(VenderVoucherRejectRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: VenderVoucherRejectProvider._internal(
        (ref) => create(ref as VenderVoucherRejectRef),
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
    return _VenderVoucherRejectProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is VenderVoucherRejectProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin VenderVoucherRejectRef
    on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `id` of this provider.
  String? get id;
}

class _VenderVoucherRejectProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with VenderVoucherRejectRef {
  _VenderVoucherRejectProviderElement(super.provider);

  @override
  String? get id => (origin as VenderVoucherRejectProvider).id;
}

String _$venderVoucherApproveListHash() =>
    r'3f7da9bb162c47b4cf3b21b73495b4fb1d68bdce';

/// See also [venderVoucherApproveList].
@ProviderFor(venderVoucherApproveList)
final venderVoucherApproveListProvider =
    AutoDisposeStreamProvider<VendorVoucherApproveListModal>.internal(
  venderVoucherApproveList,
  name: r'venderVoucherApproveListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$venderVoucherApproveListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef VenderVoucherApproveListRef
    = AutoDisposeStreamProviderRef<VendorVoucherApproveListModal>;
String _$venderVoucherApproveHash() =>
    r'267a455e15781497b8627f1e8682778d6213ce6e';

/// See also [venderVoucherApprove].
@ProviderFor(venderVoucherApprove)
const venderVoucherApproveProvider = VenderVoucherApproveFamily();

/// See also [venderVoucherApprove].
class VenderVoucherApproveFamily
    extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [venderVoucherApprove].
  const VenderVoucherApproveFamily();

  /// See also [venderVoucherApprove].
  VenderVoucherApproveProvider call({
    String? id,
    String? amount,
    String? notes,
    String? groupfirm,
  }) {
    return VenderVoucherApproveProvider(
      id: id,
      amount: amount,
      notes: notes,
      groupfirm: groupfirm,
    );
  }

  @override
  VenderVoucherApproveProvider getProviderOverride(
    covariant VenderVoucherApproveProvider provider,
  ) {
    return call(
      id: provider.id,
      amount: provider.amount,
      notes: provider.notes,
      groupfirm: provider.groupfirm,
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
  String? get name => r'venderVoucherApproveProvider';
}

/// See also [venderVoucherApprove].
class VenderVoucherApproveProvider
    extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [venderVoucherApprove].
  VenderVoucherApproveProvider({
    String? id,
    String? amount,
    String? notes,
    String? groupfirm,
  }) : this._internal(
          (ref) => venderVoucherApprove(
            ref as VenderVoucherApproveRef,
            id: id,
            amount: amount,
            notes: notes,
            groupfirm: groupfirm,
          ),
          from: venderVoucherApproveProvider,
          name: r'venderVoucherApproveProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$venderVoucherApproveHash,
          dependencies: VenderVoucherApproveFamily._dependencies,
          allTransitiveDependencies:
              VenderVoucherApproveFamily._allTransitiveDependencies,
          id: id,
          amount: amount,
          notes: notes,
          groupfirm: groupfirm,
        );

  VenderVoucherApproveProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
    required this.amount,
    required this.notes,
    required this.groupfirm,
  }) : super.internal();

  final String? id;
  final String? amount;
  final String? notes;
  final String? groupfirm;

  @override
  Override overrideWith(
    FutureOr<Map<String, dynamic>> Function(VenderVoucherApproveRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: VenderVoucherApproveProvider._internal(
        (ref) => create(ref as VenderVoucherApproveRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
        amount: amount,
        notes: notes,
        groupfirm: groupfirm,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<String, dynamic>> createElement() {
    return _VenderVoucherApproveProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is VenderVoucherApproveProvider &&
        other.id == id &&
        other.amount == amount &&
        other.notes == notes &&
        other.groupfirm == groupfirm;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);
    hash = _SystemHash.combine(hash, amount.hashCode);
    hash = _SystemHash.combine(hash, notes.hashCode);
    hash = _SystemHash.combine(hash, groupfirm.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin VenderVoucherApproveRef
    on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `id` of this provider.
  String? get id;

  /// The parameter `amount` of this provider.
  String? get amount;

  /// The parameter `notes` of this provider.
  String? get notes;

  /// The parameter `groupfirm` of this provider.
  String? get groupfirm;
}

class _VenderVoucherApproveProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with VenderVoucherApproveRef {
  _VenderVoucherApproveProviderElement(super.provider);

  @override
  String? get id => (origin as VenderVoucherApproveProvider).id;
  @override
  String? get amount => (origin as VenderVoucherApproveProvider).amount;
  @override
  String? get notes => (origin as VenderVoucherApproveProvider).notes;
  @override
  String? get groupfirm => (origin as VenderVoucherApproveProvider).groupfirm;
}

String _$venderGroupFirmListHash() =>
    r'bee20adb34c83fac4b833f0944285d8dfdcc743f';

/// See also [venderGroupFirmList].
@ProviderFor(venderGroupFirmList)
final venderGroupFirmListProvider =
    AutoDisposeStreamProvider<VendorGroupFirmListModal>.internal(
  venderGroupFirmList,
  name: r'venderGroupFirmListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$venderGroupFirmListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef VenderGroupFirmListRef
    = AutoDisposeStreamProviderRef<VendorGroupFirmListModal>;
String _$venderVoucherRejectedHash() =>
    r'8a5b1fb192966c2dbfc85dba77a9c20220d53d16';

/// See also [venderVoucherRejected].
@ProviderFor(venderVoucherRejected)
const venderVoucherRejectedProvider = VenderVoucherRejectedFamily();

/// See also [venderVoucherRejected].
class VenderVoucherRejectedFamily
    extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [venderVoucherRejected].
  const VenderVoucherRejectedFamily();

  /// See also [venderVoucherRejected].
  VenderVoucherRejectedProvider call({
    String? id,
    String? notes,
  }) {
    return VenderVoucherRejectedProvider(
      id: id,
      notes: notes,
    );
  }

  @override
  VenderVoucherRejectedProvider getProviderOverride(
    covariant VenderVoucherRejectedProvider provider,
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
  String? get name => r'venderVoucherRejectedProvider';
}

/// See also [venderVoucherRejected].
class VenderVoucherRejectedProvider
    extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [venderVoucherRejected].
  VenderVoucherRejectedProvider({
    String? id,
    String? notes,
  }) : this._internal(
          (ref) => venderVoucherRejected(
            ref as VenderVoucherRejectedRef,
            id: id,
            notes: notes,
          ),
          from: venderVoucherRejectedProvider,
          name: r'venderVoucherRejectedProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$venderVoucherRejectedHash,
          dependencies: VenderVoucherRejectedFamily._dependencies,
          allTransitiveDependencies:
              VenderVoucherRejectedFamily._allTransitiveDependencies,
          id: id,
          notes: notes,
        );

  VenderVoucherRejectedProvider._internal(
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
    FutureOr<Map<String, dynamic>> Function(VenderVoucherRejectedRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: VenderVoucherRejectedProvider._internal(
        (ref) => create(ref as VenderVoucherRejectedRef),
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
    return _VenderVoucherRejectedProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is VenderVoucherRejectedProvider &&
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

mixin VenderVoucherRejectedRef
    on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `id` of this provider.
  String? get id;

  /// The parameter `notes` of this provider.
  String? get notes;
}

class _VenderVoucherRejectedProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with VenderVoucherRejectedRef {
  _VenderVoucherRejectedProviderElement(super.provider);

  @override
  String? get id => (origin as VenderVoucherRejectedProvider).id;
  @override
  String? get notes => (origin as VenderVoucherRejectedProvider).notes;
}

String _$vendorListHash() => r'5a441f730d268cb120614bd644b9c6f7ca0f30d1';

/// See also [vendorList].
@ProviderFor(vendorList)
final vendorListProvider = AutoDisposeStreamProvider<VendorListModal>.internal(
  vendorList,
  name: r'vendorListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$vendorListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef VendorListRef = AutoDisposeStreamProviderRef<VendorListModal>;
String _$vendorExpensesListHash() =>
    r'c4d702fc49d7f14f4f7b9526ab9e4f12fa34014d';

/// See also [vendorExpensesList].
@ProviderFor(vendorExpensesList)
const vendorExpensesListProvider = VendorExpensesListFamily();

/// See also [vendorExpensesList].
class VendorExpensesListFamily extends Family<AsyncValue<VendorExpensesModal>> {
  /// See also [vendorExpensesList].
  const VendorExpensesListFamily();

  /// See also [vendorExpensesList].
  VendorExpensesListProvider call({
    required String? id,
  }) {
    return VendorExpensesListProvider(
      id: id,
    );
  }

  @override
  VendorExpensesListProvider getProviderOverride(
    covariant VendorExpensesListProvider provider,
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
  String? get name => r'vendorExpensesListProvider';
}

/// See also [vendorExpensesList].
class VendorExpensesListProvider
    extends AutoDisposeStreamProvider<VendorExpensesModal> {
  /// See also [vendorExpensesList].
  VendorExpensesListProvider({
    required String? id,
  }) : this._internal(
          (ref) => vendorExpensesList(
            ref as VendorExpensesListRef,
            id: id,
          ),
          from: vendorExpensesListProvider,
          name: r'vendorExpensesListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$vendorExpensesListHash,
          dependencies: VendorExpensesListFamily._dependencies,
          allTransitiveDependencies:
              VendorExpensesListFamily._allTransitiveDependencies,
          id: id,
        );

  VendorExpensesListProvider._internal(
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
    Stream<VendorExpensesModal> Function(VendorExpensesListRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: VendorExpensesListProvider._internal(
        (ref) => create(ref as VendorExpensesListRef),
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
  AutoDisposeStreamProviderElement<VendorExpensesModal> createElement() {
    return _VendorExpensesListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is VendorExpensesListProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin VendorExpensesListRef
    on AutoDisposeStreamProviderRef<VendorExpensesModal> {
  /// The parameter `id` of this provider.
  String? get id;
}

class _VendorExpensesListProviderElement
    extends AutoDisposeStreamProviderElement<VendorExpensesModal>
    with VendorExpensesListRef {
  _VendorExpensesListProviderElement(super.provider);

  @override
  String? get id => (origin as VendorExpensesListProvider).id;
}

String _$vendorExpensesTerminalListHash() =>
    r'235a8e95a0f7044c802e183712d1eb11d0e5ed99';

/// See also [vendorExpensesTerminalList].
@ProviderFor(vendorExpensesTerminalList)
const vendorExpensesTerminalListProvider = VendorExpensesTerminalListFamily();

/// See also [vendorExpensesTerminalList].
class VendorExpensesTerminalListFamily
    extends Family<AsyncValue<VendorExpensesTerminalModal>> {
  /// See also [vendorExpensesTerminalList].
  const VendorExpensesTerminalListFamily();

  /// See also [vendorExpensesTerminalList].
  VendorExpensesTerminalListProvider call({
    required String? id,
  }) {
    return VendorExpensesTerminalListProvider(
      id: id,
    );
  }

  @override
  VendorExpensesTerminalListProvider getProviderOverride(
    covariant VendorExpensesTerminalListProvider provider,
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
  String? get name => r'vendorExpensesTerminalListProvider';
}

/// See also [vendorExpensesTerminalList].
class VendorExpensesTerminalListProvider
    extends AutoDisposeStreamProvider<VendorExpensesTerminalModal> {
  /// See also [vendorExpensesTerminalList].
  VendorExpensesTerminalListProvider({
    required String? id,
  }) : this._internal(
          (ref) => vendorExpensesTerminalList(
            ref as VendorExpensesTerminalListRef,
            id: id,
          ),
          from: vendorExpensesTerminalListProvider,
          name: r'vendorExpensesTerminalListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$vendorExpensesTerminalListHash,
          dependencies: VendorExpensesTerminalListFamily._dependencies,
          allTransitiveDependencies:
              VendorExpensesTerminalListFamily._allTransitiveDependencies,
          id: id,
        );

  VendorExpensesTerminalListProvider._internal(
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
    Stream<VendorExpensesTerminalModal> Function(
            VendorExpensesTerminalListRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: VendorExpensesTerminalListProvider._internal(
        (ref) => create(ref as VendorExpensesTerminalListRef),
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
  AutoDisposeStreamProviderElement<VendorExpensesTerminalModal>
      createElement() {
    return _VendorExpensesTerminalListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is VendorExpensesTerminalListProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin VendorExpensesTerminalListRef
    on AutoDisposeStreamProviderRef<VendorExpensesTerminalModal> {
  /// The parameter `id` of this provider.
  String? get id;
}

class _VendorExpensesTerminalListProviderElement
    extends AutoDisposeStreamProviderElement<VendorExpensesTerminalModal>
    with VendorExpensesTerminalListRef {
  _VendorExpensesTerminalListProviderElement(super.provider);

  @override
  String? get id => (origin as VendorExpensesTerminalListProvider).id;
}

String _$vendorApproverNameHash() =>
    r'8ef461596f18d445e76d4186f961589cdf122c9f';

/// See also [vendorApproverName].
@ProviderFor(vendorApproverName)
const vendorApproverNameProvider = VendorApproverNameFamily();

/// See also [vendorApproverName].
class VendorApproverNameFamily
    extends Family<AsyncValue<VendorApproveNameListModal>> {
  /// See also [vendorApproverName].
  const VendorApproverNameFamily();

  /// See also [vendorApproverName].
  VendorApproverNameProvider call({
    required String? id,
    required String? expensesid,
    required String? amount,
  }) {
    return VendorApproverNameProvider(
      id: id,
      expensesid: expensesid,
      amount: amount,
    );
  }

  @override
  VendorApproverNameProvider getProviderOverride(
    covariant VendorApproverNameProvider provider,
  ) {
    return call(
      id: provider.id,
      expensesid: provider.expensesid,
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
  String? get name => r'vendorApproverNameProvider';
}

/// See also [vendorApproverName].
class VendorApproverNameProvider
    extends AutoDisposeStreamProvider<VendorApproveNameListModal> {
  /// See also [vendorApproverName].
  VendorApproverNameProvider({
    required String? id,
    required String? expensesid,
    required String? amount,
  }) : this._internal(
          (ref) => vendorApproverName(
            ref as VendorApproverNameRef,
            id: id,
            expensesid: expensesid,
            amount: amount,
          ),
          from: vendorApproverNameProvider,
          name: r'vendorApproverNameProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$vendorApproverNameHash,
          dependencies: VendorApproverNameFamily._dependencies,
          allTransitiveDependencies:
              VendorApproverNameFamily._allTransitiveDependencies,
          id: id,
          expensesid: expensesid,
          amount: amount,
        );

  VendorApproverNameProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
    required this.expensesid,
    required this.amount,
  }) : super.internal();

  final String? id;
  final String? expensesid;
  final String? amount;

  @override
  Override overrideWith(
    Stream<VendorApproveNameListModal> Function(VendorApproverNameRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: VendorApproverNameProvider._internal(
        (ref) => create(ref as VendorApproverNameRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
        expensesid: expensesid,
        amount: amount,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<VendorApproveNameListModal> createElement() {
    return _VendorApproverNameProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is VendorApproverNameProvider &&
        other.id == id &&
        other.expensesid == expensesid &&
        other.amount == amount;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);
    hash = _SystemHash.combine(hash, expensesid.hashCode);
    hash = _SystemHash.combine(hash, amount.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin VendorApproverNameRef
    on AutoDisposeStreamProviderRef<VendorApproveNameListModal> {
  /// The parameter `id` of this provider.
  String? get id;

  /// The parameter `expensesid` of this provider.
  String? get expensesid;

  /// The parameter `amount` of this provider.
  String? get amount;
}

class _VendorApproverNameProviderElement
    extends AutoDisposeStreamProviderElement<VendorApproveNameListModal>
    with VendorApproverNameRef {
  _VendorApproverNameProviderElement(super.provider);

  @override
  String? get id => (origin as VendorApproverNameProvider).id;
  @override
  String? get expensesid => (origin as VendorApproverNameProvider).expensesid;
  @override
  String? get amount => (origin as VendorApproverNameProvider).amount;
}

String _$createVendorVoucherHash() =>
    r'056501e2cdb68007bf779003ba7192e63f8de6c9';

/// See also [createVendorVoucher].
@ProviderFor(createVendorVoucher)
const createVendorVoucherProvider = CreateVendorVoucherFamily();

/// See also [createVendorVoucher].
class CreateVendorVoucherFamily
    extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [createVendorVoucher].
  const CreateVendorVoucherFamily();

  /// See also [createVendorVoucher].
  CreateVendorVoucherProvider call({
    String? expenseDate,
    String? vendorId,
    String? terminalId,
    String? expid,
    String? amount,
    String? approveBy,
    String? purpose,
    String? groupFirm,
    String? fromDate,
    String? toDate,
    File? image,
    File? imageSecond,
  }) {
    return CreateVendorVoucherProvider(
      expenseDate: expenseDate,
      vendorId: vendorId,
      terminalId: terminalId,
      expid: expid,
      amount: amount,
      approveBy: approveBy,
      purpose: purpose,
      groupFirm: groupFirm,
      fromDate: fromDate,
      toDate: toDate,
      image: image,
      imageSecond: imageSecond,
    );
  }

  @override
  CreateVendorVoucherProvider getProviderOverride(
    covariant CreateVendorVoucherProvider provider,
  ) {
    return call(
      expenseDate: provider.expenseDate,
      vendorId: provider.vendorId,
      terminalId: provider.terminalId,
      expid: provider.expid,
      amount: provider.amount,
      approveBy: provider.approveBy,
      purpose: provider.purpose,
      groupFirm: provider.groupFirm,
      fromDate: provider.fromDate,
      toDate: provider.toDate,
      image: provider.image,
      imageSecond: provider.imageSecond,
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
  String? get name => r'createVendorVoucherProvider';
}

/// See also [createVendorVoucher].
class CreateVendorVoucherProvider
    extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [createVendorVoucher].
  CreateVendorVoucherProvider({
    String? expenseDate,
    String? vendorId,
    String? terminalId,
    String? expid,
    String? amount,
    String? approveBy,
    String? purpose,
    String? groupFirm,
    String? fromDate,
    String? toDate,
    File? image,
    File? imageSecond,
  }) : this._internal(
          (ref) => createVendorVoucher(
            ref as CreateVendorVoucherRef,
            expenseDate: expenseDate,
            vendorId: vendorId,
            terminalId: terminalId,
            expid: expid,
            amount: amount,
            approveBy: approveBy,
            purpose: purpose,
            groupFirm: groupFirm,
            fromDate: fromDate,
            toDate: toDate,
            image: image,
            imageSecond: imageSecond,
          ),
          from: createVendorVoucherProvider,
          name: r'createVendorVoucherProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$createVendorVoucherHash,
          dependencies: CreateVendorVoucherFamily._dependencies,
          allTransitiveDependencies:
              CreateVendorVoucherFamily._allTransitiveDependencies,
          expenseDate: expenseDate,
          vendorId: vendorId,
          terminalId: terminalId,
          expid: expid,
          amount: amount,
          approveBy: approveBy,
          purpose: purpose,
          groupFirm: groupFirm,
          fromDate: fromDate,
          toDate: toDate,
          image: image,
          imageSecond: imageSecond,
        );

  CreateVendorVoucherProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.expenseDate,
    required this.vendorId,
    required this.terminalId,
    required this.expid,
    required this.amount,
    required this.approveBy,
    required this.purpose,
    required this.groupFirm,
    required this.fromDate,
    required this.toDate,
    required this.image,
    required this.imageSecond,
  }) : super.internal();

  final String? expenseDate;
  final String? vendorId;
  final String? terminalId;
  final String? expid;
  final String? amount;
  final String? approveBy;
  final String? purpose;
  final String? groupFirm;
  final String? fromDate;
  final String? toDate;
  final File? image;
  final File? imageSecond;

  @override
  Override overrideWith(
    FutureOr<Map<String, dynamic>> Function(CreateVendorVoucherRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CreateVendorVoucherProvider._internal(
        (ref) => create(ref as CreateVendorVoucherRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        expenseDate: expenseDate,
        vendorId: vendorId,
        terminalId: terminalId,
        expid: expid,
        amount: amount,
        approveBy: approveBy,
        purpose: purpose,
        groupFirm: groupFirm,
        fromDate: fromDate,
        toDate: toDate,
        image: image,
        imageSecond: imageSecond,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<String, dynamic>> createElement() {
    return _CreateVendorVoucherProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CreateVendorVoucherProvider &&
        other.expenseDate == expenseDate &&
        other.vendorId == vendorId &&
        other.terminalId == terminalId &&
        other.expid == expid &&
        other.amount == amount &&
        other.approveBy == approveBy &&
        other.purpose == purpose &&
        other.groupFirm == groupFirm &&
        other.fromDate == fromDate &&
        other.toDate == toDate &&
        other.image == image &&
        other.imageSecond == imageSecond;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, expenseDate.hashCode);
    hash = _SystemHash.combine(hash, vendorId.hashCode);
    hash = _SystemHash.combine(hash, terminalId.hashCode);
    hash = _SystemHash.combine(hash, expid.hashCode);
    hash = _SystemHash.combine(hash, amount.hashCode);
    hash = _SystemHash.combine(hash, approveBy.hashCode);
    hash = _SystemHash.combine(hash, purpose.hashCode);
    hash = _SystemHash.combine(hash, groupFirm.hashCode);
    hash = _SystemHash.combine(hash, fromDate.hashCode);
    hash = _SystemHash.combine(hash, toDate.hashCode);
    hash = _SystemHash.combine(hash, image.hashCode);
    hash = _SystemHash.combine(hash, imageSecond.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CreateVendorVoucherRef
    on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `expenseDate` of this provider.
  String? get expenseDate;

  /// The parameter `vendorId` of this provider.
  String? get vendorId;

  /// The parameter `terminalId` of this provider.
  String? get terminalId;

  /// The parameter `expid` of this provider.
  String? get expid;

  /// The parameter `amount` of this provider.
  String? get amount;

  /// The parameter `approveBy` of this provider.
  String? get approveBy;

  /// The parameter `purpose` of this provider.
  String? get purpose;

  /// The parameter `groupFirm` of this provider.
  String? get groupFirm;

  /// The parameter `fromDate` of this provider.
  String? get fromDate;

  /// The parameter `toDate` of this provider.
  String? get toDate;

  /// The parameter `image` of this provider.
  File? get image;

  /// The parameter `imageSecond` of this provider.
  File? get imageSecond;
}

class _CreateVendorVoucherProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with CreateVendorVoucherRef {
  _CreateVendorVoucherProviderElement(super.provider);

  @override
  String? get expenseDate =>
      (origin as CreateVendorVoucherProvider).expenseDate;
  @override
  String? get vendorId => (origin as CreateVendorVoucherProvider).vendorId;
  @override
  String? get terminalId => (origin as CreateVendorVoucherProvider).terminalId;
  @override
  String? get expid => (origin as CreateVendorVoucherProvider).expid;
  @override
  String? get amount => (origin as CreateVendorVoucherProvider).amount;
  @override
  String? get approveBy => (origin as CreateVendorVoucherProvider).approveBy;
  @override
  String? get purpose => (origin as CreateVendorVoucherProvider).purpose;
  @override
  String? get groupFirm => (origin as CreateVendorVoucherProvider).groupFirm;
  @override
  String? get fromDate => (origin as CreateVendorVoucherProvider).fromDate;
  @override
  String? get toDate => (origin as CreateVendorVoucherProvider).toDate;
  @override
  File? get image => (origin as CreateVendorVoucherProvider).image;
  @override
  File? get imageSecond => (origin as CreateVendorVoucherProvider).imageSecond;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
