// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_user.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// ignore_for_file: avoid_private_typedef_functions, non_constant_identifier_names, subtype_of_sealed_class, invalid_use_of_internal_member, unused_element, constant_identifier_names, unnecessary_raw_strings, library_private_types_in_public_api

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

String $FetchUserHash() => r'e9a8b65a262cdb188f1d4d86a20117f2a0de0b62';

/// See also [FetchUser].
class FetchUserProvider
    extends AutoDisposeAsyncNotifierProviderImpl<FetchUser, int> {
  FetchUserProvider({
    required this.familyArg1,
    required this.familyArg2,
  }) : super(
          () => FetchUser()
            ..familyArg1 = familyArg1
            ..familyArg2 = familyArg2,
          from: fetchUserProvider,
          name: r'fetchUserProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : $FetchUserHash,
        );

  final int familyArg1;
  final int familyArg2;

  @override
  bool operator ==(Object other) {
    return other is FetchUserProvider &&
        other.familyArg1 == familyArg1 &&
        other.familyArg2 == familyArg2;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, familyArg1.hashCode);
    hash = _SystemHash.combine(hash, familyArg2.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  FutureOr<int> runNotifierBuild(
    covariant _$FetchUser notifier,
  ) {
    return notifier.build(
      familyArg1: familyArg1,
      familyArg2: familyArg2,
    );
  }
}

typedef FetchUserRef = AutoDisposeAsyncNotifierProviderRef<int>;

/// See also [FetchUser].
final fetchUserProvider = FetchUserFamily();

class FetchUserFamily extends Family<AsyncValue<int>> {
  FetchUserFamily();

  FetchUserProvider call({
    required int familyArg1,
    required int familyArg2,
  }) {
    return FetchUserProvider(
      familyArg1: familyArg1,
      familyArg2: familyArg2,
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderImpl<FetchUser, int> getProviderOverride(
    covariant FetchUserProvider provider,
  ) {
    return call(
      familyArg1: provider.familyArg1,
      familyArg2: provider.familyArg2,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'fetchUserProvider';
}

abstract class _$FetchUser extends BuildlessAutoDisposeAsyncNotifier<int> {
  late final int familyArg1;
  late final int familyArg2;

  FutureOr<int> build({
    required int familyArg1,
    required int familyArg2,
  });
}

String $FetchUser2Hash() => r'6d7a1843c6ba30100f9ffc033cc70bffec544226';

/// See also [FetchUser2].
final fetchUser2Provider = AutoDisposeAsyncNotifierProvider<FetchUser2, int>(
  FetchUser2.new,
  name: r'fetchUser2Provider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : $FetchUser2Hash,
);
typedef FetchUser2Ref = AutoDisposeAsyncNotifierProviderRef<int>;

abstract class _$FetchUser2 extends AutoDisposeAsyncNotifier<int> {
  @override
  FutureOr<int> build();
}

String $FetchUser3Hash() => r'94f578e9299d3f2ff4150448efc0542680cf61c7';

/// See also [FetchUser3].
final fetchUser3Provider = AsyncNotifierProvider<FetchUser3, int>(
  FetchUser3.new,
  name: r'fetchUser3Provider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : $FetchUser3Hash,
);
typedef FetchUser3Ref = AsyncNotifierProviderRef<int>;

abstract class _$FetchUser3 extends AsyncNotifier<int> {
  @override
  FutureOr<int> build();
}

String $FetchUser4Hash() => r'fbd07eb406aa08c5db279448ad5b99df86d3d325';

/// See also [FetchUser4].
class FetchUser4Provider extends AsyncNotifierProviderImpl<FetchUser4, int> {
  FetchUser4Provider({
    required this.familyArg1,
    required this.familyArg2,
  }) : super(
          () => FetchUser4()
            ..familyArg1 = familyArg1
            ..familyArg2 = familyArg2,
          from: fetchUser4Provider,
          name: r'fetchUser4Provider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : $FetchUser4Hash,
        );

  final int familyArg1;
  final int familyArg2;

  @override
  bool operator ==(Object other) {
    return other is FetchUser4Provider &&
        other.familyArg1 == familyArg1 &&
        other.familyArg2 == familyArg2;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, familyArg1.hashCode);
    hash = _SystemHash.combine(hash, familyArg2.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  FutureOr<int> runNotifierBuild(
    covariant _$FetchUser4 notifier,
  ) {
    return notifier.build(
      familyArg1: familyArg1,
      familyArg2: familyArg2,
    );
  }
}

typedef FetchUser4Ref = AsyncNotifierProviderRef<int>;

/// See also [FetchUser4].
final fetchUser4Provider = FetchUser4Family();

class FetchUser4Family extends Family<AsyncValue<int>> {
  FetchUser4Family();

  FetchUser4Provider call({
    required int familyArg1,
    required int familyArg2,
  }) {
    return FetchUser4Provider(
      familyArg1: familyArg1,
      familyArg2: familyArg2,
    );
  }

  @override
  AsyncNotifierProviderImpl<FetchUser4, int> getProviderOverride(
    covariant FetchUser4Provider provider,
  ) {
    return call(
      familyArg1: provider.familyArg1,
      familyArg2: provider.familyArg2,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'fetchUser4Provider';
}

abstract class _$FetchUser4 extends BuildlessAsyncNotifier<int> {
  late final int familyArg1;
  late final int familyArg2;

  FutureOr<int> build({
    required int familyArg1,
    required int familyArg2,
  });
}
