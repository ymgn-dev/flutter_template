// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'async_counter.dart';

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

String $AsyncCounterHash() => r'cc81f1a3efc63508103b4fbd6f4a87f474491d6c';

/// Generate AsyncNotifierProvider
///
/// Copied from [AsyncCounter].
class AsyncCounterProvider
    extends AutoDisposeAsyncNotifierProviderImpl<AsyncCounter, int> {
  AsyncCounterProvider(
    this.familyArg,
  ) : super(
          () => AsyncCounter()..familyArg = familyArg,
          from: asyncCounterProvider,
          name: r'asyncCounterProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : $AsyncCounterHash,
        );

  final int familyArg;

  @override
  bool operator ==(Object other) {
    return other is AsyncCounterProvider && other.familyArg == familyArg;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, familyArg.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  FutureOr<int> runNotifierBuild(
    covariant _$AsyncCounter notifier,
  ) {
    return notifier.build(
      familyArg,
    );
  }
}

typedef AsyncCounterRef = AutoDisposeAsyncNotifierProviderRef<int>;

/// Generate AsyncNotifierProvider
///
/// Copied from [AsyncCounter].
final asyncCounterProvider = AsyncCounterFamily();

class AsyncCounterFamily extends Family<AsyncValue<int>> {
  AsyncCounterFamily();

  AsyncCounterProvider call(
    int familyArg,
  ) {
    return AsyncCounterProvider(
      familyArg,
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderImpl<AsyncCounter, int> getProviderOverride(
    covariant AsyncCounterProvider provider,
  ) {
    return call(
      provider.familyArg,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'asyncCounterProvider';
}

abstract class _$AsyncCounter extends BuildlessAutoDisposeAsyncNotifier<int> {
  late final int familyArg;

  FutureOr<int> build(
    int familyArg,
  );
}

String $AsyncNHash() => r'db24e6fb4727f794bc39fd3e0e023b1ba95e3056';

/// See also [AsyncN].
class AsyncNProvider extends AutoDisposeAsyncNotifierProviderImpl<AsyncN, int> {
  AsyncNProvider(
    this.familyArg,
  ) : super(
          () => AsyncN()..familyArg = familyArg,
          from: asyncNProvider,
          name: r'asyncNProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : $AsyncNHash,
        );

  final int familyArg;

  @override
  bool operator ==(Object other) {
    return other is AsyncNProvider && other.familyArg == familyArg;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, familyArg.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  FutureOr<int> runNotifierBuild(
    covariant _$AsyncN notifier,
  ) {
    return notifier.build(
      familyArg,
    );
  }
}

typedef AsyncNRef = AutoDisposeAsyncNotifierProviderRef<int>;

/// See also [AsyncN].
final asyncNProvider = AsyncNFamily();

class AsyncNFamily extends Family<AsyncValue<int>> {
  AsyncNFamily();

  AsyncNProvider call(
    int familyArg,
  ) {
    return AsyncNProvider(
      familyArg,
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderImpl<AsyncN, int> getProviderOverride(
    covariant AsyncNProvider provider,
  ) {
    return call(
      provider.familyArg,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'asyncNProvider';
}

abstract class _$AsyncN extends BuildlessAutoDisposeAsyncNotifier<int> {
  late final int familyArg;

  FutureOr<int> build(
    int familyArg,
  );
}
