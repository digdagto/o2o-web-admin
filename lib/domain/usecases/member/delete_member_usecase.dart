// delete_member_usecase.dart
import 'package:o2o_point_configuration/domain/repositories/member_repository.dart';

class DeleteMemberUseCase {
  final MemberRepository repository;

  DeleteMemberUseCase({required this.repository});

  Future<void> call(String name, String phone) => repository.deleteMember(name, phone);
}
