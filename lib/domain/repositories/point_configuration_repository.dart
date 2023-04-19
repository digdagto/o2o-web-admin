// point_configuration_repository.dart
import 'package:o2o_point_configuration/data/models/point_configuration_model.dart';
import 'package:o2o_point_configuration/domain/entities/point_configuration.dart';

abstract class PointConfigurationRepository {
  Future<void> addOrUpdatePointConfiguration(PointConfigurationModel pointConfiguration);
  Future<PointConfigurationModel?> getPointConfiguration(String type);
  Future<void> deletePointConfiguration(String type);
  Stream<PointConfigurationModel?> getPointConfigurationStream(String documentId);
}
