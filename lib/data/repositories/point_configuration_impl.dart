import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:o2o_point_configuration/data/models/point_configuration_model.dart';
import 'package:o2o_point_configuration/domain/entities/point_configuration.dart';
import 'package:o2o_point_configuration/domain/repositories/point_configuration_repository.dart';

class PointConfigurationRepositoryImpl implements PointConfigurationRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference _pointConfigurationsCollection;

  PointConfigurationRepositoryImpl(String collectionPath)
      : _pointConfigurationsCollection = FirebaseFirestore.instance.collection(collectionPath);



  @override
  Future<void> addOrUpdatePointConfiguration(
      PointConfigurationModel pointConfiguration) async {
    await _pointConfigurationsCollection
        .doc("point")
        .set(pointConfiguration.toJson());
    //local db
    //api
  }

  @override
  Future<PointConfigurationModel?> getPointConfiguration(String type) async {
    final snapshot = await _pointConfigurationsCollection.doc(type).get() ;
    if (snapshot.exists) {
      return PointConfigurationModel.fromJson(snapshot.data()! as Map<String, dynamic>);
    } else {
      return null;
    }
  }

  @override
  Stream<PointConfigurationModel?> getPointConfigurationStream(String documentId) {
    print("30-getPointConfigurationStream");
    return _pointConfigurationsCollection
        .doc(documentId)
        .snapshots()
        .map((snapshot) => snapshot.data() != null ? PointConfigurationModel.fromSnapshot(snapshot) : null);
  }

  @override
  Future<void> deletePointConfiguration(String type) async {
    await _pointConfigurationsCollection.doc(type).delete();
  }
}
