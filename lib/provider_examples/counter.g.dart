// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter.dart';

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

String $CounterHash() => r'0dd6190a675942f35f310db98f285e68deaca936';

/// Generate NotifierProvider
///
/// Copied from [Counter].
class CounterProvider extends AutoDisposeNotifierProviderImpl<Counter, int> {
  CounterProvider(
    this.familyArg,
  ) : super(
          () => Counter()..familyArg = familyArg,
          from: counterProvider,
          name: r'counterProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : $CounterHash,
        );

  final int familyArg;

  @override
  bool operator ==(Object other) {
    return other is CounterProvider && other.familyArg == familyArg;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, familyArg.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  int runNotifierBuild(
    covariant _$Counter notifier,
  ) {
    return notifier.build(
      familyArg,
    );
  }
}

typedef CounterRef = AutoDisposeNotifierProviderRef<int>;

/// Generate NotifierProvider
///
/// Copied from [Counter].
final counterProvider = CounterFamily();

class CounterFamily extends Family<int> {
  CounterFamily();

  CounterProvider call(
    int familyArg,
  ) {
    return CounterProvider(
      familyArg,
    );
  }

  @override
  AutoDisposeNotifierProviderImpl<Counter, int> getProviderOverride(
    covariant CounterProvider provider,
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
  String? get name => r'counterProvider';
}

abstract class _$Counter extends BuildlessAutoDisposeNotifier<int> {
  late final int familyArg;

  int build(
    int familyArg,
  );
}
