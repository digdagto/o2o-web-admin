import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:o2o_point_configuration/data/models/point_configuration_model.dart';
import 'package:o2o_point_configuration/domain/services/firebase_service.dart';

class FirestoreServiceImpl implements FirestoreService {
  final FirebaseFirestore _firestore;

  FirestoreServiceImpl({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  @override
  Future<List<Map<String, dynamic>>> getDocuments(String collectionPath) async {
    print("collectionPath: $collectionPath");
    try {
      final collection = _firestore.collection(collectionPath);
      final documents = await collection.get(GetOptions());
      for (var doc in documents.docs) {
        print(doc.data());
      }

      // final documents = await collection.get(GetOptions());
      return documents.docs.map((doc) => doc.data()).toList();
    } catch (error) {
      print('Error while getting documents: $error');
      return []; // return an empty list in case of an error
    }
  }



  @override
  Future<DocumentReference> addDocument(
      String collectionPath, Map<String, dynamic> data) async {
    try {
      final collection = _firestore.collection(collectionPath);
      return await collection.add(data);
    } catch (error) {
      print('Error while adding document: $error');
      throw Exception('Error while adding document: $error');
    }
  }
  @override
  Future<void> setDocument(String documentPath, Map<String, dynamic> data) async {
    try {
      final document = _firestore.doc(documentPath);
      await document.set(data);
    } catch (error) {
      print('Error while setting document: $error');
    }
  }

  @override
  Future<void> deleteDocument(String documentPath) async {
    try {
      final document = _firestore.doc(documentPath);
      await document.delete();
    } catch (error) {
      print('Error while deleting document: $error');
    }
  }
}
