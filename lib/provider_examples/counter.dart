import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'counter.g.dart';

/// Generate NotifierProvider
@Riverpod(keepAlive: false)
class CounterNotifier extends _$CounterNotifier {
  @override
  int build() => 0;

  increment() {
    state = state + 1;
  }
}
