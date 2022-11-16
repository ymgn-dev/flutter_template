import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'hello_world.g.dart';

// Generate Provider
@Riverpod(keepAlive: false)
int helloWorld(HelloWorldRef ref) {
  return 0;
}
