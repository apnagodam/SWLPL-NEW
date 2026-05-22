// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TruckBookService.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$transporterListHash() => r'99b7e01805f1604166e5219b0b872c2768e1a39d';

/// See also [transporterList].
@ProviderFor(transporterList)
final transporterListProvider =
    AutoDisposeStreamProvider<TransporterListModel>.internal(
  transporterList,
  name: r'transporterListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$transporterListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TransporterListRef = AutoDisposeStreamProviderRef<TransporterListModel>;
String _$truckBookListHash() => r'd230c0c3e9206607f2c55b809fcd16c364302b9f';

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

/// See also [truckBookList].
@ProviderFor(truckBookList)
const truckBookListProvider = TruckBookListFamily();

/// See also [truckBookList].
class TruckBookListFamily extends Family<AsyncValue<TruckBookListModel>> {
  /// See also [truckBookList].
  const TruckBookListFamily();

  /// See also [truckBookList].
  TruckBookListProvider call({
    String? inOut,
  }) {
    return TruckBookListProvider(
      inOut: inOut,
    );
  }

  @override
  TruckBookListProvider getProviderOverride(
    covariant TruckBookListProvider provider,
  ) {
    return call(
      inOut: provider.inOut,
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
  String? get name => r'truckBookListProvider';
}

/// See also [truckBookList].
class TruckBookListProvider
    extends AutoDisposeStreamProvider<TruckBookListModel> {
  /// See also [truckBookList].
  TruckBookListProvider({
    String? inOut,
  }) : this._internal(
          (ref) => truckBookList(
            ref as TruckBookListRef,
            inOut: inOut,
          ),
          from: truckBookListProvider,
          name: r'truckBookListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$truckBookListHash,
          dependencies: TruckBookListFamily._dependencies,
          allTransitiveDependencies:
              TruckBookListFamily._allTransitiveDependencies,
          inOut: inOut,
        );

  TruckBookListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.inOut,
  }) : super.internal();

  final String? inOut;

  @override
  Override overrideWith(
    Stream<TruckBookListModel> Function(TruckBookListRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TruckBookListProvider._internal(
        (ref) => create(ref as TruckBookListRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        inOut: inOut,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<TruckBookListModel> createElement() {
    return _TruckBookListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TruckBookListProvider && other.inOut == inOut;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, inOut.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TruckBookListRef on AutoDisposeStreamProviderRef<TruckBookListModel> {
  /// The parameter `inOut` of this provider.
  String? get inOut;
}

class _TruckBookListProviderElement
    extends AutoDisposeStreamProviderElement<TruckBookListModel>
    with TruckBookListRef {
  _TruckBookListProviderElement(super.provider);

  @override
  String? get inOut => (origin as TruckBookListProvider).inOut;
}

String _$uploadTruckBookHash() => r'176dde199d858b1b086557bb0bf802ae06818e06';

/// See also [uploadTruckBook].
@ProviderFor(uploadTruckBook)
const uploadTruckBookProvider = UploadTruckBookFamily();

/// See also [uploadTruckBook].
class UploadTruckBookFamily extends Family<AsyncValue<BaseResponse>> {
  /// See also [uploadTruckBook].
  const UploadTruckBookFamily();

  /// See also [uploadTruckBook].
  UploadTruckBookProvider call({
    String? caseId = "",
    String? transporterId = "",
    String? vehicleNo = "",
    String? driverName = "",
    String? driverPhone = "",
    String? transportRate = "",
    String? advancePayment = "",
    String? notes = "",
    String? destination = "",
    String? biltyImage = "",
  }) {
    return UploadTruckBookProvider(
      caseId: caseId,
      transporterId: transporterId,
      vehicleNo: vehicleNo,
      driverName: driverName,
      driverPhone: driverPhone,
      transportRate: transportRate,
      advancePayment: advancePayment,
      notes: notes,
      destination: destination,
      biltyImage: biltyImage,
    );
  }

  @override
  UploadTruckBookProvider getProviderOverride(
    covariant UploadTruckBookProvider provider,
  ) {
    return call(
      caseId: provider.caseId,
      transporterId: provider.transporterId,
      vehicleNo: provider.vehicleNo,
      driverName: provider.driverName,
      driverPhone: provider.driverPhone,
      transportRate: provider.transportRate,
      advancePayment: provider.advancePayment,
      notes: provider.notes,
      destination: provider.destination,
      biltyImage: provider.biltyImage,
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
  String? get name => r'uploadTruckBookProvider';
}

/// See also [uploadTruckBook].
class UploadTruckBookProvider extends AutoDisposeFutureProvider<BaseResponse> {
  /// See also [uploadTruckBook].
  UploadTruckBookProvider({
    String? caseId = "",
    String? transporterId = "",
    String? vehicleNo = "",
    String? driverName = "",
    String? driverPhone = "",
    String? transportRate = "",
    String? advancePayment = "",
    String? notes = "",
    String? destination = "",
    String? biltyImage = "",
  }) : this._internal(
          (ref) => uploadTruckBook(
            ref as UploadTruckBookRef,
            caseId: caseId,
            transporterId: transporterId,
            vehicleNo: vehicleNo,
            driverName: driverName,
            driverPhone: driverPhone,
            transportRate: transportRate,
            advancePayment: advancePayment,
            notes: notes,
            destination: destination,
            biltyImage: biltyImage,
          ),
          from: uploadTruckBookProvider,
          name: r'uploadTruckBookProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$uploadTruckBookHash,
          dependencies: UploadTruckBookFamily._dependencies,
          allTransitiveDependencies:
              UploadTruckBookFamily._allTransitiveDependencies,
          caseId: caseId,
          transporterId: transporterId,
          vehicleNo: vehicleNo,
          driverName: driverName,
          driverPhone: driverPhone,
          transportRate: transportRate,
          advancePayment: advancePayment,
          notes: notes,
          destination: destination,
          biltyImage: biltyImage,
        );

  UploadTruckBookProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.caseId,
    required this.transporterId,
    required this.vehicleNo,
    required this.driverName,
    required this.driverPhone,
    required this.transportRate,
    required this.advancePayment,
    required this.notes,
    required this.destination,
    required this.biltyImage,
  }) : super.internal();

  final String? caseId;
  final String? transporterId;
  final String? vehicleNo;
  final String? driverName;
  final String? driverPhone;
  final String? transportRate;
  final String? advancePayment;
  final String? notes;
  final String? destination;
  final String? biltyImage;

  @override
  Override overrideWith(
    FutureOr<BaseResponse> Function(UploadTruckBookRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UploadTruckBookProvider._internal(
        (ref) => create(ref as UploadTruckBookRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        caseId: caseId,
        transporterId: transporterId,
        vehicleNo: vehicleNo,
        driverName: driverName,
        driverPhone: driverPhone,
        transportRate: transportRate,
        advancePayment: advancePayment,
        notes: notes,
        destination: destination,
        biltyImage: biltyImage,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<BaseResponse> createElement() {
    return _UploadTruckBookProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UploadTruckBookProvider &&
        other.caseId == caseId &&
        other.transporterId == transporterId &&
        other.vehicleNo == vehicleNo &&
        other.driverName == driverName &&
        other.driverPhone == driverPhone &&
        other.transportRate == transportRate &&
        other.advancePayment == advancePayment &&
        other.notes == notes &&
        other.destination == destination &&
        other.biltyImage == biltyImage;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, caseId.hashCode);
    hash = _SystemHash.combine(hash, transporterId.hashCode);
    hash = _SystemHash.combine(hash, vehicleNo.hashCode);
    hash = _SystemHash.combine(hash, driverName.hashCode);
    hash = _SystemHash.combine(hash, driverPhone.hashCode);
    hash = _SystemHash.combine(hash, transportRate.hashCode);
    hash = _SystemHash.combine(hash, advancePayment.hashCode);
    hash = _SystemHash.combine(hash, notes.hashCode);
    hash = _SystemHash.combine(hash, destination.hashCode);
    hash = _SystemHash.combine(hash, biltyImage.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UploadTruckBookRef on AutoDisposeFutureProviderRef<BaseResponse> {
  /// The parameter `caseId` of this provider.
  String? get caseId;

  /// The parameter `transporterId` of this provider.
  String? get transporterId;

  /// The parameter `vehicleNo` of this provider.
  String? get vehicleNo;

  /// The parameter `driverName` of this provider.
  String? get driverName;

  /// The parameter `driverPhone` of this provider.
  String? get driverPhone;

  /// The parameter `transportRate` of this provider.
  String? get transportRate;

  /// The parameter `advancePayment` of this provider.
  String? get advancePayment;

  /// The parameter `notes` of this provider.
  String? get notes;

  /// The parameter `destination` of this provider.
  String? get destination;

  /// The parameter `biltyImage` of this provider.
  String? get biltyImage;
}

class _UploadTruckBookProviderElement
    extends AutoDisposeFutureProviderElement<BaseResponse>
    with UploadTruckBookRef {
  _UploadTruckBookProviderElement(super.provider);

  @override
  String? get caseId => (origin as UploadTruckBookProvider).caseId;
  @override
  String? get transporterId =>
      (origin as UploadTruckBookProvider).transporterId;
  @override
  String? get vehicleNo => (origin as UploadTruckBookProvider).vehicleNo;
  @override
  String? get driverName => (origin as UploadTruckBookProvider).driverName;
  @override
  String? get driverPhone => (origin as UploadTruckBookProvider).driverPhone;
  @override
  String? get transportRate =>
      (origin as UploadTruckBookProvider).transportRate;
  @override
  String? get advancePayment =>
      (origin as UploadTruckBookProvider).advancePayment;
  @override
  String? get notes => (origin as UploadTruckBookProvider).notes;
  @override
  String? get destination => (origin as UploadTruckBookProvider).destination;
  @override
  String? get biltyImage => (origin as UploadTruckBookProvider).biltyImage;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
