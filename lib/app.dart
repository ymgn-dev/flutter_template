import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  App() : super();

  final analytics = FirebaseAnalytics();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const _Init(),
      navigatorObservers: [
        FirebaseAnalyticsObserver(analytics: analytics),
      ],
    );
  }
}

class _Init extends StatelessWidget {
  const _Init() : super();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _init(context: context),
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SecandarySplash();
        }

        // TODO(ymgn9314): implement
        return const Scaffold(body: Center(child: Text('Main page')));
      },
    );
  }
}

Future<void> _init({required BuildContext context}) async {
  await Future<void>.delayed(const Duration(seconds: 1));
}

// https://pub.dev/packages/flutter_native_splash
class SecandarySplash extends StatelessWidget {
  const SecandarySplash() : super();

  // TODO(ymgn9314): implement
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.green,
      body: Center(child: Text('SecondarySplash')),
    );
  }
}
