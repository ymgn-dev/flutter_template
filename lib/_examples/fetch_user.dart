import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'fetch_user.g.dart';

@Riverpod(keepAlive: false)
class FetchUser extends _$FetchUser {
  @override
  FutureOr<int> build({
    required int familyArg1,
    required int familyArg2,
  }) async {
    return 0;
  }
}

@Riverpod(keepAlive: false)
class FetchUser2 extends _$FetchUser2 {
  @override
  FutureOr<int> build() async {
    return 0;
  }
}

@Riverpod(keepAlive: true)
class FetchUser3 extends _$FetchUser3 {
  @override
  FutureOr<int> build() async {
    return 0;
  }
}

@Riverpod(keepAlive: true)
class FetchUser4 extends _$FetchUser4 {
  @override
  FutureOr<int> build({
    required int familyArg1,
    required int familyArg2,
  }) async {
    return 0;
  }
}
