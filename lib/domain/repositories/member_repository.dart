// member_repository.dart
import 'package:o2o_point_configuration/domain/entities/member.dart';

abstract class MemberRepository {
  Future<void> addMember(Member member);
  Future<void> deleteMember(String name, String phone);
  Future<void> updateMember(Member member);
  Future<void> updateMemberPoints(String name, String phone, int points);
  Future<List<Member>> getMembers();
}