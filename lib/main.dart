import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/_examples/counter.dart';
import 'package:flutter_template/utils/logger.dart';
import 'package:flutter_template/utils/navigator_key.dart';
import 'package:flutter_template/utils/scaffold_messenger_key.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

Future<void> main() async {
  if (kDebugMode) {
    logger.enableOutputStackTrace = true;
  }

  await Future.wait([
    // ...
  ]);

  final container = ProviderContainer(
    overrides: [
      // ...
    ],
  );

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const App(),
    ),
  );
}

class App extends HookConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(counterProvider(0));

    return MaterialApp(
      navigatorKey: navigatorKey,
      scaffoldMessengerKey: scaffoldMessengerKey,
      home: Scaffold(
        appBar: AppBar(title: const Text('Example')),
        body: const Center(
          child: Text("Hello, world!"),
        ),
      ),
    );
  }
}
