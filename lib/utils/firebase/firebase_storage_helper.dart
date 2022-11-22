import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_template/utils/firebase/firebase_helper.dart';

export 'dart:io';

export 'package:flutter/foundation.dart';
export 'package:flutter_template/utils/firebase/firebase_helper.dart';

class FirebaseStorageHelper {
  FirebaseStorageHelper._();

  static FirebaseStorageHelper get instance => _instance;
  static final _instance = FirebaseStorageHelper._();

  static final _reference = FirebaseStorage.instance.ref();

  Future<void> upload<T extends Object>({
    required String path,
    required T data,
    SettableMetadata? metadata,
  }) async {
    if (data is String) {
      await _reference.child(path).putString(data, metadata: metadata);
    } else if (data is File) {
      await _reference.child(path).putFile(data, metadata);
    } else if (data is Uint8List) {
      await _reference.child(path).putData(data, metadata);
    } else {
      throw Exception('Not supported this type ${data.runtimeType}');
    }
  }

  Future<void> updateMetadata({
    required String path,
    required SettableMetadata metadata,
  }) async {
    await _reference.child(path).updateMetadata(metadata);
  }

  Future<FullMetadata> getMetadata({
    required String path,
  }) async {
    return _reference.child(path).getMetadata();
  }

  Future<String> getDownloadUrl({required String path}) async {
    return _reference.child(path).getDownloadURL();
  }

  /// https://firebase.google.com/docs/storage/flutter/download-files#download_in_memory
  Future<Uint8List?> getData({
    required String path,
    int maxByte = 1024 * 1024,
  }) async {
    return _reference.child(path).getData(maxByte);
  }

  Future<void> delete({
    required String path,
  }) async {
    await _reference.child(path).delete();
  }
}
