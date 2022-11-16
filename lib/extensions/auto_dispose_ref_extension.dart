import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';

// NOTE: https://github.com/rrousselGit/riverpod/issues/1664#issuecomment-1257177901
extension AutoDisposeRefCache on AutoDisposeRef {
  // keeps the provider alive for [duration] since when it was first created
  // (even if all the listeners are removed before then)
  void cacheFor(Duration duration) {
    final link = keepAlive();
    final timer = Timer(duration, () => link.close());
    onDispose(() => timer.cancel());
  }
}
