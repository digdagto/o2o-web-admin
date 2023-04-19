// get_members_usecase.dart
import 'package:o2o_point_configuration/domain/entities/member.dart';
import 'package:o2o_point_configuration/domain/repositories/member_repository.dart';

class GetMembersUseCase {
  final MemberRepository repository;

  GetMembersUseCase({required this.repository});

  Future<List<Member>> call() async{
    return repository.getMembers();
  }
}