import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:o2o_point_configuration/domain/entities/point_configuration.dart';

class PointConfigurationModel extends PointConfiguration {
  PointConfigurationModel({
    required String type,
    required int expiration_year,
    required int earnings_rate,
    required bool useYn,
    required double lower_limit,
    required double upper_limit,
    required int maxUse,
    required int minUse,
  }) : super(
          type: type,
          expiration_year: expiration_year,
          earnings_rate: earnings_rate,
          useYn: useYn,
          lowerLimit: lower_limit,
          upperLimit: upper_limit,
          maxUse: maxUse,
          minUse: minUse,
        );

  factory PointConfigurationModel.fromJson(Map<String, dynamic> json) {
    return PointConfigurationModel(
      type: json['type'],
      expiration_year: json['expiration_year'],
      earnings_rate: json['earnings_rate'],
      useYn: json['use'],
      lower_limit: json['min_earnings_amount'].toDouble(),
      upper_limit: json['max_earnings_amount'].toDouble(),
      maxUse: json['max_usable_point'],
      minUse: json['min_usable_point'],
    );
  }
  PointConfigurationModel.initial()
      : super(
    type: 'point',
    expiration_year: 3,
    earnings_rate: 0,
    useYn: true,
    lowerLimit: 0.0,
    upperLimit: 0.0,
    maxUse: 0,
    minUse: 0,
  );

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'expiration_year': expiration_year,
      'earnings_rate': earnings_rate,
      'use': useYn,
      'min_earnings_amount': lowerLimit, //결제 금액
      'max_earnings_amount': upperLimit, //결제 금액
      'max_usable_point': maxUse,
      'min_usable_point': minUse,
    };
  }

  factory PointConfigurationModel.fromSnapshot(DocumentSnapshot? snapshot) {
    Map<String, dynamic> data = snapshot?.data() as Map<String, dynamic>;
    return PointConfigurationModel(
      type: snapshot?.id ?? "point",
      expiration_year: data['expiration_year'] ?? 3,
      earnings_rate: data['earnings_rate'] ?? 0,
      useYn: data['use'] ?? true,
      lower_limit: data['min_earnings_amount']?.toDouble() ?? 0.0,
      upper_limit: data['max_earnings_amount']?.toDouble() ?? 0.0,
      maxUse: data['max_usable_point'] ?? 0,
      minUse: data['min_usable_point'] ?? 0,
    );
  }

  PointConfigurationModel copyWith({
    String? type,
    int? expiration_year,
    int? earnings_rate,
    bool? useYn,
    double? lower_limit,
    double? upper_limit,
    int? maxUse,
    int? minUse,
  }) {
    return PointConfigurationModel(
      type: type ?? this.type,
      expiration_year: expiration_year ?? this.expiration_year,
      earnings_rate: earnings_rate ?? this.earnings_rate,
      useYn: useYn ?? this.useYn,
      lower_limit: lower_limit ?? this.lowerLimit,
      upper_limit: upper_limit ?? this.upperLimit,
      maxUse: maxUse ?? this.maxUse,
      minUse: minUse ?? this.minUse,
    );
  }
}
