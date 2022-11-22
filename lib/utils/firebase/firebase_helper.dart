import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

export 'package:cloud_firestore/cloud_firestore.dart';
export 'package:cloud_functions/cloud_functions.dart';
export 'package:firebase_auth/firebase_auth.dart';
export 'package:firebase_storage/firebase_storage.dart';

class FirebaseHelper {
  FirebaseHelper._();

  static FirebaseHelper get instance => _instance;
  static final _instance = FirebaseHelper._();

  Future<void> setupEmulator({
    String localhost = 'localhost',
    int functionsPort = 5001,
    int firestorePort = 8080,
    int authPort = 9099,
    int storagePort = 9199,
  }) async {
    FirebaseFunctions.instance.useFunctionsEmulator(localhost, functionsPort);
    FirebaseFirestore.instance.useFirestoreEmulator(localhost, firestorePort);

    await Future.wait(
      [
        FirebaseAuth.instance.useAuthEmulator(localhost, authPort),
        FirebaseStorage.instance.useStorageEmulator(localhost, storagePort),
      ],
    );
  }
}
