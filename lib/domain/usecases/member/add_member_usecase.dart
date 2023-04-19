// add_member_usecase.dart
import 'package:o2o_point_configuration/domain/entities/member.dart';
import 'package:o2o_point_configuration/domain/repositories/member_repository.dart';

class AddMemberUseCase {
  final MemberRepository repository;

  AddMemberUseCase({required this.repository});

  Future<void> call(Member member) => repository.addMember(member);
}
