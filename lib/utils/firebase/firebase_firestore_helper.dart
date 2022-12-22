import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

export 'dart:async';

export 'package:cloud_firestore/cloud_firestore.dart';

typedef JsonMap = Map<String, dynamic>;

class Document<T> {
  Document({
    required this.id,
    required this.reference,
    required this.data,
    required this.metadata,
  });

  final String id;
  final DocumentReference<JsonMap> reference;
  final T data;
  final SnapshotMetadata metadata;
}

class FirebaseFirestoreHelper {
  FirebaseFirestoreHelper._();

  static FirebaseFirestoreHelper get instance => _instance;
  static final _instance = FirebaseFirestoreHelper._();

  static final _db = FirebaseFirestore.instance;

  DocumentReference<JsonMap> documentReference({
    required String documentPath,
  }) {
    return _db.doc(documentPath);
  }

  Future<Document<T>> get<T extends Object>({
    required String documentPath,
    required T Function(Map<String, dynamic> json) decode,
    GetOptions? getOptions,
  }) async {
    final snapshot = await _db
        .doc(documentPath)
        .withConverter(
          fromFirestore: (snapshot, options) {
            return decode(snapshot.data()!);
          },
          toFirestore: (_, __) => {},
        )
        .get(getOptions);

    if (!snapshot.exists) {
      throw Exception('The document did not exist.');
    }

    return Document(
      id: snapshot.id,
      reference: documentReference(documentPath: documentPath),
      data: snapshot.data()!,
      metadata: snapshot.metadata,
    );
  }

  Stream<Document<T>> notifyDocumentUpdates<T extends Object>({
    required String documentPath,
    required T Function(Map<String, dynamic> json) decode,
    bool includeMetadataChanges = false,
  }) {
    return _db
        .doc(documentPath)
        .withConverter(
          fromFirestore: (snapshot, options) {
            return decode(snapshot.data()!);
          },
          toFirestore: (_, __) => {},
        )
        .snapshots(includeMetadataChanges: includeMetadataChanges)
        .asyncMap(
          (snapshot) => Document(
            id: snapshot.id,
            reference: documentReference(documentPath: documentPath),
            data: snapshot.data()!,
            metadata: snapshot.metadata,
          ),
        );
  }

  Stream<List<Document<T>>> notifyCollectionUpdates<T extends Object>({
    required String collectionPath,
    required T Function(Map<String, dynamic> json) decode,
    Query<T> Function(CollectionReference<T> reference)? queryBuilder,
    bool includeMetadataChanges = false,
  }) {
    final reference = _db.collection(collectionPath).withConverter(
          fromFirestore: (snapshot, options) => decode(snapshot.data()!),
          toFirestore: (_, __) => {},
        );

    final query = queryBuilder?.call(reference) ?? reference;

    return query
        .snapshots(includeMetadataChanges: includeMetadataChanges)
        .asyncMap(
          (querySnapshot) => querySnapshot.docs
              .map(
                (snapshot) => Document(
                  id: snapshot.id,
                  reference: documentReference(
                    documentPath: snapshot.reference.path,
                  ),
                  data: snapshot.data(),
                  metadata: snapshot.metadata,
                ),
              )
              .toList(),
        );
  }

  Future<List<Document<T>>> list<T extends Object>({
    required String collectionPath,
    required T Function(Map<String, dynamic> json) decode,
    Query<T> Function(CollectionReference<T> reference)? queryBuilder,
    GetOptions? getOptions,
  }) async {
    final reference = _db.collection(collectionPath).withConverter(
          fromFirestore: (snapshot, options) => decode(snapshot.data()!),
          toFirestore: (_, __) => {},
        );

    final query = queryBuilder?.call(reference) ?? reference;

    final snapshot = await query.get(getOptions);

    return snapshot.docs
        .map(
          (e) => Document(
            id: e.id,
            reference: documentReference(documentPath: e.id),
            data: e.data(),
            metadata: e.metadata,
          ),
        )
        .toList();
  }

  PaginationBuilder<T> paginationBuilder<T>({
    required String collectionPath,
    required T Function(Map<String, dynamic> json) decode,
    Query<T> Function(CollectionReference<T> reference)? queryBuilder,
  }) {
    return PaginationBuilder<T>(
      collectionPath: collectionPath,
      decode: decode,
      queryBuilder: queryBuilder,
    );
  }

