import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'point_state.dart';

class PointCubit extends Cubit<PointState> {
  PointCubit() : super(PointState.initial());

  void pointUseChange() {
    emit(state.copyWith(pointUse: !state.pointUse));
  }

  void pointPeriodChange(int periodRadioData) {
    emit(state.copyWith(period: periodRadioData));
  }
}
