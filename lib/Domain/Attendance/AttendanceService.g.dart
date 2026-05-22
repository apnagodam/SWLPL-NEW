// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AttendanceService.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$attendanceStatusHash() => r'52d34de7d76e2c6c48d022e9be017886f07e9d25';

/// See also [attendanceStatus].
@ProviderFor(attendanceStatus)
final attendanceStatusProvider =
    AutoDisposeFutureProvider<AttendanceStatusModel>.internal(
  attendanceStatus,
  name: r'attendanceStatusProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$attendanceStatusHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AttendanceStatusRef
    = AutoDisposeFutureProviderRef<AttendanceStatusModel>;
String _$listOfHolidaysHash() => r'cf84ae38a634b3ec7abf18747df25c8486d00287';

/// See also [listOfHolidays].
@ProviderFor(listOfHolidays)
final listOfHolidaysProvider =
    AutoDisposeStreamProvider<HolidaysModel>.internal(
  listOfHolidays,
  name: r'listOfHolidaysProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$listOfHolidaysHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ListOfHolidaysRef = AutoDisposeStreamProviderRef<HolidaysModel>;
String _$listOfCleaningHash() => r'8c39bf8861335a169268d9354fdd093983f43956';

/// See also [listOfCleaning].
@ProviderFor(listOfCleaning)
final listOfCleaningProvider =
    AutoDisposeStreamProvider<HolidaysModel>.internal(
  listOfCleaning,
  name: r'listOfCleaningProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$listOfCleaningHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ListOfCleaningRef = AutoDisposeStreamProviderRef<HolidaysModel>;
String _$attendanceRequestsInHash() =>
    r'af56824c32af310ddb84394a3ac18328731eef60';

/// See also [attendanceRequestsIn].
@ProviderFor(attendanceRequestsIn)
final attendanceRequestsInProvider =
    AutoDisposeStreamProvider<AttendenceRequestsInModel>.internal(
  attendanceRequestsIn,
  name: r'attendanceRequestsInProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$attendanceRequestsInHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AttendanceRequestsInRef
    = AutoDisposeStreamProviderRef<AttendenceRequestsInModel>;
String _$attendanceRequestsOutHash() =>
    r'05165d8aa5b2e247fb59c9055809bef0cd66c2f9';

/// See also [attendanceRequestsOut].
@ProviderFor(attendanceRequestsOut)
final attendanceRequestsOutProvider =
    AutoDisposeStreamProvider<AttendenceRequestsOutModel>.internal(
  attendanceRequestsOut,
  name: r'attendanceRequestsOutProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$attendanceRequestsOutHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AttendanceRequestsOutRef
    = AutoDisposeStreamProviderRef<AttendenceRequestsOutModel>;
String _$approveRejectRequestsHash() =>
    r'e2c0f0b4d8dfd24312d2a8355d75f9353ee4446c';

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

/// See also [approveRejectRequests].
@ProviderFor(approveRejectRequests)
const approveRejectRequestsProvider = ApproveRejectRequestsFamily();

/// See also [approveRejectRequests].
class ApproveRejectRequestsFamily
    extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [approveRejectRequests].
  const ApproveRejectRequestsFamily();

  /// See also [approveRejectRequests].
  ApproveRejectRequestsProvider call({
    String? id,
    String? notes,
    String? type,
    String? status,
  }) {
    return ApproveRejectRequestsProvider(
      id: id,
      notes: notes,
      type: type,
      status: status,
    );
  }

  @override
  ApproveRejectRequestsProvider getProviderOverride(
    covariant ApproveRejectRequestsProvider provider,
  ) {
    return call(
      id: provider.id,
      notes: provider.notes,
      type: provider.type,
      status: provider.status,
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
  String? get name => r'approveRejectRequestsProvider';
}

/// See also [approveRejectRequests].
class ApproveRejectRequestsProvider
    extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [approveRejectRequests].
  ApproveRejectRequestsProvider({
    String? id,
    String? notes,
    String? type,
    String? status,
  }) : this._internal(
          (ref) => approveRejectRequests(
            ref as ApproveRejectRequestsRef,
            id: id,
            notes: notes,
            type: type,
            status: status,
          ),
          from: approveRejectRequestsProvider,
          name: r'approveRejectRequestsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$approveRejectRequestsHash,
          dependencies: ApproveRejectRequestsFamily._dependencies,
          allTransitiveDependencies:
              ApproveRejectRequestsFamily._allTransitiveDependencies,
          id: id,
          notes: notes,
          type: type,
          status: status,
        );

  ApproveRejectRequestsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
    required this.notes,
    required this.type,
    required this.status,
  }) : super.internal();

  final String? id;
  final String? notes;
  final String? type;
  final String? status;

  @override
  Override overrideWith(
    FutureOr<Map<String, dynamic>> Function(ApproveRejectRequestsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ApproveRejectRequestsProvider._internal(
        (ref) => create(ref as ApproveRejectRequestsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
        notes: notes,
        type: type,
        status: status,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<String, dynamic>> createElement() {
    return _ApproveRejectRequestsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ApproveRejectRequestsProvider &&
        other.id == id &&
        other.notes == notes &&
        other.type == type &&
        other.status == status;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);
    hash = _SystemHash.combine(hash, notes.hashCode);
    hash = _SystemHash.combine(hash, type.hashCode);
    hash = _SystemHash.combine(hash, status.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ApproveRejectRequestsRef
    on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `id` of this provider.
  String? get id;

  /// The parameter `notes` of this provider.
  String? get notes;

  /// The parameter `type` of this provider.
  String? get type;

  /// The parameter `status` of this provider.
  String? get status;
}

class _ApproveRejectRequestsProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with ApproveRejectRequestsRef {
  _ApproveRejectRequestsProviderElement(super.provider);

  @override
  String? get id => (origin as ApproveRejectRequestsProvider).id;
  @override
  String? get notes => (origin as ApproveRejectRequestsProvider).notes;
  @override
  String? get type => (origin as ApproveRejectRequestsProvider).type;
  @override
  String? get status => (origin as ApproveRejectRequestsProvider).status;
}

String _$postAttendanceHash() => r'dca3f90f0fc77b87db437a47b6820d8eee8f941f';

/// See also [postAttendance].
@ProviderFor(postAttendance)
const postAttendanceProvider = PostAttendanceFamily();

/// See also [postAttendance].
class PostAttendanceFamily extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [postAttendance].
  const PostAttendanceFamily();

  /// See also [postAttendance].
  PostAttendanceProvider call({
    String? clockStatus,
    String? image,
    String? long,
    String? lat,
    String? distance,
    String? userPurpose,
  }) {
    return PostAttendanceProvider(
      clockStatus: clockStatus,
      image: image,
      long: long,
      lat: lat,
      distance: distance,
      userPurpose: userPurpose,
    );
  }

  @override
  PostAttendanceProvider getProviderOverride(
    covariant PostAttendanceProvider provider,
  ) {
    return call(
      clockStatus: provider.clockStatus,
      image: provider.image,
      long: provider.long,
      lat: provider.lat,
      distance: provider.distance,
      userPurpose: provider.userPurpose,
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
  String? get name => r'postAttendanceProvider';
}

/// See also [postAttendance].
class PostAttendanceProvider
    extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [postAttendance].
  PostAttendanceProvider({
    String? clockStatus,
    String? image,
    String? long,
    String? lat,
    String? distance,
    String? userPurpose,
  }) : this._internal(
          (ref) => postAttendance(
            ref as PostAttendanceRef,
            clockStatus: clockStatus,
            image: image,
            long: long,
            lat: lat,
            distance: distance,
            userPurpose: userPurpose,
          ),
          from: postAttendanceProvider,
          name: r'postAttendanceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$postAttendanceHash,
          dependencies: PostAttendanceFamily._dependencies,
          allTransitiveDependencies:
              PostAttendanceFamily._allTransitiveDependencies,
          clockStatus: clockStatus,
          image: image,
          long: long,
          lat: lat,
          distance: distance,
          userPurpose: userPurpose,
        );

  PostAttendanceProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.clockStatus,
    required this.image,
    required this.long,
    required this.lat,
    required this.distance,
    required this.userPurpose,
  }) : super.internal();

  final String? clockStatus;
  final String? image;
  final String? long;
  final String? lat;
  final String? distance;
  final String? userPurpose;

  @override
  Override overrideWith(
    FutureOr<Map<String, dynamic>> Function(PostAttendanceRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PostAttendanceProvider._internal(
        (ref) => create(ref as PostAttendanceRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        clockStatus: clockStatus,
        image: image,
        long: long,
        lat: lat,
        distance: distance,
        userPurpose: userPurpose,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<String, dynamic>> createElement() {
    return _PostAttendanceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PostAttendanceProvider &&
        other.clockStatus == clockStatus &&
        other.image == image &&
        other.long == long &&
        other.lat == lat &&
        other.distance == distance &&
        other.userPurpose == userPurpose;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, clockStatus.hashCode);
    hash = _SystemHash.combine(hash, image.hashCode);
    hash = _SystemHash.combine(hash, long.hashCode);
    hash = _SystemHash.combine(hash, lat.hashCode);
    hash = _SystemHash.combine(hash, distance.hashCode);
    hash = _SystemHash.combine(hash, userPurpose.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PostAttendanceRef on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `clockStatus` of this provider.
  String? get clockStatus;

  /// The parameter `image` of this provider.
  String? get image;

  /// The parameter `long` of this provider.
  String? get long;

  /// The parameter `lat` of this provider.
  String? get lat;

  /// The parameter `distance` of this provider.
  String? get distance;

  /// The parameter `userPurpose` of this provider.
  String? get userPurpose;
}

class _PostAttendanceProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with PostAttendanceRef {
  _PostAttendanceProviderElement(super.provider);

  @override
  String? get clockStatus => (origin as PostAttendanceProvider).clockStatus;
  @override
  String? get image => (origin as PostAttendanceProvider).image;
  @override
  String? get long => (origin as PostAttendanceProvider).long;
  @override
  String? get lat => (origin as PostAttendanceProvider).lat;
  @override
  String? get distance => (origin as PostAttendanceProvider).distance;
  @override
  String? get userPurpose => (origin as PostAttendanceProvider).userPurpose;
}

String _$postAttendanceV2Hash() => r'380dd85e18cc60a56d9a85f5331814c625258489';

/// See also [postAttendanceV2].
@ProviderFor(postAttendanceV2)
const postAttendanceV2Provider = PostAttendanceV2Family();

/// See also [postAttendanceV2].
class PostAttendanceV2Family extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [postAttendanceV2].
  const PostAttendanceV2Family();

  /// See also [postAttendanceV2].
  PostAttendanceV2Provider call({
    String? clockStatus,
    String? long,
    String? lat,
    String? distance,
    String? userPurpose,
    File? image,
  }) {
    return PostAttendanceV2Provider(
      clockStatus: clockStatus,
      long: long,
      lat: lat,
      distance: distance,
      userPurpose: userPurpose,
      image: image,
    );
  }

  @override
  PostAttendanceV2Provider getProviderOverride(
    covariant PostAttendanceV2Provider provider,
  ) {
    return call(
      clockStatus: provider.clockStatus,
      long: provider.long,
      lat: provider.lat,
      distance: provider.distance,
      userPurpose: provider.userPurpose,
      image: provider.image,
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
  String? get name => r'postAttendanceV2Provider';
}

/// See also [postAttendanceV2].
class PostAttendanceV2Provider
    extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [postAttendanceV2].
  PostAttendanceV2Provider({
    String? clockStatus,
    String? long,
    String? lat,
    String? distance,
    String? userPurpose,
    File? image,
  }) : this._internal(
          (ref) => postAttendanceV2(
            ref as PostAttendanceV2Ref,
            clockStatus: clockStatus,
            long: long,
            lat: lat,
            distance: distance,
            userPurpose: userPurpose,
            image: image,
          ),
          from: postAttendanceV2Provider,
          name: r'postAttendanceV2Provider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$postAttendanceV2Hash,
          dependencies: PostAttendanceV2Family._dependencies,
          allTransitiveDependencies:
              PostAttendanceV2Family._allTransitiveDependencies,
          clockStatus: clockStatus,
          long: long,
          lat: lat,
          distance: distance,
          userPurpose: userPurpose,
          image: image,
        );

  PostAttendanceV2Provider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.clockStatus,
    required this.long,
    required this.lat,
    required this.distance,
    required this.userPurpose,
    required this.image,
  }) : super.internal();

  final String? clockStatus;
  final String? long;
  final String? lat;
  final String? distance;
  final String? userPurpose;
  final File? image;

  @override
  Override overrideWith(
    FutureOr<Map<String, dynamic>> Function(PostAttendanceV2Ref provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PostAttendanceV2Provider._internal(
        (ref) => create(ref as PostAttendanceV2Ref),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        clockStatus: clockStatus,
        long: long,
        lat: lat,
        distance: distance,
        userPurpose: userPurpose,
        image: image,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<String, dynamic>> createElement() {
    return _PostAttendanceV2ProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PostAttendanceV2Provider &&
        other.clockStatus == clockStatus &&
        other.long == long &&
        other.lat == lat &&
        other.distance == distance &&
        other.userPurpose == userPurpose &&
        other.image == image;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, clockStatus.hashCode);
    hash = _SystemHash.combine(hash, long.hashCode);
    hash = _SystemHash.combine(hash, lat.hashCode);
    hash = _SystemHash.combine(hash, distance.hashCode);
    hash = _SystemHash.combine(hash, userPurpose.hashCode);
    hash = _SystemHash.combine(hash, image.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PostAttendanceV2Ref
    on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `clockStatus` of this provider.
  String? get clockStatus;

  /// The parameter `long` of this provider.
  String? get long;

  /// The parameter `lat` of this provider.
  String? get lat;

  /// The parameter `distance` of this provider.
  String? get distance;

  /// The parameter `userPurpose` of this provider.
  String? get userPurpose;

  /// The parameter `image` of this provider.
  File? get image;
}

class _PostAttendanceV2ProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with PostAttendanceV2Ref {
  _PostAttendanceV2ProviderElement(super.provider);

  @override
  String? get clockStatus => (origin as PostAttendanceV2Provider).clockStatus;
  @override
  String? get long => (origin as PostAttendanceV2Provider).long;
  @override
  String? get lat => (origin as PostAttendanceV2Provider).lat;
  @override
  String? get distance => (origin as PostAttendanceV2Provider).distance;
  @override
  String? get userPurpose => (origin as PostAttendanceV2Provider).userPurpose;
  @override
  File? get image => (origin as PostAttendanceV2Provider).image;
}

String _$checkForLateHash() => r'20a2c312a41dc192c2aea4a79799fe49906bfd57';

/// See also [checkForLate].
@ProviderFor(checkForLate)
final checkForLateProvider =
    AutoDisposeFutureProvider<CheckForLateResponse>.internal(
  checkForLate,
  name: r'checkForLateProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$checkForLateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CheckForLateRef = AutoDisposeFutureProviderRef<CheckForLateResponse>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
