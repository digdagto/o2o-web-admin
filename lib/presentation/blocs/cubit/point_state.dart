part of 'point_cubit.dart';

class PointState extends Equatable {
  final bool pointUse;
  final int period;

  const PointState({
    required this.pointUse,
    required this.period,
  });

  factory PointState.initial() {
    return const PointState(period: 4, pointUse: false);
  }

  @override
  List<Object> get props => [pointUse, period];

  @override
  String toString() => 'PointState(pointUse: $pointUse, period: $period)';

  PointState copyWith({
    bool? pointUse,
    int? period,
  }) {
    return PointState(
      pointUse: pointUse ?? this.pointUse,
      period: period ?? this.period,
    );
  }
}
