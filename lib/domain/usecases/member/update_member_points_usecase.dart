// update_member_points_usecase.dart
import 'package:o2o_point_configuration/domain/repositories/member_repository.dart';

class UpdateMemberPointsUseCase {
  final MemberRepository repository;

  UpdateMemberPointsUseCase({required this.repository});

  Future<void> call(String name, String phone, int points) =>
      repository.updateMemberPoints(name, phone, points);
}