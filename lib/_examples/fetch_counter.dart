import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'fetch_counter.g.dart';

/// Generate FutureProvider
@Riverpod(keepAlive: false)
Future<int> fetchCounter(FetchCounterRef ref,
    {required int arg1, required bool arg2}) async {
  return 0;
}
