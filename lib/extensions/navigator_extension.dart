import 'package:flutter/material.dart';

extension NavigatorExtension on GlobalKey<NavigatorState> {
  Future<T?>? push<T extends Object?>(Route<T> route) {
    return currentState?.push(route);
  }

  /// 全ての画面をRemoveする場合は
  /// [predicate]を`(route) => false`と指定する
  Future<T?>? pushAndRemoveUntil<T extends Object?>(
    Route<T> newRoute,
    RoutePredicate predicate,
  ) async {
    return currentState?.pushAndRemoveUntil(newRoute, predicate);
  }

  Future<T?>? pushReplacement<T extends Object?, TO extends Object?>(
    Route<T> newRoute, {
    TO? result,
  }) async {
    return currentState?.pushReplacement(newRoute);
  }

  void pop<T extends Object?>([T? result]) {
    currentState?.pop();
  }
}
