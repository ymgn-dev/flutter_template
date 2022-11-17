import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'hello_world.g.dart';

// Generate Provider
@Riverpod(keepAlive: true)
String helloWorld(HelloWorldRef ref) {
  return "Hello, world";
}