  Future<List<Document<T>>> collectionGroup<T extends Object>({
    required String collectionPath,
    required T Function(Map<String, dynamic> json) decode,
    Query<T> Function(Query<T> query)? queryBuilder,
    GetOptions? getOptions,
  }) async {
    final reference = _db.collectionGroup(collectionPath).withConverter(
          fromFirestore: (snapshot, options) => decode(snapshot.data()!),
          toFirestore: (_, __) => {},
        );

    final query = queryBuilder?.call(reference) ?? reference;

    final snapshot = await query.get(getOptions);

    return snapshot.docs
        .map(
          (e) => Document(
            id: e.id,
            reference: documentReference(documentPath: e.id),
            data: e.data(),
            metadata: e.metadata,
          ),
        )
        .toList();
  }

  Future<void> set({
    required String documentPath,
    required Map<String, dynamic> data,
    SetOptions? setOptions,
  }) async {
    await _db.doc(documentPath).set(data, setOptions);
  }

  Future<void> add({
    required String collectionPath,
    required Map<String, dynamic> data,
  }) async {
    await _db.collection(collectionPath).add(data);
  }

  Future<void> transaction<T>({
    required Future<T> Function(Transaction transaction) transactionHandler,
    Duration timeout = const Duration(seconds: 30),
    int maxAttempts = 5,
  }) async {
    await _db.runTransaction<T>(
      transactionHandler,
      timeout: timeout,
      maxAttempts: maxAttempts,
    );
  }

  Future<void> batch({
    /// writeBatch.commit();を必ず呼ぶこと
    required FutureOr<void> Function(WriteBatch writeBatch) batchHandler,
  }) async {
    final writeBatch = _db.batch();
    await batchHandler(writeBatch);
  }

  Future<int> count<T extends Object>({
    required String collectionPath,
    required T Function(Map<String, dynamic> json) decode,
    Query<T> Function(CollectionReference<T> reference)? queryBuilder,
  }) async {
    final reference = _db.collection(collectionPath).withConverter(
          fromFirestore: (snapshot, options) => decode(snapshot.data()!),
          toFirestore: (_, __) => {},
        );

    final query = queryBuilder?.call(reference) ?? reference;

    final snapshot = await query.count().get();

    return snapshot.count;
  }

  Future<void> delete({
    required String documentPath,
  }) async {
    await _db.doc(documentPath).delete();
  }
}

class PaginationBuilder<T> {
  PaginationBuilder({
    required String collectionPath,
    required T Function(Map<String, dynamic> json) decode,
    Query<T> Function(CollectionReference<T> reference)? queryBuilder,
  })  : _collectionPath = collectionPath,
        _decode = decode,
        _queryBuilder = queryBuilder;

  final String _collectionPath;
  final T Function(Map<String, dynamic> json) _decode;
  final Query<T> Function(CollectionReference<T> reference)? _queryBuilder;

  static final _db = FirebaseFirestore.instance;

  final _helper = FirebaseFirestoreHelper.instance;

  QueryDocumentSnapshot<T>? _lastDocument;

  Future<List<Document<T>>> get({GetOptions? getOptions}) async {
    final reference = _db.collection(_collectionPath).withConverter(
          fromFirestore: (snapshot, options) => _decode(snapshot.data()!),
          toFirestore: (_, __) => {},
        );

    final query = _queryBuilder?.call(reference) ?? reference;

    final snapshot = await query.get(getOptions);

    _lastDocument = snapshot.docs.isEmpty ? null : snapshot.docs.last;

    return snapshot.docs
        .map(
          (e) => Document(
            id: e.id,
            reference: _helper.documentReference(documentPath: e.id),
            data: e.data(),
            metadata: e.metadata,
          ),
        )
        .toList();
  }

  // TODO(ymgn9314): getAfterに命名を変更する？
  Future<List<Document<T>>> getMore({GetOptions? getOptions}) async {
    if (_lastDocument == null) {
      return get();
    }

    final reference = _db.collection(_collectionPath).withConverter(
          fromFirestore: (snapshot, options) => _decode(snapshot.data()!),
          toFirestore: (_, __) => {},
        );

    final query = _queryBuilder?.call(reference) ?? reference;

    final snapshot = await query.startAfter([_lastDocument]).get(getOptions);

    if (snapshot.docs.isNotEmpty) {
      _lastDocument = snapshot.docs.last;
    }

    return snapshot.docs
        .map(
          (e) => Document(
            id: e.id,
            reference: _helper.documentReference(documentPath: e.id),
            data: e.data(),
            metadata: e.metadata,
          ),
        )
        .toList();
  }

  // TODO(ymgn9314): getBeforeを実装する
  // _lastDocumentよりも前のドキュメントを取得
}
