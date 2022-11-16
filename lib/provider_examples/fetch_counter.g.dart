// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_counter.dart';

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

String $fetchCounterHash() => r'5857b0af5ea5f773d4e29e023424b9bf873316c8';

/// Generate FutureProvider
///
/// Copied from [fetchCounter].
class FetchCounterProvider extends AutoDisposeFutureProvider<int> {
  FetchCounterProvider({
    required this.arg1,
    required this.arg2,
  }) : super(
          (ref) => fetchCounter(
            ref,
            arg1: arg1,
            arg2: arg2,
          ),
          from: fetchCounterProvider,
          name: r'fetchCounterProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : $fetchCounterHash,
        );

  final int arg1;
  final bool arg2;

  @override
  bool operator ==(Object other) {
    return other is FetchCounterProvider &&
        other.arg1 == arg1 &&
        other.arg2 == arg2;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, arg1.hashCode);
    hash = _SystemHash.combine(hash, arg2.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef FetchCounterRef = AutoDisposeFutureProviderRef<int>;

/// Generate FutureProvider
///
/// Copied from [fetchCounter].
final fetchCounterProvider = FetchCounterFamily();

class FetchCounterFamily extends Family<AsyncValue<int>> {
  FetchCounterFamily();

  FetchCounterProvider call({
    required int arg1,
    required bool arg2,
  }) {
    return FetchCounterProvider(
      arg1: arg1,
      arg2: arg2,
    );
  }

  @override
  AutoDisposeFutureProvider<int> getProviderOverride(
    covariant FetchCounterProvider provider,
  ) {
    return call(
      arg1: provider.arg1,
      arg2: provider.arg2,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'fetchCounterProvider';
}
