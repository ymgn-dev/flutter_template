import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  bool get isDark => MediaQuery.of(this).platformBrightness == Brightness.dark;

  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;

  bool get isAndroid => Theme.of(this).platform == TargetPlatform.android;
  bool get isIOS => Theme.of(this).platform == TargetPlatform.iOS;

  double get appBarHeight => MediaQuery.of(this).padding.top + kToolbarHeight;

  ScrollPhysics get scrollPhysics =>
      isAndroid ? const ClampingScrollPhysics() : const BouncingScrollPhysics();

  void hideKeyboard() {
    // https://github.com/flutter/flutter/issues/54277#issuecomment-640998757
    final currentScope = FocusScope.of(this);
    if (!currentScope.hasPrimaryFocus && currentScope.hasFocus) {
      FocusManager.instance.primaryFocus!.unfocus();
    }
  }
}
