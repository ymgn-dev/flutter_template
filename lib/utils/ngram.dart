import 'package:flutter/foundation.dart';

class Ngram {
  Ngram._();

  static Set<String> _exec(Map<String, dynamic> value) {
    final data = value['data'] as String;
    final n = value['n'] as int;

    final result = <String>{};
    for (var i = 0; i < data.length; i++) {
      if (n > data.length - i) {
        break;
      }
      final str = data.substring(i, i + n);
      result.add(str);
    }

    return result;
  }

  static Future<Set<String>> parse(String data, {int n = 2}) async {
    return compute(_exec, <String, dynamic>{'data': data, 'n': n});
  }

  static Set<String> parseSync(String data, {int n = 2}) {
    return _exec(<String, dynamic>{'data': data, 'n': n});
  }
}
