import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:o2o_point_configuration/data/models/point_configuration_model.dart';
import 'package:o2o_point_configuration/data/repositories/point_configuration_impl.dart';

import 'configuration_event.dart';
import 'configuration_state.dart';

class ConfigurationBloc extends Bloc<ConfigurationEvent, ConfigurationState> {
  final PointConfigurationRepositoryImpl pointConfigRepo;

  ConfigurationBloc({required this.pointConfigRepo})
      : super(ConfigurationState(pointConfiguration: PointConfigurationModel.initial(), isLoading: true));

  @override
  Stream<ConfigurationState> mapEventToState(ConfigurationEvent event) async* {
    if (event is LoadInitialValues) {
      yield* _mapLoadInitialValuesToState(event);
    } else if (event is UpdateDuration) {
      yield* _mapUpdateDurationToState(event);
    }
    // ... handle other events similarly
  }

  Stream<ConfigurationState> _mapLoadInitialValuesToState(LoadInitialValues event) async* {
    yield state.copyWith(isLoading: true);
    final pointConfiguration = await pointConfigRepo.getPointConfiguration('point');
    yield state.copyWith(pointConfiguration: pointConfiguration, isLoading: false);
  }

  Stream<ConfigurationState> _mapUpdateDurationToState(UpdateDuration event) async* {
    final updatedPointConfiguration = state.pointConfiguration.copyWith(expiration_year: event.newDuration);
    yield state.copyWith(pointConfiguration: updatedPointConfiguration);
  }

// ... handle other events similarly
}