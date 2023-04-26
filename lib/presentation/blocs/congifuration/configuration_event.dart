import 'package:equatable/equatable.dart';

abstract class ConfigurationEvent extends Equatable {
  const ConfigurationEvent();

  @override
  List<Object> get props => [];
}

class LoadInitialValues extends ConfigurationEvent {}

class UpdateDuration extends ConfigurationEvent {
  final int newDuration;

  UpdateDuration({required this.newDuration});

  @override
  List<Object> get props => [newDuration];
}


