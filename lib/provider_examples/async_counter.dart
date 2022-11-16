import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'async_counter.g.dart';

/// Generate AsyncNotifierProvider
@Riverpod(keepAlive: false)
class AsyncCounter extends _$AsyncCounter {
  final _waitTime = const Duration(milliseconds: 500);

  @override
  FutureOr<int> build() async {
    return Future.delayed(_waitTime, () async {
      return 0;
    });
  }

  Future<void> tryIncrement() async {
    state = const AsyncLoading();

    try {
      state = AsyncData(state.requireValue + 1);
    } on Exception catch (e, s) {
      state = AsyncError(e, s);
    }
  }
}
