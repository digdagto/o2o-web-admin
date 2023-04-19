
import 'package:o2o_point_configuration/domain/entities/member.dart';

class MemberModel extends Member {
  MemberModel({
    required String name,
    required String phone,
    required DateTime registeredDate,
    required int visitCount,
    required int point,
  }) : super(
    name: name,
    phone: phone,
    registeredDate: registeredDate,
    visitCount: visitCount,
    point: point,
  );

  factory MemberModel.fromJson(Map<String, dynamic> json) {
    return MemberModel(
      name: json['name'],
      phone: json['phone'],
      registeredDate: DateTime.parse(json['registeredDate']),
      visitCount: json['visitCount'],
      point: json['point'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone': phone,
      'registeredDate': registeredDate.toIso8601String(),
      'visitCount': visitCount,
      'point': point,
    };
  }
}