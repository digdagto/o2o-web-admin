// point_setting.dart
class PointConfiguration {
  final String type;
  final int expiration_year;
  final int earnings_rate;
  final bool useYn;
  final double lowerLimit;
  final double upperLimit;
  final int maxUse;
  final int minUse;

  PointConfiguration({
    required this.type,
    required this.expiration_year,
    required this.earnings_rate,
    required this.useYn,
    required this.lowerLimit,
    required this.upperLimit,
    required this.maxUse,
    required this.minUse,
  });
}