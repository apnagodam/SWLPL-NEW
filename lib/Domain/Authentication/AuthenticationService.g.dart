// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AuthenticationService.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sendOtpHash() => r'b08d0f4d1a83d4b620536a810ed4e2366451eeab';

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

/// See also [sendOtp].
@ProviderFor(sendOtp)
const sendOtpProvider = SendOtpFamily();

/// See also [sendOtp].
class SendOtpFamily extends Family<AsyncValue<LoginModel>> {
  /// See also [sendOtp].
  const SendOtpFamily();

  /// See also [sendOtp].
  SendOtpProvider call({
    String? empCode,
  }) {
    return SendOtpProvider(
      empCode: empCode,
    );
  }

  @override
  SendOtpProvider getProviderOverride(
    covariant SendOtpProvider provider,
  ) {
    return call(
      empCode: provider.empCode,
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
  String? get name => r'sendOtpProvider';
}

/// See also [sendOtp].
class SendOtpProvider extends AutoDisposeFutureProvider<LoginModel> {
  /// See also [sendOtp].
  SendOtpProvider({
    String? empCode,
  }) : this._internal(
          (ref) => sendOtp(
            ref as SendOtpRef,
            empCode: empCode,
          ),
          from: sendOtpProvider,
          name: r'sendOtpProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$sendOtpHash,
          dependencies: SendOtpFamily._dependencies,
          allTransitiveDependencies: SendOtpFamily._allTransitiveDependencies,
          empCode: empCode,
        );

  SendOtpProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.empCode,
  }) : super.internal();

  final String? empCode;

