import 'package:flutter_template/provider_examples/hello_world.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'counter.g.dart';

/// Generate NotifierProvider
@Riverpod(keepAlive: false)
class Counter extends _$Counter {
  @override
  int build(int familyArg) {
    ref.watch(helloWorldProvider);

    return 0;
  }

  increment() {
    state = state + 1;
  }
}
