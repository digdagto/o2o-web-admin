import 'package:cloud_firestore/cloud_firestore.dart';

abstract class FirestoreService {
  Future<List<Map<String, dynamic>>> getDocuments(String collectionPath);
  Future<DocumentReference> addDocument(String collectionPath, Map<String, dynamic> data);
  Future<void> setDocument(String documentPath, Map<String, dynamic> data);
  Future<void> deleteDocument(String documentPath);
}

