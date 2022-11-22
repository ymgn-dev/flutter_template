import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/utils/logger.dart';
import 'package:flutter_template/utils/navigator_key.dart';
import 'package:flutter_template/utils/scaffold_messenger_key.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class _ProviderLogger extends ProviderObserver {
  @override
  void didAddProvider(
    ProviderBase provider,
    Object? value,
    ProviderContainer container,
  ) {
    if (kDebugMode) {
      logger.info('Added Riverpod: ${provider.name ?? provider.runtimeType}');
      logger.info('value: $value');
    }
  }

  @override
  void didUpdateProvider(
    ProviderBase provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    if (kDebugMode) {
      logger.info('Updated Riverpod: ${provider.name ?? provider.runtimeType}');
      logger.info('newValue: $newValue');
    }
  }

  @override
  void didDisposeProvider(
    ProviderBase provider,
    ProviderContainer container,
  ) {
    if (kDebugMode) {
      logger.info(
        'Disposed Riverpod: ${provider.name ?? provider.runtimeType}',
      );
    }
  }
}

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
    observers: [_ProviderLogger()],
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
    return MaterialApp(
      navigatorKey: navigatorKey,
      scaffoldMessengerKey: scaffoldMessengerKey,
      home: Scaffold(
        appBar: AppBar(title: const Text('Example')),
        body: const Center(
          child: Text('helloWorld'),
        ),
      ),
    );
  }
}