  @override
  Override overrideWith(
    FutureOr<LoginModel> Function(SendOtpRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SendOtpProvider._internal(
        (ref) => create(ref as SendOtpRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        empCode: empCode,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<LoginModel> createElement() {
    return _SendOtpProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SendOtpProvider && other.empCode == empCode;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, empCode.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SendOtpRef on AutoDisposeFutureProviderRef<LoginModel> {
  /// The parameter `empCode` of this provider.
  String? get empCode;
}

class _SendOtpProviderElement
    extends AutoDisposeFutureProviderElement<LoginModel> with SendOtpRef {
  _SendOtpProviderElement(super.provider);

  @override
  String? get empCode => (origin as SendOtpProvider).empCode;
}

String _$sendOtpV1Hash() => r'f70dfd5d0fadf9cda29482745a5c530e295dfd3f';

/// See also [sendOtpV1].
@ProviderFor(sendOtpV1)
const sendOtpV1Provider = SendOtpV1Family();

/// See also [sendOtpV1].
class SendOtpV1Family extends Family<AsyncValue<LoginModel>> {
  /// See also [sendOtpV1].
  const SendOtpV1Family();

  /// See also [sendOtpV1].
  SendOtpV1Provider call({
    String? empCode,
  }) {
    return SendOtpV1Provider(
      empCode: empCode,
    );
  }

  @override
  SendOtpV1Provider getProviderOverride(
    covariant SendOtpV1Provider provider,
  ) {
    return call(
      empCode: provider.empCode,
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
  String? get name => r'sendOtpV1Provider';
}

/// See also [sendOtpV1].
class SendOtpV1Provider extends AutoDisposeFutureProvider<LoginModel> {
  /// See also [sendOtpV1].
  SendOtpV1Provider({
    String? empCode,
  }) : this._internal(
          (ref) => sendOtpV1(
            ref as SendOtpV1Ref,
            empCode: empCode,
          ),
          from: sendOtpV1Provider,
          name: r'sendOtpV1Provider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$sendOtpV1Hash,
          dependencies: SendOtpV1Family._dependencies,
          allTransitiveDependencies: SendOtpV1Family._allTransitiveDependencies,
          empCode: empCode,
        );

  SendOtpV1Provider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.empCode,
  }) : super.internal();

  final String? empCode;

  @override
  Override overrideWith(
    FutureOr<LoginModel> Function(SendOtpV1Ref provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SendOtpV1Provider._internal(
        (ref) => create(ref as SendOtpV1Ref),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        empCode: empCode,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<LoginModel> createElement() {
    return _SendOtpV1ProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SendOtpV1Provider && other.empCode == empCode;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, empCode.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SendOtpV1Ref on AutoDisposeFutureProviderRef<LoginModel> {
  /// The parameter `empCode` of this provider.
  String? get empCode;
}

class _SendOtpV1ProviderElement
    extends AutoDisposeFutureProviderElement<LoginModel> with SendOtpV1Ref {
  _SendOtpV1ProviderElement(super.provider);

  @override
  String? get empCode => (origin as SendOtpV1Provider).empCode;
}

String _$verifyOtpHash() => r'fd9273b677cba9bd448b92d876a50ba4584fd698';

/// See also [verifyOtp].
@ProviderFor(verifyOtp)
const verifyOtpProvider = VerifyOtpFamily();

/// See also [verifyOtp].
class VerifyOtpFamily extends Family<AsyncValue<OtpResponseModel>> {
  /// See also [verifyOtp].
  const VerifyOtpFamily();

  /// See also [verifyOtp].
  VerifyOtpProvider call({
    String? otp,
    String? number,
  }) {
    return VerifyOtpProvider(
      otp: otp,
      number: number,
    );
  }

  @override
  VerifyOtpProvider getProviderOverride(
    covariant VerifyOtpProvider provider,
  ) {
    return call(
      otp: provider.otp,
      number: provider.number,
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
  String? get name => r'verifyOtpProvider';
}

/// See also [verifyOtp].
class VerifyOtpProvider extends AutoDisposeFutureProvider<OtpResponseModel> {
  /// See also [verifyOtp].
  VerifyOtpProvider({
    String? otp,
    String? number,
  }) : this._internal(
          (ref) => verifyOtp(
            ref as VerifyOtpRef,
            otp: otp,
            number: number,
          ),
          from: verifyOtpProvider,
          name: r'verifyOtpProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$verifyOtpHash,
          dependencies: VerifyOtpFamily._dependencies,
          allTransitiveDependencies: VerifyOtpFamily._allTransitiveDependencies,
          otp: otp,
          number: number,
        );

  VerifyOtpProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.otp,
    required this.number,
  }) : super.internal();

  final String? otp;
  final String? number;

  @override
  Override overrideWith(
    FutureOr<OtpResponseModel> Function(VerifyOtpRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: VerifyOtpProvider._internal(
        (ref) => create(ref as VerifyOtpRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        otp: otp,
        number: number,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<OtpResponseModel> createElement() {
    return _VerifyOtpProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is VerifyOtpProvider &&
        other.otp == otp &&
        other.number == number;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, otp.hashCode);
    hash = _SystemHash.combine(hash, number.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin VerifyOtpRef on AutoDisposeFutureProviderRef<OtpResponseModel> {
  /// The parameter `otp` of this provider.
  String? get otp;

  /// The parameter `number` of this provider.
  String? get number;
}

class _VerifyOtpProviderElement
    extends AutoDisposeFutureProviderElement<OtpResponseModel>
    with VerifyOtpRef {
  _VerifyOtpProviderElement(super.provider);

  @override
  String? get otp => (origin as VerifyOtpProvider).otp;
  @override
  String? get number => (origin as VerifyOtpProvider).number;
}

String _$profileDataHash() => r'6685c16ce84d6b1f23df1f95cbb96814af1e329a';

/// See also [profileData].
@ProviderFor(profileData)
final profileDataProvider =
    AutoDisposeStreamProvider<ProfileDataModel>.internal(
  profileData,
  name: r'profileDataProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$profileDataHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ProfileDataRef = AutoDisposeStreamProviderRef<ProfileDataModel>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
