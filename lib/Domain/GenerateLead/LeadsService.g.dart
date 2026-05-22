// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LeadsService.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$generateLeadHash() => r'669bdec68ce43cd4eb03c44ee57ec7b34f88c6ff';

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

/// See also [generateLead].
@ProviderFor(generateLead)
const generateLeadProvider = GenerateLeadFamily();

/// See also [generateLead].
class GenerateLeadFamily extends Family<AsyncValue<BaseResponse>> {
  /// See also [generateLead].
  const GenerateLeadFamily();

  /// See also [generateLead].
  GenerateLeadProvider call({
    String? userId,
    String? customerName,
    String? phone,
    String? quantity,
    String? commodityId,
    String? terminalId,
    String? location,
    String? date,
    String? purpose,
  }) {
    return GenerateLeadProvider(
      userId: userId,
      customerName: customerName,
      phone: phone,
      quantity: quantity,
      commodityId: commodityId,
      terminalId: terminalId,
      location: location,
      date: date,
      purpose: purpose,
    );
  }

  @override
  GenerateLeadProvider getProviderOverride(
    covariant GenerateLeadProvider provider,
  ) {
    return call(
      userId: provider.userId,
      customerName: provider.customerName,
      phone: provider.phone,
      quantity: provider.quantity,
      commodityId: provider.commodityId,
      terminalId: provider.terminalId,
      location: provider.location,
      date: provider.date,
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
  String? get name => r'generateLeadProvider';
}

/// See also [generateLead].
class GenerateLeadProvider extends AutoDisposeFutureProvider<BaseResponse> {
  /// See also [generateLead].
  GenerateLeadProvider({
    String? userId,
    String? customerName,
    String? phone,
    String? quantity,
    String? commodityId,
    String? terminalId,
    String? location,
    String? date,
    String? purpose,
  }) : this._internal(
          (ref) => generateLead(
            ref as GenerateLeadRef,
            userId: userId,
            customerName: customerName,
            phone: phone,
            quantity: quantity,
            commodityId: commodityId,
            terminalId: terminalId,
            location: location,
            date: date,
            purpose: purpose,
          ),
          from: generateLeadProvider,
          name: r'generateLeadProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$generateLeadHash,
          dependencies: GenerateLeadFamily._dependencies,
          allTransitiveDependencies:
              GenerateLeadFamily._allTransitiveDependencies,
          userId: userId,
          customerName: customerName,
          phone: phone,
          quantity: quantity,
          commodityId: commodityId,
          terminalId: terminalId,
          location: location,
          date: date,
          purpose: purpose,
        );

  GenerateLeadProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userId,
    required this.customerName,
    required this.phone,
    required this.quantity,
    required this.commodityId,
    required this.terminalId,
    required this.location,
    required this.date,
    required this.purpose,
  }) : super.internal();

  final String? userId;
  final String? customerName;
  final String? phone;
  final String? quantity;
  final String? commodityId;
  final String? terminalId;
  final String? location;
  final String? date;
  final String? purpose;

  @override
  Override overrideWith(
    FutureOr<BaseResponse> Function(GenerateLeadRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GenerateLeadProvider._internal(
        (ref) => create(ref as GenerateLeadRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userId: userId,
        customerName: customerName,
        phone: phone,
        quantity: quantity,
        commodityId: commodityId,
        terminalId: terminalId,
        location: location,
        date: date,
        purpose: purpose,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<BaseResponse> createElement() {
    return _GenerateLeadProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GenerateLeadProvider &&
        other.userId == userId &&
        other.customerName == customerName &&
        other.phone == phone &&
        other.quantity == quantity &&
        other.commodityId == commodityId &&
        other.terminalId == terminalId &&
        other.location == location &&
        other.date == date &&
        other.purpose == purpose;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);
    hash = _SystemHash.combine(hash, customerName.hashCode);
    hash = _SystemHash.combine(hash, phone.hashCode);
    hash = _SystemHash.combine(hash, quantity.hashCode);
    hash = _SystemHash.combine(hash, commodityId.hashCode);
    hash = _SystemHash.combine(hash, terminalId.hashCode);
    hash = _SystemHash.combine(hash, location.hashCode);
    hash = _SystemHash.combine(hash, date.hashCode);
    hash = _SystemHash.combine(hash, purpose.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GenerateLeadRef on AutoDisposeFutureProviderRef<BaseResponse> {
  /// The parameter `userId` of this provider.
  String? get userId;

  /// The parameter `customerName` of this provider.
  String? get customerName;

  /// The parameter `phone` of this provider.
  String? get phone;

  /// The parameter `quantity` of this provider.
  String? get quantity;

  /// The parameter `commodityId` of this provider.
  String? get commodityId;

  /// The parameter `terminalId` of this provider.
  String? get terminalId;

  /// The parameter `location` of this provider.
  String? get location;

  /// The parameter `date` of this provider.
  String? get date;

  /// The parameter `purpose` of this provider.
  String? get purpose;
}

class _GenerateLeadProviderElement
    extends AutoDisposeFutureProviderElement<BaseResponse>
    with GenerateLeadRef {
  _GenerateLeadProviderElement(super.provider);

  @override
  String? get userId => (origin as GenerateLeadProvider).userId;
  @override
  String? get customerName => (origin as GenerateLeadProvider).customerName;
  @override
  String? get phone => (origin as GenerateLeadProvider).phone;
  @override
  String? get quantity => (origin as GenerateLeadProvider).quantity;
  @override
  String? get commodityId => (origin as GenerateLeadProvider).commodityId;
  @override
  String? get terminalId => (origin as GenerateLeadProvider).terminalId;
  @override
  String? get location => (origin as GenerateLeadProvider).location;
  @override
  String? get date => (origin as GenerateLeadProvider).date;
  @override
  String? get purpose => (origin as GenerateLeadProvider).purpose;
}

String _$leadsListHash() => r'a53affb8ee0ebe1ff67ec38b411cfdd5b6baae4f';

/// See also [leadsList].
@ProviderFor(leadsList)
final leadsListProvider = AutoDisposeStreamProvider<LeadsListModel>.internal(
  leadsList,
  name: r'leadsListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$leadsListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef LeadsListRef = AutoDisposeStreamProviderRef<LeadsListModel>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
