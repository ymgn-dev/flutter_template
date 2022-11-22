import 'package:flutter/material.dart';

extension StringExtension on String {
  bool get isUrl => RegExp(r'https?://[a-zA-Z0-9\-%_/=&?.]+').hasMatch(this);

  bool get isKatakana => RegExp(r'[\u30A1-\u30FC]+').hasMatch(this);
  bool get isHiragana => RegExp(r'[\u3040-\u309F]+').hasMatch(this);
  bool get isKanji => RegExp(r'[\u4E00-\u9FFF]+').hasMatch(this);

  bool get isHalfWidth =>
      RegExp(r'[a-zA-Z0-9!@#$%^&*(),.?":{}|<>\[\]\-_=+~`\\;/]+').hasMatch(this);

  String toKatakana() => replaceAllMapped(
        RegExp('[ぁ-ゔ]'),
        (Match m) => String.fromCharCode(m.group(0)!.codeUnitAt(0) + 0x60),
      );

  String toHiragana() => replaceAllMapped(
        RegExp('[ァ-ヴ]'),
        (Match m) => String.fromCharCode(m.group(0)!.codeUnitAt(0) - 0x60),
      );

  Color toColor() {
    final buffer = StringBuffer();
    if (length == 6 || length == 7) {
      buffer.write('ff');
    }
    buffer.write(replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
