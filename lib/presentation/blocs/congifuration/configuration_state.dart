import 'package:equatable/equatable.dart';
import 'package:o2o_point_configuration/data/models/point_configuration_model.dart';

class ConfigurationState extends Equatable {
  final PointConfigurationModel pointConfiguration;
  final bool isLoading;

  ConfigurationState({
    required this.pointConfiguration,
    required this.isLoading,
  });

  ConfigurationState copyWith({
    PointConfigurationModel? pointConfiguration,
    bool? isLoading,
  }) {
    return ConfigurationState(
      pointConfiguration: pointConfiguration ?? this.pointConfiguration,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object> get props => [pointConfiguration, isLoading];
}