// member_repository_impl.dart
import 'dart:math';

import 'package:o2o_point_configuration/domain/entities/member.dart';
import 'package:o2o_point_configuration/domain/repositories/member_repository.dart';

class MemberRepositoryImpl implements MemberRepository {
   Map<String, Member> _members = {};

   factory MemberRepositoryImpl({int numberOfDummyData = 0}) {
     return MemberRepositoryImpl._(
       members: _createDummyData(numberOfDummyData),
     );
   }

   MemberRepositoryImpl._({required Map<String, Member> members})
       : _members = members;


  @override
  Future<void> addMember(Member member) async {
    String key = _getKey(member.name, member.phone);
    _members[key] = member;
  }

  @override
  Future<void> deleteMember(String name, String phone) async {
    String key = _getKey(name, phone);
    _members.remove(key);
  }

  @override
  Future<void> updateMember(Member member) async {
    print("update ${member}");
    String key = _getKey(member.name, member.phone);
    _members[key] = member;
    // deleteMember(member.name, member.phone);
  }

  @override
  Future<void> updateMemberPoints(String name, String phone, int points) async {
    String key = _getKey(name, phone);
    Member? member = _members[key];
    if (member != null) {
      _members[key] = Member(
        name: member.name,
        phone: member.phone,
        registeredDate: member.registeredDate,
        visitCount: member.visitCount,
        point: points,
      );
    }
  }

   static Map<String, Member> _createDummyData(int count) {
    final random = Random();
    final dummyData = List<Member>.generate(count, (index) {
      final name = 'User$index';
      final phone = _generateRandomPhoneNumber(random);
      return Member(
        name: name,
        phone: phone,
        registeredDate: DateTime.now().subtract(Duration(days: random.nextInt(30))),
        visitCount: random.nextInt(10),
        point: random.nextInt(500),
      );
    });

    return {
      for (var member in dummyData) _getKey(member.name, member.phone): member
    };
  }

  static String _generateRandomPhoneNumber(Random random) {
    return List<int>.generate(10, (_) => random.nextInt(10)).join();
  }

  static String _getKey(String name, String phone) {
    return '$name-$phone';
  }

  @override
  Future<List<Member>> getMembers() async {
    // return _members.values.toList();
    return _members.values.toList();
  }
}